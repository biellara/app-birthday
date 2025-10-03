import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Importe o arquivo gerado pelo FlutterFire

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Garante que os widgets foram inicializados
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Birthday',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const Scaffold(
        body: Center(child: Text('Hello World! Firebase Conectado!')),
      ),
    );
  }
}
