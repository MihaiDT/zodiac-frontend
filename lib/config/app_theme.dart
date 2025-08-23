import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Application theme configuration with automatic dark/light mode support
class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.softBackground,
        background: AppColors.softBackground,
      ),
      scaffoldBackgroundColor: Colors.transparent, // Use gradient instead
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.textPrimaryLight,
        titleTextStyle: TextStyle(
          color: AppColors.textPrimaryLight,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppColors.accent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.cardBackgroundLight,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: AppColors.textPrimaryLight,
          fontWeight: FontWeight.bold,
          fontSize: 36,
        ),
        headlineMedium: TextStyle(
          color: AppColors.textPrimaryLight,
          fontWeight: FontWeight.w300,
          fontSize: 32,
        ),
        bodyLarge: TextStyle(
          color: AppColors.textSecondaryLight,
          fontSize: 16,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          color: AppColors.textSecondaryLight,
          fontSize: 14,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.darkBackground,
        background: AppColors.darkBackground,
      ),
      scaffoldBackgroundColor: Colors.transparent, // Use gradient instead
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.textPrimaryDark,
        titleTextStyle: TextStyle(
          color: AppColors.textPrimaryDark,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppColors.accent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.cardBackgroundDark,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: AppColors.textPrimaryDark,
          fontWeight: FontWeight.bold,
          fontSize: 36,
        ),
        headlineMedium: TextStyle(
          color: AppColors.textPrimaryDark,
          fontWeight: FontWeight.w300,
          fontSize: 32,
        ),
        bodyLarge: TextStyle(
          color: AppColors.textSecondaryDark,
          fontSize: 16,
          height: 1.5,
        ),
        bodyMedium: TextStyle(color: AppColors.textSecondaryDark, fontSize: 14),
      ),
    );
  }
}
