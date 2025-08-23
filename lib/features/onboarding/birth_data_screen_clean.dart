import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../config/app_colors.dart';
import '../../core/services/haptics_service.dart';
import '../../core/models/onboarding_models.dart';
import 'providers/onboarding_provider.dart';

class SimpleBirthDataScreen extends ConsumerStatefulWidget {
  const SimpleBirthDataScreen({super.key});

  @override
  ConsumerState<SimpleBirthDataScreen> createState() =>
      _SimpleBirthDataScreenState();
}

class _SimpleBirthDataScreenState extends ConsumerState<SimpleBirthDataScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _selectedPlace;
  String? _zodiacSign;

  String _calculateZodiacSign(DateTime birthDate) {
    final month = birthDate.month;
    final day = birthDate.day;

    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) return 'aries';
    if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) return 'taurus';
    if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) return 'gemini';
    if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) return 'cancer';
    if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) return 'leo';
    if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) return 'virgo';
    if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) return 'libra';
    if ((month == 10 && day >= 23) || (month == 11 && day <= 21))
      return 'scorpio';
    if ((month == 11 && day >= 22) || (month == 12 && day <= 21))
      return 'sagittarius';
    if ((month == 12 && day >= 22) || (month == 1 && day <= 19))
      return 'capricorn';
    if ((month == 1 && day >= 20) || (month == 2 && day <= 18))
      return 'aquarius';
    return 'pisces';
  }

  String _getZodiacName(String sign) {
    const names = {
      'aries': 'Aries ♈',
      'taurus': 'Taurus ♉',
      'gemini': 'Gemini ♊',
      'cancer': 'Cancer ♋',
      'leo': 'Leo ♌',
      'virgo': 'Virgo ♍',
      'libra': 'Libra ♎',
      'scorpio': 'Scorpio ♏',
      'sagittarius': 'Sagittarius ♐',
      'capricorn': 'Capricorn ♑',
      'aquarius': 'Aquarius ♒',
      'pisces': 'Pisces ♓',
    };
    return names[sign] ?? sign;
  }

  Future<void> _selectDate() async {
    HapticsService.lightImpact();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(1990, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: AppColors.primary,
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _zodiacSign = _calculateZodiacSign(pickedDate);
      });
    }
  }

  Future<void> _selectTime() async {
    HapticsService.lightImpact();
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? const TimeOfDay(hour: 12, minute: 0),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  void _continueToNext() {
    if (_selectedDate == null) return;

    HapticsService.mediumImpact();

    // Create birth data
    final birthData = BirthData(
      birthDate: _selectedDate!,
      birthTime: _selectedTime?.format(context),
      birthPlace: _selectedPlace,
      zodiacSign: _zodiacSign,
    );

    // Save to onboarding state
    ref.read(onboardingProvider.notifier).setBirthData(birthData);

    // Navigate to next step
    context.go('/onboarding/preferences');
  }

  @override
  Widget build(BuildContext context) {
    final onboardingState = ref.watch(onboardingProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Birth Information'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tell us about yourself',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'We\'ll use this information to create your personalized horoscope and zodiac profile.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onBackground.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 32),

              // Birth Date
              _buildInputCard(
                title: 'Birth Date',
                subtitle:
                    _selectedDate != null
                        ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                        : 'Tap to select',
                icon: Icons.calendar_today,
                onTap: _selectDate,
                isRequired: true,
              ),

              const SizedBox(height: 16),

              // Birth Time
              _buildInputCard(
                title: 'Birth Time (Optional)',
                subtitle:
                    _selectedTime != null
                        ? _selectedTime!.format(context)
                        : 'Tap to select',
                icon: Icons.access_time,
                onTap: _selectTime,
              ),

              const SizedBox(height: 16),

              // Birth Place
              _buildInputCard(
                title: 'Birth Place (Optional)',
                subtitle: _selectedPlace ?? 'Tap to enter',
                icon: Icons.location_on,
                onTap: () {
                  // For now, just set a placeholder
                  setState(() {
                    _selectedPlace = 'Bucharest, Romania';
                  });
                },
              ),

              if (_zodiacSign != null) ...[
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary.withOpacity(0.1),
                        AppColors.accent.withOpacity(0.1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.auto_awesome,
                        size: 32,
                        color: AppColors.primary,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Your Zodiac Sign',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _getZodiacName(_zodiacSign!),
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              const Spacer(),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed:
                      _selectedDate != null && !onboardingState.isLoading
                          ? _continueToNext
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
                  ),
                  child:
                      onboardingState.isLoading
                          ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                          : const Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
    bool isRequired = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).dividerColor.withOpacity(0.3),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.primary, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      if (isRequired) ...[
                        const SizedBox(width: 4),
                        Text(
                          '*',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onBackground.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Theme.of(
                context,
              ).colorScheme.onBackground.withOpacity(0.3),
            ),
          ],
        ),
      ),
    );
  }
}
