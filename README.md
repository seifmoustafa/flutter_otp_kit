# Flutter OTP Kit

<div align="center">
  <img src="https://raw.githubusercontent.com/seifmoustafa/flutter_otp_kit/main/screenshots/flutter_otp_kit_logo.png" width="300" alt="Flutter OTP Kit Logo">
  <br>
  <strong>Flutter OTP Kit - Professional OTP Verification Package</strong>
</div>

[![pub package](https://img.shields.io/pub/v/flutter_otp_kit.svg)](https://pub.dev/packages/flutter_otp_kit)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue.svg)](https://flutter.dev)

A comprehensive Flutter package for OTP (One-Time Password) verification with extensive customization options, responsive design, robust error handling, RTL/LTR support, cursor styles, animations, and intelligent focus management. Built with a modern widget-based architecture for flexibility and maintainability.

## 📦 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_otp_kit: ^3.0.0
```

Then run:

```bash
flutter pub get
```

## 🚀 Quick Start

### Basic Usage

```dart
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

// Simple OTP Field
FlexibleOtpField(
  length: 4,
  onChanged: (value) => print('OTP: $value'),
  onCompleted: (value) => print('Completed: $value'),
)

// Complete Verification Flow
FlexibleOtpVerification(
  title: 'Verification Code',
  subtitle: 'Enter the code sent to +1 (555) 123-****',
  otpLength: 4,
  onVerify: (value) => print('Verifying: $value'),
  onResend: () => print('Resending code'),
)
```

### Advanced Usage with Cursor Styles

```dart
// Custom cursor with builder
FlexibleOtpField(
  length: 4,
  cursorStyle: CursorStyle.custom,
  cursorColor: Colors.blue,
  customCursorBuilder: (context, color) => Container(
    width: 10,
    height: 10,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(0.3),
          blurRadius: 4,
          spreadRadius: 1,
        ),
      ],
    ),
  ),
  onChanged: (value) => print('OTP: $value'),
  onCompleted: (value) => print('Completed: $value'),
)

// Bottom cursor (underlined style)
FlexibleOtpField(
  length: 4,
  cursorStyle: CursorStyle.bottom,
  cursorColor: Colors.green,
  onChanged: (value) => print('OTP: $value'),
  onCompleted: (value) => print('Completed: $value'),
)
```

### Builder Pattern Usage

```dart
// Using OtpBuilder for advanced configuration
OtpBuilder()
  .length(4)
  .cursorStyle(CursorStyle.custom)
  .cursorColor(Colors.purple)
  .customCursorBuilder((context, color) => Icon(
    Icons.edit,
    color: color,
    size: 14,
  ))
  .showErrorText(false) // Hide error text for custom error handling
  .build(
    onChanged: (value) => print('OTP: $value'),
    onCompleted: (value) => print('Completed: $value'),
  )
