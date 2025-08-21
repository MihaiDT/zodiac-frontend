# Zodiac AI Frontend - Environment Configuration

## Development Setup

### Flutter Run Commands

#### Local Development

```bash
flutter run --dart-define=API_BASE_URL=https://zodiac-api-gmapemgtc7dkasg5.centralus-01.azurewebsites.net --dart-define=BUILD_FLAVOR=development
```

#### Production

```bash
flutter run --dart-define=API_BASE_URL=https://zodiac-api-gmapemgtc7dkasg5.centralus-01.azurewebsites.net --dart-define=BUILD_FLAVOR=production --dart-define=SENTRY_DSN=your_sentry_dsn_here
```

#### Debug with local backend (if running locally)

```bash
flutter run --dart-define=API_BASE_URL=http://localhost:3000 --dart-define=BUILD_FLAVOR=development
```

### Build Commands

#### Android APK

```bash
flutter build apk --dart-define=API_BASE_URL=https://zodiac-api-gmapemgtc7dkasg5.centralus-01.azurewebsites.net --dart-define=BUILD_FLAVOR=production
```

#### iOS

```bash
flutter build ios --dart-define=API_BASE_URL=https://zodiac-api-gmapemgtc7dkasg5.centralus-01.azurewebsites.net --dart-define=BUILD_FLAVOR=production
```

## Environment Variables

| Variable       | Description                                | Default Value                                                        |
| -------------- | ------------------------------------------ | -------------------------------------------------------------------- |
| `API_BASE_URL` | Backend API base URL                       | `https://zodiac-api-gmapemgtc7dkasg5.centralus-01.azurewebsites.net` |
| `BUILD_FLAVOR` | Build environment (development/production) | `development`                                                        |
| `SENTRY_DSN`   | Sentry error tracking DSN                  | _(empty)_                                                            |

## API Contract (OpenAPI)

The API contract is maintained in the backend repository and should be brought into this project via:

### Option 1: Git Submodule (Recommended)

```bash
git submodule add https://github.com/MihaiDT/zodiac-api-backend.git third_party/openapi
git submodule update --init --recursive
```

### Option 2: CI Script

Create a script that downloads the `openapi.yaml` file from the backend repository during build.

## Project Structure

```
lib/
├── config/
│   ├── environment.dart     # Environment variables configuration
│   └── api_config.dart      # API endpoints configuration
├── services/
│   ├── api_service.dart     # HTTP client service
│   ├── auth_service.dart    # Authentication service
│   └── storage_service.dart # Local storage service
├── models/                  # Data models (generated from OpenAPI)
├── screens/                 # UI screens
├── widgets/                 # Reusable widgets
└── main.dart               # App entry point
```

## Next Steps

1. Set up the git submodule for the OpenAPI contract
2. Install necessary dependencies (http, shared_preferences, etc.)
3. Generate Dart models from OpenAPI specification
4. Implement authentication flow
5. Create UI screens for zodiac features
