// lib/screens/upload_screen.dart
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../auth/auth_service.dart';
import '../database_service.dart'; // Importe o novo serviço

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final AuthService _authService = AuthService();
  final DatabaseService _databaseService =
      DatabaseService(); // Instancie o serviço
  final ImagePicker _picker = ImagePicker();

  bool _isAuthenticating = true;
  bool _isUploading = false;
  String? _userId;
  Uint8List? _imageBytes;

  @override
  void initState() {
    super.initState();
    _signInGuest();
  }

  Future<void> _signInGuest() async {
    final user = await _authService.signInAnonymously();
    setState(() {
      _isAuthenticating = false;
      if (user != null) {
        _userId = user.uid;
        log('Convidado autenticado com ID: $_userId');
      } else {
        log('Falha na autenticação anônima.');
      }
    });
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxWidth: 1080,
    );

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
    } else {
      log('Nenhuma imagem selecionada.');
    }
  }

  // Lógica de upload real
  Future<void> _uploadImage() async {
    if (_imageBytes == null || _userId == null) return;

    setState(() {
      _isUploading = true;
    });

    final success = await _databaseService.uploadPhoto(
      imageBytes: _imageBytes!,
      userId: _userId!,
    );

    setState(() {
      _isUploading = false;
    });

    // Mostra o feedback para o usuário
    if (mounted) {
      final message = success
          ? 'Foto enviada com sucesso!'
          : 'Ocorreu um erro ao enviar a foto.';
      final color = success ? Colors.green : Colors.red;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
    }

    if (success) {
      setState(() {
        _imageBytes = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enviar Foto para o Evento'),
        centerTitle: true,
      ),
      body: Center(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    if (_isAuthenticating) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 10),
          Text('Conectando ao evento...'),
        ],
      );
    }

    if (_isUploading) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 10),
          Text('Enviando foto...'),
        ],
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Compartilhe um momento especial!',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 40),
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: _imageBytes != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.memory(_imageBytes!, fit: BoxFit.cover),
                )
              : const Center(
                  child: Icon(Icons.photo, size: 50, color: Colors.grey),
                ),
        ),
        const SizedBox(height: 40),
        if (_imageBytes != null)
          ElevatedButton.icon(
            onPressed: _uploadImage,
            icon: const Icon(Icons.cloud_upload),
            label: const Text('Enviar Foto'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle: const TextStyle(fontSize: 16),
            ),
          )
        else
          ElevatedButton.icon(
            onPressed: _pickImage,
            icon: const Icon(Icons.photo_library),
            label: const Text('Selecionar da Galeria'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle: const TextStyle(fontSize: 16),
            ),
          ),
      ],
    );
  }
}
