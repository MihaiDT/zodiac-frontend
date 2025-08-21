#!/bin/bash

# Quick Hot Reload Script for iOS Development
# Usage: ./hot_reload.sh

echo "🔥 Starting iOS Hot Reload Setup..."

# Kill any existing Flutter processes
pkill -f "flutter"
sleep 1

# Clean build cache
echo "🧹 Cleaning Flutter cache..."
flutter clean
flutter pub get

# Start Flutter with hot reload on iOS
echo "🚀 Starting Flutter with Hot Reload on iOS..."
flutter run -d "iPhone 16 Pro" --host-vmservice-port 8888 --hot

echo "✅ Hot Reload active! Press 'r' in terminal to reload, 'R' to restart, 'q' to quit."
