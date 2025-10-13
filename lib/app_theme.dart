// lib/app_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Cor de fundo principal, extraída do seu esboço
  static const Color primaryColor = Color(0xFF738244); //
  // Cor para textos e elementos de destaque
  static const Color accentColor = Colors.white;

  static ThemeData get theme {
    return ThemeData(
      // Cor de fundo padrão para todas as telas
      scaffoldBackgroundColor: const Color(0xFF738244),

      // Tema do AppBar
      appBarTheme: AppBarTheme(
        backgroundColor:
            Colors.transparent, // AppBar transparente para se mesclar ao fundo
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: accentColor),
        titleTextStyle: GoogleFonts.dancingScript(
          // Fonte cursiva para títulos
          color: accentColor,
          fontSize: 32,
          fontWeight: FontWeight.w700,
        ),
      ),

      // Tema para os campos de texto (Inputs)
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: GoogleFonts.montserrat(
          color: accentColor.withAlpha(204),
        ), // CORREÇÃO AQUI
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: accentColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: accentColor, width: 2.0),
        ),
      ),

      // Tema para os botões
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor:
              Colors.white, // Adicionado para cor do texto do botão
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: accentColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          textStyle: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Tema para textos gerais
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.montserrat(color: accentColor),
        bodyMedium: GoogleFonts.montserrat(color: accentColor),
      ),

      // Cor do cursor e outros acentos
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: accentColor,
        selectionColor: Colors.white24,
        selectionHandleColor: accentColor,
      ),
      // Cor do indicador de progresso
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.white,
      ),
    );
  }
}
