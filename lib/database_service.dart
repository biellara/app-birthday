// lib/database_service.dart
import 'dart:developer';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// Faz o upload de uma foto para o Firebase Storage e salva os metadados no Firestore.
  ///
  /// Retorna `true` se o upload for bem-sucedido, e `false` caso contrário.
  Future<bool> uploadPhoto({
    required Uint8List imageBytes,
    required String userId,
  }) async {
    try {
      // 1. Criar um nome de arquivo único usando o timestamp.
      final String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      final String filePath = 'photos/$photoId.jpg';

      // 2. Fazer o upload do arquivo para o Cloud Storage com metadados.
      final ref = _storage.ref().child(filePath);
      final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        // Adiciona o ID do usuário aos metadados para as regras de segurança.
        customMetadata: {'ownerId': userId},
      );

      final uploadTask = ref.putData(imageBytes, metadata);
      final snapshot = await uploadTask.whenComplete(() => {});
      final downloadUrl = await snapshot.ref.getDownloadURL();

      log('Foto enviada para o Storage: $downloadUrl');

      // 3. Salvar as informações da foto no Firestore.
      await _firestore.collection('photos').doc(photoId).set({
        'imageUrl': downloadUrl,
        'uploadedBy': userId,
        'createdAt': FieldValue.serverTimestamp(),
      });

      log('Informações da foto salvas no Firestore.');
      return true;
    } catch (e) {
      log('Erro durante o upload: $e');
      return false;
    }
  }

  Stream<QuerySnapshot> getPhotosStream() {
    return _firestore
        .collection('photos')
        .orderBy(
          'createdAt',
          descending: true,
        ) // Ordena para mostrar as mais novas primeiro
        .snapshots(); // '.snapshots()' é o que cria o fluxo em tempo real
  }
}
