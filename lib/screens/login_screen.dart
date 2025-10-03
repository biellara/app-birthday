import 'package:flutter/material.dart';
import '../auth/auth_service.dart';
import 'home_screen.dart'; // Importaremos a próxima tela

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    final user = await _authService.signInAnonymously();

    // --- CORREÇÃO AQUI ---
    if (!mounted) return;

    if (user != null) {
      // Navega para a tela principal se o login for bem-sucedido
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // Mostra uma mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não foi possível entrar no evento.')),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bem-vindo(a)!')),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator() // Mostra um loading
            : ElevatedButton(
                onPressed: _login,
                child: const Text('Entrar no Evento'),
              ),
      ),
    );
  }
}
