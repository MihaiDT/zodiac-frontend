# Flutter iOS Development Setup Guide

## 🎯 Problema

Aplicația Flutter nu poate fi construită pentru simulatorul iOS din cauza problemelor de code signing.

## ✅ Ceea ce funcționează deja

- ✅ Flutter Web (cu hot reload)
- ✅ Dependințele sunt instalate corect
- ✅ Xcode este configurat

## 🔧 Soluții implementate

### 1. Configurări optimizate pentru development

- **Podfile optimizat** pentru build-uri rapide
- **Debug.xcconfig** configurat pentru a dezactiva code signing
- **VS Code launch configurations** pentru iOS development

### 2. Scripturi utile

- `scripts/run_ios_dev.sh` - pornește dev environment cu hot reload
- `scripts/fix_ios_signing.sh` - repară problemele de code signing

### 3. Hot Reload activat

Odată ce aplicația rulează, poți folosi:

- `r` - Hot reload (modificări instant)
- `R` - Hot restart (restart complet)
- `q` - Quit

## 🚀 Cum să rulezi aplicația

### Opțiunea 1: Web (recomandat pentru development rapid)

```bash
cd /Users/mihai/Documents/zodiac-frontend
flutter run --debug -d chrome
```

### Opțiunea 2: iOS Simulator (după fix-uri)

```bash
cd /Users/mihai/Documents/zodiac-frontend
./scripts/fix_ios_signing.sh
flutter run --debug -d ios
```

### Opțiunea 3: Xcode direct

```bash
cd /Users/mihai/Documents/zodiac-frontend
open ios/Runner.xcworkspace
```

Apoi în Xcode:

1. Selectează simulator-ul dorit
2. Product → Run (Cmd+R)

## 📱 Simulatoare disponibile

- iPhone 16 Pro (505584F4-01C0-4C90-87BA-7CF3DD97D609)
- iPhone 15 Pro iOS 18.4 (D393A622-AA2C-48B8-91F1-38DB582DED17)

## 🔥 Hot Reload Setup

### În VS Code

1. Deschide proiectul
2. Apasă F5 sau selectează "Zodiac App (iOS Hot Reload)" din debug configurations
3. Modifică codul și salvează pentru hot reload instant

### În Terminal

```bash
flutter run --debug -d ios --hot
```

## 🛠️ Troubleshooting

### Problemă: Code signing errors

**Soluție:**

```bash
./scripts/fix_ios_signing.sh
```

### Problemă: Build fails

**Soluție:**

```bash
flutter clean
flutter pub get
cd ios && pod install && cd ..
```

### Problemă: Simulator nu pornește

**Soluție:**

```bash
xcrun simctl list devices
xcrun simctl boot [DEVICE_ID]
```

## 🎨 Configurări avansate

### Build optimizat pentru development

- `GCC_OPTIMIZATION_LEVEL = 0` (debug builds rapide)
- `SWIFT_OPTIMIZATION_LEVEL = -Onone` (compilare rapidă Swift)
- `COMPILER_INDEX_STORE_ENABLE = NO` (indexing dezactivat)

### Configurări VS Code

- Debug configurations pentru iOS
- Hot reload activat by default
- API endpoints configurate

## 📋 Next Steps

1. **Testează web development:**

   ```bash
   flutter run --debug -d chrome
   ```

2. **Pentru iOS, încearcă în Xcode:**
   ```bash
   open ios/Runner.xcworkspace
   ```
3. **Configurează un device fizic:**
   - Conectează iPhone-ul
   - Activează Developer Mode
   - Trust computer-ul

## 🏆 Rezultate așteptate

Odată configurată, vei avea:

- ⚡ Hot reload instant (sub 1 secundă)
- 🔄 Hot restart rapid (2-3 secunde)
- 🐛 Debugging complet în VS Code/Xcode
- 📱 UI actualizat în timp real pe simulator/device

## 💡 Tips pentru development optim

1. **Folosește web pentru UI development rapid**
2. **Testează pe iOS doar pentru funcționalități specifice**
3. **Păstrează terminal-ul cu `flutter run` deschis pentru hot reload**
4. **Folosește VS Code debugger pentru debugging avansat**
