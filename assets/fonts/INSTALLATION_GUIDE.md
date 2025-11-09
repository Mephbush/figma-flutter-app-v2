# Flutter Font Installation Guide

## Required Fonts

### 1. Poppins Font Family
Download from: https://fonts.google.com/specimen/Poppins

**Required files:**
- `Poppins-Regular.ttf` (weight: 400)
- `Poppins-Bold.ttf` (weight: 700)
- `Poppins-SemiBold.ttf` (weight: 600)
- `Poppins-Light.ttf` (weight: 300)

### 2. InterTight Font Family
Download from: https://fonts.google.com/specimen/Inter+Tight

**Required files:**
- `InterTight-Regular.ttf` (weight: 400)
- `InterTight-Bold.ttf` (weight: 700)

## Installation Steps

1. **Download Fonts from Google Fonts**
   - Go to https://fonts.google.com
   - Search for "Poppins"
   - Click "Download family"
   - Extract the ZIP file
   - Find the Regular, Bold, SemiBold, and Light variants

2. **Place Fonts in This Directory**
   - Copy all `.ttf` files to `flutter_app/assets/fonts/`

3. **Verify `pubspec.yaml` Configuration**
   - The `pubspec.yaml` already contains the correct font configurations
   - Do NOT modify the fonts section unless changing font names

4. **Use Fonts in Your Flutter Code**

```dart
// Use Poppins
Text(
  'Hello World',
  style: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
  ),
)

// Use Poppins Bold
Text(
  'Bold Text',
  style: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold, // 700
  ),
)

// Use Poppins SemiBold
Text(
  'SemiBold Text',
  style: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  ),
)

// Use Poppins Light
Text(
  'Light Text',
  style: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
  ),
)

// Use InterTight
Text(
  'Hello World',
  style: TextStyle(
    fontFamily: 'InterTight',
    fontWeight: FontWeight.normal,
  ),
)
```

5. **Rebuild Your App**
   ```bash
   flutter pub get
   flutter run
   ```

## Font Weights Reference

| FontWeight | Value |
|-----------|-------|
| w300 | Light |
| w400 | Normal |
| w600 | SemiBold |
| w700 | Bold |

## Troubleshooting

**Issue:** Font not loading
- Solution: Run `flutter clean` and `flutter pub get`
- Verify file paths match exactly (case-sensitive)
- Check that font file extensions are `.ttf`

**Issue:** Wrong font weight applied
- Solution: Ensure the filename matches the weight definition in `pubspec.yaml`
- Check that you're using the correct `fontWeight` property

## Current Font Configuration in pubspec.yaml

```yaml
flutter:
  fonts:
    - family: Poppins
      fonts:
        - asset: assets/fonts/Poppins-Regular.ttf
        - asset: assets/fonts/Poppins-Bold.ttf
          weight: 700
        - asset: assets/fonts/Poppins-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/Poppins-Light.ttf
          weight: 300
    - family: InterTight
      fonts:
        - asset: assets/fonts/InterTight-Regular.ttf
        - asset: assets/fonts/InterTight-Bold.ttf
          weight: 700
```
