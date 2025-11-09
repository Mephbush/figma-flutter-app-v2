# Font Files Required

Add the following font files to this folder:

## Poppins Font Family
- Poppins-Regular.ttf
- Poppins-Bold.ttf (weight: 700)
- Poppins-SemiBold.ttf (weight: 600)
- Poppins-Light.ttf (weight: 300)

## InterTight Font Family
- InterTight-Regular.ttf
- InterTight-Bold.ttf (weight: 700)

### Download Links
- **Poppins**: https://fonts.google.com/specimen/Poppins
- **InterTight**: https://fonts.google.com/specimen/Inter+Tight

### How to Add Fonts
1. Download the font files from Google Fonts
2. Place them in this folder
3. The pubspec.yaml is already configured to use these fonts

### Usage in Flutter
```dart
// Use Poppins
Text(
  'Hello World',
  style: TextStyle(fontFamily: 'Poppins'),
)

// Use InterTight
Text(
  'Hello World',
  style: TextStyle(fontFamily: 'InterTight'),
)
```
