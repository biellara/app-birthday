import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Retorna o usuário atual, se houver
  User? get currentUser => _auth.currentUser;

  // Faz o login anônimo
  Future<User?> signInAnonymously() async {
    try {
      final userCredential = await _auth.signInAnonymously();
      log("Usuário anônimo logado: ${userCredential.user?.uid}");
      return userCredential.user;
    } catch (e, stackTrace) {
      log("Erro ao fazer login anônimo", error: e, stackTrace: stackTrace);
      return null;
    }
  }

  // Faz o logout
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
