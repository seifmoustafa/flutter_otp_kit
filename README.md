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

### New in v1.2.2 - Critical Layout Error Fixes
- **🚨 Fixed RenderBox Layout Errors**: Resolved "RenderBox was not laid out" exceptions completely
- **🔧 Removed Problematic Wrapper**: Eliminated SingleChildScrollView + ConstrainedBox causing infinite height constraints
- **🛡️ Safe Responsive Design**: Implemented conservative responsive calculations with extra safety margins
- **📐 Enhanced Field Constraints**: Added Container with maxWidth constraints for overflow protection
- **🎯 Conservative Safety Margins**: Increased safety margins to 30% for spacing and 20% for field width
- **📱 Improved Wrap Detection**: Reduced wrap threshold to 75% of screen width for extra safety
- **🔒 Layout Stability**: Ensured stable layout rendering without constraint conflicts

### Previous Features (v1.2.1) - Critical Responsive Fixes
- **🚨 Fixed Overflow Bug**: Resolved "RIGHT OVERFLOWED BY 12 PIXELS" error completely
- **📱 Enhanced Responsive Design**: Implemented comprehensive responsive field width calculation
- **🛡️ Overflow Protection**: Added 20% safety margin to prevent any pixel overflow
- **🔄 Force Resize Mechanism**: Automatic field width adjustment based on screen constraints
- **📐 Smart Spacing**: Dynamic spacing calculation with min/max constraints
- **🎯 Layout Optimization**: Improved wrap detection and grid layout handling
- **📱 Screen Adaptation**: Better handling of different screen sizes and orientations
- **🔧 Edge Case Handling**: Comprehensive handling of all edge cases for responsive design

### Previous Features (v1.2.0) - Complete Generic Package
- **🏗️ Comprehensive Layout System**: Multiple layout types (singleRow, wrap, grid, custom)
- **🔷 Advanced Field Shapes**: Rectangle, rounded rectangle, circle, stadium, and custom shapes
- **🎬 Complete Animation Control**: Predefined animation configs (default, fast, smooth, disabled)
- **🎨 Full Theme System**: Material 3, light, dark themes with complete customization
- **📱 Responsive Spacing**: Min/max field spacing with automatic calculation
- **⚙️ Advanced Behavior Configuration**: Haptic feedback, sound feedback, auto-submit, auto-clear
- **♿ Comprehensive Accessibility**: Screen reader support, semantic labels, custom actions
- **🌈 Gradient Support**: Linear, radial, and sweep gradients for backgrounds
- **🎭 Custom Decorations**: Complete BoxDecoration customization
- **✅ Advanced Validation**: Real-time validation, custom regex, custom messages
- **🔤 Multiple Input Types**: Numeric, alphabetic, alphanumeric, and custom with formatters
- **🎤 Voice and Biometric Input**: Support for advanced input methods
- **👆 Swipe Navigation**: Touch gesture support for field navigation
- **🛠️ Custom Field Builders**: Complete control over field appearance and behavior
- **📐 Custom Layout Builders**: Full control over field arrangement
- **🔲 Grid Layout Support**: Multi-column field arrangements
- **↔️ Field Direction Control**: Horizontal and vertical field arrangements
- **🎯 Field Alignment Options**: Center, start, end, space between, around, evenly
- **🖼️ Border Style Control**: Solid, dashed, dotted, and custom border styles
- **🌫️ Shadow Configuration**: Customizable shadows with color, blur, spread, offset
- **📝 Text Style Control**: Complete typography customization for all text elements
- **🔘 Button Color System**: Comprehensive button color configuration
- **❌ Error State Management**: Visual error states with custom styling
- **✅ Success State Management**: Visual success states with custom styling
- **🎯 Focus State Management**: Custom focus styling and behavior
- **⏰ Timer Control**: Show/hide timer with custom styling
- **⌨️ Keyboard Type Control**: Custom keyboard types for different input scenarios
- **🔤 Text Capitalization**: Control over text capitalization behavior
- **👆 Interactive Selection**: Enable/disable text selection
- **✔️ Custom Validators**: Complete validation control with custom logic
- **⚡ Real-time Validation**: Live validation feedback
- **💬 Custom Error Messages**: Personalized error messaging
- **♿ Accessibility Actions**: Custom accessibility actions for screen readers
- **🏷️ Semantic Support**: Complete semantic labeling for accessibility
- **🌐 Cross-platform Optimization**: Optimized for iOS, Android, Web, and Desktop

