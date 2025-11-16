# 📱 VisCend Studio Flutter App
Big Bug here

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)

**تطبيق موبايل كامل لـ VisCend Studio - استوديو التميز البصري**

[المميزات](#-المميزات) • [التثبيت](#-التثبيت) • [الاستخدام](#-الاستخدام) • [البنية](#-البنية)

</div>

---

## ✨ المميزات

### 🎯 **الميزات الرئيسية**
- ✅ **5 صفحات كاملة**: الرئيسية، من نحن، الخدمات، الأعمال، التواصل
- ✅ **دعم كامل للغتين**: العربية والإنجليزية مع تبديل سلس
- ✅ **شاشة انترو متحركة**: تجربة افتتاحية احترافية
- ✅ **نظام تحليلات**: تتبع الزيارات والإحصائيات
- ✅ **تصميم متجاوب**: يعمل بشكل مثالي على جميع أحجام الشاشات
- ✅ **أداء عالي**: سلاسة في الحركة والانتقالات

### 🎨 **التصميم**
- 🌈 نظام ألوان VisCend (بنفسجي متدرج #9333EA → #7C3AED)
- 💎 تأثيرات Gradient جميلة
- 🎭 أنيميشن سلسة ومريحة
- 🌙 Dark Theme أنيق
- ✨ Shadows و Glow Effects

### 🧭 **التنقل**
- 📂 Navigation Drawer أنيق
- 🔄 انتقالات سلسة بين الصفحات
- 🎯 AppBar مخصص
- 🔙 Back navigation متطور

---

## 🚀 التثبيت

### المتطلبات
- Flutter SDK (3.0.0 أو أحدث)
- Dart SDK (2.19.0 أو أحدث)
- Android Studio / Xcode
- جهاز أو محاكي Android/iOS

### خطوات التثبيت

```bash
# 1. الانتقال إلى مجلد التطبيق
cd flutter_app

# 2. تثبيت Dependencies
flutter pub get

# 3. تشغيل التطبيق
flutter run
```

### Build للإنتاج

```bash
# Android APK
flutter build apk --release

# Android App Bundle (للنشر على Play Store)
flutter build appbundle --release

# iOS (يتطلب macOS)
flutter build ios --release
```

---

## 📱 الاستخدام

### بدء التطبيق

```bash
flutter run
```

### الصفحات المتاحة

| الصفحة | الوصف | المسار |
|--------|-------|--------|
| 🎬 Splash | شاشة الانترو | `/` |
| 🏠 Home | الصفحة الرئيسية | `/home` |
| ℹ️ About | من نحن | `/about` |
| 💼 Services | الخدمات | `/services` |
| 🖼️ Portfolio | الأعمال | `/portfolio` |
| 📞 Contact | التواصل | `/contact` |

---

## 📁 البنية

```
flutter_app/
├── lib/
│   ├── main.dart                   # Entry point
│   ├── config/
│   │   ├── app_theme.dart         # Theme & Colors
│   │   └── app_router.dart        # Navigation
│   ├── providers/
│   │   ├── language_provider.dart # Multi-language
│   │   └── analytics_provider.dart # Analytics
│   ├── screens/
│   │   ├── splash_screen.dart     # شاشة الانترو
│   │   ├── home_screen.dart       # الرئيسية
│   │   ├── about_screen.dart      # من نحن
│   │   ├── services_screen.dart   # الخدمات
│   │   ├── portfolio_screen.dart  # الأعمال
│   │   └── contact_screen.dart    # التواصل
│   └── widgets/
│       ├── app_drawer.dart        # القائمة الجانبية
│       └── gradient_button.dart   # زر متدرج
├── assets/
│   ├── images/                    # الصور
│   ├── icons/                     # الأيقونات
│   └── fonts/                     # الخطوط
├── pubspec.yaml                   # Dependencies
└── README.md                      # هذا الملف
```

---

## 🎨 نظام الألوان

```dart
// ألوان VisCend
Primary Purple:   #9333EA
Secondary Purple: #7C3AED
Accent Blue:      #3B82F6
Light Blue:       #60A5FA

// Dark Theme
Background:       #0F0F23
Card Background:  #1A1A2E
Text Primary:     #FFFFFF
Text Secondary:   #B4B4C8
```

---

## 🔧 Dependencies الرئيسية

| Package | الوصف |
|---------|-------|
| `provider` | State Management |
| `google_fonts` | خطوط Google |
| `animate_do` | أنيميشن سلسة |
| `font_awesome_flutter` | أيقونات Font Awesome |
| `shared_preferences` | تخزين محلي |

---

## 🌐 دعم اللغات

التطبيق يدعم:
- 🇸🇦 **العربية** (اللغة الافتراضية)
- 🇬🇧 **الإنجليزية**

### تبديل اللغة

```dart
// في الكود
final lang = context.read<LanguageProvider>();
await lang.toggleLanguage();

// أو تحديد لغة معينة
await lang.setLanguage('ar', 'SA'); // العربية
await lang.setLanguage('en', 'US'); // الإنجليزية
```

---

## 📊 نظام التحليلات

التطبيق يتضمن نظام تحليلات بسيط:

```dart
// تسجيل زيارة صفحة
context.read<AnalyticsProvider>().trackPageVisit('home');

// الحصول على الإحصائيات
final analytics = context.read<AnalyticsProvider>();
print('إجمالي الزيارات: ${analytics.totalVisits}');
print('زيارات اليوم: ${analytics.todayVisits}');
```

---

## 🎯 الميزات المستقبلية

- [ ] دعم الوضع الليلي/النهاري
- [ ] دمج مع API حقيقي
- [ ] نظام إشعارات Push
- [ ] مشاركة عبر وسائل التواصل
- [ ] حفظ المشاريع المفضلة
- [ ] نظام تقييم الخدمات
- [ ] دردشة مباشرة مع الدعم

---

## 🐛 حل المشاكل

### مشكلة: التطبيق لا يعمل

```bash
# تنظيف المشروع
flutter clean

# إعادة تثبيت Dependencies
flutter pub get

# تشغيل التطبيق
flutter run
```

### مشكلة: الخطوط لا تظهر

تأكد من وجود ملفات الخطوط في:
```
assets/fonts/Cairo-Regular.ttf
assets/fonts/Cairo-Bold.ttf
assets/fonts/Tajawal-Regular.ttf
assets/fonts/Tajawal-Bold.ttf
```

---

## 📄 الترخيص

هذا المشروع مملوك لـ VisCend Studio © 2024

---

## 👨‍💻 المطور

صُنع بـ ❤️ بواسطة **VisCend Studio Team**

- 🌐 الموقع: [www.viscendstudio.com](https://viscendstudio.com)
- 📧 البريد: info@viscendstudio.com
- 📱 الهاتف: +966 50 123 4567

---

## 🙏 شكر خاص

- [Flutter Team](https://flutter.dev)
- [Google Fonts](https://fonts.google.com)
- [Font Awesome](https://fontawesome.com)
- [Animate Do Package](https://pub.dev/packages/animate_do)

---

<div align="center">

**⭐ إذا أعجبك المشروع، لا تنسى إضافة نجمة! ⭐**

</div>
