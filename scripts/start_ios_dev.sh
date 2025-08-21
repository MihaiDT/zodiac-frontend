#!/bin/bash

# Professional iOS Development Workflow
# Used by Apple engineers and top iOS teams

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

echo "🍎 Starting Professional iOS Development Workflow..."
echo "📁 Project: $(basename "$PROJECT_ROOT")"
echo ""

# Step 1: Clean and prepare Flutter environment
echo "🧹 Cleaning Flutter environment..."
flutter clean > /dev/null 2>&1
flutter pub get > /dev/null 2>&1

# Step 2: Open Xcode workspace
echo "📱 Opening Xcode workspace..."
open ios/Runner.xcworkspace

echo ""
echo "✅ Professional Development Environment Ready!"
echo ""
echo "🔧 Next Steps (Apple Engineering Workflow):"
echo "   1. In Xcode: Select iPhone 16 Pro simulator"
echo "   2. In Xcode: Press Cmd+R to build and run"
echo "   3. After app launches, run: flutter attach --debug-port=0"
echo "   4. Make code changes in VS Code"
echo "   5. Press 'r' in terminal for hot reload"
echo ""
echo "🎯 This is how Apple engineers work:"
echo "   • Xcode handles native iOS building & debugging"
echo "   • Flutter handles hot reload for rapid iteration"
echo "   • Clean separation of concerns"
echo ""
echo "🚀 Ready to code like a pro!"
