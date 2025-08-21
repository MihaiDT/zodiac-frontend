import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'providers/auth_controller.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final authController = ref.read(authControllerProvider.notifier);
    final user = authState.user;

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    // Listen to auth state changes
    ref.listen(authControllerProvider, (previous, next) {
      if (!next.isAuthenticated) {
        // Navigate to login when logged out
        context.go('/login');
      }
    });

    if (!authState.isAuthenticated || user == null) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.person_circle,
                size: 80,
                color: colorScheme.onSurface.withOpacity(0.3),
              ),
              const SizedBox(height: 16),
              Text(
                'Not logged in',
                style: textTheme.headlineSmall?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 24),
              _buildGlassButton(
                onPressed: () => context.go('/login'),
                colorScheme: colorScheme,
                child: Text(
                  'Sign In',
                  style: textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorScheme.primary.withOpacity(0.1),
              colorScheme.surface,
              colorScheme.secondary.withOpacity(0.05),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // Header
                Row(
                  children: [
                    Text(
                      'Profile',
                      style: textTheme.headlineLarge?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () =>
                          _showLogoutDialog(context, authController),
                      child: Icon(
                        CupertinoIcons.square_arrow_right,
                        color: colorScheme.error,
                        size: 24,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Profile Avatar
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [colorScheme.primary, colorScheme.secondary],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: user.avatar != null
                      ? ClipOval(
                          child: Image.network(
                            user.avatar!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return _buildAvatarFallback(
                                user.name,
                                colorScheme,
                                textTheme,
                              );
                            },
                          ),
                        )
                      : _buildAvatarFallback(user.name, colorScheme, textTheme),
                ),

                const SizedBox(height: 24),

                // User Name
                Text(
                  user.name,
                  style: textTheme.headlineMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 8),

                // User Email
                Text(
                  user.email,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),

                const SizedBox(height: 32),

                // Profile Information Cards
                _buildProfileCard(
                  title: 'Personal Information',
                  children: [
                    _buildInfoRow(
                      icon: CupertinoIcons.person,
                      label: 'Full Name',
                      value: user.name,
                      colorScheme: colorScheme,
                      textTheme: textTheme,
                    ),
                    _buildInfoRow(
                      icon: CupertinoIcons.mail,
                      label: 'Email',
                      value: user.email,
                      colorScheme: colorScheme,
                      textTheme: textTheme,
                    ),
                    if (user.birthDate != null)
                      _buildInfoRow(
                        icon: CupertinoIcons.calendar,
                        label: 'Birth Date',
                        value:
                            '${user.birthDate!.day}/${user.birthDate!.month}/${user.birthDate!.year}',
                        colorScheme: colorScheme,
                        textTheme: textTheme,
                      ),
                    if (user.zodiacSign != null)
                      _buildInfoRow(
                        icon: CupertinoIcons.star,
                        label: 'Zodiac Sign',
                        value: user.zodiacSign!,
                        colorScheme: colorScheme,
                        textTheme: textTheme,
                      ),
                    if (user.lifePath != null)
                      _buildInfoRow(
                        icon: CupertinoIcons.number,
                        label: 'Life Path Number',
                        value: user.lifePath!,
                        colorScheme: colorScheme,
                        textTheme: textTheme,
                      ),
                  ],
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                ),

                const SizedBox(height: 24),

                // Account Actions
                _buildProfileCard(
                  title: 'Account',
                  children: [
                    _buildActionRow(
                      icon: CupertinoIcons.pencil,
                      label: 'Edit Profile',
                      onTap: () {
                        // TODO: Navigate to edit profile
                      },
                      colorScheme: colorScheme,
                      textTheme: textTheme,
                    ),
                    _buildActionRow(
                      icon: CupertinoIcons.lock,
                      label: 'Change Password',
                      onTap: () {
                        // TODO: Navigate to change password
                      },
                      colorScheme: colorScheme,
                      textTheme: textTheme,
                    ),
                    _buildActionRow(
                      icon: CupertinoIcons.settings,
                      label: 'Settings',
                      onTap: () {
                        // TODO: Navigate to settings
                      },
                      colorScheme: colorScheme,
                      textTheme: textTheme,
                    ),
                  ],
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                ),

                const SizedBox(height: 24),

                // Support & Info
                _buildProfileCard(
                  title: 'Support',
                  children: [
                    _buildActionRow(
                      icon: CupertinoIcons.question_circle,
                      label: 'Help & Support',
                      onTap: () {
                        // TODO: Navigate to help
                      },
                      colorScheme: colorScheme,
                      textTheme: textTheme,
                    ),
                    _buildActionRow(
                      icon: CupertinoIcons.doc_text,
                      label: 'Terms of Service',
                      onTap: () {
                        // TODO: Navigate to terms
                      },
                      colorScheme: colorScheme,
                      textTheme: textTheme,
                    ),
                    _buildActionRow(
                      icon: CupertinoIcons.shield,
                      label: 'Privacy Policy',
                      onTap: () {
                        // TODO: Navigate to privacy policy
                      },
                      colorScheme: colorScheme,
                      textTheme: textTheme,
                    ),
                  ],
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                ),

                const SizedBox(height: 32),

                // Logout Button
                _buildGlassButton(
                  onPressed: authState.isLoading
                      ? null
                      : () => _showLogoutDialog(context, authController),
                  isLoading: authState.isLoading,
                  colorScheme: colorScheme,
                  isDestructive: true,
                  child: Text(
                    'Sign Out',
                    style: textTheme.labelLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // App Version
                Text(
                  'Version 1.0.0',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withOpacity(0.5),
                  ),
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarFallback(
    String name,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    final initials = name.isNotEmpty
        ? name
              .split(' ')
              .map((n) => n.isNotEmpty ? n[0] : '')
              .take(2)
              .join()
              .toUpperCase()
        : 'U';

    return Center(
      child: Text(
        initials,
        style: textTheme.headlineLarge?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildProfileCard({
    required String title,
    required List<Widget> children,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: colorScheme.surface.withOpacity(0.1),
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.headlineSmall?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: colorScheme.primary.withOpacity(0.1),
            ),
            child: Icon(icon, size: 20, color: colorScheme.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionRow({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: colorScheme.primary.withOpacity(0.1),
                ),
                child: Icon(icon, size: 20, color: colorScheme.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                CupertinoIcons.chevron_right,
                size: 16,
                color: colorScheme.onSurface.withOpacity(0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGlassButton({
    required VoidCallback? onPressed,
    required Widget child,
    required ColorScheme colorScheme,
    bool isLoading = false,
    bool isDestructive = false,
  }) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: onPressed != null
              ? isDestructive
                    ? [colorScheme.error, colorScheme.error.withOpacity(0.8)]
                    : [colorScheme.primary, colorScheme.secondary]
              : [
                  colorScheme.onSurface.withOpacity(0.3),
                  colorScheme.onSurface.withOpacity(0.2),
                ],
        ),
        boxShadow: onPressed != null
            ? [
                BoxShadow(
                  color:
                      (isDestructive ? colorScheme.error : colorScheme.primary)
                          .withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
                ),
              ]
            : null,
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: isLoading
            ? const CupertinoActivityIndicator(color: Colors.white)
            : child,
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, AuthController authController) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(context).pop();
              authController.logout();
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
