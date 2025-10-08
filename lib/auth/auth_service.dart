// lib/auth/auth_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Getter para obter o usuário atual
  User? get currentUser => _auth.currentUser;

  // Stream para ouvir as mudanças no estado de autenticação
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Método para login com E-mail e Senha
  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      // Usando kDebugMode para garantir que o print só apareça em modo de depuração
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  // Método para login anônimo
  Future<User?> signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      return result.user;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  // Método para fazer logout
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
