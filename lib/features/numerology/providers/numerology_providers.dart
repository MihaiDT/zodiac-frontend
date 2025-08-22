import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/numerology.dart';
import '../services/numerology_api_service.dart';

// Form data state
final numerologyFormProvider =
    StateNotifierProvider<NumerologyFormNotifier, NumerologyRequest?>(
      (ref) => NumerologyFormNotifier(),
    );

// Key figures provider
final keyFiguresProvider = FutureProvider<KeyFiguresResponse?>((ref) async {
  final formData = ref.watch(numerologyFormProvider);
  if (formData == null) return null;

  final apiService = ref.watch(numerologyApiServiceProvider);
  return apiService.getKeyFigures(formData);
});

// Interpretations provider
final interpretationsProvider = FutureProvider<InterpretationsResponse?>((
  ref,
) async {
  // Only fetch interpretations if we have key figures
  final keyFigures = await ref.watch(keyFiguresProvider.future);
  if (keyFigures == null) return null;

  final apiService = ref.watch(numerologyApiServiceProvider);
  return apiService.getInterpretations();
});

// Form state notifier
class NumerologyFormNotifier extends StateNotifier<NumerologyRequest?> {
  NumerologyFormNotifier() : super(null);

  void updateForm({String? firstName, String? lastName, String? birthdate}) {
    final current = state;
    state = NumerologyRequest(
      firstName: firstName ?? current?.firstName ?? '',
      lastName: lastName ?? current?.lastName ?? '',
      birthdate: birthdate ?? current?.birthdate ?? '',
    );
  }

  void clearForm() {
    state = null;
  }

  bool get isFormValid {
    final current = state;
    return current != null &&
        current.firstName.isNotEmpty &&
        current.lastName.isNotEmpty &&
        current.birthdate.isNotEmpty;
  }
}
