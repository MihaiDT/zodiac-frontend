import 'package:flutter/services.dart';

class HapticsService {
  static void lightImpact() {
    HapticFeedback.lightImpact();
  }

  static void selectionClick() {
    HapticFeedback.selectionClick();
  }

  static void mediumImpact() {
    HapticFeedback.mediumImpact();
  }

  static void heavyImpact() {
    HapticFeedback.heavyImpact();
  }
}