### Previous Features (v1.1.0)
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
  flutter_otp_kit: ^1.2.2
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

### Complete Generic Configuration

```dart
OtpVerificationWidget(
  title: 'Fully Customizable OTP',
  subtitle: 'Every aspect is controllable',
  buttonText: 'Verify',
  resendText: 'Resend',
  timerPrefix: 'after',
  // Layout configuration
  layoutType: OtpLayoutType.wrap,
  fieldAlignment: OtpFieldAlignment.center,
  fieldDirection: OtpFieldDirection.horizontal,
  fieldShape: OtpFieldShape.circle,
  // Animation configuration
  animationConfig: OtpAnimationConfig.smooth,
  // Theme configuration
  themeConfig: OtpThemeConfig.material3(context),
  // Behavior configuration
  behaviorConfig: OtpBehaviorConfig(
    enableHapticFeedback: true,
    enableSoundFeedback: true,
    enableAutoSubmit: true,
    enableAutoClearOnError: true,
  ),
  // Responsive spacing
  fieldSpacing: 12.0,
  minFieldSpacing: 8.0,
  maxFieldSpacing: 20.0,
  // Gradient background
  enableGradient: true,
  gradientConfig: OtpGradientConfig(
    colors: [Colors.blue, Colors.purple],
    type: GradientType.linear,
  ),
  // Advanced validation
  enableRealTimeValidation: true,
  validationRegex: r'^[0-9]{5}$',
  validationMessage: 'Please enter 5 digits',
  // Accessibility
  enableScreenReaderSupport: true,
  semanticLabel: 'OTP verification code',
  semanticHint: 'Enter the 5-digit code',
  onVerify: (otp) => handleVerification(otp),
  onResend: () => resendOtp(),
)
```

### Custom Field Builder

```dart
OtpVerificationWidget(
  title: 'Custom Field Design',
  subtitle: 'Completely custom field appearance',
  buttonText: 'Verify',
  resendText: 'Resend',
  timerPrefix: 'after',
  // Custom field builder
  customFieldBuilder: (context, index, controller, focusNode) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange, Colors.red],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
        onChanged: (value) => _onDigitChanged(value, index),
      ),
    );
  },
  onVerify: (otp) => handleVerification(otp),
  onResend: () => resendOtp(),
)
```

### Grid Layout Example

