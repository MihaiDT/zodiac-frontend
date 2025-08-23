# Configurare iOS Personal Team pentru Zodiac App

## ✅ Modificări efectuate automat:

### 1. Curățat Runner.entitlements

- Șters `com.apple.application-identifier`
- Șters `com.apple.developer.keychain-access-groups`
- Fișierul este acum gol (fără capabilities)

### 2. Actualizat Bundle Identifier în project.pbxproj

- **Schimbat de la:** `com.deltatech.zodiacapp`
- **La:** `com.deltatech.zodiacapp.dev1` (pentru toate configurațiile: Debug, Release, Profile)

### 3. Eliminat Development Team din configurația automată

- `DEVELOPMENT_TEAM = ""` (gol pentru a permite selecția manuală în Xcode)

### 4. Curățat build cache

- `flutter clean` efectuat
- Pods reinstalate
- Cache eliminat complet

## 📋 Pașii finali în Xcode:

### 1. Deschide proiectul în Xcode:

```bash
cd /Users/mihai/Developer/zodiac-frontend
open ios/Runner.xcworkspace
```

### 2. Configurare Signing & Capabilities:

1. **Selectează target-ul "Runner"**
2. **Mergi la tab-ul "Signing & Capabilities"**
3. **Bifează "Automatically manage signing"**
4. **Selectează Team: Mihai Lipovanu (Personal Team)**
5. **Verifică Bundle Identifier:** `com.deltatech.zodiacapp.dev1`

### 3. Eliminarea capabilităților (dacă există):

- În "Signing & Capabilities", șterge TOATE capability-urile:
  - ❌ Keychain Sharing
  - ❌ Push Notifications
  - ❌ App Groups
  - ❌ Associated Domains
  - ❌ Sign in with Apple
  - ❌ Orice altă capability

### 4. Regenerare provisioning profile:

1. **Debifează "Automatically manage signing"**
2. **Rebifează "Automatically manage signing"**
3. **Selectează din nou Personal Team**
4. **Xcode va genera automat un provisioning profile nou**

### 5. Clean & Build:

1. **Product → Clean Build Folder** (⇧⌘K)
2. **Product → Build** (⌘B)

## 🚀 Rulare pe device:

```bash
cd /Users/mihai/Developer/zodiac-frontend
flutter run -d "numele-device-ului-tau"
```

## 🔧 Debugging în caz de probleme:

### Dacă tot apare eroarea cu entitlements:

```bash
# Verifică dacă Pods au adăugat entitlements
find ios/Pods -name "*.entitlements" -exec rm {} \;

# Reinstalează Pods
cd ios && rm Podfile.lock && rm -rf Pods && pod install
```

### Dacă Bundle ID este luat:

- Schimbă `com.deltatech.zodiacapp.dev1` cu `com.deltatech.zodiacapp.dev2`
- Sau folosește: `com.[numele-tau].zodiacapp.dev1`

## 📱 Pentru App Store (viitor):

Când vei avea cont Apple Developer plătit:

1. **Schimbă Bundle ID înapoi la:** `com.deltatech.zodiacapp`
2. **Adaugă capabilities necesare:**
   - Push Notifications (pentru notificări)
   - Associated Domains (pentru deep linking)
   - Sign in with Apple (dacă folosești)
3. **Creează provisioning profiles în Apple Developer Portal**

## ⚠️ Important:

- **Bundle ID-ul temporar** (`com.deltatech.zodiacapp.dev1`) este doar pentru development
- **Pentru App Store** va trebui schimbat înapoi la ID-ul principal
- **Personal Team** permite doar development, nu și distribuție
- **Device-ul trebuie să fie înregistrat** în Personal Team (Xcode face asta automat)

## 🎯 Status actual:

- ✅ Entitlements curățate
- ✅ Bundle ID schimbat pentru Personal Team
- ✅ Development Team configurat pentru selecție manuală
- ✅ Build cache curățat
- ✅ Pods reinstalate

**Următorul pas:** Deschide Xcode și urmează pașii de mai sus!
