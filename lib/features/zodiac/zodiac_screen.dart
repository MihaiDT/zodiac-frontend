import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme/app_theme.dart';
import 'providers/zodiac_providers.dart';
import 'models/zodiac_sign.dart';

class ZodiacScreen extends ConsumerWidget {
  const ZodiacScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final zodiacSignsAsync = ref.watch(zodiacSignsProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Zodiac Signs'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            GlassUtils.glassContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '✨ Discover Your Sign',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Explore the 12 zodiac signs and their unique characteristics',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Zodiac signs grid
            zodiacSignsAsync.when(
              loading: () => _buildLoadingGrid(),
              error:
                  (error, stackTrace) => _buildErrorState(context, error, ref),
              data: (signs) => _buildZodiacGrid(context, signs),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: 12,
      itemBuilder: (context, index) => _buildLoadingCard(),
    );
  }

  Widget _buildLoadingCard() {
    return GlassUtils.glassContainer(
      opacity: 0.1,
      child: const Center(
        child: CupertinoActivityIndicator(color: Colors.white),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, Object error, WidgetRef ref) {
    return GlassUtils.glassContainer(
      child: Column(
        children: [
          Icon(
            CupertinoIcons.exclamationmark_triangle,
            size: 48,
            color: Colors.orange,
          ),
          const SizedBox(height: 16),
          Text(
            'Failed to load zodiac signs',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          CupertinoButton.filled(
            onPressed: () => ref.invalidate(zodiacSignsProvider),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildZodiacGrid(BuildContext context, List<ZodiacSign> signs) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: signs.length,
      itemBuilder: (context, index) => _ZodiacSignCard(sign: signs[index]),
    );
  }
}

class _ZodiacSignCard extends StatelessWidget {
  final ZodiacSign sign;

  const _ZodiacSignCard({required this.sign});

  Color get _elementColor {
    switch (sign.element.toLowerCase()) {
      case 'fire':
        return const Color(0xFFFF6B6B);
      case 'earth':
        return const Color(0xFF4ECDC4);
      case 'air':
        return const Color(0xFF45B7D1);
      case 'water':
        return const Color(0xFF96CEB4);
      default:
        return AppTheme.primaryPurple;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/zodiac/sign/${sign.name.toLowerCase()}'),
      child: Container(
        decoration: GlassUtils.softGlow(
          color: _elementColor,
          blurRadius: 15,
          spreadRadius: 2,
        ),
        child: GlassUtils.glassContainer(
          opacity: 0.15,
          color: _elementColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Symbol
              Text(
                sign.symbol,
                style: const TextStyle(fontSize: 48, color: Colors.white),
              ),
              const SizedBox(height: 12),

              // Name
              Text(
                sign.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),

              // Date range
              Text(
                '${sign.startDate} - ${sign.endDate}',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              // Element badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white.withOpacity(0.2),
                ),
                child: Text(
                  sign.element,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
