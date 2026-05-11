import 'package:flutter/material.dart';
import '../../../core/theme/neon_theme.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LOGIN')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: NeonEffects.neonBox(color: NeonColors.neonMagenta),
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'EMAIL',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: NeonColors.neonMagenta,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('ENTER GRID'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