```

## ✨ Features

### 🎯 Core Functionality
- **Complete OTP Verification**: Full-featured OTP input with validation and verification
- **Multiple Input Types**: Numeric, alphabetic, alphanumeric, and custom input support
- **Smart Paste Detection**: Enhanced clipboard detection with intelligent full OTP vs single-digit handling
- **Consecutive Digit Support**: Handles consecutive identical digits (e.g., "2244")
- **Real-time Validation**: Live validation with custom regex patterns and error messages
- **Auto-submit**: Automatic form submission when OTP is complete
- **Timer Integration**: Enhanced timer with automatic start and proper reset on resend
- **Smart Validation**: Prevents verification with incomplete fields and shows user-friendly error messages
- **Instant Error Clearing**: Validation errors clear immediately when user starts typing for better UX
- **Backend Integration Ready**: Perfect for Cubit/Bloc patterns with automatic state management
- **Real-time State Callbacks**: Custom widgets get notified of all state changes instantly
- **RTL/LTR Support**: Complete directionality support with automatic detection for Arabic, Hebrew, Persian, Urdu, and other RTL languages
- **Tap Outside Unfocus**: Global tap outside unfocus functionality with external handler priority

### 🎨 Design & Customization
- **Perfect Visual Hierarchy**: Strict visual hierarchy: Error > Focused > Completed > Filled > Empty
- **Generic Color System**: All colors (including error colors) are completely customizable
- **Comprehensive Styling**: Complete control over colors, dimensions, spacing, and appearance
- **Advanced Field Shapes**: Rectangle, rounded rectangle, circle, stadium, and custom shapes
- **Gradient Support**: Linear, radial, and sweep gradient backgrounds
- **Shadow Effects**: Customizable shadows with color, blur, spread, and offset control
- **Animation System**: Smooth animations with customizable curves for professional transitions
- **Enhanced Field Transitions**: Smooth field-to-field visual transitions and state animations
- **Progressive Highlighting**: Visual feedback showing user progress through OTP entry
- **Theme Integration**: Material Design 3, light, dark themes with automatic adaptation
- **Responsive Design**: Fixed pixel overflow issues with proper text wrapping and flexible layouts

### 🎨 Cursor Styles & Customization
- **Multiple Cursor Styles**: Vertical, Bottom (underlined), Custom, and None
- **Custom Cursor Builder**: Complete control over cursor appearance with custom widgets
- **Interactive Cursor Examples**: Live preview with different cursor styles based on color selection
- **Enhanced Bottom Cursor**: Improved styling with better positioning and visual enhancement
- **Cursor Animation**: Smooth cursor transitions and animations
- **Color-based Cursor Examples**: Different cursor styles for each color selection

### 🎬 Advanced Animations
- **Shake Animation**: Customizable shake animation with smooth return to original position
- **Field Animations**: Scale, fade, slide, and custom field animations
- **Error Animations**: Smooth error state transitions with elastic curves
- **Success Animations**: Celebration animations for successful verification
- **Custom Animation Curves**: Support for all Flutter animation curves
- **Animation Presets**: Predefined animation configurations for common use cases
- **Performance Optimized**: Smooth animations without performance impact

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
- **Backend Integration**: Built-in methods for Cubit/Bloc state management
- **Automatic State Handling**: Package handles all error/validation states automatically
- **Custom Widget Synchronization**: Real-time callbacks for custom widget state updates

### 🧩 Architecture
- **Widget-Based Design**: Modular architecture for better maintainability
- **State Management**: Dedicated state management for OTP fields
- **Styling System**: Centralized styling for consistent appearance
- **Configuration System**: Comprehensive configuration options
- **Utility Functions**: Reusable utility functions for common tasks
- **Public API**: Clean and well-documented public API

## 🎨 Cursor Styles

### Available Cursor Styles

1. **Vertical Cursor** (`CursorStyle.vertical`)
   - Traditional vertical line cursor
   - Default Flutter TextField cursor

2. **Bottom Cursor** (`CursorStyle.bottom`)
   - Underlined cursor that looks like "_"
   - Better positioned and styled
   - Enhanced with shadow effects

3. **Custom Cursor** (`CursorStyle.custom`)
   - Complete control over cursor appearance
   - Use `customCursorBuilder` to create your own cursor
   - Supports any widget as cursor

4. **No Cursor** (`CursorStyle.none`)
   - Clean look without visible cursor
   - Perfect for minimal designs

### Custom Cursor Examples

```dart
// Circular cursor with shadow
customCursorBuilder: (context, color) => Container(
  width: 10,
  height: 10,
  decoration: BoxDecoration(
    color: color,
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: color.withOpacity(0.3),
        blurRadius: 4,
        spreadRadius: 1,
      ),
    ],
  ),
),

// Square cursor with rounded corners
customCursorBuilder: (context, color) => Container(
  width: 12,
  height: 12,
  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(2),
  ),
),

// Icon cursor
customCursorBuilder: (context, color) => Icon(
  Icons.edit,
  color: color,
  size: 14,
),

