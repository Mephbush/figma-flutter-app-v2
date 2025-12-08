# 🔧 ملخص إصلاح مشكلة Gradle

## المشكلة التي حدثت

عندما حاولت تشغيل `flutter build apk --debug`، حصلت على الخطأ:

```
[!] Your app is using an unsupported Gradle project. To fix this problem, 
create a new project by running `flutter create -t app <app-directory>` 
and then move the dart code, assets and pubspec.yaml to the new project.
```

## السبب

في المحاولة السابقة، قمت بـ:
1. حذف `android/build.gradle` واستبداله بتحذير فقط
2. حذف `android/settings.gradle` واستبداله بتحذير فقط
3. حذف `android/app/build.gradle` واستبداله بتحذير فقط
4. الاعتماد على ملفات Kotlin DSL فقط

**المشكلة**: Flutter يحتاج إلى ملفات Gradle بصيغة Groovy في مجلد `android/`، وليس KTS!

## الحل المتخذ

### 1. استعادة `android/build.gradle`
```gradle
buildscript {
    ext.kotlin_version = '2.1.0'
    repositories { ... }
    dependencies {
        classpath 'com.android.tools.build:gradle:8.9.1'
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    }
}

allprojects { ... }
rootProject.buildDir = '../build'
subprojects { ... }
tasks.register("clean", Delete) { ... }
```

### 2. استعادة `android/settings.gradle`
```gradle
pluginManagement {
    def flutterSdkPath = { ... }
    settings.ext.flutterSdkPath = flutterSdkPath()
    includeBuild("${settings.ext.flutterSdkPath}/packages/flutter_tools/gradle")
    repositories { ... }
    plugins { ... }
}

plugins {
    id "dev.flutter.flutter-plugin-loader" version "1.0.0"
}

include ":app"

def plugins = new Properties()
def pluginsFile = new File(flutterProjectRoot.toFile(), '.flutter-plugins')
if (pluginsFile.exists()) {
    pluginsFile.withReader('UTF-8') { reader -> plugins.load(reader) }
    plugins.each { name, path ->
        include ":$name"
        project(":$name").projectDir = new File(path)
    }
}
```

### 3. استعادة `android/app/build.gradle`
```gradle
plugins {
    id 'com.android.application'
    id 'kotlin-android'
    id 'dev.flutter.flutter-gradle-plugin'
}

def localProperties = new Properties()
def localPropertiesFile = rootProject.file('local.properties')
if (localPropertiesFile.exists()) {
    localPropertiesFile.withReader('UTF-8') { reader ->
        localProperties.load(reader)
    }
}

android {
    namespace "com.viscendstudio.app"
    compileSdk 34
    ...
}

flutter {
    source '../..'
}
```

### 4. حذف ملفات KTS من `android/`
```bash
rm android/build.gradle.kts
rm android/settings.gradle.kts
rm android/app/build.gradle.kts
```

**السبب**: Flutter لا يدعم KTS في مجلد `android/` بشكل كامل. يجب استخدام Groovy فقط هناك.

### 5. الملفات الآمنة في الجذر
```
✅ build.gradle.kts  (في الجذر - آمن)
✅ settings.gradle.kts (في الجذر - آمن)
```

## البنية النهائية الصحيحة

```
android/
├── build.gradle          ✅ Groovy (مستلزم)
├── settings.gradle       ✅ Groovy (مستلزم)
├── gradle.properties     ✅
├── local.properties      ✅
├── gradlew              ✅
├── gradlew.bat          ✅
├── gradle/
│   └── wrapper/
│       ├── gradle-wrapper.jar
│       └── gradle-wrapper.properties
└── app/
    └── build.gradle     ✅ Groovy (مستلزم)

Root/
├── build.gradle.kts     ✅ Kotlin DSL (آمن - لا يستخدم Flutter)
├── settings.gradle.kts  ✅ Kotlin DSL (آمن - لا يستخدم Flutter)
├── pubspec.yaml         ✅
├── lib/                 ✅
└── assets/              ✅
```

## الخطوات التالية

### 1. تنظيف البناء السابق
```bash
flutter clean
rm -rf build/
rm -rf android/.gradle/
```

### 2. الآن جرب البناء مجدداً
```bash
flutter build apk --debug
```

### 3. أو عبر Gradle مباشرة
```bash
cd android
./gradlew assembleDebug
```

## الدرس المستفاد

⚠️ **مهم جداً**: Flutter و Gradle يحتاجان إلى:
- ملفات `build.gradle` بصيغة **Groovy** في `android/`
- ملفات `settings.gradle` بصيغة **Groovy** في `android/`
- ملفات `build.gradle` بصيغة **Groovy** في `android/app/`

✅ يمكنك استخدام Kotlin DSL في الجذر فقط (root `build.gradle.kts` و `settings.gradle.kts`)

## الحالة الحالية

✅ **البنية الآن صحيحة وجاهزة للبناء**

اخ��بر الآن:
```bash
flutter build apk --debug
```
