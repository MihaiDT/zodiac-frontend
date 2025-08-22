import 'package:flutter/material.dart';

/// Application color scheme with cosmic/zodiac theme
class AppColors {
  AppColors._();

  // Primary gradient colors
  static const Color primary = Color(0xFF977DFF); // Light purple
  static const Color primaryDark = Color(0xFF0033FF); // Deep blue
  static const Color primaryLight = Color(0xFFF2E6EE); // Very light pink

  // Secondary gradient colors
  static const Color secondary = Color(0xFFFFCCF2); // Light pink
  static const Color secondaryDark = Color(0xFF0600AB); // Very deep blue
  static const Color accent = Color(0xFF0033DD); // Deep blue accent

  // Gradients for different screens/components
  static const LinearGradient gradient1 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFF2E6EE), // Light pink
      Color(0xFF977DFF), // Light purple
    ],
  );

  static const LinearGradient gradient2 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFCCF2), // Light pink
      Color(0xFF977DFF), // Light purple
      Color(0xFF0033FF), // Deep blue
    ],
  );

  static const LinearGradient gradient3 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF977DFF), // Light purple
      Color(0xFF0033FF), // Deep blue
    ],
  );

  static const LinearGradient gradient4 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF0033FF), // Deep blue
      Color(0xFF0600AB), // Very deep blue
      Color(0xFF0033DD), // Deep blue accent
    ],
  );

  // Current main gradient (can be easily changed)
  static const LinearGradient mainGradient = gradient3;

  // Text colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFE0E0E0);
  static const Color textAccent = Color(0xFF977DFF);

  // UI element colors
  static const Color surface = Color(0xFF1A1A2E);
  static const Color surfaceLight = Color(0xFF2A2A3E);
  static const Color border = Color(0xFF3A3A4E);
  static const Color borderLight = Color(0xFF4A4A5E);

  // Zodiac/cosmic specific colors
  static const Color zodiacCircle = Color(0xFF977DFF);
  static const Color orbitLine = Color(0x1AFFFFFF); // Semi-transparent white
  static const Color planetBlue = Colors.lightBlue;
  static const Color planetRed = Colors.redAccent;
  static const Color sun = Colors.amber;
  static const Color sunGlow = Colors.orange;

  // Status colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  // Helper methods for creating custom gradients
  static LinearGradient createCustomGradient({
    required List<Color> colors,
    Alignment begin = Alignment.topCenter,
    Alignment end = Alignment.bottomCenter,
  }) {
    return LinearGradient(begin: begin, end: end, colors: colors);
  }

  // Method to get gradient by name
  static LinearGradient getGradient(String name) {
    switch (name) {
      case 'gradient1':
        return gradient1;
      case 'gradient2':
        return gradient2;
      case 'gradient3':
        return gradient3;
      case 'gradient4':
        return gradient4;
      default:
        return mainGradient;
    }
  }
}
