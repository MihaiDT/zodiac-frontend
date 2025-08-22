import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app/theme/app_theme.dart';
import 'providers/horoscope_providers.dart';
import 'models/horoscope.dart';

class HoroscopeScreen extends ConsumerWidget {
  const HoroscopeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSign = ref.watch(horoscopeSelectedSignProvider);
    final selectedTone = ref.watch(horoscopeSelectedToneProvider);
    final horoscopeAsync = ref.watch(refreshableHoroscopeProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Daily Horoscope'),
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
                    '🌟 Your Daily Guidance',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Select your zodiac sign and preferred tone for personalized insights',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Sign selector
            _buildSignSelector(context, ref, selectedSign),

            const SizedBox(height: 16),

            // Tone selector
            _buildToneSelector(context, ref, selectedTone),

            const SizedBox(height: 24),

            // Horoscope result
            if (selectedSign != null)
              horoscopeAsync.when(
                loading: () => _buildLoadingState(),
                error: (error, stackTrace) => _buildErrorState(context, error, ref),
                data: (horoscope) => horoscope != null
                    ? _buildHoroscopeResult(context, horoscope)
                    : const SizedBox.shrink(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignSelector(BuildContext context, WidgetRef ref, String? selectedSign) {
    final zodiacSigns = [
      {'id': 'aries', 'name': 'Aries', 'symbol': '♈', 'dates': 'Mar 21 - Apr 19'},
      {'id': 'taurus', 'name': 'Taurus', 'symbol': '♉', 'dates': 'Apr 20 - May 20'},
      {'id': 'gemini', 'name': 'Gemini', 'symbol': '♊', 'dates': 'May 21 - Jun 20'},
      {'id': 'cancer', 'name': 'Cancer', 'symbol': '♋', 'dates': 'Jun 21 - Jul 22'},
      {'id': 'leo', 'name': 'Leo', 'symbol': '♌', 'dates': 'Jul 23 - Aug 22'},
      {'id': 'virgo', 'name': 'Virgo', 'symbol': '♍', 'dates': 'Aug 23 - Sep 22'},
      {'id': 'libra', 'name': 'Libra', 'symbol': '♎', 'dates': 'Sep 23 - Oct 22'},
      {'id': 'scorpio', 'name': 'Scorpio', 'symbol': '♏', 'dates': 'Oct 23 - Nov 21'},
      {'id': 'sagittarius', 'name': 'Sagittarius', 'symbol': '♐', 'dates': 'Nov 22 - Dec 21'},
      {'id': 'capricorn', 'name': 'Capricorn', 'symbol': '♑', 'dates': 'Dec 22 - Jan 19'},
      {'id': 'aquarius', 'name': 'Aquarius', 'symbol': '♒', 'dates': 'Jan 20 - Feb 18'},
      {'id': 'pisces', 'name': 'Pisces', 'symbol': '♓', 'dates': 'Feb 19 - Mar 20'},
    ];

    return GlassUtils.glassContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Your Zodiac Sign',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          
          if (selectedSign != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppTheme.primaryPurple.withOpacity(0.2),
                border: Border.all(
                  color: AppTheme.primaryPurple.withOpacity(0.5),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Text(
                    zodiacSigns.firstWhere((sign) => sign['id'] == selectedSign)['symbol']!,
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          zodiacSigns.firstWhere((sign) => sign['id'] == selectedSign)['name']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          zodiacSigns.firstWhere((sign) => sign['id'] == selectedSign)['dates']!,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => _showSignPicker(context, ref, zodiacSigns),
                    child: const Icon(
                      CupertinoIcons.chevron_down,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
            )
          else
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => _showSignPicker(context, ref, zodiacSigns),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white.withOpacity(0.1),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.star_circle,
                      color: Colors.white.withOpacity(0.7),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Choose your sign',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      CupertinoIcons.chevron_down,
                      color: Colors.white.withOpacity(0.7),
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildToneSelector(BuildContext context, WidgetRef ref, HoroscopeTone selectedTone) {
    return GlassUtils.glassContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Choose Tone',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          
          CupertinoSlidingSegmentedControl<HoroscopeTone>(
            backgroundColor: Colors.white.withOpacity(0.1),
            thumbColor: AppTheme.primaryPurple,
            groupValue: selectedTone,
            onValueChanged: (tone) {
              if (tone != null) {
                ref.read(horoscopeSelectedToneProvider.notifier).state = tone;
              }
            },
            children: const {
              HoroscopeTone.serious: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Text(
                  'Serious',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              HoroscopeTone.funny: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Text(
                  'Funny',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              HoroscopeTone.sincere: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Text(
                  'Sincere',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return GlassUtils.glassContainer(
      child: const Center(
        child: Column(
          children: [
            CupertinoActivityIndicator(color: Colors.white),
            SizedBox(height: 16),
            Text(
              'Reading the stars...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, Object error, WidgetRef ref) {
    return GlassUtils.glassContainer(
      child: Column(
        children: [
          const Icon(
            CupertinoIcons.exclamationmark_triangle,
            size: 48,
            color: Colors.orange,
          ),
          const SizedBox(height: 16),
          Text(
            'Failed to load horoscope',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          CupertinoButton.filled(
            onPressed: () {
              ref.read(horoscopeRefreshProvider.notifier).state++;
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildHoroscopeResult(BuildContext context, HoroscopeResponse horoscope) {
    return Column(
      children: [
        // Main prediction
        GlassUtils.glassContainer(
          color: AppTheme.primaryPurple,
          opacity: 0.15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Today\'s Reading',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: Text(
                      horoscope.tone.toString().split('.').last.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                horoscope.prediction,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Lucky details
        Row(
          children: [
            Expanded(
              child: GlassUtils.glassContainer(
                opacity: 0.1,
                color: AppTheme.accentGold,
                child: Column(
                  children: [
                    Icon(
                      CupertinoIcons.paintbrush,
                      color: AppTheme.accentGold,
                      size: 24,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Lucky Color',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      horoscope.luckyColor,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: GlassUtils.glassContainer(
                opacity: 0.1,
                color: AppTheme.secondaryBlue,
                child: Column(
                  children: [
                    Icon(
                      CupertinoIcons.number,
                      color: AppTheme.secondaryBlue,
                      size: 24,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Lucky Numbers',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      horoscope.luckyNumbers.join(', '),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        if (horoscope.advice != null) ...[
          const SizedBox(height: 16),
          GlassUtils.glassContainer(
            opacity: 0.1,
            color: AppTheme.accentGold,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '💡 Advice',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  horoscope.advice!,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],

        const SizedBox(height: 16),

        // Refresh button
        Consumer(
          builder: (context, ref, _) => CupertinoButton.filled(
            onPressed: () {
              ref.read(horoscopeRefreshProvider.notifier).state++;
            },
            child: const Text('Get New Reading'),
          ),
        ),
      ],
    );
  }

  void _showSignPicker(BuildContext context, WidgetRef ref, List<Map<String, String>> zodiacSigns) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => Container(
        height: 300,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: CupertinoPicker(
            magnification: 1.22,
            squeeze: 1.2,
            useMagnifier: true,
            itemExtent: 40,
            onSelectedItemChanged: (int selectedItem) {
              ref.read(horoscopeSelectedSignProvider.notifier).state = 
                  zodiacSigns[selectedItem]['id'];
            },
            children: zodiacSigns.map((sign) => Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    sign['symbol']!,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    sign['name']!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )).toList(),
          ),
        ),
      ),
    );
  }
}
