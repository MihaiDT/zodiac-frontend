#!/bin/bash

# Quick development script pentru Zodiac app
# Usage: ./dev.sh [ios|web|clean]

case "$1" in
    "ios")
        echo "🍎 Starting iOS development..."
        echo "Opening Xcode workspace..."
        open ios/Runner.xcworkspace
        echo "💡 În Xcode:"
        echo "   1. Selectează un simulator"
        echo "   2. Product → Run (Cmd+R)"
        echo "   3. Pentru hot reload, păstrează și terminalul deschis:"
        echo ""
        read -p "Press enter to start Flutter hot reload in terminal..."
        flutter run --debug -d ios --hot
        ;;
    "web")
        echo "🌐 Starting web development with hot reload..."
        flutter run --debug -d chrome --hot
        ;;
    "clean")
        echo "🧹 Cleaning project..."
        flutter clean
        flutter pub get
        cd ios && pod install && cd ..
        echo "✅ Project cleaned and dependencies reinstalled"
        ;;
    *)
        echo "🚀 Zodiac Development Helper"
        echo ""
        echo "Usage: $0 [command]"
        echo ""
        echo "Commands:"
        echo "  ios    - Open in Xcode + start hot reload"
        echo "  web    - Start web development with hot reload"
        echo "  clean  - Clean and reinstall dependencies"
        echo ""
        echo "Quick start:"
        echo "  $0 web    # Fastest for UI development"
        echo "  $0 ios    # For iOS-specific testing"
        ;;
esac
