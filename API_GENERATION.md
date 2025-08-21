# 🔧 API Client Generator - Zodiac & Numerology

Documentație completă pentru generarea automată a clientului API din OpenAPI specification.

## 📋 Cerințe

```bash
# Install Node.js și npm
# Install openapi-generator-cli
npm install -g @openapitools/openapi-generator-cli

# Verifică instalarea
openapi-generator --version
```

## 🚀 Comenzi de Generare

### 1. Setup Inițial

```bash
# Método 1: Cu Makefile
make setup        # Instalează openapi-generator-cli
make submodule    # Adaugă backend repo ca submodul

# Método 2: Cu script Dart
dart run scripts/generate_api.dart setup
dart run scripts/generate_api.dart submodule
```

### 2. Generare Client API

```bash
# Método 1: Cu Makefile
make generate     # Generează clientul API
make rebuild      # Clean + generate

# Método 2: Cu script Dart
dart run scripts/generate_api.dart generate
dart run scripts/generate_api.dart rebuild

# Método 3: Manual
openapi-generator generate \
  -i third_party/openapi/openapi.yaml \
  -g dart \
  -o lib/data/api/generated \
  -c openapi-generator-config.json \
  --additional-properties=sourceFolder=lib
```

### 3. Build cu JSON Serialization

```bash
# Generează + rulează build_runner pentru Freezed/JsonSerializable
make generate-with-build

# Sau manual
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## 📁 Structura Generată

După generare, vei avea:

```
lib/data/api/
├── generated/              # Client generat automat
│   ├── lib/
│   │   ├── api.dart        # API classes
│   │   ├── api_client.dart # HTTP client
│   │   ├── api_helper.dart # Utilities
│   │   └── model/         # DTOs/Models
│   └── pubspec.yaml       # Dependencies
├── generated_exports.dart  # Exports centralizate
├── zodiac_api.dart        # Wrapper custom
└── dio_client.dart        # Dio client existent
```

## 🔧 Configurare

### openapi-generator-config.json

```json
{
  "packageName": "zodiac_api_client",
  "dartPackage": true,
  "browserClient": false,
  "useEnumExtension": true,
  "nullableFields": true,
  "serialization": "json",
  "dateLibrary": "core"
}
```

### Integrare cu Dio Existent

Wrapper-ul `ZodiacApi` mapează clientul generat cu Dio-ul nostru custom:

```dart
final apiClient = ApiClient(dio: _dioClient.dio);
_authApi = AuthApi(apiClient);
```

## 🌟 Exemplu de Utilizare

### 1. În Provider Riverpod

```dart
final zodiacSignsProvider = FutureProvider<List<ZodiacSign>>((ref) async {
  final repository = ref.watch(zodiacRepositoryProvider);
  return await repository.getAllSigns();
});
```

### 2. În Widget

```dart
class ZodiacScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final zodiacSignsAsync = ref.watch(zodiacSignsProvider);

    return zodiacSignsAsync.when(
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
      data: (signs) => ListView.builder(
        itemCount: signs.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(signs[index].name),
          subtitle: Text(signs[index].element),
        ),
      ),
    );
  }
}
```

### 3. Apeluri API Direct

```dart
// Prin wrapper
final api = ref.read(zodiacApiProvider);
final signs = await api.getZodiacSigns();

// Horoscop zilnic
final horoscope = await api.getDailyHoroscope(
  'aries',
  tone: 'optimistic',
  date: DateTime.now(),
);

// Numerologie
final lifePathNumber = await api.calculateLifePathNumber(
  DateTime(1990, 5, 15),
);
```

## 🔄 Workflow de Dezvoltare

### 1. Update Backend OpenAPI

```bash
# Update submodul când backend-ul se schimbă
git submodule update --remote third_party/openapi
make rebuild
```

### 2. Regenerare Automată

```bash
# După modificări în openapi.yaml
make generate
flutter packages pub run build_runner build
```

### 3. Testing

```bash
# Test că generarea funcționează
make generate
flutter analyze
flutter test
```

## 📡 API Endpoints Mapate

### Authentication (`/api/auth/*`)

- `POST /api/auth/register` → `register(RegisterRequest)`
- `POST /api/auth/login` → `login(LoginRequest)`
- `POST /api/auth/refresh` → `refreshToken(RefreshTokenRequest)`
- `GET /api/auth/me` → `getCurrentUser()`
- `POST /api/auth/logout` → `logout()`

### Zodiac (`/api/zodiac/*`)

- `GET /api/zodiac/signs` → `getZodiacSigns()`
- `GET /api/zodiac/signs/{sign}` → `getZodiacSign(signId)`
- `GET /api/zodiac/compatibility` → `getCompatibility(sign1, sign2)`

### Horoscope (`/api/horoscope/*`)

- `GET /api/horoscope/{sign}?tone=` → `getDailyHoroscope(sign, tone, date)`
- `GET /api/horoscope/{sign}/weekly` → `getWeeklyHoroscope(sign)`
- `GET /api/horoscope/{sign}/monthly` → `getMonthlyHoroscope(sign)`

### Numerology (`/api/numerology/*`)

- `POST /api/numerology/life-path-number` → `calculateLifePathNumber(birthDate)`
- `POST /api/numerology/personal-year` → `calculatePersonalYear(birthDate, year)`
- `POST /api/numerology/name-numerology` → `calculateNameNumerology(fullName)`
- `GET /api/numerology/interpretations` → `getNumerologyInterpretations()`
- `POST /api/numerology/lucky-numbers` → `getLuckyNumbers(birthDate)`

## 🚨 Troubleshooting

### Error: openapi-generator not found

```bash
npm install -g @openapitools/openapi-generator-cli
```

### Error: third_party/openapi/openapi.yaml not found

```bash
make submodule
```

### Error: Generated classes not found

```bash
make generate
# Verifică că fișierele sunt în lib/data/api/generated/
```

### Error: Build runner conflicts

```bash
flutter packages pub run build_runner clean
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## 📦 Dependencies Necesare

Adaugă în `pubspec.yaml`:

```yaml
dependencies:
  # Generated client dependencies
  http: ^1.2.0
  json_annotation: ^4.8.1

dev_dependencies:
  build_runner: ^2.4.7
  json_serializable: ^6.7.1
```

---

**După setup, totul va funcționa automat! API-ul va fi type-safe și sincronizat cu backend-ul.** 🎉
