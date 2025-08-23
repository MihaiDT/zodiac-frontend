import 'dart:math' as math;
import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../config/app_colors.dart';
import '../../core/services/haptics_service.dart';
import '../../core/services/places_service.dart';
import '../../core/models/onboarding_models.dart';
import '../../core/widgets/skeleton_loader.dart';
import 'providers/onboarding_provider.dart';

class BirthDataScreen extends ConsumerStatefulWidget {
  const BirthDataScreen({super.key});

  @override
  ConsumerState<BirthDataScreen> createState() => _BirthDataScreenState();
}

class _BirthDataScreenState extends ConsumerState<BirthDataScreen>
    with TickerProviderStateMixin {
  late AnimationController _starsController;
  late AnimationController _zodiacRotationController;
  late AnimationController _finalPulseController;
  late AnimationController _movingStarsController;
  late AnimationController _transformationController;
  
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  PlaceModel? _selectedPlace;
  String? _zodiacSign;
  
  // Cosmic element states
  bool _allFieldsCompleted = false;
  bool _showTransformation = false;
  bool _showMovingStars = false;
  String? _sunSign;
  String? _moonSign;
  String? _ascendantSign;

  @override
  void initState() {
    super.initState();
    _starsController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);
    
    _zodiacRotationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    
    _finalPulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _movingStarsController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    );
    
    _transformationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _starsController.dispose();
    _zodiacRotationController.dispose();
    _finalPulseController.dispose();
    _movingStarsController.dispose();
    _transformationController.dispose();
    super.dispose();
  }

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

  Future<void> _selectDate() async {
    HapticsService.lightImpact();

    DateTime selectedDate = _selectedDate ?? DateTime(1990, 1, 1);

    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      useSafeArea: true,
      elevation: 0,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        spreadRadius: 0,
                        offset: const Offset(0, 8),
                      ),
                      BoxShadow(
                        color: Colors.white.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Drag handle
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),

                      // Header
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              'Select Birth Date',
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                HapticsService.lightImpact();
                                setState(() {
                                  _selectedDate = selectedDate;
                                  _zodiacSign = _calculateZodiacSign(
                                    selectedDate,
                                  );
                                });
                                Navigator.of(context).pop();
                                _activateCosmicElement();
                              },
                              child: const Text(
                                'Done',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Divider
                      Container(
                        height: 0.5,
                        color: Colors.white.withOpacity(0.2),
                      ),

                      // Cupertino Date Picker
                      Expanded(
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            cupertinoOverrideTheme: const CupertinoThemeData(
                              textTheme: CupertinoTextThemeData(
                                dateTimePickerTextStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                pickerTextStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: selectedDate,
                            minimumDate: DateTime(1900),
                            maximumDate: DateTime.now(),
                            backgroundColor: Colors.transparent,
                            onDateTimeChanged: (DateTime newDate) {
                              selectedDate = newDate;
                              HapticsService.selectionClick();
                            },
                          ),
                        ),
                      ),

                      // Bottom padding for safe area
                      SizedBox(height: MediaQuery.of(context).padding.bottom),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _selectTime() async {
    HapticsService.lightImpact();

    TimeOfDay selectedTime =
        _selectedTime ?? const TimeOfDay(hour: 12, minute: 0);

    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      useSafeArea: true,
      elevation: 0,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        spreadRadius: 0,
                        offset: const Offset(0, 8),
                      ),
                      BoxShadow(
                        color: Colors.white.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Drag handle
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),

                      // Header
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              'Select Birth Time',
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                HapticsService.lightImpact();
                                setState(() {
                                  _selectedTime = selectedTime;
                                });
                                Navigator.of(context).pop();
                                _activateCosmicElement();
                              },
                              child: const Text(
                                'Done',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Divider
                      Container(
                        height: 0.5,
                        color: Colors.white.withOpacity(0.2),
                      ),

                      // Cupertino Time Picker
                      Expanded(
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            cupertinoOverrideTheme: const CupertinoThemeData(
                              textTheme: CupertinoTextThemeData(
                                dateTimePickerTextStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                pickerTextStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.time,
                            use24hFormat:
                                false, // 12h format with AM/PM for USA users
                            minuteInterval: 1, // Allow all minutes
                            initialDateTime: DateTime(
                              2023,
                              1,
                              1,
                              selectedTime.hour == 0
                                  ? 12
                                  : (selectedTime.hour > 12
                                      ? selectedTime.hour - 12
                                      : selectedTime.hour),
                              selectedTime.minute,
                            ),
                            backgroundColor: Colors.transparent,
                            onDateTimeChanged: (DateTime newDateTime) {
                              selectedTime = TimeOfDay.fromDateTime(
                                newDateTime,
                              );
                              HapticsService.selectionClick();
                            },
                          ),
                        ),
                      ),

                      // Bottom padding for safe area
                      SizedBox(height: MediaQuery.of(context).padding.bottom),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _activateCosmicElement() async {
    // Start moving stars animation when first field is completed
    if (!_showMovingStars && 
        (_selectedDate != null || _selectedTime != null || _selectedPlace != null)) {
      print('Starting moving stars animation');
      setState(() => _showMovingStars = true);
      _movingStarsController.repeat();
    }
    
    // Check if all fields are completed
    if (_selectedDate != null && _selectedTime != null && _selectedPlace != null && !_allFieldsCompleted) {
      print('All fields completed, starting transformation');
      setState(() => _allFieldsCompleted = true);
      
      // Calculate cosmic signs
      _sunSign = _calculateZodiacSign(_selectedDate!);
      _moonSign = _calculateMoonSign();
      _ascendantSign = _calculateAscendantSign();
      
      // Short delay after completing last field
      await Future.delayed(const Duration(milliseconds: 800));
      
      // Start zodiac rotation
      _zodiacRotationController.forward();
      
      await Future.delayed(const Duration(milliseconds: 1000));
      
      // Stop moving stars and start transformation
      _movingStarsController.stop();
      setState(() {
        _showMovingStars = false;
        _showTransformation = true;
      });
      
      // Start transformation animation
      _transformationController.forward();
      
      // Add haptic feedback for the magical moment
      HapticsService.heavyImpact();
    }
  }
  
  String _calculateMoonSign() {
    // Simplified moon sign calculation for demo
    if (_selectedTime == null) return 'Cancer'; // Default moon sign
    
    final hour = _selectedTime!.hour;
    final moonSigns = [
      'Aries', 'Taurus', 'Gemini', 'Cancer', 'Leo', 'Virgo',
      'Libra', 'Scorpio', 'Sagittarius', 'Capricorn', 'Aquarius', 'Pisces'
    ];
    
    return moonSigns[hour % 12];
  }
  
  String _calculateAscendantSign() {
    // Simplified ascendant calculation for demo
    if (_selectedPlace == null) return 'Leo'; // Default ascendant
    
    final placeName = _selectedPlace!.name.toLowerCase();
    final ascendantSigns = [
      'Aries', 'Taurus', 'Gemini', 'Cancer', 'Leo', 'Virgo',
      'Libra', 'Scorpio', 'Sagittarius', 'Capricorn', 'Aquarius', 'Pisces'
    ];
    
    return ascendantSigns[placeName.hashCode.abs() % 12];
  }

  void _selectBirthPlace() {
    HapticsService.lightImpact();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false, // Disable drag to prevent interference with map gestures
      isDismissible: true,
      useSafeArea: true,
      elevation: 0,
      builder:
          (context) => _BirthPlaceSheet(
            onPlaceSelected: (place) {
              setState(() {
                _selectedPlace = place;
              });
              _activateCosmicElement();
            },
            initialPlace: _selectedPlace,
          ),
    );
  }

  void _continueToNext() {
    if (_selectedDate == null) return;

    HapticsService.mediumImpact();

    // Create birth data
    final birthData = BirthData(
      birthDate: _selectedDate!,
      birthTime: _selectedTime?.format(context),
      birthPlace: _selectedPlace?.address,
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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.getBackgroundGradient(isDarkMode),
        ),
        child: Stack(
          children: [
            // Stars background
            AnimatedBuilder(
              animation: _starsController,
              child: const SizedBox.expand(), // Static child for performance
              builder: (context, child) {
                return SizedBox.expand(
                  child: CustomPaint(
                    painter: StarsPainter(_starsController),
                    size: Size.infinite,
                  ),
                );
              },
            ),

            // Content
            SafeArea(
              child: Column(
                children: [
                  // Custom header with back button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () => context.go('/onboarding'),
                        ),
                        const Expanded(
                          child: Text(
                            'Birth Information',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 48), // Balance the back button
                      ],
                    ),
                  ),

                  // Main content
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 32), // Added spacing at the top
                          Text(
                            'Tell us about yourself',
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'We\'ll use this information to create your personalized horoscope and zodiac profile.',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.onBackground.withOpacity(0.7),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 32),

                          // Input Cards in a Row
                          Row(
                            children: [
                              // Birth Date
                              Expanded(
                                child: _buildCompactInputCard(
                                  title: 'Date',
                                  subtitle: _selectedDate != null
                                      ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                                      : 'Select',
                                  icon: Icons.calendar_today,
                                  onTap: _selectDate,
                                  isDarkMode: isDarkMode,
                                  isRequired: true,
                                ),
                              ),
                              const SizedBox(width: 8),
                              // Birth Time
                              Expanded(
                                child: _buildCompactInputCard(
                                  title: 'Time',
                                  subtitle: _selectedTime != null
                                      ? _selectedTime!.format(context)
                                      : 'Select',
                                  icon: Icons.access_time,
                                  onTap: _selectTime,
                                  isDarkMode: isDarkMode,
                                ),
                              ),
                              const SizedBox(width: 8),
                              // Birth Place
                              Expanded(
                                child: _buildCompactInputCard(
                                  title: 'Place',
                                  subtitle: _selectedPlace?.name ?? 'Select',
                                  icon: Icons.location_on,
                                  onTap: _selectBirthPlace,
                                  isDarkMode: isDarkMode,
                                ),
                              ),
                            ],
                          ),

                          if (_selectedDate != null || _selectedTime != null || _selectedPlace != null) ...[
                            const SizedBox(height: 20),
                            Container(
                              width: double.infinity,
                              height: 320, // Increased height for larger wheel
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // Show transformation text or zodiac wheel
                                  if (_showTransformation)
                                    // Magical transformation text
                                    AnimatedBuilder(
                                      animation: _transformationController,
                                      builder: (context, child) {
                                        return AnimatedOpacity(
                                          opacity: _transformationController.value,
                                          duration: const Duration(milliseconds: 500),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              // Sun
                                              _buildCosmicText(
                                                '☉ Sun in $_sunSign',
                                                Colors.amber,
                                                0.0,
                                              ),
                                              const SizedBox(height: 16),
                                              // Moon
                                              _buildCosmicText(
                                                '☽ Moon in $_moonSign',
                                                Colors.blue.shade300,
                                                0.3,
                                              ),
                                              const SizedBox(height: 16),
                                              // Ascendant
                                              _buildCosmicText(
                                                '↑ Ascendant in $_ascendantSign',
                                                Colors.green.shade400,
                                                0.6,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    )
                                  else
                                    // Zodiac Wheel with moving stars
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        // Static Zodiac Wheel Background
                                        AnimatedBuilder(
                                          animation: _zodiacRotationController,
                                          builder: (context, child) {
                                            return Transform.rotate(
                                              angle: _zodiacRotationController.value * 2 * math.pi,
                                              child: Container(
                                                width: 300,
                                                height: 300,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(150),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/birth_wheel.png',
                                                  width: 300,
                                                  height: 300,
                                                  fit: BoxFit.contain,
                                                  color: Colors.white.withOpacity(0.6),
                                                  colorBlendMode: BlendMode.modulate,
                                                  errorBuilder: (context, error, stackTrace) {
                                                    return Container(
                                                      width: 300,
                                                      height: 300,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: Colors.white.withOpacity(0.3),
                                                          width: 2,
                                                        ),
                                                      ),
                                                      child: const Center(
                                                        child: Text(
                                                          'Birth Wheel',
                                                          style: TextStyle(
                                                            color: Colors.white54,
                                                            fontSize: 14,
                                                          ),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        
                                        // Moving stars on wheel circumference
                                        if (_showMovingStars)
                                          AnimatedBuilder(
                                            animation: _movingStarsController,
                                            builder: (context, child) {
                                              return CustomPaint(
                                                size: const Size(320, 320),
                                                painter: MovingStarsOnWheelPainter(
                                                  _movingStarsController,
                                                  140.0, // Radius slightly smaller than wheel
                                                  const Offset(160, 160), // Center of 320x320
                                                ),
                                              );
                                            },
                                          ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ],

                          // Spacer to push button to bottom
                          const Spacer(),

                          // Continue Button
                          ClipRRect(
                            borderRadius: BorderRadius.circular(28),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                width: double.infinity,
                                height: 56,
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color:
                                      isDarkMode
                                          ? const Color(0xFF0033FF).withOpacity(
                                            0.3,
                                          ) // Dark mode - using gradient blue
                                          : const Color(0xFF7986CB).withOpacity(
                                            0.4,
                                          ), // Light mode - using gradient indigo
                                  border: Border.all(
                                    color:
                                        isDarkMode
                                            ? Colors.white.withOpacity(0.2)
                                            : Colors.white.withOpacity(
                                              0.4,
                                            ), // Better contrast on both modes
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(
                                        0.05,
                                      ), // Reduced shadow opacity
                                      blurRadius: 10, // Reduced blur
                                      spreadRadius: 0,
                                      offset: const Offset(
                                        0,
                                        4,
                                      ), // Reduced offset
                                    ),
                                    BoxShadow(
                                      color:
                                          isDarkMode
                                              ? Colors.white.withOpacity(
                                                0.05,
                                              ) // Reduced inner glow
                                              : Colors.white.withOpacity(0.1),
                                      blurRadius:
                                          6, // Reduced blur for inner glow
                                      spreadRadius: 0,
                                      offset: const Offset(
                                        0,
                                        1,
                                      ), // Reduced offset
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  onPressed:
                                      _selectedDate != null &&
                                              !onboardingState.isLoading
                                          ? _continueToNext
                                          : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    foregroundColor:
                                        isDarkMode
                                            ? Colors.white
                                            : Colors.white,
                                    elevation: 0,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28),
                                    ),
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCosmicText(String text, Color color, double delay) {
    return AnimatedBuilder(
      animation: _transformationController,
      builder: (context, child) {
        // Calculate delayed animation value
        final delayedValue = math.max(0.0, (_transformationController.value - delay) / (1.0 - delay));
        final clampedValue = math.min(1.0, delayedValue);
        
        return AnimatedOpacity(
          opacity: clampedValue,
          duration: const Duration(milliseconds: 300),
          child: Transform.scale(
            scale: 0.8 + (clampedValue * 0.2),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: color.withOpacity(0.5),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: color.withOpacity(0.8),
                      offset: const Offset(0, 0),
                      blurRadius: 10,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCompactInputCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
    required bool isDarkMode,
    bool isRequired = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? Colors.white.withOpacity(0.15)
                  : const Color(0xFF7986CB).withOpacity(0.4),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Icon(icon, color: Colors.white, size: 18),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if (isRequired) ...[
                      const SizedBox(width: 2),
                      Text(
                        '*',
                        style: TextStyle(
                          color: Colors.red.shade300,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StarsPainter extends CustomPainter {
  final Animation<double> animation;
  final math.Random _random = math.Random(42);
  static const int _starCount = 60; // Reduced from 80 for better performance

  StarsPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..style = PaintingStyle.fill
          ..isAntiAlias = true;

    for (int i = 0; i < _starCount; i++) {
      final x = _random.nextDouble() * size.width;
      final y = _random.nextDouble() * size.height;
      final opacity =
          (math.sin(animation.value * 2 * math.pi + i * 0.1) + 1) / 2;
      final size_multiplier =
          0.5 + opacity * 0.5; // Dynamic size based on opacity

      paint.color = Colors.white.withOpacity(opacity * 0.7);

      canvas.drawCircle(Offset(x, y), 1.2 * size_multiplier, paint);
    }
  }

  @override
  bool shouldRepaint(covariant StarsPainter oldDelegate) {
    return oldDelegate.animation.value != animation.value;
  }
}

class MovingStarsOnWheelPainter extends CustomPainter {
  final Animation<double> animation;
  final double wheelRadius;
  final Offset center;
  static const int _starsCount = 12;

  MovingStarsOnWheelPainter(this.animation, this.wheelRadius, this.center) 
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    for (int i = 0; i < _starsCount; i++) {
      // Calculate star position on the wheel circumference
      final angle = (animation.value * 2 * math.pi) + (i * 2 * math.pi / _starsCount);
      final x = center.dx + wheelRadius * math.cos(angle);
      final y = center.dy + wheelRadius * math.sin(angle);
      
      // Create pulsing effect
      final pulsePhase = (animation.value * 4 + i * 0.5) % 1.0;
      final opacity = (math.sin(pulsePhase * 2 * math.pi) + 1) / 2;
      final starSize = 2.0 + opacity * 2.0;
      
      // Different colors for different stars
      final colors = [
        Colors.amber,
        Colors.cyan,
        Colors.pink,
        Colors.lightBlue,
        Colors.yellow,
        Colors.purple,
      ];
      
      paint.color = colors[i % colors.length].withOpacity(0.8 * opacity);
      
      // Draw star with glow effect
      canvas.drawCircle(Offset(x, y), starSize, paint);
      
      // Add glow
      paint.color = colors[i % colors.length].withOpacity(0.3 * opacity);
      canvas.drawCircle(Offset(x, y), starSize * 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant MovingStarsOnWheelPainter oldDelegate) {
    return oldDelegate.animation.value != animation.value;
  }
}

class _BirthPlaceSheet extends StatefulWidget {
  final Function(PlaceModel) onPlaceSelected;
  final PlaceModel? initialPlace;

  const _BirthPlaceSheet({required this.onPlaceSelected, this.initialPlace});

  @override
  State<_BirthPlaceSheet> createState() => _BirthPlaceSheetState();
}

class _BirthPlaceSheetState extends State<_BirthPlaceSheet> {
  final TextEditingController _searchController = TextEditingController();
  List<PlaceModel> _searchResults = [];
  bool _isLoading = false;
  bool _isGettingCurrentLocation = false;
  GoogleMapController? _mapController;
  PlaceModel? _selectedMapPlace;

  // Default location (San Francisco)
  static const LatLng _defaultLocation = LatLng(37.7749, -122.4194);
  LatLng _currentMapCenter = _defaultLocation;
  LatLng? _currentUserLocation;
  LatLng? _selectedMapLocation;
  Set<Marker> _markers = {};
  bool _isMapReady = false;
  
  // Performance optimizations
  static final Map<String, List<PlaceModel>> _searchCache = {};
  static final Map<String, PlaceModel> _locationCache = {};
  bool _isSearching = false;
  Timer? _searchTimer;

  // Map styles for different themes
  static const String _lightMapStyle = '''[
    {
      "featureType": "all",
      "stylers": [
        {"saturation": -30},
        {"lightness": 20}
      ]
    },
    {
      "featureType": "poi",
      "stylers": [
        {"visibility": "simplified"}
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry",
      "stylers": [
        {"visibility": "simplified"}
      ]
    }
  ]''';

  static const String _darkMapStyle = '''[
    {
      "elementType": "geometry",
      "stylers": [
        {"color": "#2d2d2d"}
      ]
    },
    {
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#b0b0b0"}
      ]
    },
    {
      "elementType": "labels.text.stroke",
      "stylers": [
        {"color": "#2d2d2d"}
      ]
    },
    {
      "featureType": "administrative",
      "elementType": "geometry",
      "stylers": [
        {"color": "#757575"},
        {"visibility": "on"}
      ]
    },
    {
      "featureType": "administrative.country",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#c0c0c0"}
      ]
    },
    {
      "featureType": "administrative.locality",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#e0e0e0"}
      ]
    },
    {
      "featureType": "poi",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#a0a0a0"}
      ]
    },
    {
      "featureType": "poi",
      "elementType": "geometry",
      "stylers": [
        {"color": "#3a3a3a"}
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "geometry",
      "stylers": [
        {"color": "#263c3c"}
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#6b9a76"}
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry.fill",
      "stylers": [
        {"color": "#4a4a4a"}
      ]
    },
    {
      "featureType": "road",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#c0c0c0"}
      ]
    },
    {
      "featureType": "road.arterial",
      "elementType": "geometry",
      "stylers": [
        {"color": "#555555"}
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry",
      "stylers": [
        {"color": "#606060"}
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#e0e0e0"}
      ]
    },
    {
      "featureType": "transit",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#a0a0a0"}
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [
        {"color": "#1a1a2e"}
      ]
    },
    {
      "featureType": "water",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#6b9dc2"}
      ]
    }
  ]''';

  String _getMapStyle(bool isDarkMode) {
    return isDarkMode ? _darkMapStyle : _lightMapStyle;
  }  @override
  void dispose() {
    _searchController.dispose();
    _mapController?.dispose();
    _searchTimer?.cancel();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _isMapReady = true;
    });

    // Get current location when map is ready (only if not already detected)
    if (_currentUserLocation == null) {
      _detectCurrentLocation();
    }
    
    print('Map created and ready for interactions');
  }

  void _onMapTap(LatLng position) async {
    setState(() {
      _selectedMapLocation = position;
      _currentMapCenter = position;
      _updateMapMarkers();
    });

    // Get place info from coordinates with caching
    try {
      final cacheKey =
          '${position.latitude.toStringAsFixed(4)},${position.longitude.toStringAsFixed(4)}';

      PlaceModel? place = _locationCache[cacheKey];
      if (place == null) {
        place = await PlacesService.getPlaceFromCoordinates(
          position.latitude,
          position.longitude,
        );
        if (place != null) {
          _locationCache[cacheKey] = place;
        }
      }

      if (place != null) {
        setState(() {
          _selectedMapPlace = place;
        });
      }
    } catch (e) {
      print('Error getting place from map tap: $e');
    }
  }

  void _moveToPlace(PlaceModel place) {
    if (_mapController != null && _isMapReady) {
      final position = LatLng(place.latitude, place.longitude);
      _mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: position,
            zoom: 14.0, // Better zoom level for city view
            bearing: 0,
            tilt: 0,
          ),
        ),
      );
      setState(() {
        _currentMapCenter = position;
        _selectedMapLocation = position;
        _selectedMapPlace = place;
        _updateMapMarkers();
      });
    }
  }

  // Detect current user location
  Future<void> _detectCurrentLocation() async {
    if (_currentUserLocation != null) return; // Already detected

    try {
      final position = await PlacesService.getCurrentLocation();
      if (position != null && mounted) {
        setState(() {
          _currentUserLocation = LatLng(position.latitude, position.longitude);
          _currentMapCenter = _currentUserLocation!;
          _updateMapMarkers();
        });

        // Move map to current location only if no place is selected yet
        if (_mapController != null &&
            _isMapReady &&
            _selectedMapLocation == null) {
          _mapController!.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: _currentUserLocation!,
                zoom: 12.0,
                bearing: 0,
                tilt: 0,
              ),
            ),
          );
        }
      }
    } catch (e) {
      print('Error detecting current location: $e');
    }
  }

  // Update markers on map
  void _updateMapMarkers() {
    Set<Marker> markers = {};
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Add current location marker
    if (_currentUserLocation != null) {
      markers.add(
        Marker(
          markerId: const MarkerId('current_location'),
          position: _currentUserLocation!,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            isDarkMode ? BitmapDescriptor.hueCyan : BitmapDescriptor.hueBlue
          ),
          infoWindow: const InfoWindow(
            title: 'Current Location',
            snippet: 'Your current position',
          ),
        ),
      );
    }

    // Add selected location marker
    if (_selectedMapLocation != null) {
      markers.add(
        Marker(
          markerId: const MarkerId('selected_location'),
          position: _selectedMapLocation!,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            isDarkMode ? BitmapDescriptor.hueYellow : BitmapDescriptor.hueRed
          ),
          infoWindow: InfoWindow(
            title: _selectedMapPlace?.name ?? 'Selected Location',
            snippet:
                _selectedMapPlace?.address ?? 'Tap to select this location',
          ),
        ),
      );
    }

    if (mounted) {
      setState(() {
        _markers = markers;
      });
    }
  }

  Future<void> _searchPlaces(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
        _isSearching = false;
      });
      return;
    }

    // Cancel previous search timer
    _searchTimer?.cancel();

    // Set debouncing timer
    _searchTimer = Timer(const Duration(milliseconds: 500), () async {
      if (!mounted) return;

      setState(() {
        _isSearching = true;
      });

      try {
        // Check cache first
        List<PlaceModel> results = _searchCache[query.toLowerCase()] ?? [];

        if (results.isEmpty) {
          // Perform actual search
          results = await PlacesService.searchPlaces(query);
          // Cache results
          _searchCache[query.toLowerCase()] = results;
        }

        if (mounted) {
          setState(() {
            _searchResults = results;
            _isLoading = false;
            _isSearching = false;
          });
        }
      } catch (e) {
        if (mounted) {
          setState(() {
            _isLoading = false;
            _isSearching = false;
            _searchResults = [];
          });
        }
        print('Search error: $e');
      }
    });
  }

  Future<void> _getCurrentLocation() async {
    setState(() {
      _isGettingCurrentLocation = true;
    });

    try {
      final position = await PlacesService.getCurrentLocation();
      if (position != null) {
        final place = await PlacesService.getPlaceFromCoordinates(
          position.latitude,
          position.longitude,
        );
        if (place != null) {
          // Move map to current location
          _moveToPlace(place);
          // Set as selected place but don't close the sheet
          setState(() {
            _selectedMapPlace = place;
            _selectedMapLocation = LatLng(position.latitude, position.longitude);
          });
        }
      }
    } catch (e) {
      print('Current location error: $e');
    } finally {
      setState(() {
        _isGettingCurrentLocation = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 0,
                offset: const Offset(0, 8),
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque, // Ensure proper gesture handling
            onTap: () {}, // Empty onTap to prevent dismissal on map interaction
            child: Column(
            children: [
              // Drag handle
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      _selectedMapPlace != null 
                        ? 'Birth Place Selected'
                        : 'Select Birth Place',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        // If a place is selected, send it to parent and close
                        if (_selectedMapPlace != null) {
                          widget.onPlaceSelected(_selectedMapPlace!);
                        }
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(
                          color: _selectedMapPlace != null ? Colors.white : Colors.white.withOpacity(0.5),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Divider
              Container(height: 0.5, color: Colors.white.withOpacity(0.2)),

              // Content
              Expanded(
                child: Column(
                  children: [
                    // Fixed top section with search
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          // Search input
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: TextField(
                              controller: _searchController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Search for a place...',
                                hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white.withOpacity(0.6),
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(16),
                              ),
                              onChanged: _searchPlaces,
                            ),
                          ),

                          const SizedBox(height: 12),

                          // Current Location Button
                          Container(
                            width: double.infinity,
                            child: CupertinoButton(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              onPressed:
                                  _isGettingCurrentLocation
                                      ? null
                                      : _getCurrentLocation,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.2),
                                    width: 1,
                                  ),
                                ),
                                child:
                                    _isGettingCurrentLocation
                                        ? const SkeletonText(
                                          height: 16,
                                          width: 150,
                                        )
                                        : Row(
                                          children: [
                                            Icon(
                                              Icons.my_location,
                                              color: Colors.white.withOpacity(
                                                0.8,
                                              ),
                                              size: 20,
                                            ),
                                            const SizedBox(width: 12),
                                            Text(
                                              'Use Current Location',
                                              style: TextStyle(
                                                color: Colors.white.withOpacity(
                                                  0.8,
                                                ),
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Divider
                    Container(
                      height: 1,
                      color: Colors.white.withOpacity(0.1),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                    ),

                    // Dynamic content area
                    Expanded(
                      child:
                          _isLoading || _isSearching
                              ? const Padding(
                                padding: EdgeInsets.all(16),
                                child: SkeletonSearchResult(itemCount: 4),
                              )
                              : _searchResults.isNotEmpty
                              // Search Results View
                              ? ListView.builder(
                                padding: const EdgeInsets.all(16),
                                itemCount: _searchResults.length,
                                itemBuilder: (context, index) {
                                  final place = _searchResults[index];
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        _moveToPlace(place);
                                        // Set as selected place but don't close the sheet
                                        setState(() {
                                          _selectedMapPlace = place;
                                          _selectedMapLocation = LatLng(place.latitude, place.longitude);
                                          _searchResults = []; // Clear search results
                                          _searchController.clear(); // Clear search text
                                        });
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          border: Border.all(
                                            color: Colors.white.withOpacity(
                                              0.2,
                                            ),
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.white.withOpacity(
                                                0.8,
                                              ),
                                              size: 20,
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    place.name,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    place.address,
                                                    style: TextStyle(
                                                      color: Colors.white
                                                          .withOpacity(0.7),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white.withOpacity(
                                                0.5,
                                              ),
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                              // Map View
                              : Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    // Google Map
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          border: Border.all(
                                            color: Colors.white.withOpacity(
                                              0.2,
                                            ),
                                            width: 1,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Stack(
                                            children: [
                                              // Google Map with full interaction
                                              GoogleMap(
                                                onMapCreated: _onMapCreated,
                                                onTap: _onMapTap,
                                                onCameraMove: (CameraPosition position) {
                                                  // Debug: Confirm camera movement
                                                  print('Camera moved to: ${position.target}');
                                                },
                                                initialCameraPosition:
                                                    CameraPosition(
                                                      target: _currentMapCenter,
                                                      zoom: 11.0,
                                                    ),
                                                markers: _markers,
                                                myLocationButtonEnabled: false,
                                                zoomControlsEnabled: false,
                                                mapToolbarEnabled: false,
                                                buildingsEnabled:
                                                    false, // Disable for better performance
                                                compassEnabled:
                                                    true, // Re-enable for navigation
                                                rotateGesturesEnabled:
                                                    true, // Re-enable for navigation
                                                tiltGesturesEnabled:
                                                    true, // Re-enable for navigation
                                                scrollGesturesEnabled:
                                                    true, // Ensure scroll is enabled
                                                zoomGesturesEnabled:
                                                    true, // Ensure zoom is enabled
                                                trafficEnabled:
                                                    false, // Keep disabled for performance
                                                indoorViewEnabled: false,
                                                style: _getMapStyle(isDarkMode),
                                              ),
                                              
                                              // Loading overlay
                                              if (!_isMapReady)
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.black.withOpacity(0.3),
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  child: Center(
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        CircularProgressIndicator(
                                                          color: Colors.white,
                                                          strokeWidth: 2,
                                                        ),
                                                        const SizedBox(height: 8),
                                                        Text(
                                                          'Loading map...',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                
                                              // Navigation hint
                                              if (_isMapReady && _selectedMapLocation == null)
                                                Positioned(
                                                  bottom: 16,
                                                  left: 16,
                                                  right: 16,
                                                  child: Container(
                                                    padding: const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 8,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: isDarkMode 
                                                        ? Colors.black.withOpacity(0.8)
                                                        : Colors.white.withOpacity(0.9),
                                                      borderRadius: BorderRadius.circular(8),
                                                      border: isDarkMode 
                                                        ? Border.all(color: Colors.white.withOpacity(0.2))
                                                        : null,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Icon(
                                                          Icons.touch_app,
                                                          color: isDarkMode ? Colors.white : Colors.black87,
                                                          size: 16,
                                                        ),
                                                        const SizedBox(width: 8),
                                                        Text(
                                                          'Tap on map to select location',
                                                          style: TextStyle(
                                                            color: isDarkMode ? Colors.white : Colors.black87,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Selected place card
                                    if (_selectedMapPlace != null) ...[
                                      const SizedBox(height: 12),
                                      Container(
                                        width: double.infinity,
                                        child: CupertinoButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            // Select the location and close the sheet
                                            widget.onPlaceSelected(
                                              _selectedMapPlace!,
                                            );
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(
                                                0.15,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color: Colors.green.withOpacity(
                                                  0.5,
                                                ),
                                                width: 2,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.green.withOpacity(0.2),
                                                  blurRadius: 8,
                                                  spreadRadius: 0,
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: Colors.green,
                                                  size: 20,
                                                ),
                                                const SizedBox(width: 12),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        _selectedMapPlace!.name,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 2),
                                                      Text(
                                                        _selectedMapPlace!
                                                            .address,
                                                        style: TextStyle(
                                                          color: Colors.white
                                                              .withOpacity(0.8),
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 6,
                                                      ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.green
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons.check_circle,
                                                        color: Colors.green,
                                                        size: 14,
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        'Select',
                                                        style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                    ),
                  ],
                ),
              ),

              // Bottom padding for safe area
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
            ),
          ),
        ),
      ),
    );
  }
}
