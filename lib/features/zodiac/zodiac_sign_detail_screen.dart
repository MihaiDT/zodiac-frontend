import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme/app_theme.dart';
import 'providers/zodiac_providers.dart';
import 'models/zodiac_sign.dart';

class ZodiacSignDetailScreen extends ConsumerWidget {
  final String signId;

  const ZodiacSignDetailScreen({super.key, required this.signId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signDetailAsync = ref.watch(zodiacSignDetailProvider(signId));

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: signDetailAsync.when(
        loading: () => _buildLoadingState(context),
        error: (error, stackTrace) => _buildErrorState(context, error, ref),
        data: (sign) => _buildDetailContent(context, sign),
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Back button
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => context.pop(),
                  child: const Icon(CupertinoIcons.back, color: Colors.white),
                ),
              ],
            ),
          ),

          const Expanded(
            child: Center(
              child: CupertinoActivityIndicator(
                color: Colors.white,
                radius: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, Object error, WidgetRef ref) {
    return SafeArea(
      child: Column(
        children: [
          // Back button
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => context.pop(),
                  child: const Icon(CupertinoIcons.back, color: Colors.white),
                ),
              ],
            ),
          ),

          Expanded(
            child: Center(
              child: GlassUtils.glassContainer(
                margin: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      CupertinoIcons.exclamationmark_triangle,
                      size: 48,
                      color: Colors.orange,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Failed to load sign details',
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    CupertinoButton.filled(
                      onPressed:
                          () =>
                              ref.invalidate(zodiacSignDetailProvider(signId)),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailContent(BuildContext context, ZodiacSign sign) {
    final elementColor = _getElementColor(sign.element);

    return CustomScrollView(
      slivers: [
        // Custom app bar with sign info
        SliverAppBar(
          expandedHeight: 200,
          pinned: true,
          backgroundColor: Colors.transparent,
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => context.pop(),
            child: const Icon(CupertinoIcons.back, color: Colors.white),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: GlassUtils.softGlow(
                color: elementColor,
                blurRadius: 20,
                spreadRadius: 5,
              ),
              child: GlassUtils.glassContainer(
                opacity: 0.2,
                color: elementColor,
                borderRadius: BorderRadius.circular(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40), // Space for status bar
                    Text(
                      sign.symbol,
                      style: const TextStyle(fontSize: 80, color: Colors.white),
                    ),
                    Text(
                      sign.name,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${sign.startDate} - ${sign.endDate}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Content
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Basic info cards
                Row(
                  children: [
                    Expanded(
                      child: _buildInfoCard(
                        context,
                        'Element',
                        sign.element,
                        CupertinoIcons.flame,
                        elementColor,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildInfoCard(
                        context,
                        'Quality',
                        sign.quality,
                        CupertinoIcons.circle_grid_3x3,
                        elementColor,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                _buildInfoCard(
                  context,
                  'Ruling Planet',
                  sign.rulingPlanet,
                  CupertinoIcons.globe,
                  elementColor,
                ),

                const SizedBox(height: 24),

                // Description
                _buildSectionCard(
                  context,
                  'Description',
                  sign.description,
                  elementColor,
                ),

                const SizedBox(height: 16),

                // Description
                if (sign.personality?.description.isNotEmpty == true)
                  _buildDescriptionCard(
                    context,
                    'Description',
                    sign.personality!.description,
                    elementColor,
                  ),
                
                const SizedBox(height: 16),
                
                // Strengths
                if (sign.personality?.strengths.isNotEmpty == true)
                  _buildTraitsCard(
                    context,
                    'Strengths',
                    sign.personality!.strengths,
                    Colors.green,
                  ),
                
                const SizedBox(height: 16),
                
                // Weaknesses 
                if (sign.personality?.weaknesses.isNotEmpty == true)
                  _buildTraitsCard(
                    context,
                    'Weaknesses',
                    sign.personality!.weaknesses,
                    Colors.orange,
                  ),

                const SizedBox(height: 16),

                // Compatibility
                _buildSectionCard(
                  context,
                  'Compatibility',
                  sign.compatibility,
                  elementColor,
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return GlassUtils.glassContainer(
      opacity: 0.1,
      color: color,
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(
    BuildContext context,
    String title,
    String content,
    Color color,
  ) {
    return GlassUtils.glassContainer(
      opacity: 0.1,
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionCard(
    BuildContext context,
    String title,
    String content,
    Color color,
  ) {
    return GlassUtils.glassContainer(
      opacity: 0.1,
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTraitsCard(
    BuildContext context,
    String title,
    List<String> traits,
    Color color,
  ) {
    return GlassUtils.glassContainer(
      opacity: 0.1,
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                traits
                    .map(
                      (trait) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white.withOpacity(0.2),
                        ),
                        child: Text(
                          trait,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }

  Color _getElementColor(String element) {
    switch (element.toLowerCase()) {
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
}
