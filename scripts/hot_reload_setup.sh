#!/bin/bash

# 🔥 Script optimizat pentru Hot Reload iOS Flutter
# Usage: ./scripts/hot_reload_setup.sh

echo "🔥 Setting up iOS Hot Reload with Auto-Save..."

# Navigăm la directorul proiectului
cd "$(dirname "$0")/.."

# Opțiuni
CLEAN_CACHE=${1:-false}
DEVICE_NAME=${2:-"iPhone 16 Pro"}

if [ "$CLEAN_CACHE" = "--clean" ]; then
    echo "🧹 Cleaning Flutter cache..."
    flutter clean
    flutter pub get
    cd ios && pod install && cd ..
fi

# Oprește orice proces Flutter anterior
echo "🛑 Stopping previous Flutter processes..."
pkill -f "flutter" 2>/dev/null || true
sleep 2

# Verifică simulatoarele disponibile
echo "📱 Available iOS devices:"
flutter devices --machine | jq -r '.[] | select(.platform == "ios") | "\(.name) - \(.id)"' 2>/dev/null || {
    echo "Using xcrun to list devices..."
    xcrun simctl list devices | grep -E "(Booted|iPhone)" | head -3
}

echo ""
echo "🚀 Starting Flutter with Hot Reload..."
echo "📝 Auto-reload is ACTIVE on file save (Ctrl+S)"
echo ""
echo "🎮 Manual controls:"
echo "   r - Hot reload (fast)"
echo "   R - Hot restart (medium)"
echo "   q - Quit"
echo "   o - Open DevTools"
echo ""
echo "🔥 Starting app on $DEVICE_NAME..."

# Start Flutter cu hot reload activat
flutter run \
  --debug \
  --hot \
  --device-id "$DEVICE_NAME" \
  --dart-define=FLUTTER_WEB_AUTO_DETECT=true \
  --enable-software-rendering \
  --verbose-system-logs \
  --host-vmservice-port=8888

echo "✅ Hot reload session ended."
