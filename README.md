# Roqqu Assessment

A Flutter application for Roqqu Pay that displays live cryptocurrency ticker prices using the Binance API.

## Features

- Real-time cryptocurrency price tracking
- Live updates from Binance API
- Clean and intuitive UI
- Cross-platform support (iOS & Android)

## Tech Stack

- **Framework**: Flutter
- **State Management**: Riverpod
- **Navigation**: go_router
- **API**: Binance Public API

## Prerequisites

Before you begin, ensure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (latest stable version)
- [Dart SDK](https://dart.dev/get-dart) (comes with Flutter)
- **For Android development**:
  - Android Studio
  - Android SDK
- **For iOS development** (macOS only):
  - Xcode
  - CocoaPods
- A code editor:
  - [VS Code](https://code.visualstudio.com/) with Flutter extension
  - [Android Studio](https://developer.android.com/studio)
  - [IntelliJ IDEA](https://www.jetbrains.com/idea/)

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/presh-devs/roqqu_assessment
cd roqqu_assessment
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Verify Installation

Run Flutter Doctor to check your environment:

```bash
flutter doctor
```

Fix any issues reported before proceeding.

## Running the Application

### Development Mode

Run on a connected device or emulator:

```bash
flutter run
```

### Run on Specific Device

List available devices:

```bash
flutter devices
```

Run on a specific device:

```bash
flutter run -d <device_id>
```

### Debug Mode

```bash
flutter run --debug
```

### Release Mode

```bash
flutter run --release
```

## Building the Application

### Android

Build APK (for distribution):

```bash
flutter build apk --release
```

Build App Bundle (recommended for Play Store):

```bash
flutter build appbundle
```

The output will be located at:
- APK: `build/app/outputs/flutter-apk/app-release.apk`
- AAB: `build/app/outputs/bundle/release/app-release.aab`

### iOS

Build for iOS (macOS only):

```bash
flutter build ios --release
```

**Note**: For iOS distribution, you'll need to configure signing in Xcode.

## Project Structure

```
lib/
├── main.dart                    # Application entry point
├── core/                        # Core functionality and utilities
│   ├── constants/              # App-wide constants
│   ├── router/                 # Navigation configuration (go_router)
│   └── widgets/                # Reusable widgets
├── features/                   # Feature-based modules
│   └── home/                   # Home feature
│       ├── data/               # Data layer
│       │   ├── datasources/   # API clients and data sources
│       │   ├── models/        # Data models
│       │   └── repositories/  # Repository implementations
│       ├── domain/             # Business logic layer
│       │   └── repositories/  # Repository interfaces
│       └── presentation/       # UI layer
│           ├── providers/     # Riverpod providers
│           ├── views/         # Screen widgets
│           └── widgets/       # Feature-specific widgets
```

## Dependencies

Key packages used in this project:

- `flutter_riverpod` - State management
- `go_router` - Declarative routing
- Additional dependencies can be found in `pubspec.yaml`

## API Integration

This application uses the [Binance Public API](https://binance-docs.github.io/apidocs/) to fetch real-time cryptocurrency data.

**Note**: No API key is required for public endpoints.

## Development


### Testing

Run all tests:

```bash
flutter test
```

Run tests with coverage:

```bash
flutter test --coverage
```

## Troubleshooting

### Common Issues

**Issue**: Dependencies not installing
```bash
flutter clean
flutter pub get
```

**Issue**: Build failures
```bash
flutter clean
flutter pub get
rm -rf ios/Pods ios/Podfile.lock  # For iOS issues
cd ios && pod install && cd ..
```

**Issue**: Environment problems
```bash
flutter doctor -v
```

**Issue**: Gradle build issues (Android)
- Ensure you have a stable internet connection
- Check that JAVA_HOME is properly set
- Try invalidating caches in Android Studio

### References

- Check [Flutter documentation](https://docs.flutter.dev/)
- Review [Binance API documentation](https://binance-docs.github.io/apidocs/)


## License

This project is part of a technical assessment for Roqqu Pay.


---

**Built with Flutter**