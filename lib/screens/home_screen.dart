import 'package:flutter/material.dart';
import '../auth/auth_service.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Festa de Aniversário"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authService.signOut();

              // --- CORREÇÃO AQUI ---
              if (!context.mounted) return;

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Bem-vindo! Seu ID de convidado é: \n${authService.currentUser?.uid}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
