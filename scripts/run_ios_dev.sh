#!/bin/bash

# Script pentru a rula aplicația Flutter pe iOS cu hot reload optimizat
# Usage: ./scripts/run_ios_dev.sh

echo "🚀 Starting Flutter iOS development environment..."

# Navigăm la directorul proiectului
cd "$(dirname "$0")/.."

# Curățăm cache-ul dacă e necesar
if [ "$1" = "--clean" ]; then
    echo "🧹 Cleaning Flutter project..."
    flutter clean
    flutter pub get
    cd ios && pod install && cd ..
fi

# Verificăm că Flutter e funcțional
echo "🔍 Checking Flutter installation..."
flutter doctor --android-licenses > /dev/null 2>&1 || true

# Verificăm simulatoarele disponibile
echo "📱 Available iOS simulators:"
xcrun simctl list devices --json | jq -r '.devices | to_entries[] | select(.key | contains("iOS")) | .value[] | select(.isAvailable == true) | "\(.name) (\(.udid))"' | head -5

# Pornim aplicația cu hot reload
echo "🔥 Starting Flutter with hot reload..."
echo "💡 Hot reload shortcuts:"
echo "   r - Hot reload"
echo "   R - Hot restart"
echo "   q - Quit"
echo ""

flutter run --debug --flavor development --dart-define=ENVIRONMENT=development

echo "✅ Development session ended."
