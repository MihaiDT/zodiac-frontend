#!/bin/bash

# Script pentru a fixa problemele de code signing în iOS simulator
# Usage: ./scripts/fix_ios_signing.sh

echo "🔧 Fixing iOS code signing for simulator..."

cd "$(dirname "$0")/.."

# Step 1: Clean everything
echo "🧹 Cleaning project..."
flutter clean
rm -rf build/
rm -rf ios/Pods/
rm -rf ios/.symlinks/
rm -rf ios/Podfile.lock

# Step 2: Remove extended attributes
echo "🗑️  Removing extended attributes..."
xattr -cr ios/

# Step 3: Reinstall dependencies
echo "📦 Reinstalling dependencies..."
flutter pub get

# Step 4: Reinstall pods with updated configuration
echo "🍫 Reinstalling CocoaPods..."
cd ios
pod deintegrate
pod repo update
pod install --repo-update
cd ..

# Step 5: Fix bundle identifier in project files
echo "🆔 Fixing bundle identifier..."
BUNDLE_ID="com.zodiacnumerology.zodiacNumerology"

# Create/update bundle identifier
defaults write "$(pwd)/ios/Runner.xcodeproj/project.pbxproj" PRODUCT_BUNDLE_IDENTIFIER "$BUNDLE_ID" 2>/dev/null || true

echo "✅ Code signing fixes applied!"
echo "💡 Now try: flutter run -d ios --debug"
echo "   Or open ios/Runner.xcworkspace in Xcode"
