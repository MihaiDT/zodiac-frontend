import 'package:flutter/material.dart';

class OnboardingProgressIndicator extends StatefulWidget {
  final int currentStep;
  final int totalSteps;
  final Duration animationDuration;

  const OnboardingProgressIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.animationDuration = const Duration(milliseconds: 800),
  });

  @override
  State<OnboardingProgressIndicator> createState() =>
      _OnboardingProgressIndicatorState();
}

class _OnboardingProgressIndicatorState
    extends State<OnboardingProgressIndicator>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: widget.currentStep / widget.totalSteps,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Start animation
    _animationController.forward();
  }

  @override
  void didUpdateWidget(OnboardingProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentStep != widget.currentStep) {
      _progressAnimation = Tween<double>(
        begin: oldWidget.currentStep / widget.totalSteps,
        end: widget.currentStep / widget.totalSteps,
      ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
      );
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Step counter text
        Text(
          '${widget.currentStep} of ${widget.totalSteps}',
          style: TextStyle(
            fontFamily: 'Inter',
            color: Colors.white.withOpacity(0.7),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        // Continuous progress line
        AnimatedBuilder(
          animation: _progressAnimation,
          builder: (context, child) {
            return Container(
              width: 120,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.white.withOpacity(0.2),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 120 * _progressAnimation.value,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
