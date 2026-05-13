import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import '../../../services/supabase_service.dart';
import 'dart:developer' as developer;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final Ref _ref;

  AuthService(this._ref);

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.authenticate();
      final googleAuth = googleUser.authentication;
      final String? idToken = googleAuth.idToken;

      // In 7.2.0, accessToken is retrieved via authorizationClient
      String? accessToken;
      try {
        final authz = await googleUser.authorizationClient.authorizeScopes(['email', 'profile']);
        accessToken = authz.accessToken;
      } catch (e) {
        developer.log('Failed to obtain access token', name: 'auth', error: e);
      }

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      
      // Also sign into Supabase
      if (idToken != null) {
        try {
          final supabaseService = await _ref.read(supabaseServiceProvider.future);
          await supabaseService.client.auth.signInWithIdToken(
            provider: supabase.OAuthProvider.google,
            idToken: idToken,
            accessToken: accessToken,
          );
          developer.log('Supabase Google Sign-In Successful', name: 'auth');
        } catch (e) {
          developer.log('Supabase Google Sign-In Failed', name: 'auth', error: e);
        }
      }

      return userCredential;
    } catch (e) {
      developer.log('Google Sign-In Failed', name: 'auth', error: e);
      return null;
    }
  }

  Future<UserCredential?> signInWithEmail(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      
      // Also sign into Supabase
      try {
        final supabaseService = await _ref.read(supabaseServiceProvider.future);
        await supabaseService.signIn(email, password);
        developer.log('Supabase Email Sign-In Successful', name: 'auth');
      } catch (e) {
        developer.log('Supabase Email Sign-In Failed', name: 'auth', error: e);
      }

      return userCredential;
    } catch (e) {
      developer.log('Email Sign-In Failed', name: 'auth', error: e);
      return null;
    }
  }

  Future<UserCredential?> registerWithEmail(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      
      // Also sign into Supabase
      try {
        final supabaseService = await _ref.read(supabaseServiceProvider.future);
        await supabaseService.signUp(email, password);
        developer.log('Supabase Email Sign-Up Successful', name: 'auth');
      } catch (e) {
        developer.log('Supabase Email Sign-Up Failed', name: 'auth', error: e);
      }

      return userCredential;
    } catch (e) {
      developer.log('Email Registration Failed', name: 'auth', error: e);
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    try {
      final supabaseService = await _ref.read(supabaseServiceProvider.future);
      await supabaseService.signOut();
    } catch (_) {}
  }
}

final authServiceProvider = Provider<AuthService>((ref) => AuthService(ref));

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authServiceProvider).authStateChanges;
});
