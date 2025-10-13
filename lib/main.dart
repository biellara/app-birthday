// lib/main.dart
import 'package:app_birthday/firebase_options.dart';
import 'package:app_birthday/app_theme.dart';
import 'package:app_birthday/screens/login_screen.dart';
import 'package:app_birthday/screens/upload_screen.dart'; // Importe a nova tela
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'; // Importe para usar o kIsWeb
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Birthday',
      theme: AppTheme.theme,
      home: kIsWeb ? const UploadScreen() : const LoginScreen(),
    );
  }
}
