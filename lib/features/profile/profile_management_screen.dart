import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme/app_theme.dart';
import '../auth/providers/auth_controller.dart';
import '../profile/models/profile.dart';
import '../profile/providers/profile_providers.dart';

class ProfileManagementScreen extends HookConsumerWidget {
  const ProfileManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    // Switch back to real API provider
    final profileState = ref.watch(userProfileProvider);

    return CupertinoPageScaffold(
      backgroundColor: AppTheme.darkBackground,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppTheme.darkBackground,
              AppTheme.deepPurple,
              AppTheme.primaryPurple,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(theme),
                const SizedBox(height: 30),

                profileState.when(
                  data: (profile) => _buildProfileContent(theme, profile, ref),
                  loading: () => _buildLoadingIndicator(theme),
                  error:
                      (error, _) => _buildErrorMessage(context, theme, error),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Profile',
          style: theme.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 32,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Manage your personal information and preferences',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.white.withOpacity(0.8),
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileContent(
    ThemeData theme,
    UserProfile profile,
    WidgetRef ref,
  ) {
    return Column(
      children: [
        _buildPersonalInfoSection(theme, profile, ref),
        const SizedBox(height: 24),
        _buildSettingsSection(theme, profile.settings, ref),
        const SizedBox(height: 24),
        _buildQuickActions(theme, profile, ref),
      ],
    );
  }

  Widget _buildPersonalInfoSection(
    ThemeData theme,
    UserProfile profile,
    WidgetRef ref,
  ) {
    return GlassUtils.glassContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Personal Information',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => _showEditProfileModal(theme, profile, ref),
                child: const Icon(
                  CupertinoIcons.pencil,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          _buildInfoRow(
            theme,
            'Name',
            '${profile.firstName} ${profile.lastName}',
            CupertinoIcons.person,
          ),
          const SizedBox(height: 12),

          _buildInfoRow(theme, 'Email', profile.email, CupertinoIcons.mail),
          const SizedBox(height: 12),

          if (profile.birthdate != null)
            _buildInfoRow(
              theme,
              'Birth Date',
              _formatDate(profile.birthdate!),
              CupertinoIcons.calendar,
            ),
          const SizedBox(height: 12),

          if (profile.zodiacSign != null)
            _buildInfoRow(
              theme,
              'Zodiac Sign',
              profile.zodiacSign!,
              CupertinoIcons.star,
            ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    ThemeData theme,
    String label,
    String value,
    IconData icon,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white.withOpacity(0.8), size: 16),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.white.withOpacity(0.7),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSettingsSection(
    ThemeData theme,
    ProfileSettings settings,
    WidgetRef ref,
  ) {
    return GlassUtils.glassContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Settings',
            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),

          // Notifications section
          Text(
            'Notifications',
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),

          _buildSettingToggle(
            theme,
            'Daily Horoscope',
            'Get your daily horoscope reading',
            settings.notifications.dailyHoroscope,
            CupertinoIcons.bell,
            (value) => _updateNotificationSetting(
              ref,
              settings,
              'dailyHoroscope',
              value,
            ),
          ),
          const SizedBox(height: 12),

          _buildSettingToggle(
            theme,
            'Weekly Forecast',
            'Receive weekly astrology insights',
            settings.notifications.weeklyForecast,
            CupertinoIcons.calendar,
            (value) => _updateNotificationSetting(
              ref,
              settings,
              'weeklyForecast',
              value,
            ),
          ),
          const SizedBox(height: 12),

          _buildSettingToggle(
            theme,
            'Monthly Insights',
            'Monthly astrology and numerology updates',
            settings.notifications.monthlyInsights,
            CupertinoIcons.star,
            (value) => _updateNotificationSetting(
              ref,
              settings,
              'monthlyInsights',
              value,
            ),
          ),
          const SizedBox(height: 12),

          _buildSettingToggle(
            theme,
            'Numerology Updates',
            'New numerology features and insights',
            settings.notifications.numerologyUpdates,
            CupertinoIcons.number_circle,
            (value) => _updateNotificationSetting(
              ref,
              settings,
              'numerologyUpdates',
              value,
            ),
          ),
          const SizedBox(height: 20),

          // Horoscope tone selector
          _buildToneSelector(theme, settings.horoscopeTone, ref, settings),
          const SizedBox(height: 16),

          // Analytics toggle
          _buildSettingToggle(
            theme,
            'Analytics',
            'Help improve our services with usage data',
            settings.analyticsEnabled,
            CupertinoIcons.chart_bar,
            (value) => _updateSettings(
              ref,
              settings.copyWith(analyticsEnabled: value),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingToggle(
    ThemeData theme,
    String title,
    String subtitle,
    bool value,
    IconData icon,
    Function(bool) onChanged,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white.withOpacity(0.8), size: 16),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
        CupertinoSwitch(
          value: value,
          onChanged: onChanged,
          activeColor: AppTheme.primaryPurple,
        ),
      ],
    );
  }

  Widget _buildToneSelector(
    ThemeData theme,
    String currentTone,
    WidgetRef ref,
    ProfileSettings settings,
  ) {
    final tones = ['serious', 'funny', 'sincere'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                CupertinoIcons.chat_bubble_2,
                color: Colors.white.withOpacity(0.8),
                size: 16,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Default Tone',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Preferred style for horoscope readings',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: CupertinoSlidingSegmentedControl<String>(
            groupValue: currentTone,
            onValueChanged: (value) {
              if (value != null) {
                _updateSettings(ref, settings.copyWith(horoscopeTone: value));
              }
            },
            children: {
              for (final tone in tones)
                tone: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    tone.toUpperCase(),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            },
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions(
    ThemeData theme,
    UserProfile profile,
    WidgetRef ref,
  ) {
    return Builder(
      builder:
          (context) => Column(
            children: [
              _buildActionButton(
                theme,
                'Update Profile',
                'Edit personal information',
                CupertinoIcons.person_badge_plus,
                const Color(0xFF6366F1),
                () => _showEditProfileModal(theme, profile, ref),
              ),
              const SizedBox(height: 12),
              _buildActionButton(
                theme,
                'Export Data',
                'Download your profile data',
                CupertinoIcons.cloud_download,
                const Color(0xFF10B981),
                () => _exportProfileData(ref),
              ),
              const SizedBox(height: 12),
              _buildActionButton(
                theme,
                'Sign Out',
                'Log out from your account',
                CupertinoIcons.power,
                const Color(0xFFEF4444),
                () => _handleLogout(context, ref),
              ),
              const SizedBox(height: 12),
              _buildActionButton(
                theme,
                'Reset Preferences',
                'Restore default settings',
                CupertinoIcons.refresh,
                const Color(0xFFFF6B35),
                () => _resetPreferences(ref),
              ),
            ],
          ),
    );
  }

  Widget _buildActionButton(
    ThemeData theme,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3), width: 1),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              CupertinoIcons.chevron_right,
              color: Colors.white.withOpacity(0.5),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  void _exportProfileData(WidgetRef ref) {
    // Implementation for data export
  }

  void _resetPreferences(WidgetRef ref) {
    // Implementation for resetting preferences
  }

  Widget _buildLoadingIndicator(ThemeData theme) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CupertinoActivityIndicator(color: Colors.white, radius: 16),
            const SizedBox(height: 16),
            Text(
              'Loading profile...',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorMessage(
    BuildContext context,
    ThemeData theme,
    Object error,
  ) {
    final errorString = error.toString();

    // Check for different types of errors
    final bool isAuthError =
        errorString.contains('401') ||
        errorString.contains('unauthorized') ||
        errorString.contains('token');

    final bool isServerError =
        errorString.contains('500') ||
        errorString.contains('internal_error') ||
        errorString.contains('server error');

    final bool isRateLimit =
        errorString.contains('429') ||
        errorString.contains('rate_limit_exceeded') ||
        errorString.contains('too many requests');

    String title;
    String message;
    IconData icon;

    if (isAuthError) {
      title = 'Autentificare Necesară';
      message = 'Te rog să te autentifici pentru a vedea profilul.';
      icon = CupertinoIcons.lock;
    } else if (isServerError) {
      title = 'Problemă Server';
      message =
          'Serverul întâmpină probleme temporare. Te rog încearcă din nou în câteva minute.';
      icon = CupertinoIcons.gear_alt;
    } else if (isRateLimit) {
      title = 'Prea Multe Cereri';
      message =
          'Ai făcut prea multe cereri. Te rog să aștepți ~15 minute și încearcă din nou.';
      icon = CupertinoIcons.clock;
    } else {
      title = 'Eroare Încărcare Profil';
      message =
          'A apărut o problemă la încărcarea profilului. Verifică conexiunea și încearcă din nou.';
      icon = CupertinoIcons.exclamationmark_triangle;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.withOpacity(0.3), width: 1),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.red, size: 40),
          const SizedBox(height: 16),
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
          if (isAuthError) ...[
            const SizedBox(height: 16),
            CupertinoButton.filled(
              child: const Text('Go to Login'),
              onPressed: () {
                // Navigate to login screen
                context.go('/login');
              },
            ),
          ],
        ],
      ),
    );
  }

  void _showEditProfileModal(
    ThemeData theme,
    UserProfile profile,
    WidgetRef ref,
  ) {
    // Implementation for edit profile modal
    // This would show a modal with form fields to edit profile
  }

  void _updateSettings(WidgetRef ref, ProfileSettings newSettings) {
    // Create a ProfileUpdateRequest with updated settings
    final updateRequest = ProfileUpdateRequest(settings: newSettings);
    ref.read(profileUpdateProvider.notifier).updateProfile(updateRequest);
  }

  void _updateNotificationSetting(
    WidgetRef ref,
    ProfileSettings settings,
    String settingName,
    bool value,
  ) {
    final currentNotifications = settings.notifications;
    NotificationSettings newNotifications;

    switch (settingName) {
      case 'dailyHoroscope':
        newNotifications = currentNotifications.copyWith(dailyHoroscope: value);
        break;
      case 'weeklyForecast':
        newNotifications = currentNotifications.copyWith(weeklyForecast: value);
        break;
      case 'monthlyInsights':
        newNotifications = currentNotifications.copyWith(
          monthlyInsights: value,
        );
        break;
      case 'numerologyUpdates':
        newNotifications = currentNotifications.copyWith(
          numerologyUpdates: value,
        );
        break;
      default:
        return;
    }

    final newSettings = settings.copyWith(notifications: newNotifications);
    _updateSettings(ref, newSettings);
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final months = [
        '',
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      return '${date.day} ${months[date.month]} ${date.year}';
    } catch (e) {
      return dateString;
    }
  }

  Future<void> _handleLogout(BuildContext context, WidgetRef ref) async {
    // Show confirmation dialog
    final shouldLogout = await showCupertinoDialog<bool>(
      context: context,
      builder:
          (context) => CupertinoAlertDialog(
            title: const Text('Confirm Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              CupertinoDialogAction(
                child: const Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: const Text('Logout'),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
    );

    if (shouldLogout == true) {
      try {
        // Show loading indicator
        showCupertinoDialog(
          context: context,
          barrierDismissible: false,
          builder:
              (context) => const CupertinoAlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CupertinoActivityIndicator(),
                    SizedBox(height: 16),
                    Text('Logging out...'),
                  ],
                ),
              ),
        );

        // Perform logout
        await ref.read(authControllerProvider.notifier).logout();

        // Dismiss loading dialog
        if (context.mounted) {
          Navigator.of(context).pop();
        }

        // Navigate to login
        if (context.mounted) {
          context.go('/login');
        }
      } catch (e) {
        // Dismiss loading dialog if still showing
        if (context.mounted) {
          Navigator.of(context).pop();
        }

        // Show error (but logout still happened locally)
        if (context.mounted) {
          showCupertinoDialog(
            context: context,
            builder:
                (context) => CupertinoAlertDialog(
                  title: const Text('Logout Complete'),
                  content: const Text(
                    'You have been logged out locally. Network issues prevented server logout.',
                  ),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        context.go('/login');
                      },
                    ),
                  ],
                ),
          );
        }
      }
    }
  }
}
