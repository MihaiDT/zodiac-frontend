import 'package:flutter/services.dart';

// Premium Haptic Feedback Helper Class
class PremiumHaptics {
  // Light feedback for secondary interactions (cards, icons)
  static void light() {
    HapticFeedback.lightImpact();
  }

  // Medium feedback for primary buttons and important actions
  static void medium() {
    HapticFeedback.mediumImpact();
  }

  // Heavy feedback for confirmations and successful actions
  static void heavy() {
    HapticFeedback.heavyImpact();
  }

  // Success feedback for completed actions
  static void success() {
    HapticFeedback.mediumImpact();
  }

  // Selection feedback for toggles and selections
  static void selection() {
    HapticFeedback.selectionClick();
  }
}
