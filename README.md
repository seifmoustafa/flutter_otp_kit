# 🔐 Flutter OTP Kit

A comprehensive Flutter package for OTP (One-Time Password) verification with customizable styling, localization support, and robust functionality.

[![pub package](https://img.shields.io/pub/v/flutter_otp_kit.svg)](https://pub.dev/packages/flutter_otp_kit)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## ✨ Features

- **🔢 Configurable field count**: Support for 4, 5, 6, or any number of digits
- **🌍 Fully localizable**: All text must be provided by caller (no hardcoded strings)
- **🎯 Smart focus management**: Auto-navigation between fields during input
- **⏰ Timer functionality**: Countdown timer with customizable duration
- **✅ Validation support**: Optional form validation with error handling
- **📱 Cross-platform**: Works seamlessly on iOS, Android, Web, and Desktop
- **🎨 Customizable styling**: Colors, dimensions, spacing all configurable
- **♿ Accessibility ready**: Proper focus handling and keyboard navigation
- **🔒 Contact masking**: Automatic phone/email masking for privacy

## 📦 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_otp_kit: ^1.0.2
```

Then run:

```bash
flutter pub get
```

## 🚀 Quick Start

```dart
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

// Basic OTP verification
OtpVerificationWidget(
  title: 'Verify Phone Number',
  subtitle: 'Enter the code sent to {contactInfo}',
  contactInfo: '01012345678',
  maskingType: MaskingType.phone,
  buttonText: 'Verify',
  resendText: 'Resend Code',
  timerPrefix: 'after',
  onVerify: (otp) {
    // Handle OTP verification
    print('OTP: $otp');
  },
  onResend: () {
    // Handle resend OTP
    print('Resend OTP');
  },
)
```

## 📖 Usage Examples

### Phone Number OTP

```dart
OtpVerificationWidget(
  title: 'Verify Phone Number',
  subtitle: 'Enter the 5-digit code sent to {contactInfo}',
  contactInfo: '01012345678',
  maskingType: MaskingType.phone,
  fieldCount: 5,
  timerDuration: 60,
  buttonText: 'Verify',
  resendText: 'Resend Code',
  timerPrefix: 'after',
  onVerify: (otp) => handlePhoneVerification(otp),
  onResend: () => resendPhoneOtp(),
)
```

### Email OTP

```dart
OtpVerificationWidget(
  title: 'Verify Email',
  subtitle: 'Enter the code sent to {contactInfo}',
  contactInfo: 'user@example.com',
  maskingType: MaskingType.email,
  fieldCount: 6,
  timerDuration: 120,
  buttonText: 'Verify Email',
  resendText: 'Resend Code',
  timerPrefix: 'after',
  onVerify: (otp) => handleEmailVerification(otp),
  onResend: () => resendEmailOtp(),
)
```

### Custom Styling

```dart
OtpVerificationWidget(
  title: 'Custom OTP',
  subtitle: 'Enter verification code',
  buttonText: 'Verify',
  resendText: 'Resend',
  timerPrefix: 'after',
  // Custom styling
  primaryColor: Colors.purple,
  secondaryColor: Colors.grey,
  fieldWidth: 60,
  fieldHeight: 70,
  borderRadius: 20,
  spacing: 20,
  titleStyle: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.purple,
  ),
  onVerify: (otp) => handleVerification(otp),
  onResend: () => resendOtp(),
)
```

### Custom Button Widget

```dart
OtpVerificationWidget(
  title: 'Custom Button OTP',
  subtitle: 'Enter verification code',
  buttonText: 'Verify',
  resendText: 'Resend',
  timerPrefix: 'after',
  buttonWidget: Container(
    width: double.infinity,
    height: 50,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.purple],
      ),
      borderRadius: BorderRadius.circular(25),
    ),
    child: ElevatedButton(
      onPressed: () => handleVerification(_getOtpValue()),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: Text('Custom Verify Button'),
    ),
  ),
  onVerify: (otp) => handleVerification(otp),
  onResend: () => resendOtp(),
)
```

## 🎛️ Configuration Options

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | `String` | Title text displayed at the top |
| `subtitle` | `String` | Subtitle text displayed below title |
| `buttonText` | `String` | Text for the verify button |
| `resendText` | `String` | Text for the resend link |
| `timerPrefix` | `String` | Text prefix for timer (e.g., "after") |
| `onVerify` | `Function(String)` | Callback when verify button is pressed |
| `onResend` | `VoidCallback` | Callback when resend is pressed |

### Optional Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `contactInfo` | `String?` | `null` | Contact info to mask in subtitle |
| `maskingType` | `MaskingType` | `MaskingType.phone` | Type of masking to apply |
| `fieldCount` | `int` | `5` | Number of OTP input fields |
| `timerDuration` | `int` | `60` | Timer duration in seconds |
| `fieldWidth` | `double` | `55.125` | Width of each input field |
| `fieldHeight` | `double` | `60.731` | Height of each input field |
| `borderRadius` | `double` | `17.752` | Border radius of input fields |
| `borderWidth` | `double` | `1.869` | Border width of input fields |
| `spacing` | `double` | `16.0` | Spacing between elements |
| `primaryColor` | `Color` | `Color(0xFF018CC3)` | Primary color |
| `secondaryColor` | `Color` | `Color(0xFF8B8B8B)` | Secondary color |
| `backgroundColor` | `Color` | `Colors.white` | Background color of fields |
| `autoFocus` | `bool` | `true` | Auto focus first field |
| `enableAutoValidation` | `bool` | `true` | Enable automatic validation |
| `titleStyle` | `TextStyle?` | `null` | Custom title text style |
| `subtitleStyle` | `TextStyle?` | `null` | Custom subtitle text style |
| `buttonStyle` | `TextStyle?` | `null` | Custom button text style |
| `resendStyle` | `TextStyle?` | `null` | Custom resend text style |
| `timerStyle` | `TextStyle?` | `null` | Custom timer text style |
| `fieldStyle` | `TextStyle?` | `null` | Custom field text style |
| `buttonWidget` | `Widget?` | `null` | Custom button widget |

## 🔧 Public Methods

### `clearOtp()`
Clears all OTP input fields and refocuses the first field.

```dart
final otpWidget = OtpVerificationWidget(/* ... */);
otpWidget.clearOtp();
```

### `setOtp(String otp)`
Pre-fills fields with provided OTP (useful for testing/auto-fill).

```dart
final otpWidget = OtpVerificationWidget(/* ... */);
otpWidget.setOtp("12345");
```

## 🌍 Localization

The package is designed to be fully localizable. All text parameters are required to ensure proper localization:

```dart
OtpVerificationWidget(
  title: S.of(context).otpVerificationTitle,
  subtitle: S.of(context).otpVerificationSubtitle('{contactInfo}'),
  buttonText: S.of(context).verify,
  resendText: S.of(context).resendOtp,
  timerPrefix: S.of(context).timerPrefix,
  // ... other parameters
)
```

## 🎨 Masking Types

### `MaskingType.phone`
Masks phone numbers: `01012345678` → `010****678`

### `MaskingType.email`
Masks email addresses: `user@example.com` → `us***@example.com`

### `MaskingType.none`
Shows full contact information without masking.

## 🧪 Testing

The package includes comprehensive tests. Run them with:

```bash
flutter test
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Contributors and users who provide feedback

## 📞 Support

If you encounter any problems or have suggestions, please file an issue at the [GitHub repository](https://github.com/yourusername/flutter_otp_kit/issues).

---

Made with ❤️ for the Flutter community
