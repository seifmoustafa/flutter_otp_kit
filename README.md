# Flutter OTP Kit

[![pub package](https://img.shields.io/pub/v/flutter_otp_kit.svg)](https://pub.dev/packages/flutter_otp_kit)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue.svg)](https://flutter.dev)

A comprehensive, production-ready Flutter package for OTP (One-Time Password) verification with extensive customization options, responsive design, and robust error handling.

## ✨ Features

### 🎯 Core Functionality
- **Complete OTP Verification**: Full-featured OTP input with validation and verification
- **Multiple Input Types**: Numeric, alphabetic, alphanumeric, and custom input support
- **Smart Paste Detection**: Automatic clipboard detection and OTP filling
- **Real-time Validation**: Live validation with custom regex patterns and error messages
- **Auto-submit**: Automatic form submission when OTP is complete
- **Timer Integration**: Built-in countdown timer for resend functionality

### 🎨 Design & Customization
- **Comprehensive Styling**: Complete control over colors, dimensions, spacing, and appearance
- **Advanced Field Shapes**: Rectangle, rounded rectangle, circle, stadium, and custom shapes
- **Gradient Support**: Linear, radial, and sweep gradient backgrounds
- **Shadow Effects**: Customizable shadows with color, blur, spread, and offset control
- **Animation System**: Smooth animations with predefined configurations (default, fast, smooth, disabled)
- **Theme Integration**: Material Design 3, light, dark themes with automatic adaptation

### 📱 Responsive & Layout
- **Responsive Design**: Automatic adaptation to different screen sizes and orientations
- **Single Row Layout**: Standard OTP appearance with fields always in a single row
- **Smart Spacing**: Dynamic field spacing with min/max constraints and safety margins
- **Overflow Protection**: Comprehensive overflow prevention with multiple safety layers
- **Cross-platform**: Optimized for iOS, Android, Web, and Desktop

### ♿ Accessibility & UX
- **Screen Reader Support**: Complete accessibility with semantic labels and hints
- **Keyboard Navigation**: Full keyboard navigation support
- **Focus Management**: Proper focus handling and auto-focus capabilities
- **Haptic Feedback**: Optional haptic feedback for better user experience
- **Interactive Selection**: Configurable text selection behavior
- **Contact Masking**: Automatic phone/email masking for privacy

### 🔧 Advanced Features
- **Custom Validators**: Complete validation control with custom logic
- **Input Formatters**: Support for custom TextInputFormatter
- **Biometric Input**: Support for advanced input methods
- **Voice Input**: Voice input capabilities
- **Swipe Navigation**: Touch gesture support for field navigation
- **Custom Field Builders**: Complete control over field appearance and behavior
- **Custom Layout Builders**: Full control over field arrangement

## 🚀 Quick Start

### Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_otp_kit: ^1.2.4
```

Then run:

```bash
flutter pub get
```

### Basic Usage

```dart
import 'package:flutter/material.dart';
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

class MyOTPPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OtpVerificationWidget(
          title: 'Verify Phone Number',
          subtitle: 'Enter the 5-digit code sent to {contactInfo}',
          contactInfo: '01012345678',
          maskingType: MaskingType.phone,
          fieldCount: 5,
          timerDuration: 60,
          buttonText: 'Verify',
          resendText: 'Resend Code',
          timerPrefix: 'after',
          onVerify: (otp) {
            // Handle OTP verification
            print('OTP: $otp');
          },
          onResend: () {
            // Handle resend functionality
            print('Resend requested');
          },
        ),
      ),
    );
  }
}
```

## 📖 API Reference

### OtpVerificationWidget

The main widget for OTP verification with comprehensive customization options.

#### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | `String` | Main title displayed above OTP fields |
| `subtitle` | `String` | Subtitle with instructions (use `{contactInfo}` for dynamic content) |
| `buttonText` | `String` | Text for the verification button |
| `resendText` | `String` | Text for the resend button |
| `timerPrefix` | `String` | Text prefix for the countdown timer |
| `onVerify` | `Function(String)` | Callback when OTP verification is requested |
| `onResend` | `Function()` | Callback when resend is requested |

#### Optional Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `contactInfo` | `String?` | `null` | Contact information to display (phone/email) |
| `maskingType` | `MaskingType` | `MaskingType.phone` | Type of contact masking |
| `fieldCount` | `int` | `5` | Number of OTP input fields |
| `timerDuration` | `int` | `60` | Countdown timer duration in seconds |
| `fieldWidth` | `double` | `55.125` | Width of each OTP field |
| `fieldHeight` | `double` | `60.731` | Height of each OTP field |
| `borderRadius` | `double` | `17.752` | Border radius for fields |
| `borderWidth` | `double` | `1.869` | Border width for fields |
| `spacing` | `double` | `16.0` | General spacing around the widget |
| `fieldSpacing` | `double` | `12.0` | Spacing between OTP fields |
| `minFieldSpacing` | `double` | `8.0` | Minimum spacing between fields |
| `maxFieldSpacing` | `double` | `20.0` | Maximum spacing between fields |
| `primaryColor` | `Color` | `Color(0xFF018CC3)` | Primary color for the widget |
| `secondaryColor` | `Color` | `Color(0xFF8B8B8B)` | Secondary color for borders and text |
| `backgroundColor` | `Color` | `Colors.white` | Background color for fields |
| `autoFocus` | `bool` | `true` | Auto-focus the first field |
| `enableAutoValidation` | `bool` | `true` | Enable automatic validation |
| `otpInputType` | `OtpInputType` | `OtpInputType.numeric` | Type of input allowed |
| `enablePaste` | `bool` | `true` | Enable clipboard paste detection |
| `obscureText` | `bool` | `false` | Hide input text (for sensitive OTPs) |
| `obscuringCharacter` | `String` | `'•'` | Character used for obscuring text |
| `showTimer` | `bool` | `true` | Show/hide the countdown timer |
| `enableShadow` | `bool` | `false` | Enable shadow effects |
| `shadowColor` | `Color?` | `null` | Color of the shadow |
| `shadowBlurRadius` | `double` | `10.0` | Blur radius of the shadow |
| `shadowSpreadRadius` | `double` | `0.0` | Spread radius of the shadow |
| `focusedBorderColor` | `Color?` | `null` | Color of focused field border |
| `errorBorderColor` | `Color?` | `null` | Color of error field border |
| `filledFieldBackgroundColor` | `Color?` | `null` | Background color of filled fields |
| `cursorColor` | `Color?` | `null` | Color of the text cursor |
| `cursorHeight` | `double?` | `fieldHeight - 6` | Height of the text cursor |
| `cursorWidth` | `double` | `1.0` | Width of the text cursor |
| `cursorAlignment` | `CursorAlignment` | `CursorAlignment.center` | Alignment of the cursor within the field |
| `animationDuration` | `Duration` | `Duration(milliseconds: 150)` | Duration of animations |
| `animationCurve` | `Curve` | `Curves.easeInOut` | Animation curve |
| `textCapitalization` | `TextCapitalization` | `TextCapitalization.none` | Text capitalization behavior |
| `enableInteractiveSelection` | `bool` | `true` | Enable text selection |
| `layoutType` | `OtpLayoutType` | `OtpLayoutType.singleRow` | Layout type for field arrangement |
| `fieldAlignment` | `OtpFieldAlignment` | `OtpFieldAlignment.center` | Field alignment within layout |
| `fieldDirection` | `OtpFieldDirection` | `OtpFieldDirection.horizontal` | Field arrangement direction |
| `fieldShape` | `OtpFieldShape` | `OtpFieldShape.roundedRectangle` | Field shape type |
| `animationConfig` | `OtpAnimationConfig` | `OtpAnimationConfig.defaultConfig` | Animation configuration |
| `themeConfig` | `OtpThemeConfig?` | `null` | Theme configuration |
| `behaviorConfig` | `OtpBehaviorConfig` | `OtpBehaviorConfig()` | Behavior configuration |
| `enableGradient` | `bool` | `false` | Enable gradient background |
| `gradientConfig` | `OtpGradientConfig?` | `null` | Gradient configuration |
| `enableHapticFeedback` | `bool` | `false` | Enable haptic feedback |
| `enableSoundFeedback` | `bool` | `false` | Enable sound feedback |
| `enableAutoSubmit` | `bool` | `false` | Enable auto submit when complete |
| `enableAutoClearOnError` | `bool` | `false` | Enable auto clear on error |
| `validationRegex` | `String?` | `null` | Validation regex pattern |
| `validationMessage` | `String?` | `null` | Custom validation message |
| `enableRealTimeValidation` | `bool` | `false` | Enable real-time validation |
| `enableScreenReaderSupport` | `bool` | `true` | Enable screen reader support |

### Enums

#### OtpInputType
- `numeric`: Only accepts numbers (0-9)
- `alphabetic`: Only accepts letters (a-z, A-Z)
- `alphanumeric`: Accepts both letters and numbers
- `custom`: Allows custom input with formatters

#### MaskingType
- `phone`: Masks phone numbers (e.g., 010******78)
- `email`: Masks email addresses (e.g., u***@example.com)

#### OtpLayoutType
- `singleRow`: Fields arranged in a single horizontal row
- `wrap`: Fields wrap to next line when needed
- `grid`: Fields arranged in a grid
- `custom`: Custom layout using builder function

#### OtpFieldShape
- `rectangle`: Standard rectangle shape
- `roundedRectangle`: Rectangle with rounded corners
- `circle`: Perfect circle shape
- `stadium`: Pill-shaped (stadium) shape
- `custom`: Custom shape using path function

#### OtpFieldAlignment
- `start`: Align fields to the start
- `center`: Center align fields
- `end`: Align fields to the end
- `spaceBetween`: Distribute fields with space between
- `spaceAround`: Distribute fields with space around
- `spaceEvenly`: Distribute fields with even spacing

#### OtpFieldDirection
- `horizontal`: Arrange fields horizontally
- `vertical`: Arrange fields vertically

#### CursorAlignment
- `left`: Align cursor to the left
- `center`: Center align cursor (default)
- `right`: Align cursor to the right

### Configuration Classes

#### OtpAnimationConfig
Predefined animation configurations:

```dart
OtpAnimationConfig.defaultConfig  // Standard animations
OtpAnimationConfig.fast          // Fast animations
OtpAnimationConfig.smooth        // Smooth animations
OtpAnimationConfig.disabled      // No animations
```

#### OtpThemeConfig
Theme configurations:

```dart
OtpThemeConfig.material3(context)  // Material Design 3 theme
OtpThemeConfig.light             // Light theme
OtpThemeConfig.dark              // Dark theme
```

#### OtpBehaviorConfig
Behavior configuration options:

```dart
OtpBehaviorConfig(
  enableHapticFeedback: true,
  enableSoundFeedback: true,
  enableAutoSubmit: true,
  enableAutoClearOnError: true,
  enableVisualFeedback: true,
)
```

#### OtpGradientConfig
Gradient configuration:

```dart
OtpGradientConfig(
  colors: [Colors.blue, Colors.purple],
  type: GradientType.linear,
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
)
```

## 🎨 Examples

### Basic OTP
```dart
OtpVerificationWidget(
  title: 'Verify Phone Number',
  subtitle: 'Enter the 5-digit code sent to {contactInfo}',
  contactInfo: '01012345678',
  maskingType: MaskingType.phone,
  fieldCount: 5,
  buttonText: 'Verify',
  resendText: 'Resend Code',
  timerPrefix: 'after',
  onVerify: (otp) => handleVerification(otp),
  onResend: () => resendOtp(),
)
```

### Alphanumeric OTP
```dart
OtpVerificationWidget(
  title: 'Verify Account',
  subtitle: 'Enter the 6-character code',
  fieldCount: 6,
  otpInputType: OtpInputType.alphanumeric,
  textCapitalization: TextCapitalization.characters,
  buttonText: 'Verify',
  resendText: 'Resend',
  timerPrefix: 'expires in',
  onVerify: (otp) => handleVerification(otp),
  onResend: () => resendOtp(),
)
```

### Secure OTP
```dart
OtpVerificationWidget(
  title: 'Secure Verification',
  subtitle: 'Enter the secure code',
  fieldCount: 4,
  obscureText: true,
  obscuringCharacter: '●',
  enableShadow: true,
  shadowColor: Colors.purple.withOpacity(0.3),
  buttonText: 'Verify',
  resendText: 'Resend',
  timerPrefix: 'after',
  onVerify: (otp) => handleVerification(otp),
  onResend: () => resendOtp(),
)
```

### Custom Validation
```dart
OtpVerificationWidget(
  title: 'Custom Validation',
  subtitle: 'Enter valid OTP',
  fieldCount: 6,
  validationRegex: r'^[0-9]{6}$',
  validationMessage: 'Please enter 6 digits',
  enableRealTimeValidation: true,
  buttonText: 'Verify',
  resendText: 'Resend',
  timerPrefix: 'after',
  onVerify: (otp) => handleVerification(otp),
  onResend: () => resendOtp(),
)
```

### Advanced Styling
```dart
OtpVerificationWidget(
  title: 'Styled OTP',
  subtitle: 'Enter code with style',
  fieldCount: 5,
  fieldShape: OtpFieldShape.circle,
  fieldWidth: 60,
  fieldHeight: 60,
  borderRadius: 30,
  primaryColor: Colors.purple,
  enableGradient: true,
  gradientConfig: OtpGradientConfig(
    colors: [Colors.purple, Colors.pink],
    type: GradientType.linear,
  ),
  animationConfig: OtpAnimationConfig.smooth,
  enableHapticFeedback: true,
  buttonText: 'Verify',
  resendText: 'Resend',
  timerPrefix: 'after',
  onVerify: (otp) => handleVerification(otp),
  onResend: () => resendOtp(),
)
```

### Cursor Control
```dart
OtpVerificationWidget(
  title: 'Custom Cursor OTP',
  subtitle: 'Enter code with custom cursor',
  fieldCount: 6,
  fieldHeight: 56,
  // Cursor customization
  cursorHeight: 50, // 6px padding from top and bottom
  cursorWidth: 2.0, // Thicker cursor
  cursorAlignment: CursorAlignment.left, // Left-aligned cursor
  cursorColor: Colors.blue, // Blue cursor
  buttonText: 'Verify',
  resendText: 'Resend',
  timerPrefix: 'after',
  onVerify: (otp) => handleVerification(otp),
  onResend: () => resendOtp(),
)
```

### Complete Customization
```dart
OtpVerificationWidget(
  title: 'Fully Customized OTP',
  subtitle: 'Every aspect is controllable',
  fieldCount: 6,
  // Layout configuration
  layoutType: OtpLayoutType.singleRow,
  fieldAlignment: OtpFieldAlignment.center,
  fieldShape: OtpFieldShape.roundedRectangle,
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
  validationRegex: r'^[0-9]{6}$',
  validationMessage: 'Please enter 6 digits',
  // Cursor control
  cursorHeight: 50, // Custom cursor height with padding
  cursorWidth: 1.5, // Slightly thicker cursor
  cursorAlignment: CursorAlignment.center, // Center-aligned cursor
  cursorColor: Colors.purple, // Purple cursor
  // Accessibility
  enableScreenReaderSupport: true,
  semanticLabel: 'OTP verification code',
  semanticHint: 'Enter the 6-digit code',
  buttonText: 'Verify',
  resendText: 'Resend',
  timerPrefix: 'after',
  onVerify: (otp) => handleVerification(otp),
  onResend: () => resendOtp(),
)
```

## 🔧 Public Methods

### clearOtp()
Clears all OTP input fields and refocuses the first field.

```dart
final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();

