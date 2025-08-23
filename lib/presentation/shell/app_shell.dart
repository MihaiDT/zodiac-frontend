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
      body: Container(
        color: Colors.black, // Solid black background complet
        child: child,
      ),
      bottomNavigationBar: _GlassBottomNavBar(),
    );
  }
}

class _GlassBottomNavBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPath = GoRouterState.of(context).uri.path;

    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
          top: BorderSide(color: Colors.white.withOpacity(0.1), width: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              _NavItem(
                icon: CupertinoIcons.home,
                label: 'Home',
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
                icon: CupertinoIcons.chat_bubble_2,
                label: 'Chat',
                isSelected: currentPath.startsWith('/chat'),
                onTap: () => context.go('/chat'),
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
  final bool hasNotification;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.hasNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6), // Padding mai mare
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
              color: isSelected ? AppTheme.primaryPurple : Colors.white.withOpacity(0.6),
              size: 28, // Iconuri mult mai mari
            ),
            const SizedBox(height: 3), // Spațiu între icon și text
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppTheme.primaryPurple : Colors.white.withOpacity(0.6),
                fontSize: 11, // Text puțin mai mare
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
