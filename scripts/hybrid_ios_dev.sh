#!/bin/bash

# Hybrid Hot Reload Strategy for iOS
# 1. Build and run from Xcode
# 2. Connect Flutter for hot reload

echo "🚀 Starting Hybrid Hot Reload for iOS..."

# Open Xcode project
open /Users/mihai/Documents/zodiac-frontend/ios/Runner.xcworkspace

echo "📱 Now in Xcode:"
echo "   1. Select 'iPhone 16 Pro' simulator"
echo "   2. Press Cmd+R to run in Debug mode"
echo "   3. Wait for app to launch"
echo ""
echo "🔌 After app launches, run this in terminal:"
echo "   flutter attach --debug-port=0"
echo ""
echo "🔥 Or use VS Code hot reload commands:"
echo "   Cmd+Shift+P → 'Flutter: Hot Reload'"
echo ""
echo "✅ This gives you the best of both worlds:"
echo "   - Xcode handles code signing & building"
echo "   - Flutter handles hot reload for instant changes"
