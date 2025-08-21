#!/bin/bash

# Script pentru a rula Flutter pe iOS simulator fără probleme de code signing

echo "🚀 Pornind Flutter pe iOS simulator..."

# Setează variabilele de mediu pentru a evita problemele de code signing
export CODESIGN_ALLOCATE="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/codesign_allocate"
export CODE_SIGNING_REQUIRED=NO
export CODE_SIGNING_ALLOWED=NO

# Curăță atributele extended de pe toate fișierele
echo "🧹 Curățând atributele extended..."
xattr -cr ios/
xattr -cr build/ 2>/dev/null || true

# Rulează aplicația
echo "▶️  Rulând flutter run pe simulator..."
flutter run \
  -d "iPhone 16 Pro" \
  --debug \
  --hot \
  --enable-hot-reload \
  --enable-hot-restart