// Gradient cursor
customCursorBuilder: (context, color) => Container(
  width: 8,
  height: 8,
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [color, color.withOpacity(0.5)],
    ),
    shape: BoxShape.circle,
  ),
),
```

## 🎬 Animations

### Shake Animation

```dart
FlexibleOtpField(
  length: 4,
  shakeAnimationDuration: Duration(milliseconds: 500),
  shakeAnimationIntensity: 10.0,
  onChanged: (value) => print('OTP: $value'),
  onCompleted: (value) => print('Completed: $value'),
)
```

### Field Animations

```dart
FlexibleOtpField(
  length: 4,
  fieldAnimationType: FieldAnimationType.scale,
  animationDuration: Duration(milliseconds: 300),
  animationCurve: Curves.elasticOut,
  onChanged: (value) => print('OTP: $value'),
  onCompleted: (value) => print('Completed: $value'),
)
```

### Animation Presets

```dart
// Using predefined animation presets
FlexibleOtpField(
  length: 4,
  fieldAnimationType: FieldAnimationType.scale,
  animationDuration: Duration(milliseconds: 200),
  animationCurve: Curves.easeInOut,
  shakeAnimationDuration: Duration(milliseconds: 400),
  shakeAnimationIntensity: 8.0,
  onChanged: (value) => print('OTP: $value'),
  onCompleted: (value) => print('Completed: $value'),
)
```

## 🔧 Backend Integration

### Cubit/Bloc Integration

```dart
final GlobalKey<FlexibleOtpVerificationState> otpKey = GlobalKey();

FlexibleOtpVerification(
  key: otpKey,
  title: 'Verify Phone Number',
  subtitle: 'Enter the code sent to {contactInfo}',
  contactInfo: '+1 (555) 123-4567',
  otpLength: 4,
  onVerify: (otp) {
    // Your business logic
    if (otp == '1234') {
      // Success - package handles state automatically
      otpKey.currentState?.handleVerificationResult(true);
    } else {
      // Error - package handles state automatically
      otpKey.currentState?.handleVerificationResult(
        false, 
        errorMessage: 'Invalid OTP. Please try again.'
      );
    }
  },
  onResend: () {
    // Your resend logic
    print('Resending OTP');
  },
)
```

### State Management Methods

```dart
final GlobalKey<FlexibleOtpVerificationState> otpKey = GlobalKey();

// Clear OTP fields
otpKey.currentState?.clearOtp();

// Set OTP programmatically
otpKey.currentState?.setOtp('1234');

// Get current OTP
String currentOtp = otpKey.currentState?.getCurrentOtp() ?? '';

// Set error state
otpKey.currentState?.setErrorState(true);

// Clear error state
otpKey.currentState?.clearErrorState();

