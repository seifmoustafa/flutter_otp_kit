# Flutter OTP Kit

<div align="center">
  <img src="https://raw.githubusercontent.com/seifmoustafa/flutter_otp_kit/main/screenshots/flutter_otp_kit_logo.png" width="300" alt="Flutter OTP Kit Logo">
  <br>
  <strong>Professional OTP Verification Package for Flutter</strong>
</div>

[![pub package](https://img.shields.io/pub/v/flutter_otp_kit.svg)](https://pub.dev/packages/flutter_otp_kit)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue.svg)](https://flutter.dev)

A comprehensive, production-ready Flutter package for OTP (One-Time Password) verification with extensive customization options, responsive design, robust error handling, RTL/LTR support, and intelligent focus management. Built with a modern widget-based architecture, this package offers unparalleled flexibility, maintainability, and performance.

## 📸 Screenshots & Demo

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

### 🎬 Video Demo

<p align="center">
  <a href="https://raw.githubusercontent.com/seifmoustafa/flutter_otp_kit/main/screenshots/tutorial.gif">
    <img src="https://raw.githubusercontent.com/seifmoustafa/flutter_otp_kit/main/screenshots/tutorial.gif" width="200px" alt="Tutorial Video Demo">
  </a>
</p>

**Tutorial Video**: Complete walkthrough of Flutter OTP Kit features and implementation

## ✨ Features

### 🎯 Core Functionality
- **Complete OTP Verification**: Full-featured OTP input with validation and verification
- **Multiple Input Types**: Numeric, alphabetic, alphanumeric, and custom input support
- **Smart Paste Detection**: Enhanced clipboard detection with debounce mechanism
- **Consecutive Digit Support**: Fixed issue preventing consecutive identical digits
- **Real-time Validation**: Live validation with custom regex patterns and error messages
- **Auto-submit**: Automatic form submission when OTP is complete
- **Timer Integration**: Enhanced timer with automatic start and proper reset on resend
- **Smart Validation**: Prevents verification with incomplete fields
- **Instant Error Clearing**: Validation errors clear immediately when user starts typing
- **Backend Integration Ready**: Perfect for Cubit/Bloc patterns with automatic state management
- **Real-time State Callbacks**: Custom widgets get notified of all state changes instantly

### 🎨 Design & Customization
- **Perfect Visual Hierarchy**: Strict visual hierarchy: Error > Focused > Completed > Filled > Empty
- **Generic Color System**: All colors are completely customizable
- **Comprehensive Styling**: Complete control over colors, dimensions, spacing, and appearance
- **Advanced Field Shapes**: Rectangle, rounded rectangle, circle, stadium, and custom shapes
- **Custom Border Styles**: Solid, dashed, dotted, bottomOnly, topOnly, leftOnly, rightOnly
- **Gradient Support**: Linear, radial, and sweep gradient backgrounds
- **Shadow Effects**: Customizable shadows with color, blur, spread, and offset control
- **Animation System**: Smooth animations with professional transitions
- **Theme Integration**: Material Design 3, light, dark themes with automatic adaptation
- **Responsive Design**: Fixed pixel overflow issues with proper text wrapping

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
- **RTL/LTR Support**: Complete right-to-left and left-to-right language support
- **Auto Direction Detection**: Automatic text direction detection based on app locale
- **Tap Outside Unfocus**: Global tap outside functionality to unfocus fields
- **Intelligent Focus Management**: Real-time focus state synchronization

### 🔧 Advanced Features
- **Custom Validators**: Complete validation control with custom logic
- **Input Formatters**: Support for custom TextInputFormatter
- **Biometric Input**: Support for advanced input methods
- **Voice Input**: Voice input capabilities
- **Swipe Navigation**: Touch gesture support for field navigation
- **Custom Field Builders**: Complete control over field appearance and behavior
- **Backend Integration**: Built-in methods for Cubit/Bloc state management
- **Automatic State Handling**: Package handles all error/validation states automatically

### 🧩 Architecture
- **Widget-Based Design**: Modular architecture for better maintainability
- **State Management**: Dedicated state management for OTP fields
- **Styling System**: Centralized styling for consistent appearance
- **Configuration System**: Comprehensive configuration options
- **Utility Functions**: Reusable utility functions for common tasks
- **Public API**: Clean and well-documented public API

## 📦 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_otp_kit: ^2.2.0
```

Then run:

```bash
flutter pub get
```

## 🚀 Quick Start

### Basic Usage

```dart
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

OtpVerificationWidget(
  title: 'Verify Phone Number',
  subtitle: 'Enter the code sent to {contactInfo}',
  contactInfo: '+1 (555) 123-4567',
  maskingType: MaskingType.phone,
  onVerify: (otp) {
    // Handle OTP verification
    print('Verifying OTP: $otp');
  },
  onResend: () {
    // Handle resend OTP
    print('Resending OTP');
  },
)
```

### Complete Field Configuration Control

The package offers complete field configuration control through the `fieldConfig` parameter:

#### Method 1: Individual Parameters (Simple)
```dart
OtpVerificationWidget(
  fieldShape: OtpFieldShape.circle,
  fieldWidth: 50,
  fieldHeight: 50,
  borderWidth: 2.0,
  primaryColor: Colors.blue,
  onVerify: (otp) => handleVerification(otp),
  onResend: () => resendCode(),
)
```

#### Method 2: Complete Field Configuration (Advanced)
```dart
OtpVerificationWidget(
  title: 'Custom Styled OTP',
  subtitle: 'Enter the verification code',
  fieldConfig: OtpFieldConfig(
    // Field dimensions
    fieldWidth: 60,
    fieldHeight: 70,
    borderRadius: 15,
    borderWidth: 3,
    
    // Field shape and styling
    fieldShape: OtpFieldShape.custom,
    fieldShapeConfig: OtpFieldShapeConfig(
      borderStyle: OtpBorderStyle.dashed,
      dashPattern: [8, 4],
    ),
    
    // Colors
    primaryColor: Colors.purple,
    backgroundColor: Colors.purple.shade50,
    
    // Effects
    enableShadow: true,
    shadowColor: Colors.purple.withOpacity(0.3),
    focusEffect: FocusEffect.glow,
    completedEffect: CompletedEffect.fillAndBorder,
    
    // Typography
    fieldFontSize: 28,
    fieldFontWeight: FontWeight.bold,
    letterSpacing: 1.0,
    
    // Cursor
    cursorColor: Colors.purple,
    cursorWidth: 2.0,
    
    // Focus effects
    focusGlowRadius: 4.0,
    focusGlowIntensity: 0.8,
  ),
  onVerify: (otp) => handleVerification(otp),
  onResend: () => resendCode(),
)
```

## 🎨 Field Shapes & Styles

### Available Field Shapes
- `OtpFieldShape.rectangle` - Square corners
- `OtpFieldShape.roundedRectangle` - Rounded corners  
- `OtpFieldShape.circle` - Circular fields
- `OtpFieldShape.stadium` - Pill-shaped fields
- `OtpFieldShape.underlined` - Bottom border only
- `OtpFieldShape.outlined` - Material Design outlined
- `OtpFieldShape.custom` - Fully customizable

### Custom Border Styles
- `OtpBorderStyle.solid` - Solid border
- `OtpBorderStyle.dashed` - Dashed border
- `OtpBorderStyle.dotted` - Dotted border
- `OtpBorderStyle.bottomOnly` - Bottom border only
- `OtpBorderStyle.topOnly` - Top border only
- `OtpBorderStyle.leftOnly` - Left border only
- `OtpBorderStyle.rightOnly` - Right border only

## 📱 Platform Support

Flutter OTP Kit is fully optimized for all Flutter-supported platforms:

### Supported Platforms
- **Android** - SDK 21+ with Material Design compliance
- **iOS** - iOS 12.0+ with Cupertino design guidelines
- **Web** - All modern browsers with responsive design
- **Desktop** - Windows, macOS, Linux with native keyboard navigation
- **macOS** - macOS 10.15+ with native styling

### Platform-Specific Features

#### Android
- Material Design 3 compliance
- Adaptive theming based on system theme
- Haptic feedback support
- Optimized for different screen densities
- Support for Android-specific input methods

#### iOS
- Cupertino design guidelines
- iOS-specific animations and transitions
- Support for iOS keyboard types
- Optimized for different iPhone and iPad sizes
- iOS-specific accessibility features

#### Web
- Responsive design for all screen sizes
- Touch and mouse input support
- Keyboard navigation optimized
- Web-specific performance optimizations
- Support for web-specific input methods

#### Desktop
- Native keyboard navigation
- Mouse and touchpad support
- Desktop-specific performance optimizations
- Support for desktop-specific input methods
- Multi-window support

### Platform Adaptation Examples

```dart
// Platform-adaptive styling
OtpVerificationWidget(
  title: 'Verify Phone Number',
  subtitle: 'Enter the code sent to {contactInfo}',
  contactInfo: '+1 (555) 123-4567',
  maskingType: MaskingType.phone,
  // Platform-adaptive field configuration
  fieldConfig: Platform.isIOS 
    ? OtpFieldConfig(
        fieldShape: OtpFieldShape.roundedRectangle,
        borderRadius: 12,
        borderWidth: 1.5,
        primaryColor: Colors.blue,
      )
    : OtpFieldConfig(
        fieldShape: OtpFieldShape.outlined,
        borderRadius: 8,
        borderWidth: 2,
        primaryColor: Colors.blue,
      ),
  onVerify: (otp) => handleVerification(otp),
  onResend: () => resendCode(),
)
```

## 🔧 Advanced Usage

### Backend Integration (Cubit/Bloc Ready)

```dart
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();

OtpVerificationWidget(
  key: otpKey,
  title: 'Verify Phone Number',
  subtitle: 'Enter the code sent to {contactInfo}',
  contactInfo: '+1 (555) 123-4567',
  maskingType: MaskingType.phone,
  buttonText: 'Verify',
  resendText: 'Resend Code',
  timerPrefix: 'in',
  enableAutoValidation: true,
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
  // Real-time state callbacks for custom widgets
  onTimerChanged: (remainingTime) {
    // Custom widgets get notified of timer changes
    setState(() { _customTimer = remainingTime; });
  },
  onErrorStateChangedCallback: (hasError) {
    // Custom widgets get notified of error state changes
    print('Error state changed: $hasError');
  },
  onValidationStateChanged: (isValidating) {
    // Custom widgets get notified of validation state changes
    print('Validation state changed: $isValidating');
  },
  onCompletionStateChanged: (isComplete) {
    // Custom widgets get notified of completion state changes
    print('Completion state changed: $isComplete');
  },
)
```

### RTL/LTR Support

```dart
// Automatic direction detection based on app locale
OtpVerificationWidget(
  title: 'تحقق من رقم الهاتف', // Arabic title
  subtitle: 'أدخل الرمز المرسل إلى {contactInfo}', // Arabic subtitle
  contactInfo: '+966501234567',
  maskingType: MaskingType.phone,
  buttonText: 'تحقق', // Arabic button text
  resendText: 'إعادة إرسال الرمز', // Arabic resend text
  timerPrefix: 'بعد', // Arabic timer prefix
  // textDirection: TextDirection.rtl, // Optional: Force RTL
  onVerify: (otp) {
    // Handle OTP verification
    print('Verifying OTP: $otp');
  },
  onResend: () {
    // Handle resend OTP
    print('Resending OTP');
  },
)

// Manual direction override
OtpVerificationWidget(
  title: 'Verify Phone Number',
  subtitle: 'Enter the code sent to {contactInfo}',
  contactInfo: '+1 (555) 123-4567',
  textDirection: TextDirection.ltr, // Force LTR
  onVerify: (otp) => handleVerification(otp),
  onResend: () => handleResend(),
)
```

### Tap Outside Unfocus

```dart
// Package handles tap outside automatically
OtpVerificationWidget(
  title: 'Verify Phone Number',
  subtitle: 'Enter the code sent to {contactInfo}',
  contactInfo: '+1 (555) 123-4567',
  unfocusOnTapOutside: true, // Enable global tap outside unfocus
  onVerify: (otp) => handleVerification(otp),
  onResend: () => handleResend(),
)

// External handler with priority
final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();

OtpVerificationWidget(
  key: otpKey,
  title: 'Verify Phone Number',
  subtitle: 'Enter the code sent to {contactInfo}',
  contactInfo: '+1 (555) 123-4567',
  unfocusOnTapOutside: true, // Package would handle it, but external handler takes priority
  externalTapOutsideHandler: () {
    // Your custom tap outside logic
    otpKey.currentState?.unfocusAllFields();
    // Additional custom logic here
  },
  onVerify: (otp) => handleVerification(otp),
  onResend: () => handleResend(),
)
```

### Validation & Error Handling

```dart
OtpVerificationWidget(
  title: 'Verify Phone Number',
  subtitle: 'Enter the code sent to {contactInfo}',
  contactInfo: '+1 (555) 123-4567',
  buttonText: 'Verify',
  resendText: 'Resend Code',
  timerPrefix: 'in',
  enableAutoValidation: true, // Prevents verify with incomplete fields
  validationMessage: 'Please enter all digits', // Shows when fields are missing
  onVerify: (otp) {
    if (otp == '1234') {
      // Success - proceed with verification
      print('Verification successful');
    } else {
      // Error - set error state programmatically
      otpKey.currentState?.setErrorState(true);
    }
  },
  onResend: () => resendOtp(),
)
```

**Validation Features:**
- ✅ **Prevents incomplete verification**: Verify button won't work with missing fields
- ✅ **User-friendly messages**: Shows "Please enter all digits" when fields are incomplete
- ✅ **Instant error clearing**: Validation errors disappear immediately when typing
- ✅ **Programmatic control**: Set/clear error states programmatically
- ✅ **Smart error handling**: Errors clear automatically on user interaction

## 🔧 Public Methods

### handleVerificationResult(bool, {String?})
Automatically handles verification results with comprehensive state management.

```dart
final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();

// Success - clears all error states automatically
otpKey.currentState?.handleVerificationResult(true);

// Error - sets error state and message automatically
otpKey.currentState?.handleVerificationResult(
  false, 
  errorMessage: 'Invalid OTP. Please try again.'
);
```

### handleBackendState({bool?, bool?, String?, bool?, String?})
Comprehensive backend integration for Cubit/Bloc patterns.

```dart
final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();

// Loading state
otpKey.currentState?.handleBackendState(isLoading: true);

// Success state
otpKey.currentState?.handleBackendState(
  isLoading: false,
  hasError: false,
);

// Error state
otpKey.currentState?.handleBackendState(
  isLoading: false,
  hasError: true,
  errorMessage: 'Backend error message',
);

// Validation state
otpKey.currentState?.handleBackendState(
  isValidating: true,
  validationMessage: 'Custom validation message',
);
```

### triggerResend()
Public method to trigger resend functionality programmatically.

```dart
final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();

// Trigger resend programmatically
otpKey.currentState?.triggerResend();
```

### clearOtp()
Clears all OTP input fields with configurable options.

```dart
final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();

// Basic usage
otpKey.currentState?.clearOtp();

// Advanced usage with options
otpKey.currentState?.clearOtp(
  refocus: true,      // Whether to refocus first field
  clearError: true,   // Whether to clear error state
  callOnChanged: true // Whether to call onChanged callback
);
```

### setOtp(String)
Pre-fills fields with provided OTP with configurable options.

```dart
final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();

// Basic usage
otpKey.currentState?.setOtp('12345');

// Advanced usage with options
otpKey.currentState?.setOtp('12345',
  clearFocus: true,   // Whether to clear focus from all fields
  clearError: true,   // Whether to clear error state
  callCallbacks: true // Whether to call onChanged and onCompleted callbacks
);
```

### getCurrentOtp()
Returns the current OTP value.

```dart
final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();

// Get current OTP
String currentOtp = otpKey.currentState?.getCurrentOtp() ?? '';
print('Current OTP: $currentOtp');
```

### setErrorState(bool)
Sets the error state programmatically.

```dart
final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();

// Set error state
otpKey.currentState?.setErrorState(true);
```

### clearErrorState()
Clears the error state programmatically.

```dart
final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();

// Clear error state
otpKey.currentState?.clearErrorState();
```

### isOtpValid()
Checks if the current OTP is valid (complete and passes validation).

```dart
final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();

// Check if OTP is valid
bool isValid = otpKey.currentState?.isOtpValid() ?? false;

// Use in conditional logic
if (otpKey.currentState?.isOtpValid() ?? false) {
  // OTP is valid, proceed with verification
} else {
  // OTP is invalid, show error
}
```

## 📋 API Reference

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `onVerify` | `Function(String)` | Callback when verify button is pressed with OTP value |
| `onResend` | `VoidCallback` | Callback when resend button is pressed |

### Optional Text Parameters (with defaults)

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | `String?` | `null` | Title text for the verification screen |
| `subtitle` | `String?` | `null` | Subtitle text with optional {contactInfo} placeholder |
| `buttonText` | `String?` | `"Verify"` | Text for the verify button |
| `resendText` | `String?` | `"Resend Code"` | Text for the resend button |
| `timerPrefix` | `String?` | `"Resend in"` | Prefix for the timer text |

### Optional Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `contactInfo` | `String?` | `null` | Contact information to display in subtitle |
| `maskingType` | `MaskingType` | `MaskingType.none` | Type of masking to apply to contact information |
| `fieldCount` | `int` | `4` | Number of OTP input fields |
| `fieldSpacing` | `double` | `10.0` | Spacing between OTP fields |
| `spacing` | `double` | `16.0` | General spacing for the widget |
| `otpInputType` | `OtpInputType` | `OtpInputType.numeric` | Type of OTP input |
| `layoutType` | `OtpLayoutType` | `OtpLayoutType.fixed` | Layout type for OTP fields |
| `cursorAlignment` | `TextAlign` | `TextAlign.center` | Alignment of cursor within OTP fields |
| `obscureText` | `bool` | `false` | Whether to obscure OTP input |
| `obscuringCharacter` | `String` | `'•'` | Character to use for obscuring text |
| `enableInteractiveSelection` | `bool` | `true` | Whether to enable text selection in OTP fields |
| `textCapitalization` | `TextCapitalization` | `TextCapitalization.none` | Text capitalization for OTP fields |
| `autoFocus` | `bool` | `true` | Whether to auto-focus the first OTP field |
| `enableAutoValidation` | `bool` | `false` | Whether to enable automatic validation |
| `enablePaste` | `bool` | `true` | Whether to enable paste functionality |
| `showTimer` | `bool` | `true` | Whether to show the resend timer |
| `timerDuration` | `int` | `60` | Duration for the resend timer in seconds |
| `primaryColor` | `Color` | `Color(0xFF018CC3)` | Primary color for the widget |
| `secondaryColor` | `Color` | `Color(0xFF8B8B8B)` | Secondary color for the widget |
| `backgroundColor` | `Color` | `Colors.white` | Background color for OTP fields |
| `defaultBorderColor` | `Color?` | `null` | Default border color for empty/unfocused fields |
| `focusedBorderColor` | `Color?` | `null` | Border color for focused OTP fields |
| `completedFieldBorderColor` | `Color?` | `null` | Border color for completed OTP fields |
| `completedFieldBackgroundColor` | `Color?` | `null` | Background color for completed OTP fields |
| `completedFieldTextColor` | `Color?` | `null` | Text color for completed OTP fields |
| `filledFieldBackgroundColor` | `Color?` | `null` | Background color for filled OTP fields |
| `enableProgressiveHighlighting` | `bool` | `false` | Whether to enable progressive highlighting of completed fields |
| `titleStyle` | `TextStyle?` | `null` | Style for title text |
| `subtitleStyle` | `TextStyle?` | `null` | Style for subtitle text |
| `errorStyle` | `TextStyle?` | `null` | Style for error text |
| `buttonStyle` | `TextStyle?` | `null` | Style for button text |
| `resendStyle` | `TextStyle?` | `null` | Style for resend text |
| `timerStyle` | `TextStyle?` | `null` | Style for timer text |
| `validator` | `FormFieldValidator<String>?` | `null` | Validator function for OTP input |
| `onChanged` | `ValueChanged<String>?` | `null` | Callback when OTP value changes |
| `onCompleted` | `ValueChanged<String>?` | `null` | Callback when OTP input is completed |
| `errorText` | `String?` | `null` | Error text to display |
| `buttonBackgroundColor` | `Color?` | `null` | Background color for the verify button |
| `buttonTextColor` | `Color?` | `null` | Text color for the verify button |
| `buttonBorderRadius` | `double` | `8.0` | Border radius for the verify button |
| `buttonHeight` | `double` | `50.0` | Height for the verify button |
| `buttonWidth` | `double` | `double.infinity` | Width for the verify button |
| `buttonElevation` | `double` | `0.0` | Elevation for the verify button |
| `loadingIndicatorColor` | `Color?` | `null` | Color for the loading indicator |
| `loadingIndicatorSize` | `double` | `24.0` | Size for the loading indicator |
| `customKeyboardType` | `TextInputType?` | `null` | Custom keyboard type for OTP input |
| `inputFormatters` | `List<TextInputFormatter>?` | `null` | Custom input formatters for OTP input |
| `validationRegex` | `String?` | `null` | Validation regex pattern for OTP input |
| `validationMessage` | `String?` | `null` | Validation message for OTP input |
| `customValidator` | `String? Function(String?)?` | `null` | Custom validator function for OTP input |
| `semanticLabel` | `String?` | `null` | Semantic label for accessibility |
| `semanticHint` | `String?` | `null` | Semantic hint for accessibility |
| `semanticValue` | `String?` | `null` | Semantic value for accessibility |
| `enableScreenReaderSupport` | `bool` | `true` | Whether to enable screen reader support |
| `customAccessibilityActions` | `List<Map<String, dynamic>>?` | `null` | Custom accessibility actions |
| `enableAnimation` | `bool` | `true` | Whether to enable animations |
| `animationDuration` | `Duration` | `Duration(milliseconds: 300)` | Duration for the main animation |
| `animationCurve` | `Curve` | `Curves.easeInOut` | Curve for the main animation |
| `enableFieldStateAnimation` | `bool` | `true` | Whether to enable field state animation |
| `enableFieldToFieldAnimation` | `bool` | `true` | Whether to enable field-to-field animation |
| `fieldTransitionDuration` | `Duration` | `Duration(milliseconds: 150)` | Duration for field transition animation |
| `fieldTransitionCurve` | `Curve` | `Curves.easeInOut` | Curve for field transition animation |
| `transitionHighlightColor` | `Color?` | `null` | Color for transition highlight |
| `errorBorderColor` | `Color?` | `null` | Border color for fields in error state |
| `errorBackgroundColor` | `Color?` | `null` | Background color for fields in error state |
| `errorTextColor` | `Color?` | `null` | Text color for fields in error state |
| `hasError` | `bool` | `false` | Whether the OTP is in error state |
| `onErrorStateChanged` | `VoidCallback?` | `null` | Callback when error state changes |
| `errorStateDuration` | `Duration` | `Duration(seconds: 3)` | Duration to show error state before auto-clearing |
| `autoClearErrorOnInput` | `bool` | `false` | Whether to auto-clear error state on input |
| `autoClearErrorOnResend` | `bool` | `true` | Whether to auto-clear error state on resend |
| `autoClearErrorOnComplete` | `bool` | `true` | Whether to auto-clear error state on completion |
| `errorStatePriority` | `ErrorStatePriority` | `ErrorStatePriority.highest` | Priority of error state over other field states |
| `errorStateBehavior` | `ErrorStateBehavior` | `ErrorStateBehavior.autoClear` | Behavior of error state |
| `titleWidget` | `Widget?` | `null` | Custom title widget |
| `subtitleWidget` | `Widget?` | `null` | Custom subtitle widget |
| `errorWidget` | `Widget?` | `null` | Custom error message widget |
| `verifyButtonWidget` | `Widget?` | `null` | Custom verify button widget |
| `resendWidget` | `Widget?` | `null` | Custom resend widget |
| `timerWidget` | `Widget?` | `null` | Custom timer widget |
| `validationMessage` | `Widget?` | `null` | Custom validation message widget |
| `onTimerChanged` | `ValueChanged<int>?` | `null` | Callback when timer state changes |
| `onErrorStateChangedCallback` | `ValueChanged<bool>?` | `null` | Callback when error state changes |
| `onValidationStateChanged` | `ValueChanged<bool>?` | `null` | Callback when validation state changes |
| `onCompletionStateChanged` | `ValueChanged<bool>?` | `null` | Callback when completion state changes |
| `textDirection` | `TextDirection?` | `null` | Text direction (RTL/LTR) - auto-detected if null |
| `unfocusOnTapOutside` | `bool` | `false` | Enable tap outside to unfocus fields globally |
| `externalTapOutsideHandler` | `VoidCallback?` | `null` | External handler for tap outside (takes priority) |
| `fieldConfig` | `OtpFieldConfig?` | `null` | Complete field configuration (overrides individual field parameters) |
| `fieldWidth` | `double` | `55.125` | Width of OTP fields |
| `fieldHeight` | `double` | `60.731` | Height of OTP fields |
| `borderRadius` | `double` | `17.752` | Border radius for OTP fields |
| `borderWidth` | `double` | `1.869` | Border width for OTP fields |
| `fieldShape` | `OtpFieldShape` | `OtpFieldShape.roundedRectangle` | Shape of OTP fields |

### Field Configuration Parameters

When using the `fieldConfig` parameter, you have access to all `OtpFieldConfig` properties:

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `fieldWidth` | `double` | `55.125` | Width of OTP fields |
| `fieldHeight` | `double` | `60.731` | Height of OTP fields |
| `borderRadius` | `double` | `17.752` | Border radius for OTP fields |
| `borderWidth` | `double` | `1.869` | Border width for OTP fields |
| `fieldShape` | `OtpFieldShape` | `OtpFieldShape.roundedRectangle` | Shape of OTP fields |
| `fieldShapeConfig` | `OtpFieldShapeConfig?` | `null` | Custom field shape configuration |
| `primaryColor` | `Color` | `Color(0xFF018CC3)` | Primary color for fields |
| `secondaryColor` | `Color` | `Color(0xFF8B8B8B)` | Secondary color for fields |
| `backgroundColor` | `Color` | `Colors.white` | Background color for fields |
| `cursorColor` | `Color` | `Color(0xFF018CC3)` | Cursor color |
| `cursorWidth` | `double` | `2.0` | Cursor width |
| `enableShadow` | `bool` | `false` | Enable shadow effects |
| `shadowColor` | `Color?` | `null` | Shadow color |
| `shadowBlurRadius` | `double` | `4.0` | Shadow blur radius |
| `shadowSpreadRadius` | `double` | `0.0` | Shadow spread radius |
| `shadowOffset` | `Offset` | `Offset(0, 2)` | Shadow offset |
| `focusEffect` | `FocusEffect` | `FocusEffect.color` | Focus effect type |
| `completedEffect` | `CompletedEffect` | `CompletedEffect.color` | Completed effect type |
| `focusGlowRadius` | `double` | `2.0` | Focus glow radius |
| `focusGlowIntensity` | `double` | `0.5` | Focus glow intensity |
| `fieldFontSize` | `double` | `24.0` | Font size for field text |
| `fieldFontWeight` | `FontWeight` | `FontWeight.normal` | Font weight for field text |
| `letterSpacing` | `double` | `0.0` | Letter spacing for field text |

## 🏗️ Architecture

Flutter OTP Kit is built with a modern widget-based architecture that emphasizes separation of concerns, maintainability, and flexibility. This architecture makes the package highly customizable, easy to extend, and simple to integrate into any Flutter application.

### Widgets

The package is organized into several key widgets, each with a specific responsibility:

#### OtpVerificationWidget
The main widget that orchestrates all widgets. It serves as the entry point for the package and manages the overall state and behavior of the OTP verification process.

#### OtpField
Individual OTP input field with customizable styling and behavior. Each field manages its own state, styling, and input handling.

#### OtpFieldsRow
Container for OTP fields that manages layout, spacing, and field arrangement. Supports different layout types (fixed, responsive) and handles overflow protection.

#### OtpHeader
Title and subtitle widget with support for masked contact information. Can be customized with widgets or strings.

#### OtpFooter
Verify button, resend button, and timer widget. Manages loading states, timer countdown, and button styling.

#### OtpErrorDisplay
Error message display widget that can be customized with widgets or strings.

### State Management

State management is centralized in dedicated classes that handle all aspects of OTP state, error state, and field state transitions.

#### OtpStateManager
Centralized state management for the OTP verification process. Handles field state transitions, error state management, focus management, and input handling.

#### OtpFieldState
Enum that represents the state of an OTP field. Used for styling and behavior.

#### ErrorStateBehavior
Enum that defines how error states should behave.

### Styling

Styling is managed by dedicated classes that handle all aspects of OTP field appearance based on state.

#### OtpStyleManager
Manages styling for OTP fields based on state, configuration, and theme. Provides consistent styling across all fields.

#### FieldColors
Represents the colors for an OTP field based on its state. Includes border color, background color, and text color.

### Configuration

Configuration is split into logical modules that handle specific aspects of the OTP verification process.

#### OtpFieldConfig
Configuration for OTP field appearance and behavior. Defines field dimensions, border properties, colors, and other visual aspects.

#### OtpErrorConfig
Configuration for error state behavior and appearance. Defines error state duration, auto-clear behavior, priority, and styling.

#### OtpAnimationConfig
Configuration for animations. Defines animation duration, curves, and behavior.

### Utilities

Utility classes provide reusable functionality for common tasks in the OTP verification process.

#### OtpMasker
Utilities for masking contact information (phone numbers, email addresses) for privacy.

#### OtpValidator
Utilities for validating OTP input based on input type, length, and custom rules.

#### OtpFormatter
Utilities for formatting OTP input, including input formatters and keyboard type.

## 🧪 Testing

The package has been thoroughly tested across all platforms:

- **Android**: Tested on Android 5.0+ (API 21+) across different screen sizes
- **iOS**: Tested on iOS 12.0+ across iPhone and iPad devices
- **Web**: Tested on Chrome, Firefox, Safari, and Edge
- **Desktop**: Tested on Windows 10+, macOS 10.15+, and Linux
- **Responsive**: Tested across different screen sizes and orientations

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## 📞 Support

If you encounter any issues or have questions, please:

1. Check the [documentation](https://github.com/seifmoustafa/flutter_otp_kit#readme)
2. Search existing [issues](https://github.com/seifmoustafa/flutter_otp_kit/issues)
3. Create a new [issue](https://github.com/seifmoustafa/flutter_otp_kit/issues/new) if needed

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design team for design guidelines
- Cupertino team for iOS design guidelines
- All contributors and users of this package

---

<div align="center">
  <strong>Made with ❤️ for the Flutter community</strong>
</div>
