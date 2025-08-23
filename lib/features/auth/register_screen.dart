import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'providers/auth_controller.dart';
import '../onboarding/providers/onboarding_provider.dart';

class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final isPasswordVisible = useState(false);
    final isConfirmPasswordVisible = useState(false);
    final agreedToTerms = useState(false);
    final birthDate = useState<DateTime?>(null);

    final authState = ref.watch(authControllerProvider);
    final authController = ref.read(authControllerProvider.notifier);

    // Watch onboarding data
    final onboardingState = ref.watch(onboardingProvider);

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    // Listen to auth state changes
    ref.listen(authControllerProvider, (previous, next) {
      if (next.isAuthenticated) {
        // Navigate to home/dashboard on successful registration
        context.go('/home');
      }
    });

    Future<void> handleRegister() async {
      // Validation
      if (nameController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty ||
          confirmPasswordController.text.isEmpty) {
        _showErrorDialog(context, 'Please fill in all required fields');
        return;
      }

      if (!_isValidEmail(emailController.text)) {
        _showErrorDialog(context, 'Please enter a valid email address');
        return;
      }

      if (!_isStrongPassword(passwordController.text)) {
        _showErrorDialog(
          context,
          'Password must be at least 8 characters long and contain uppercase, lowercase, number, and special character',
        );
        return;
      }

      if (passwordController.text != confirmPasswordController.text) {
        _showErrorDialog(context, 'Passwords do not match');
        return;
      }

      if (!agreedToTerms.value) {
        _showErrorDialog(
          context,
          'Please agree to the Terms of Service and Privacy Policy',
        );
        return;
      }

      // Check if we have onboarding data
      final onboardingState = ref.read(onboardingProvider);
      final hasOnboardingData =
          onboardingState.birthData != null &&
          onboardingState.preferences != null;

      bool success = false;

      if (hasOnboardingData) {
        // Use onboarding provider for registration with profile data
        try {
          final onboardingNotifier = ref.read(onboardingProvider.notifier);
          await onboardingNotifier.completeRegistration(
            email: emailController.text.trim(),
            password: passwordController.text,
            firstName: nameController.text.trim().split(' ').first,
            lastName:
                nameController.text.trim().split(' ').length > 1
                    ? nameController.text.trim().split(' ').last
                    : null,
          );
          success = true;
        } catch (e) {
          if (context.mounted) {
            _showErrorDialog(context, 'Registration failed: ${e.toString()}');
          }
          return;
        }
      } else {
        // Use regular auth controller registration
        success = await authController.register(
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text,
          birthDate: birthDate.value,
          agreedToTerms: agreedToTerms.value,
        );

        if (!success && context.mounted) {
          _showErrorDialog(context, authState.error ?? 'Registration failed');
        }
      }

      // Navigate to dashboard on success
      if (success && context.mounted) {
        context.go('/dashboard');
      }
    }

    Future<void> pickBirthDate() async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: birthDate.value ?? DateTime(2000, 1, 1),
        firstDate: DateTime(1900),
        lastDate: DateTime.now().subtract(
          const Duration(days: 365 * 13),
        ), // Must be at least 13 years old
        builder: (context, child) {
          return Theme(
            data: theme.copyWith(colorScheme: colorScheme),
            child: child!,
          );
        },
      );

      if (picked != null) {
        birthDate.value = picked;
      }
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
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Back Button
                  Row(
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => context.pop(),
                        child: Icon(
                          CupertinoIcons.back,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // App Logo/Title
                  Container(
                    width: 120,
                    height: 120,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorScheme.primary.withOpacity(0.1),
                      border: Border.all(
                        color: colorScheme.primary.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: ClipOval(
                      child: Container(
                        color: Colors.grey.withOpacity(0.3),
                        child: const Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Text(
                    'Create Account',
                    style: textTheme.headlineLarge?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Join the cosmic journey',
                    style: textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Debug info for onboarding data
                  if (onboardingState.birthData != null ||
                      onboardingState.preferences != null)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: colorScheme.primary.withOpacity(0.1),
                        border: Border.all(
                          color: colorScheme.primary.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Onboarding Data Found!',
                            style: textTheme.titleSmall?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (onboardingState.birthData != null) ...[
                            Text(
                              'Birth Date: ${onboardingState.birthData!.birthDate.day}/${onboardingState.birthData!.birthDate.month}/${onboardingState.birthData!.birthDate.year}',
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurface.withOpacity(0.8),
                              ),
                            ),
                            if (onboardingState.birthData!.zodiacSign != null)
                              Text(
                                'Zodiac: ${onboardingState.birthData!.zodiacSign}',
                                style: textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurface.withOpacity(0.8),
                                ),
                              ),
                          ],
                          if (onboardingState.preferences != null)
                            Text(
                              'Preferences: ${onboardingState.preferences!.tone}',
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurface.withOpacity(0.8),
                              ),
                            ),
                        ],
                      ),
                    ),

                  // Registration Form
                  Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(
                      children: [
                        // Name Field
                        _buildGlassTextField(
                          controller: nameController,
                          hintText: 'Full Name',
                          prefixIcon: CupertinoIcons.person,
                          textInputAction: TextInputAction.next,
                          colorScheme: colorScheme,
                          textTheme: textTheme,
                        ),

                        const SizedBox(height: 16),

                        // Email Field
                        _buildGlassTextField(
                          controller: emailController,
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: CupertinoIcons.mail,
                          textInputAction: TextInputAction.next,
                          colorScheme: colorScheme,
                          textTheme: textTheme,
                        ),

                        const SizedBox(height: 16),

                        // Birth Date Field (Optional)
                        GestureDetector(
                          onTap: pickBirthDate,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: colorScheme.surface.withOpacity(0.1),
                              border: Border.all(
                                color: colorScheme.outline.withOpacity(0.2),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.calendar,
                                  color: colorScheme.onSurface.withOpacity(0.6),
                                  size: 20,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  birthDate.value != null
                                      ? '${birthDate.value!.day}/${birthDate.value!.month}/${birthDate.value!.year}'
                                      : 'Birth Date (Optional)',
                                  style: textTheme.bodyLarge?.copyWith(
                                    color:
                                        birthDate.value != null
                                            ? colorScheme.onSurface
                                            : colorScheme.onSurface.withOpacity(
                                              0.5,
                                            ),
                                  ),
                                ),
                                const Spacer(),
                                if (birthDate.value != null)
                                  CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () => birthDate.value = null,
                                    child: Icon(
                                      CupertinoIcons.clear_circled,
                                      color: colorScheme.onSurface.withOpacity(
                                        0.6,
                                      ),
                                      size: 20,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Password Field
                        _buildGlassTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          isPassword: true,
                          isPasswordVisible: isPasswordVisible.value,
                          onPasswordToggle:
                              () =>
                                  isPasswordVisible.value =
                                      !isPasswordVisible.value,
                          prefixIcon: CupertinoIcons.lock,
                          textInputAction: TextInputAction.next,
                          colorScheme: colorScheme,
                          textTheme: textTheme,
                        ),

                        const SizedBox(height: 16),

                        // Confirm Password Field
                        _buildGlassTextField(
                          controller: confirmPasswordController,
                          hintText: 'Confirm Password',
                          isPassword: true,
                          isPasswordVisible: isConfirmPasswordVisible.value,
                          onPasswordToggle:
                              () =>
                                  isConfirmPasswordVisible.value =
                                      !isConfirmPasswordVisible.value,
                          prefixIcon: CupertinoIcons.lock_shield,
                          textInputAction: TextInputAction.done,
                          onSubmitted: (_) => handleRegister(),
                          colorScheme: colorScheme,
                          textTheme: textTheme,
                        ),

                        const SizedBox(height: 16),

                        // Password Requirements
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: colorScheme.primaryContainer.withOpacity(
                              0.3,
                            ),
                            border: Border.all(
                              color: colorScheme.primary.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Password Requirements:',
                                style: textTheme.bodySmall?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              _buildPasswordRequirement(
                                'At least 8 characters',
                                passwordController.text.length >= 8,
                                colorScheme,
                                textTheme,
                              ),
                              _buildPasswordRequirement(
                                'Uppercase letter',
                                passwordController.text.contains(
                                  RegExp(r'[A-Z]'),
                                ),
                                colorScheme,
                                textTheme,
                              ),
                              _buildPasswordRequirement(
                                'Lowercase letter',
                                passwordController.text.contains(
                                  RegExp(r'[a-z]'),
                                ),
                                colorScheme,
                                textTheme,
                              ),
                              _buildPasswordRequirement(
                                'Number',
                                passwordController.text.contains(
                                  RegExp(r'[0-9]'),
                                ),
                                colorScheme,
                                textTheme,
                              ),
                              _buildPasswordRequirement(
                                'Special character',
                                passwordController.text.contains(
                                  RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
                                ),
                                colorScheme,
                                textTheme,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Terms Agreement
                        Row(
                          children: [
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed:
                                  () =>
                                      agreedToTerms.value =
                                          !agreedToTerms.value,
                              child: Icon(
                                agreedToTerms.value
                                    ? CupertinoIcons.check_mark_circled_solid
                                    : CupertinoIcons.circle,
                                size: 20,
                                color:
                                    agreedToTerms.value
                                        ? colorScheme.primary
                                        : colorScheme.onSurface.withOpacity(
                                          0.5,
                                        ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'I agree to the ',
                                      style: textTheme.bodySmall?.copyWith(
                                        color: colorScheme.onSurface
                                            .withOpacity(0.8),
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Terms of Service',
                                      style: textTheme.bodySmall?.copyWith(
                                        color: colorScheme.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' and ',
                                      style: textTheme.bodySmall?.copyWith(
                                        color: colorScheme.onSurface
                                            .withOpacity(0.8),
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: textTheme.bodySmall?.copyWith(
                                        color: colorScheme.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Register Button
                        _buildGlassButton(
                          onPressed:
                              authState.isLoading ? null : handleRegister,
                          isLoading: authState.isLoading,
                          colorScheme: colorScheme,
                          child: Text(
                            'Create Account',
                            style: textTheme.labelLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Login Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? ',
                              style: textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurface.withOpacity(0.7),
                              ),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () => context.go('/login'),
                              child: Text(
                                'Sign In',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGlassTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.next,
    bool isPassword = false,
    bool isPasswordVisible = false,
    VoidCallback? onPasswordToggle,
    Function(String)? onSubmitted,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: colorScheme.surface.withOpacity(0.1),
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: isPassword && !isPasswordVisible,
        onFieldSubmitted: onSubmitted,
        style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurface),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurface.withOpacity(0.5),
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: colorScheme.onSurface.withOpacity(0.6),
            size: 20,
          ),
          suffixIcon:
              isPassword
                  ? CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: onPasswordToggle,
                    child: Icon(
                      isPasswordVisible
                          ? CupertinoIcons.eye_slash
                          : CupertinoIcons.eye,
                      color: colorScheme.onSurface.withOpacity(0.6),
                      size: 20,
                    ),
                  )
                  : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordRequirement(
    String text,
    bool isMet,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(
            isMet ? CupertinoIcons.check_mark : CupertinoIcons.clear,
            size: 16,
            color: isMet ? Colors.green : colorScheme.error,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: textTheme.bodySmall?.copyWith(
              color:
                  isMet ? Colors.green : colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassButton({
    required VoidCallback? onPressed,
    required Widget child,
    required ColorScheme colorScheme,
    bool isLoading = false,
  }) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors:
              onPressed != null
                  ? [colorScheme.primary, colorScheme.secondary]
                  : [
                    colorScheme.onSurface.withOpacity(0.3),
                    colorScheme.onSurface.withOpacity(0.2),
                  ],
        ),
        boxShadow:
            onPressed != null
                ? [
                  BoxShadow(
                    color: colorScheme.primary.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ]
                : null,
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child:
            isLoading
                ? const CupertinoActivityIndicator(color: Colors.white)
                : child,
      ),
    );
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  bool _isStrongPassword(String password) {
    return password.length >= 8 &&
        password.contains(RegExp(r'[A-Z]')) &&
        password.contains(RegExp(r'[a-z]')) &&
        password.contains(RegExp(r'[0-9]')) &&
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  void _showErrorDialog(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder:
          (context) => CupertinoAlertDialog(
            title: const Text('Error'),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }
}
