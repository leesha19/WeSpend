# wespend
# weSpend

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

[✓] Flutter (Channel stable, 3.35.5, on macOS 15.2 24C101 darwin-arm64 (Rosetta), locale en-IN)
[✓] Android toolchain - develop for Android devices (Android SDK version 36.0.0)
[✗] Xcode - develop for iOS and macOS
    ✗ Xcode installation is incomplete; a full installation is necessary for iOS and macOS development.
      Download at: https://developer.apple.com/xcode/
      Or install Xcode via the App Store.
      Once installed, run:
        sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
        sudo xcodebuild -runFirstLaunch
    ✗ CocoaPods not installed.
        CocoaPods is a package manager for iOS or macOS platform code.
        Without CocoaPods, plugins will not work on iOS or macOS.
        For more info, see https://flutter.dev/to/platform-plugins
      For installation instructions, see https://guides.cocoapods.org/using/getting-started.html#installation
[✓] Chrome - develop for the web
[✓] Android Studio (version 2024.3)
[✓] Connected device (2 available)
[✓] Network resources

! Doctor found issues in 1 category.
leeshavani@leeshas-MacBook-Air WeSpend % flutter doctor -v
[✓] Flutter (Channel stable, 3.35.5, on macOS 15.2 24C101 darwin-arm64 (Rosetta), locale en-IN) [300ms]
    • Flutter version 3.35.5 on channel stable at /Users/leeshavani/Downloads/flutter
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision ac4e799d23 (4 months ago), 2025-09-26 12:05:09 -0700
    • Engine revision d3d45dcf25
    • Dart version 3.9.2
    • DevTools version 2.48.0
    • Feature flags: enable-web, enable-linux-desktop, enable-macos-desktop, enable-windows-desktop, enable-android, enable-ios, cli-animations,
      enable-lldb-debugging

[✓] Android toolchain - develop for Android devices (Android SDK version 36.0.0) [1,172ms]
    • Android SDK at /Users/leeshavani/Library/Android/sdk
    • Emulator version 35.4.9.0 (build_id 13025442) (CL:N/A)
    • Platform android-36, build-tools 36.0.0
    • ANDROID_HOME = /Users/leeshavani/Library/Android/sdk
    • Java binary at: /Applications/Android Studio.app/Contents/jbr/Contents/Home/bin/java
      This is the JDK bundled with the latest Android Studio installation on this machine.
      To manually set the JDK path, use: `flutter config --jdk-dir="path/to/jdk"`.
    • Java version OpenJDK Runtime Environment (build 21.0.6+-13355223-b631.42)
    • All Android licenses accepted.

[✗] Xcode - develop for iOS and macOS [264ms]
    ✗ Xcode installation is incomplete; a full installation is necessary for iOS and macOS development.
      Download at: https://developer.apple.com/xcode/
      Or install Xcode via the App Store.
      Once installed, run:
        sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
        sudo xcodebuild -runFirstLaunch
    ✗ CocoaPods not installed.
        CocoaPods is a package manager for iOS or macOS platform code.
        Without CocoaPods, plugins will not work on iOS or macOS.
        For more info, see https://flutter.dev/to/platform-plugins
      For installation instructions, see https://guides.cocoapods.org/using/getting-started.html#installation

[✓] Chrome - develop for the web [86ms]
    • Chrome at /Applications/Google Chrome.app/Contents/MacOS/Google Chrome

[✓] Android Studio (version 2024.3) [85ms]
    • Android Studio at /Applications/Android Studio.app/Contents
    • Flutter plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/6351-dart
    • Java version OpenJDK Runtime Environment (build 21.0.6+-13355223-b631.42)

[✓] Connected device (2 available) [519ms]
    • macOS (desktop) • macos  • darwin-arm64   • macOS 15.2 24C101 darwin-arm64 (Rosetta)
    • Chrome (web)    • chrome • web-javascript • Google Chrome 143.0.7499.193

[✓] Network resources [849ms]
    • All expected network resources are available.


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
flutter clean && flutter pub get && dart run build_runner build --delete-conflicting-outputs &&
dart run easy_localization:generate --source-dir assets/lang/ -f keys -O lib/ui/utils/theme --output-file app_strings.g.dart &&
dart pub global activate flutter_gen && fluttergen
--------------------------------------------------------------------------------------------
flutter clean && flutter pub get && dart run build_runner build --delete-conflicting-outputs
flutter pub run build_runner watch --delete-conflicting-outputs
For windows: 
flutter clean; flutter pub get; dart run build_runner build --delete-conflicting-outputs;
dart run easy_localization:generate --source-dir assets/lang/ -f keys -O lib/ui/utils/theme --output-file app_strings.g.dart;
dart pub global activate flutter_gen; fluttergen


-----------------------------------------------------------------------------------------------------------------------
Common Widget Entries
-----------------------------------------------
Common Switch  -  CommonCupertinoSwitch
Common Table header widget - CommonTableHeaderWidget
Common Table Value widget - CommonTableValueWidget
Common Back with title widget - CommonBackTitleWidget
Common Button widget - CommonButton
Common Confirmation overlay widget - CommonConfirmationOverlayWidget
Common Form field widget - CommonInputFormField
Common Search form field widget - CommonSearchFormField
Common Searchable dropdown widget - CommonSearchableDropdown
Common Svg widget - CommonSVG
Common Text widget - CommonText
Common Outline container widget - CommonOutlineBox
Common Checkbox widget - CommonCheckBox
Common Appbar Widget - CommonAppbar
Common Success Dialog Widget - showSuccessDialogue
