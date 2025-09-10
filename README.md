# Flutter OTP Kit

A comprehensive Flutter package for OTP (One-Time Password) verification with customizable styling, localization support, and robust functionality.

[![pub package](https://img.shields.io/pub/v/flutter_otp_kit.svg)](https://pub.dev/packages/flutter_otp_kit)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## TL;DR

A wrapper library that makes it easier to implement OTP verification with a single widget, supporting both Material and Cupertino design languages across all platforms.

## Bit more

For anyone building apps with Flutter, implementing OTP verification typically requires designing input fields, managing focus navigation, handling timers, and validation logic. This package provides a complete solution with a single widget that handles all these complexities.

This package supports the **Stable** release as a full released version.

## How it works

Instead of having to write complex OTP verification logic like this...

```dart
// Traditional approach - lots of boilerplate
class CustomOtpWidget extends StatefulWidget {
  // Multiple controllers, focus nodes, timers, validation logic...
  // Hundreds of lines of code for basic functionality
}
```

you can use a single `OtpVerificationWidget` which handles all the complexity for you...

```dart
OtpVerificationWidget(
  title: 'Verify Phone Number',
  subtitle: 'Enter the code sent to {contactInfo}',
  contactInfo: '01012345678',
  maskingType: MaskingType.phone,
  onVerify: (otp) => handleVerification(otp),
  onResend: () => resendOtp(),
)
```

The heavy lifting of focus management, timer handling, validation, and styling is done for you.

## ✨ Features

### Core Features
- **🔢 Configurable field count**: Support for 4, 5, 6, or any number of digits
- **🌍 Fully localizable**: All text must be provided by caller (no hardcoded strings)
- **🎯 Smart focus management**: Auto-navigation between fields during input
- **⏰ Timer functionality**: Countdown timer with customizable duration
- **✅ Validation support**: Optional form validation with error handling
- **📱 Cross-platform**: Works seamlessly on iOS, Android, Web, and Desktop
- **🎨 Customizable styling**: Colors, dimensions, spacing all configurable
- **♿ Accessibility ready**: Proper focus handling and keyboard navigation
- **🔒 Contact masking**: Automatic phone/email masking for privacy

### New in v1.1.0
- **🔤 Multiple input types**: numeric, alphabetic, alphanumeric, and custom
- **📋 Paste support**: Automatically detect and fill OTP from clipboard
- **🎭 Custom input formatters**: Support for custom TextInputFormatter
- **✔️ Custom validators**: Add your own validation logic
- **📞 Enhanced callbacks**: onChanged and onCompleted callbacks
- **✨ Animation support**: Fade and scale animations with customizable duration and curves
- **❌ Enhanced error handling**: Custom error messages and styling
- **🦾 Accessibility features**: Semantic labels for better screen reader support
- **🔐 Secure OTP mode**: Obscure text option for sensitive inputs
- **🎨 Advanced styling options**: Focused/error borders, filled backgrounds, shadows
- **🌓 Theme support**: Automatic adaptation to light/dark themes

## Installation

> pub.dev: https://pub.dev/packages/flutter_otp_kit/install

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_otp_kit: ^1.1.0
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

### Alphanumeric OTP

```dart
OtpVerificationWidget(
  title: 'Enter Access Code',
  subtitle: 'Enter your 6-character access code',
  buttonText: 'Verify Code',
  resendText: 'Get New Code',
  timerPrefix: 'expires in',
  fieldCount: 6,
  otpInputType: OtpInputType.alphanumeric,
  textCapitalization: TextCapitalization.characters,
  onVerify: (otp) => handleVerification(otp),
  onResend: () => resendOtp(),
  onChanged: (value) => print('Current: $value'),
  onCompleted: (otp) => print('Completed: $otp'),
)
```

### Secure OTP with Obscure Text

```dart
OtpVerificationWidget(
  title: 'Secure PIN',
  subtitle: 'Enter your 4-digit secure PIN',
  buttonText: 'Confirm',
  resendText: 'Reset PIN',
  timerPrefix: 'valid for',
  fieldCount: 4,
  obscureText: true,
  obscuringCharacter: '●',
  onVerify: (otp) => handleSecureVerification(otp),
  onResend: () => resetPin(),
)
```

### Custom Validation and Formatting

```dart
OtpVerificationWidget(
  title: 'Custom OTP',
  subtitle: 'Enter verification code',
  buttonText: 'Submit',
  resendText: 'Resend',
  timerPrefix: 'wait',
  otpInputType: OtpInputType.custom,
  inputFormatters: [
    FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]')),
  ],
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Required';
    }
    if (!RegExp(r'^[A-Z0-9]$').hasMatch(value)) {
      return 'Invalid character';
    }
    return null;
  },
  errorText: 'Please enter valid code',
  errorBorderColor: Colors.red,
  focusedBorderColor: Colors.blue,
  onVerify: (otp) => handleVerification(otp),
  onResend: () => resendOtp(),
)
```

### Advanced Styling with Animations

```dart
OtpVerificationWidget(
  title: 'Animated OTP',
  subtitle: 'Enter code with style',
  buttonText: 'Verify',
  resendText: 'Resend',
  timerPrefix: 'after',
  // Animation settings
  animationDuration: Duration(milliseconds: 300),
  animationCurve: Curves.easeOutBack,
  // Shadow effects
  enableShadow: true,
  shadowColor: Colors.purple.withOpacity(0.3),
  shadowBlurRadius: 15,
  shadowSpreadRadius: 2,
  // Advanced colors
  focusedBorderColor: Colors.purple,
  filledFieldBackgroundColor: Colors.purple.shade50,
  cursorColor: Colors.purple,
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
| `fieldSpacing` | `double` | `12.0` | Spacing between OTP input fields |
| `minFieldSpacing` | `double` | `8.0` | Minimum spacing between fields (responsive) |
| `maxFieldSpacing` | `double` | `20.0` | Maximum spacing between fields (responsive) |
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
| `otpInputType` | `OtpInputType` | `OtpInputType.numeric` | Type of input allowed |
| `inputFormatters` | `List<TextInputFormatter>?` | `null` | Custom input formatters |
| `validator` | `String? Function(String?)?` | `null` | Custom validator function |
| `onChanged` | `Function(String)?` | `null` | Called when any field changes |
| `onCompleted` | `Function(String)?` | `null` | Called when all fields are filled |
| `enablePaste` | `bool` | `true` | Enable paste from clipboard |
| `errorText` | `String?` | `null` | Custom error text |
| `errorStyle` | `TextStyle?` | `null` | Custom error text style |
| `focusedBorderColor` | `Color?` | `null` | Border color when focused |
| `errorBorderColor` | `Color?` | `null` | Border color for errors |
| `filledFieldBackgroundColor` | `Color?` | `null` | Background for filled fields |
| `cursorColor` | `Color?` | `null` | Cursor color |
| `animationDuration` | `Duration` | `150ms` | Animation duration |
| `animationCurve` | `Curve` | `Curves.easeInOut` | Animation curve |
| `enableShadow` | `bool` | `false` | Enable shadow effects |
| `shadowColor` | `Color?` | `null` | Shadow color |
| `shadowBlurRadius` | `double` | `10.0` | Shadow blur radius |
| `shadowSpreadRadius` | `double` | `0.0` | Shadow spread radius |
| `obscureText` | `bool` | `false` | Hide input text |
| `obscuringCharacter` | `String` | `'•'` | Character for obscuring |
| `semanticLabel` | `String?` | `null` | Accessibility label |
| `showTimer` | `bool` | `true` | Show/hide timer |
| `customKeyboardType` | `TextInputType?` | `null` | Custom keyboard type |
| `textCapitalization` | `TextCapitalization` | `TextCapitalization.none` | Text capitalization |
| `enableInteractiveSelection` | `bool` | `true` | Enable text selection |

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

## 🔤 OTP Input Types

### `OtpInputType.numeric`
Only accepts numeric input (0-9). Default keyboard is numeric.

### `OtpInputType.alphabetic`
Only accepts letters (a-z, A-Z). Default keyboard is text.

### `OtpInputType.alphanumeric`
Accepts both letters and numbers. Default keyboard is text.

### `OtpInputType.custom`
Allows custom input with your own formatters and validators.

## Example

An example app that demonstrates the usage is included in the `example/` directory. You can run it to see the package in action:

```bash
cd example
flutter run
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Contributors and users who provide feedback

## 📞 Support

If you encounter any problems or have suggestions, please file an issue at the [GitHub repository](https://github.com/seifmoustafa/flutter_otp_kit/issues).

---

Made with ❤️ for the Flutter community