// Check if OTP is valid
bool isValid = otpKey.currentState?.isOtpValid() ?? false;
```

## 🎨 Customization Examples

### Complete Customization

```dart
FlexibleOtpField(
  length: 4,
  fieldWidth: 60.0,
  fieldHeight: 60.0,
  fieldSpacing: 12.0,
  cursorStyle: CursorStyle.custom,
  cursorColor: Colors.blue,
  customCursorBuilder: (context, color) => Container(
    width: 8,
    height: 8,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
  ),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey.shade300),
    borderRadius: BorderRadius.circular(8),
  ),
  focusedDecoration: BoxDecoration(
    border: Border.all(color: Colors.blue, width: 2),
    borderRadius: BorderRadius.circular(8),
    color: Colors.blue.withOpacity(0.1),
  ),
  errorDecoration: BoxDecoration(
    border: Border.all(color: Colors.red, width: 2),
    borderRadius: BorderRadius.circular(8),
    color: Colors.red.withOpacity(0.1),
  ),
  completedDecoration: BoxDecoration(
    border: Border.all(color: Colors.green, width: 2),
    borderRadius: BorderRadius.circular(8),
    color: Colors.green.withOpacity(0.1),
  ),
  onChanged: (value) => print('OTP: $value'),
  onCompleted: (value) => print('Completed: $value'),
)
```

### Predefined Styles

```dart
// Using predefined styles
FlexibleOtpField(
  length: 4,
  predefinedStyle: OtpPredefinedStyle.roundedFilled,
  cursorStyle: CursorStyle.bottom,
  cursorColor: Colors.purple,
  onChanged: (value) => print('OTP: $value'),
  onCompleted: (value) => print('Completed: $value'),
)
```

### RTL/LTR Support

```dart
// RTL/LTR support
FlexibleOtpField(
  length: 4,
  textDirection: TextDirection.rtl, // For Arabic, Hebrew, etc.
  unfocusOnTapOutside: true, // Tap outside to unfocus
  externalTapOutsideHandler: () => print('Custom tap outside'), // Custom handler
  onChanged: (value) => print('OTP: $value'),
  onCompleted: (value) => print('Completed: $value'),
)
```

## 📋 API Reference

### FlexibleOtpField Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `length` | `int` | `4` | Number of OTP input fields |
| `onChanged` | `ValueChanged<String>?` | `null` | Callback when OTP value changes |
| `onCompleted` | `ValueChanged<String>?` | `null` | Callback when OTP input is completed |
| `cursorStyle` | `CursorStyle` | `CursorStyle.vertical` | Style of the cursor |
| `cursorColor` | `Color?` | `null` | Color of the cursor |
| `customCursorBuilder` | `Widget Function(BuildContext, Color)?` | `null` | Custom cursor builder |
| `fieldWidth` | `double` | `50.0` | Width of each OTP field |
| `fieldHeight` | `double` | `50.0` | Height of each OTP field |
| `fieldSpacing` | `double` | `8.0` | Spacing between OTP fields |
| `decoration` | `BoxDecoration?` | `null` | Decoration for empty fields |
| `focusedDecoration` | `BoxDecoration?` | `null` | Decoration for focused fields |
| `errorDecoration` | `BoxDecoration?` | `null` | Decoration for error fields |
| `completedDecoration` | `BoxDecoration?` | `null` | Decoration for completed fields |
| `shakeAnimationDuration` | `Duration` | `Duration(milliseconds: 500)` | Duration of shake animation |
| `shakeAnimationIntensity` | `double` | `10.0` | Intensity of shake animation |
| `fieldAnimationType` | `FieldAnimationType` | `FieldAnimationType.none` | Type of field animation |
| `animationDuration` | `Duration` | `Duration(milliseconds: 300)` | Duration of field animation |
| `animationCurve` | `Curve` | `Curves.easeInOut` | Curve for field animation |
| `showErrorText` | `bool` | `true` | Whether to show error text |
| `textDirection` | `TextDirection?` | `null` | Text direction for RTL/LTR support |
| `unfocusOnTapOutside` | `bool` | `true` | Whether to unfocus on tap outside |
| `externalTapOutsideHandler` | `VoidCallback?` | `null` | External tap outside handler |

### FlexibleOtpVerification Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | `String?` | `null` | Title text for the verification screen |
| `subtitle` | `String?` | `null` | Subtitle text with optional {contactInfo} placeholder |
| `contactInfo` | `String?` | `null` | Contact information to display in subtitle |
| `otpLength` | `int` | `4` | Number of OTP input fields |
| `onVerify` | `Function(String)` | **Required** | Callback when verify button is pressed |
| `onResend` | `VoidCallback` | **Required** | Callback when resend button is pressed |
| `buttonText` | `String?` | `"Verify"` | Text for the verify button |
| `resendText` | `String?` | `"Resend Code"` | Text for the resend button |
| `timerPrefix` | `String?` | `"Resend in"` | Prefix for the timer text |
| `fieldSpacing` | `double` | `10.0` | Spacing between OTP fields |
| `primaryColor` | `Color` | `Color(0xFF018CC3)` | Primary color for the widget |
| `secondaryColor` | `Color` | `Color(0xFF8B8B8B)` | Secondary color for the widget |
| `backgroundColor` | `Color` | `Colors.white` | Background color for OTP fields |
| `focusedBorderColor` | `Color?` | `null` | Border color for focused OTP fields |
| `completedFieldBorderColor` | `Color?` | `null` | Border color for completed OTP fields |
| `errorBorderColor` | `Color?` | `null` | Border color for error OTP fields |
| `showTimer` | `bool` | `true` | Whether to show the resend timer |
| `timerDuration` | `int` | `60` | Duration for the resend timer in seconds |

### CursorStyle Enum

```dart
enum CursorStyle {
  vertical, // Traditional vertical line cursor
  bottom,   // Underlined cursor that looks like "_"
  custom,   // Custom cursor using customCursorBuilder
  none,     // No visible cursor
}
```

### FieldAnimationType Enum

```dart
enum FieldAnimationType {
  none,    // No animation
  scale,   // Scale animation
  fade,    // Fade animation
  slide,   // Slide animation
  bounce,  // Bounce animation
  elastic, // Elastic animation
}
```

## 🎯 Public Methods

### FlexibleOtpVerificationState Methods

```dart
final GlobalKey<FlexibleOtpVerificationState> otpKey = GlobalKey();