```dart
OtpVerificationWidget(
  title: 'Grid Layout OTP',
  subtitle: 'Fields arranged in a grid',
  buttonText: 'Verify',
  resendText: 'Resend',
  timerPrefix: 'after',
  fieldCount: 9,
  // Grid layout
  layoutType: OtpLayoutType.grid,
  gridColumns: 3,
  fieldAlignment: OtpFieldAlignment.center,
  // Custom styling
  fieldShape: OtpFieldShape.roundedRectangle,
  fieldWidth: 50,
  fieldHeight: 50,
  borderRadius: 10,
  primaryColor: Colors.green,
  // Animation
  animationConfig: OtpAnimationConfig.fast,
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
| `layoutType` | `OtpLayoutType` | `OtpLayoutType.singleRow` | Layout type for field arrangement |
| `fieldAlignment` | `OtpFieldAlignment` | `OtpFieldAlignment.center` | Field alignment within layout |
| `fieldDirection` | `OtpFieldDirection` | `OtpFieldDirection.horizontal` | Field arrangement direction |
| `fieldShape` | `OtpFieldShape` | `OtpFieldShape.roundedRectangle` | Field shape type |
| `fieldShapeConfig` | `OtpFieldShapeConfig?` | `null` | Custom field shape configuration |
| `animationConfig` | `OtpAnimationConfig` | `OtpAnimationConfig.defaultConfig` | Animation configuration |
| `themeConfig` | `OtpThemeConfig?` | `null` | Theme configuration |
| `behaviorConfig` | `OtpBehaviorConfig` | `OtpBehaviorConfig()` | Behavior configuration |
| `gridColumns` | `int` | `3` | Number of columns for grid layout |
| `customFieldBuilder` | `Widget Function(...)?` | `null` | Custom field builder function |
| `customLayoutBuilder` | `Widget Function(...)?` | `null` | Custom layout builder function |
| `enableGradient` | `bool` | `false` | Enable gradient background |
| `gradientConfig` | `OtpGradientConfig?` | `null` | Gradient configuration |
| `enableCustomDecoration` | `bool` | `false` | Enable custom decoration |
| `customDecoration` | `BoxDecoration?` | `null` | Custom decoration for fields |
| `enableHapticFeedback` | `bool` | `false` | Enable haptic feedback |
| `enableSoundFeedback` | `bool` | `false` | Enable sound feedback |
| `enableVoiceInput` | `bool` | `false` | Enable voice input |
| `enableBiometricInput` | `bool` | `false` | Enable biometric input |
| `enableSwipeNavigation` | `bool` | `false` | Enable swipe navigation |
| `enableKeyboardNavigation` | `bool` | `true` | Enable keyboard navigation |
| `enableAutoSubmit` | `bool` | `false` | Enable auto submit when complete |
| `enableAutoClearOnError` | `bool` | `false` | Enable auto clear on error |
| `customValidator` | `String? Function(String?)?` | `null` | Custom validator function |
| `validationRegex` | `String?` | `null` | Validation regex pattern |
| `validationMessage` | `String?` | `null` | Custom validation message |
| `enableRealTimeValidation` | `bool` | `false` | Enable real-time validation |
| `semanticHint` | `String?` | `null` | Semantic hint for accessibility |
| `semanticValue` | `String?` | `null` | Semantic value for accessibility |
| `enableScreenReaderSupport` | `bool` | `true` | Enable screen reader support |
| `customAccessibilityActions` | `List<Map<String, dynamic>>?` | `null` | Custom accessibility actions |

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

## 🏗️ Layout Types

### `OtpLayoutType.singleRow`
Fields arranged in a single horizontal row (default).

### `OtpLayoutType.wrap`
Fields wrap to next line when screen width is insufficient.

### `OtpLayoutType.grid`
Fields arranged in a grid with specified number of columns.

### `OtpLayoutType.custom`
Custom layout using your own layout builder function.

## 🔷 Field Shapes

### `OtpFieldShape.rectangle`
Standard rectangle shape.

### `OtpFieldShape.roundedRectangle`
Rectangle with rounded corners (default).

### `OtpFieldShape.circle`
Perfect circle shape.

### `OtpFieldShape.stadium`
Pill-shaped (stadium) shape.

### `OtpFieldShape.custom`
Custom shape using your own path function.

## 🎬 Animation Configurations

### `OtpAnimationConfig.defaultConfig`
Standard animation configuration with moderate timing.

### `OtpAnimationConfig.fast`
Fast animations for quick interactions.

### `OtpAnimationConfig.smooth`
Smooth animations with longer durations and easing curves.

### `OtpAnimationConfig.disabled`
No animations for maximum performance.

## 🎨 Theme Configurations

### `OtpThemeConfig.material3(context)`
Material Design 3 theme that adapts to your app's theme.

### `OtpThemeConfig.light`
Light theme with bright colors and high contrast.

### `OtpThemeConfig.dark`
Dark theme with dark colors and appropriate contrast.

### Custom Theme
Create your own theme with complete color and style control.

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
