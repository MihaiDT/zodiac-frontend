import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app/theme/app_theme.dart';

/// Main app shell with bottom navigation
class AppShell extends ConsumerWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppTheme.darkBackground,
                  Color(0xFF1A1A2E),
                  Color(0xFF16213E),
                ],
              ),
            ),
          ),

          // Content with proper padding for floating bottom nav
          Padding(
            padding: const EdgeInsets.only(bottom: 116), // 100 + 16 margin
            child: SafeArea(child: child),
          ),
        ],
      ),

      // Bottom navigation with glassmorphism
      bottomNavigationBar: _GlassBottomNavBar(),
    );
  }
}

class _GlassBottomNavBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPath = GoRouterState.of(context).uri.path;

    return Container(
      height: 100, // Increased height
      margin: const EdgeInsets.all(16),
      child: GlassUtils.glassContainer(
        borderRadius: BorderRadius.circular(25),
        blur: 20,
        opacity: 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _NavItem(
              icon: CupertinoIcons.home,
              label: 'Dashboard',
              isSelected: currentPath == '/dashboard',
              onTap: () => context.go('/dashboard'),
            ),
            _NavItem(
              icon: CupertinoIcons.star_circle,
              label: 'Zodiac',
              isSelected: currentPath.startsWith('/zodiac'),
              onTap: () => context.go('/zodiac'),
            ),
            _NavItem(
              icon: CupertinoIcons.number_circle,
              label: 'Numerology',
              isSelected: currentPath.startsWith('/numerology'),
              onTap: () => context.go('/numerology'),
            ),
            _NavItem(
              icon: CupertinoIcons.moon_stars,
              label: 'Horoscope',
              isSelected: currentPath.startsWith('/horoscope'),
              onTap: () => context.go('/horoscope'),
            ),
            _NavItem(
              icon: CupertinoIcons.person_circle,
              label: 'Profile',
              isSelected: currentPath.startsWith('/profile'),
              onTap: () => context.go('/profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppTheme.primaryPurple.withOpacity(0.2),
                border: Border.all(
                  color: AppTheme.primaryPurple.withOpacity(0.3),
                  width: 1,
                ),
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? AppTheme.primaryPurple
                  : Colors.white.withOpacity(0.6),
              size: 22, // Slightly smaller icon
            ),
            const SizedBox(height: 2), // Smaller spacing
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? AppTheme.primaryPurple
                    : Colors.white.withOpacity(0.6),
                fontSize: 9, // Smaller text
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
