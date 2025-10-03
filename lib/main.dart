import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/auth_service.dart';
import 'firebase_options.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return MaterialApp(
      title: 'App Birthday',
      theme: ThemeData(primarySwatch: Colors.pink, brightness: Brightness.dark),
      // Decide qual tela mostrar com base no status do login
      home: authService.currentUser == null
          ? const LoginScreen()
          : const HomeScreen(),
    );
  }
}
