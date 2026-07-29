import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/app_colors.dart';

class AppTheme {
  // Paleta de colores Hex

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.backgroundColor,
      cardColor: AppColors.cardColor,
      primaryColor: AppColors.accentColor,

      // Configuración de Tipografía con Google Fonts
      textTheme: TextTheme(
        // Títulos grandes y medianos (Plus Jakarta Sans)
        displayMedium: GoogleFonts.plusJakartaSans(
          color: AppColors.titleColor,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.plusJakartaSans(
          color: AppColors.titleColor,
          fontWeight: FontWeight.bold,
        ),
        // Subtítulos de acento
        titleMedium: GoogleFonts.plusJakartaSans(
          color: AppColors.accentColor,
          fontWeight: FontWeight.w600,
        ),
        // Texto de cuerpo / descripciones
        bodyMedium: GoogleFonts.plusJakartaSans(
          color: AppColors.textColor,
          fontSize: 14,
          height: 1.5,
        ),
        // Etiquetas de tecnologías (Fira Code)
        labelMedium: GoogleFonts.firaCode(
          color: AppColors.accentColor,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
