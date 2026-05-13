import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../shared/config/env_config.dart';
import 'dart:developer' as developer;

part 'supabase_service.g.dart';

@Riverpod(keepAlive: true)
Future<SupabaseClient> supabaseClient(SupabaseClientRef ref) async {
  if (EnvConfig.supabaseUrl.isEmpty || EnvConfig.supabaseAnonKey.isEmpty) {
    developer.log(
      'Supabase credentials missing! Ensure SUPABASE_URL and SUPABASE_ANON_KEY are set via --dart-define or .env',
      name: 'supabase',
      level: 1000,
    );
    throw Exception('Supabase credentials missing');
  }

  try {
    await Supabase.initialize(
      url: EnvConfig.supabaseUrl,
      anonKey: EnvConfig.supabaseAnonKey,
    );
  } catch (e) {
    developer.log('Supabase initialization failed', name: 'supabase', error: e);
  }
  
  return Supabase.instance.client;
}

class SupabaseService {
  final SupabaseClient client;

  SupabaseService(this.client);

  // Auth
  Future<AuthResponse> signIn(String email, String password) async {
    return await client.auth.signInWithPassword(email: email, password: password);
  }

  Future<AuthResponse> signUp(String email, String password) async {
    return await client.auth.signUp(email: email, password: password);
  }

  Future<void> signOut() async {
    await client.auth.signOut();
  }

  Session? get currentSession => client.auth.currentSession;
  User? get currentUser => client.auth.currentUser;

  // Sync logic will be added here
}

@Riverpod(keepAlive: true)
Future<SupabaseService> supabaseService(SupabaseServiceRef ref) async {
  final client = await ref.watch(supabaseClientProvider.future);
  return SupabaseService(client);
}
