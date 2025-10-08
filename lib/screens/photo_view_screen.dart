// lib/screens/photo_view_screen.dart
import 'package:flutter/material.dart';

class PhotoViewScreen extends StatelessWidget {
  final String imageUrl;

  const PhotoViewScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fundo preto para imersão
      backgroundColor: Colors.black,
      appBar: AppBar(
        // AppBar transparente
        backgroundColor: Colors.transparent,
        elevation: 0,
        // Ícone de fechar branco
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        // InteractiveViewer permite que o usuário dê zoom e arraste a imagem
        child: InteractiveViewer(
          panEnabled: true, // Permite arrastar
          minScale: 0.5,
          maxScale: 4.0, // Nível máximo de zoom
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain, // Garante que a imagem inteira seja visível
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error, color: Colors.white);
            },
          ),
        ),
      ),
    );
  }
}
