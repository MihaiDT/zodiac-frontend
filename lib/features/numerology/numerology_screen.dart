import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../app/theme/app_theme.dart';
import 'models/numerology.dart';
import 'providers/numerology_providers.dart';

class NumerologyScreen extends HookConsumerWidget {
  const NumerologyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final selectedDate = useState<DateTime?>(null);

    final keyFiguresState = ref.watch(keyFiguresProvider);
    final interpretationsState = ref.watch(interpretationsProvider);

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
                _buildForm(
                  theme,
                  firstNameController,
                  lastNameController,
                  selectedDate,
                  context,
                ),
                const SizedBox(height: 24),
                _buildCalculateButton(
                  theme,
                  firstNameController,
                  lastNameController,
                  selectedDate,
                  ref,
                ),
                const SizedBox(height: 30),
                if (keyFiguresState.hasValue &&
                    keyFiguresState.value != null) ...[
                  _buildKeyFiguresResults(theme, keyFiguresState.value!),
                  const SizedBox(height: 20),
                  _buildInterpretationsButton(theme, ref),
                ],
                if (interpretationsState.hasValue &&
                    interpretationsState.value != null) ...[
                  const SizedBox(height: 30),
                  _buildInterpretationsResults(
                    theme,
                    interpretationsState.value!,
                  ),
                ],
                if (keyFiguresState.isLoading || interpretationsState.isLoading)
                  _buildLoadingIndicator(theme),
                if (keyFiguresState.hasError || interpretationsState.hasError)
                  _buildErrorMessage(
                    theme,
                    keyFiguresState.error ?? interpretationsState.error,
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
          'Numerology',
          style: theme.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 32,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Discover your life path numbers and their meanings',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.white.withOpacity(0.8),
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildForm(
    ThemeData theme,
    TextEditingController firstNameController,
    TextEditingController lastNameController,
    ValueNotifier<DateTime?> selectedDate,
    BuildContext context,
  ) {
    return Column(
      children: [
        _buildGlassContainer(
          theme,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Personal Information',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                theme,
                controller: firstNameController,
                label: 'First Name',
                placeholder: 'Enter your first name',
              ),
              const SizedBox(height: 16),
              _buildTextField(
                theme,
                controller: lastNameController,
                label: 'Last Name',
                placeholder: 'Enter your last name',
              ),
              const SizedBox(height: 16),
              _buildDatePicker(theme, selectedDate, context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
    ThemeData theme, {
    required TextEditingController controller,
    required String label,
    required String placeholder,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
          ),
          child: CupertinoTextField(
            controller: controller,
            placeholder: placeholder,
            style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
            placeholderStyle: theme.textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.6),
            ),
            decoration: null,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildDatePicker(
    ThemeData theme,
    ValueNotifier<DateTime?> selectedDate,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Birth Date',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _showDatePicker(context, selectedDate),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedDate.value != null
                        ? '${selectedDate.value!.day}/${selectedDate.value!.month}/${selectedDate.value!.year}'
                        : 'Select your birth date',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color:
                          selectedDate.value != null
                              ? Colors.white
                              : Colors.white.withOpacity(0.6),
                    ),
                  ),
                ),
                Icon(
                  CupertinoIcons.calendar,
                  color: Colors.white.withOpacity(0.7),
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showDatePicker(
    BuildContext context,
    ValueNotifier<DateTime?> selectedDate,
  ) {
    showCupertinoModalPopup(
      context: context,
      builder:
          (context) => Container(
            height: 300,
            color: CupertinoColors.systemBackground.resolveFrom(context),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
                        child: const Text('Cancel'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      CupertinoButton(
                        child: const Text('Done'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: selectedDate.value ?? DateTime.now(),
                    maximumDate: DateTime.now(),
                    onDateTimeChanged: (date) {
                      selectedDate.value = date;
                    },
                  ),
                ),
              ],
            ),
          ),
    );
  }

  Widget _buildCalculateButton(
    ThemeData theme,
    TextEditingController firstNameController,
    TextEditingController lastNameController,
    ValueNotifier<DateTime?> selectedDate,
    WidgetRef ref,
  ) {
    return HookConsumer(
      builder: (context, ref, child) {
        final firstName = useState(firstNameController.text);
        final lastName = useState(lastNameController.text);

        useEffect(() {
          void listener() {
            firstName.value = firstNameController.text;
            lastName.value = lastNameController.text;
          }

          firstNameController.addListener(listener);
          lastNameController.addListener(listener);
          return () {
            firstNameController.removeListener(listener);
            lastNameController.removeListener(listener);
          };
        });

        final canCalculate =
            firstName.value.isNotEmpty &&
            lastName.value.isNotEmpty &&
            selectedDate.value != null;

        return Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            gradient:
                canCalculate
                    ? const LinearGradient(
                      colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                    : null,
            color: canCalculate ? null : Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
            boxShadow:
                canCalculate
                    ? [
                      BoxShadow(
                        color: const Color(0xFF6366F1).withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ]
                    : null,
          ),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed:
                canCalculate
                    ? () => _calculateKeyFigures(
                      ref,
                      firstNameController.text,
                      lastNameController.text,
                      selectedDate.value!,
                    )
                    : null,
            child: Text(
              'Calculate Key Figures',
              style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildKeyFiguresResults(
    ThemeData theme,
    KeyFiguresResponse keyFigures,
  ) {
    return _buildGlassContainer(
      theme,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Key Figures',
            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildNumberCard(
                  theme,
                  'Life Path',
                  keyFigures.lifePathNumber.toString(),
                  const Color(0xFF6366F1),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildNumberCard(
                  theme,
                  'Expression',
                  keyFigures.expressionNumber.toString(),
                  const Color(0xFF8B5CF6),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildNumberCard(
                  theme,
                  'Soul Urge',
                  keyFigures.soulUrgeNumber.toString(),
                  const Color(0xFFEC4899),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildNumberCard(
                  theme,
                  'Personality',
                  keyFigures.personalityNumber.toString(),
                  const Color(0xFF06B6D4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumberCard(
    ThemeData theme,
    String label,
    String number,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Column(
        children: [
          Text(
            number,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: Colors.white.withOpacity(0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInterpretationsButton(ThemeData theme, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFEC4899), Color(0xFFF97316)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFEC4899).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () => _getInterpretations(ref),
        child: Text(
          'Get Interpretations',
          style: theme.textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildInterpretationsResults(
    ThemeData theme,
    InterpretationsResponse interpretations,
  ) {
    return _buildGlassContainer(
      theme,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Number Interpretations',
            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          // Overall Reading
          _buildInterpretationCard(
            theme,
            'Overall Reading',
            interpretations.overallReading,
            const Color(0xFF6366F1),
          ),
          const SizedBox(height: 12),

          // Strengths
          _buildListCard(
            theme,
            'Strengths',
            interpretations.strengths,
            const Color(0xFF10B981),
          ),
          const SizedBox(height: 12),

          // Challenges
          _buildListCard(
            theme,
            'Challenges',
            interpretations.challenges,
            const Color(0xFFEF4444),
          ),
          const SizedBox(height: 12),

          // Advice
          _buildInterpretationCard(
            theme,
            'Advice',
            interpretations.advice,
            const Color(0xFF8B5CF6),
          ),
        ],
      ),
    );
  }

  Widget _buildListCard(
    ThemeData theme,
    String title,
    List<String> items,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          ...items
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• ',
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          item,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white.withOpacity(0.9),
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }

  Widget _buildInterpretationCard(
    ThemeData theme,
    String title,
    String content,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white.withOpacity(0.9),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
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
              'Calculating your numbers...',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorMessage(ThemeData theme, Object? error) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.withOpacity(0.3), width: 1),
      ),
      child: Row(
        children: [
          const Icon(
            CupertinoIcons.exclamationmark_triangle,
            color: Colors.red,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Error: ${error.toString()}',
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassContainer(ThemeData theme, {required Widget child}) {
    return GlassUtils.glassContainer(child: child);
  }

  void _calculateKeyFigures(
    WidgetRef ref,
    String firstName,
    String lastName,
    DateTime birthDate,
  ) {
    final request = NumerologyRequest(
      firstName: firstName,
      lastName: lastName,
      birthdate:
          '${birthDate.year}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}',
    );

    // Update the form provider, which will trigger the keyFiguresProvider
    ref
        .read(numerologyFormProvider.notifier)
        .updateForm(
          firstName: request.firstName,
          lastName: request.lastName,
          birthdate: request.birthdate,
        );
  }

  void _getInterpretations(WidgetRef ref) {
    // Interpretations provider automatically triggers when key figures are available
    // Force refresh by invalidating the provider
    ref.invalidate(interpretationsProvider);
  }
}