// Handle verification results
otpKey.currentState?.handleVerificationResult(true); // Success
otpKey.currentState?.handleVerificationResult(false, errorMessage: 'Invalid OTP'); // Error

// Clear OTP fields
otpKey.currentState?.clearOtp();

// Set OTP programmatically
otpKey.currentState?.setOtp('1234');

// Get current OTP
String currentOtp = otpKey.currentState?.getCurrentOtp() ?? '';

// Set error state
otpKey.currentState?.setErrorState(true);

// Clear error state
otpKey.currentState?.clearErrorState();

// Check if OTP is valid
bool isValid = otpKey.currentState?.isOtpValid() ?? false;

// Reset fields
otpKey.currentState?.resetFields();
```

## 🏗️ Architecture

Flutter OTP Kit is built with a modern widget-based architecture that emphasizes separation of concerns, maintainability, and flexibility.

### Core Widgets

- **FlexibleOtpField**: Individual OTP input field with complete customization
- **FlexibleOtpVerification**: Complete verification widget with all features
- **OtpBuilder**: Builder pattern for advanced configuration
- **OtpPredefinedStyle**: Predefined styling options

### State Management

- **FlexibleOtpFieldState**: Manages individual field state
- **FlexibleOtpVerificationState**: Manages overall verification state
- **GlobalKey Integration**: For programmatic control

### Customization System

- **CursorStyle**: Enum for cursor styles
- **FieldAnimationType**: Enum for animation types
- **BoxDecoration**: Complete styling control
- **Custom Builders**: For advanced customization

## 📱 Screenshots

<div align="center">
  <table>
    <tr>
      <td align="center">
        <img src="https://raw.githubusercontent.com/seifmoustafa/flutter_otp_kit/main/screenshots/sc1.png" width="200px" alt="Basic Design with Validation Error">
        <br />
        <em>Basic Design with Validation Error</em>
      </td>
      <td align="center">
        <img src="https://raw.githubusercontent.com/seifmoustafa/flutter_otp_kit/main/screenshots/sc4.png" width="200px" alt="Empty Initial Basic Design">
        <br />
        <em>Empty Initial Basic Design</em>
      </td>
      <td align="center">
        <img src="https://raw.githubusercontent.com/seifmoustafa/flutter_otp_kit/main/screenshots/sc5.png" width="200px" alt="Complete Filled Inputs">
        <br />
        <em>Complete Filled Inputs</em>
      </td>
    </tr>
    <tr>
      <td align="center">
        <img src="https://raw.githubusercontent.com/seifmoustafa/flutter_otp_kit/main/screenshots/sc6.png" width="200px" alt="Email Basic Design">
        <br />
        <em>Email Basic Design</em>
      </td>
      <td align="center">
        <img src="https://raw.githubusercontent.com/seifmoustafa/flutter_otp_kit/main/screenshots/sc2.png" width="200px" alt="Widget Design While Writing">
        <br />
        <em>Widget Design While Writing</em>
      </td>
      <td align="center">
        <img src="https://raw.githubusercontent.com/seifmoustafa/flutter_otp_kit/main/screenshots/sc3.png" width="200px" alt="Complete Typed Widget Design">
        <br />
        <em>Complete Typed Widget Design</em>
      </td>
    </tr>
  </table>
</div>

### 🎬 Video Demo

<p align="center">
  <a href="https://raw.githubusercontent.com/seifmoustafa/flutter_otp_kit/main/screenshots/tutorial.gif">
    <img src="https://raw.githubusercontent.com/seifmoustafa/flutter_otp_kit/main/screenshots/tutorial.gif" width="200px" alt="Tutorial Video Demo">
  </a>
</p>

**Tutorial Video**: Complete walkthrough of Flutter OTP Kit features and implementation

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📞 Support

If you encounter any issues or have questions, please file an issue on the GitHub repository.

---

**Made with ❤️ for the Flutter community**
