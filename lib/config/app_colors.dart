import 'package:flutter/material.dart';

/// Premium Astrology & Tarot App Color System
/// Designed for maximum conversions and positive psychological impact
class AppColors {
  AppColors._();

  // === CORE BRAND COLORS ===
  static const Color primary = Color(
    0xFF977DFF,
  ); // Mystical violet - spirituality, trust, uniqueness
  static const Color accent = Color(
    0xFF0033FF,
  ); // Deep blue - safety, clarity, balance
  static const Color softBackground = Color(
    0xFFF2E6EE,
  ); // Soft pink - calm, welcoming
  static const Color darkBackground = Color(
    0xFF0600AB,
  ); // Deep blue - mystery, depth
  static const Color pastelAccent = Color(
    0xFFFFCCF2,
  ); // Pastel pink - delicacy, emotion

  // === GRADIENT SYSTEM ===
  /// Light mode background - elegant cosmic morning atmosphere
  static const LinearGradient backgroundLight = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(
        0xFF5C6BC0,
      ), // Indigo from palette (darker at top for better contrast)
      Color(0xFF7986CB), // Soft indigo
      Color(0xFF9FA8DA), // Medium light indigo
      Color(0xFFE8EAF6), // Very light indigo (lighter at bottom)
    ],
    stops: [0.0, 0.3, 0.7, 1.0],
  );

  /// Dark mode background - mystery, depth, concentration
  static const LinearGradient backgroundDark = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF0600AB), // Very deep blue (darkest at top)
      Color(0xFF0033FF), // Deep blue
      Color(0xFF0033DD), // Deep blue accent
      Color(0xFF1565C0), // Lighter blue (lighter at bottom)
    ],
    stops: [0.0, 0.3, 0.7, 1.0],
  );

  /// Primary CTA - strong contrast, immediate action sensation
  static const LinearGradient ctaPrimary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF977DFF), // Mystical violet
      Color(0xFF0033FF), // Deep blue
    ],
  );

  /// Secondary CTA hover/active state - energy, optimism
  static const LinearGradient ctaSecondary = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFCCF2), // Pastel pink
      Color(0xFF977DFF), // Mystical violet
      Color(0xFF0033FF), // Deep blue
    ],
  );

  /// Badges and highlights - energy, clear visual signal
  static const LinearGradient highlight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFCCF2), // Pastel pink
      Color(0xFF977DFF), // Mystical violet
      Color(0xFF0033FF), // Deep blue
    ],
  );

  // === TEXT COLORS ===
  /// Light mode text colors
  static const Color textPrimaryLight = Color(0xFF0600AB); // Deep blue titles
  static const Color textSecondaryLight = Color(
    0xB3977DFF,
  ); // Violet with 70% opacity
  static const Color textOnCta = Colors.white; // White on CTA buttons

  /// Dark mode text colors
  static const Color textPrimaryDark = Color(0xFFF2E6EE); // Soft pink titles
  static const Color textSecondaryDark = Color(
    0xB3FFFFFF,
  ); // White with 70% opacity

  // === CARD & PANEL COLORS ===
  /// Light mode cards
  static const Color cardBackgroundLight = Color(
    0xFFF2E6EE,
  ); // Soft pink background
  static const Color cardAccentLight = Color(0xFF977DFF); // Violet accents

  /// Dark mode cards
  static const Color cardBackgroundDark = Color(
    0xFF0600AB,
  ); // Deep blue background
  static const Color cardAccentDark = Color(
    0xFF0033FF,
  ); // Blue accents for clarity

  // === INTERACTIVE STATES ===
  static const Color stateActive = Color(0xFF977DFF); // Brand violet
  static const Color stateInactive = Color(0x66003FF); // Blue with 40% opacity
  static const Color stateHover = Color(0xFF0033FF); // Accent blue
  static const Color stateDisabled = Color(
    0x80977DFF,
  ); // Violet with 50% opacity

  // === BORDER COLORS ===
  static const Color borderActive = Color(0xFF977DFF); // Mystical violet
  static const Color borderInactive = Color(0x66003FF); // Blue with 40% opacity
  static const Color borderLight = Color(0x33977DFF); // Violet with 20% opacity
  static const Color borderDark = Color(0x33003FF); // Blue with 20% opacity

  // === ICON COLORS ===
  static const Color iconActive = Color(0xFF977DFF); // Brand violet
  static const Color iconInactive = Color(0x80003FF); // Blue with 50% opacity
  static const Color iconLight = Color(0xFF0600AB); // Deep blue
  static const Color iconDark = Color(0xFFF2E6EE); // Soft pink

  // Legacy gradients for backward compatibility
  static const LinearGradient gradient1 = backgroundLight;
  static const LinearGradient gradient2 = ctaSecondary;
  static const LinearGradient gradient3 = ctaPrimary;
  static const LinearGradient gradient4 = backgroundDark;

  // Current main gradient (can be easily changed)
  static const LinearGradient mainGradient = ctaPrimary;

  // === LEGACY SUPPORT ===
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFE0E0E0);
  static const Color textAccent = Color(0xFF977DFF);

  // === COSMIC SPECIFIC COLORS ===
  static const Color zodiacCircle = Color(0xFF977DFF);
  static const Color orbitLine = Color(0x1AFFFFFF); // Semi-transparent white
  static const Color planetPrimary = Color(0xFF6B73FF); // Warm blue-purple
  static const Color planetSecondary = Color(0xFF9BB5FF); // Soft periwinkle
  static const Color sunIcon = Colors.white; // Pure white sun

  // Status colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  // === HELPER METHODS ===

  /// Get appropriate background gradient based on theme mode
  static LinearGradient getBackgroundGradient(bool isDark) {
    return isDark ? backgroundDark : backgroundLight;
  }

  /// Get appropriate text color based on theme mode
  static Color getTextPrimary(bool isDark) {
    return isDark ? textPrimaryDark : textPrimaryLight;
  }

  /// Get appropriate text secondary color based on theme mode
  static Color getTextSecondary(bool isDark) {
    return isDark ? textSecondaryDark : textSecondaryLight;
  }

  /// Get appropriate card background based on theme mode
  static Color getCardBackground(bool isDark) {
    return isDark ? cardBackgroundDark : cardBackgroundLight;
  }

  /// Get appropriate card accent based on theme mode
  static Color getCardAccent(bool isDark) {
    return isDark ? cardAccentDark : cardAccentLight;
  }

  /// Get appropriate icon color based on theme mode
  static Color getIconColor(bool isDark) {
    return isDark ? iconDark : iconLight;
  }

  /// Create custom gradient with specified colors
  static LinearGradient createCustomGradient({
    required List<Color> colors,
    Alignment begin = Alignment.topCenter,
    Alignment end = Alignment.bottomCenter,
    List<double>? stops,
  }) {
    return LinearGradient(begin: begin, end: end, colors: colors, stops: stops);
  }

  /// Create glassmorphism effect
  static BoxDecoration createGlassmorphism({
    required bool isDark,
    double borderRadius = 16.0,
    double opacity = 0.1,
  }) {
    return BoxDecoration(
      color:
          isDark
              ? Color(0x1A003FF).withOpacity(opacity)
              : Color(0x1AF2E6EE).withOpacity(opacity),
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(color: isDark ? borderDark : borderLight, width: 1),
      boxShadow: [
        BoxShadow(
          color:
              isDark
                  ? Colors.black.withOpacity(0.2)
                  : Colors.black.withOpacity(0.1),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    );
  }

  // Legacy method for backward compatibility
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