// Clear OTP
otpKey.currentState?.clearOtp();
```

### setOtp(String)
Pre-fills fields with provided OTP (useful for testing/auto-fill).

```dart
final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();

// Set OTP
otpKey.currentState?.setOtp('12345');
```

## 🎯 Best Practices

### Performance
- Use `OtpAnimationConfig.disabled` for maximum performance
- Set `enableShadow: false` if shadows are not needed
- Use appropriate `fieldCount` for your use case (typically 4-6 digits)

### Accessibility
- Always provide meaningful `semanticLabel` and `semanticHint`
- Use `enableScreenReaderSupport: true` for accessibility
- Ensure sufficient color contrast for all text and borders

### Security
- Use `obscureText: true` for sensitive OTPs
- Implement proper validation with `validationRegex`
- Use `enableRealTimeValidation: true` for immediate feedback

### Responsive Design
- Test on different screen sizes
- Use appropriate `minFieldSpacing` and `maxFieldSpacing`
- Consider using `fieldSpacing` for consistent spacing

## 🐛 Troubleshooting

### Common Issues

**Fields not appearing**
- Check if `fieldCount` is greater than 0
- Ensure `fieldWidth` and `fieldHeight` are positive values

**Overflow errors**
- The package automatically handles overflow with safety margins
- If issues persist, reduce `fieldWidth` or increase `minFieldSpacing`

**Validation not working**
- Ensure `enableAutoValidation: true`
- Check `validationRegex` pattern
- Verify `validationMessage` is provided

**Timer not showing**
- Set `showTimer: true`
- Ensure `timerDuration` is greater than 0

### Debug Mode
Enable debug mode by setting `enableAutoValidation: false` and handling validation manually.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📞 Support

If you encounter any issues or have questions, please file an issue on the [GitHub repository](https://github.com/seifmoustafa/flutter_otp_kit/issues).

## 🔗 Links

- [pub.dev Package](https://pub.dev/packages/flutter_otp_kit)
- [GitHub Repository](https://github.com/seifmoustafa/flutter_otp_kit)
- [Documentation](https://github.com/seifmoustafa/flutter_otp_kit#readme)
- [Issue Tracker](https://github.com/seifmoustafa/flutter_otp_kit/issues)

---

Made with ❤️ for the Flutter community