import 'dart:math' as math;
import 'package:flutter/material.dart';

// Zodiac Circle Painter
class ZodiacCirclePainter extends CustomPainter {
  final Animation<double> rotationAnimation;
  final bool showCircle;

  ZodiacCirclePainter({
    required this.rotationAnimation,
    this.showCircle = true,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (!showCircle) return;
    
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = math.min(size.width, size.height) * 0.4;
    final innerRadius = outerRadius * 0.75;
    final housesRadius = innerRadius * 0.85;
    
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Outer circle (zodiac signs)
    paint.color = Colors.white.withOpacity(0.2);
    canvas.drawCircle(center, outerRadius, paint);
    
    // Inner circle (houses)
    paint.color = Colors.white.withOpacity(0.15);
    canvas.drawCircle(center, innerRadius, paint);
    
    // Houses circle
    paint.color = Colors.white.withOpacity(0.1);
    canvas.drawCircle(center, housesRadius, paint);
    
    // Zodiac signs sectors (12 equal parts)
    final zodiacSigns = [
      '♈', '♉', '♊', '♋', '♌', '♍',
      '♎', '♏', '♐', '♑', '♒', '♓'
    ];
    
    for (int i = 0; i < 12; i++) {
      final angle = (i * 30 * math.pi / 180) + rotationAnimation.value * 0.5;
      
      // Sector divider lines
      final startX = center.dx + innerRadius * math.cos(angle);
      final startY = center.dy + innerRadius * math.sin(angle);
      final endX = center.dx + outerRadius * math.cos(angle);
      final endY = center.dy + outerRadius * math.sin(angle);
      
      paint
        ..color = Colors.white.withOpacity(0.2)
        ..strokeWidth = 0.8;
      
      canvas.drawLine(
        Offset(startX, startY),
        Offset(endX, endY),
        paint,
      );
      
      // Zodiac sign symbols
      final textAngle = angle + (15 * math.pi / 180); // Center of sector
      final textRadius = (outerRadius + innerRadius) / 2;
      final textX = center.dx + textRadius * math.cos(textAngle);
      final textY = center.dy + textRadius * math.sin(textAngle);
      
      final textPainter = TextPainter(
        text: TextSpan(
          text: zodiacSigns[i],
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      
      textPainter.layout();
      
      // Center the text
      final textOffset = Offset(
        textX - textPainter.width / 2,
        textY - textPainter.height / 2,
      );
      
      textPainter.paint(canvas, textOffset);
    }
    
    // Houses sectors (12 equal parts, offset by 15 degrees)
    for (int i = 0; i < 12; i++) {
      final angle = ((i * 30) + 15) * math.pi / 180 + rotationAnimation.value * 0.2;
      
      // House divider lines (thinner)
      final startX = center.dx + housesRadius * math.cos(angle);
      final startY = center.dy + housesRadius * math.sin(angle);
      final endX = center.dx + innerRadius * math.cos(angle);
      final endY = center.dy + innerRadius * math.sin(angle);
      
      paint
        ..color = Colors.white.withOpacity(0.1)
        ..strokeWidth = 0.5;
      
      canvas.drawLine(
        Offset(startX, startY),
        Offset(endX, endY),
        paint,
      );
      
      // House numbers
      final textAngle = angle + (15 * math.pi / 180);
      final textRadius = (innerRadius + housesRadius) / 2;
      final textX = center.dx + textRadius * math.cos(textAngle);
      final textY = center.dy + textRadius * math.sin(textAngle);
      
      final textPainter = TextPainter(
        text: TextSpan(
          text: '${i + 1}',
          style: TextStyle(
            color: Colors.white.withOpacity(0.4),
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      
      textPainter.layout();
      
      final textOffset = Offset(
        textX - textPainter.width / 2,
        textY - textPainter.height / 2,
      );
      
      textPainter.paint(canvas, textOffset);
    }
    
    // Central cross lines (traditional astrology chart)
    paint
      ..color = Colors.white.withOpacity(0.15)
      ..strokeWidth = 1.0;
    
    // Horizontal line (Ascendant - Descendant axis)
    canvas.drawLine(
      Offset(center.dx - housesRadius, center.dy),
      Offset(center.dx + housesRadius, center.dy),
      paint,
    );
    
    // Vertical line (Midheaven - IC axis)
    canvas.drawLine(
      Offset(center.dx, center.dy - housesRadius),
      Offset(center.dx, center.dy + housesRadius),
      paint,
    );
    
    // Center point
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.white.withOpacity(0.3);
    canvas.drawCircle(center, 2, paint);
  }

  @override
  bool shouldRepaint(ZodiacCirclePainter oldDelegate) {
    return rotationAnimation.value != oldDelegate.rotationAnimation.value ||
           showCircle != oldDelegate.showCircle;
  }
}

// Cosmic Points Painter
class CosmicPointsPainter extends CustomPainter {
  final Animation<double> sunAnimation;
  final Animation<double> moonAnimation;
  final Animation<double> ascendantAnimation;
  final Animation<double> pulseAnimation;
  final bool sunActivated;
  final bool moonActivated;
  final bool ascendantActivated;
  final bool finalPulse;

  CosmicPointsPainter({
    required this.sunAnimation,
    required this.moonAnimation,
    required this.ascendantAnimation,
    required this.pulseAnimation,
    required this.sunActivated,
    required this.moonActivated,
    required this.ascendantActivated,
    this.finalPulse = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) * 0.4;
    
    // Positions following traditional astrology chart
    // Sun position (9th house area - top right)
    final sunPos = Offset(
      center.dx + radius * 0.6 * math.cos(math.pi / 6),
      center.dy - radius * 0.6 * math.sin(math.pi / 6),
    );
    
    // Moon position (3rd house area - bottom right) 
    final moonPos = Offset(
      center.dx + radius * 0.6 * math.cos(-math.pi / 6),
      center.dy - radius * 0.6 * math.sin(-math.pi / 6),
    );
    
    // Ascendant position (1st house - exact east)
    final ascendantPos = Offset(
      center.dx + radius * 0.8,
      center.dy,
    );
    
    // Draw cosmic points
    if (sunActivated) {
      _drawCosmicPoint(canvas, sunPos, Colors.amber.shade300, sunAnimation.value, pulseAnimation.value, finalPulse);
    }
    
    if (moonActivated) {
      _drawCosmicPoint(canvas, moonPos, Colors.blue.shade200, moonAnimation.value, pulseAnimation.value, finalPulse);
    }
    
    if (ascendantActivated) {
      _drawCosmicPoint(canvas, ascendantPos, Colors.green.shade300, ascendantAnimation.value, pulseAnimation.value, finalPulse);
    }
  }
  
  void _drawCosmicPoint(Canvas canvas, Offset position, Color color, double activation, double pulse, bool finalPulse) {
    final paint = Paint()
      ..style = PaintingStyle.fill;
    
    // Glow effect
    final glowRadius = 12 + (finalPulse ? pulse * 8 : activation * 6);
    final glowPaint = Paint()
      ..color = color.withOpacity(0.3 * activation)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
    
    canvas.drawCircle(position, glowRadius, glowPaint);
    
    // Main point
    paint.color = color.withOpacity(activation);
    final pointRadius = 6 + (finalPulse ? pulse * 2 : activation * 2);
    canvas.drawCircle(position, pointRadius, paint);
    
    // Inner bright core
    paint.color = Colors.white.withOpacity(activation * 0.8);
    canvas.drawCircle(position, pointRadius * 0.4, paint);
  }

  @override
  bool shouldRepaint(CosmicPointsPainter oldDelegate) {
    return sunAnimation.value != oldDelegate.sunAnimation.value ||
           moonAnimation.value != oldDelegate.moonAnimation.value ||
           ascendantAnimation.value != oldDelegate.ascendantAnimation.value ||
           pulseAnimation.value != oldDelegate.pulseAnimation.value ||
           sunActivated != oldDelegate.sunActivated ||
           moonActivated != oldDelegate.moonActivated ||
           ascendantActivated != oldDelegate.ascendantActivated ||
           finalPulse != oldDelegate.finalPulse;
  }
}

// Particles Painter
class ParticlesPainter extends CustomPainter {
  final Animation<double> animation;
  final Offset startPosition;
  final Offset endPosition;
  final Color color;
  final bool isActive;

  ParticlesPainter({
    required this.animation,
    required this.startPosition,
    required this.endPosition,
    required this.color,
    this.isActive = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (!isActive || animation.value == 0) return;
    
    final paint = Paint()
      ..color = color.withOpacity(1.0 - animation.value)
      ..style = PaintingStyle.fill;
    
    // Create multiple particles for effect
    for (int i = 0; i < 5; i++) {
      final progress = (animation.value + i * 0.1).clamp(0.0, 1.0);
      final currentPos = Offset.lerp(startPosition, endPosition, progress)!;
      
      // Add some randomness to particle positions
      final offsetX = (i - 2) * 8.0 * (1.0 - progress);
      final offsetY = math.sin(progress * math.pi * 3) * 10 * (1.0 - progress);
      
      final particlePos = Offset(
        currentPos.dx + offsetX,
        currentPos.dy + offsetY,
      );
      
      final particleSize = (1.0 - progress) * 3 + 1;
      canvas.drawCircle(particlePos, particleSize, paint);
    }
  }

  @override
  bool shouldRepaint(ParticlesPainter oldDelegate) {
    return animation.value != oldDelegate.animation.value ||
           isActive != oldDelegate.isActive;
  }
}
