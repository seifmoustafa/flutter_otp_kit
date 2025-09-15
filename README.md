# Flutter OTP Kit

[![pub package](https://img.shields.io/pub/v/flutter_otp_kit.svg)](https://pub.dev/packages/flutter_otp_kit)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue.svg)](https://flutter.dev)

A comprehensive, production-ready Flutter package for OTP (One-Time Password) verification with extensive customization options, responsive design, and robust error handling. Built with a modern widget-based architecture, this package offers unparalleled flexibility, maintainability, and performance.

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
- **Smart Paste Detection**: Enhanced clipboard detection with debounce mechanism and intelligent full OTP vs single-digit handling
- **Consecutive Digit Support**: Fixed issue preventing consecutive identical digits (e.g., "2244" now works perfectly)
- **Real-time Validation**: Live validation with custom regex patterns and error messages
- **Auto-submit**: Automatic form submission when OTP is complete
- **Timer Integration**: Enhanced timer with automatic start and proper reset on resend
- **Smart Validation**: Prevents verification with incomplete fields and shows user-friendly error messages
- **Instant Error Clearing**: Validation errors clear immediately when user starts typing for better UX
- **Backend Integration Ready**: Perfect for Cubit/Bloc patterns with automatic state management
- **Real-time State Callbacks**: Custom widgets get notified of all state changes instantly

### 🎨 Design & Customization
- **Perfect Visual Hierarchy**: Strict visual hierarchy: Error > Focused > Completed > Filled > Empty
- **Generic Color System**: All colors (including error colors) are completely customizable
- **Comprehensive Styling**: Complete control over colors, dimensions, spacing, and appearance
- **Advanced Field Shapes**: Rectangle, rounded rectangle, circle, stadium, and custom shapes
- **Gradient Support**: Linear, radial, and sweep gradient backgrounds
- **Shadow Effects**: Customizable shadows with color, blur, spread, and offset control
- **Animation System**: Smooth animations with `Curves.easeInOut` for professional transitions
- **Enhanced Field Transitions**: Smooth field-to-field visual transitions and state animations
- **Progressive Highlighting**: Visual feedback showing user progress through OTP entry
- **Theme Integration**: Material Design 3, light, dark themes with automatic adaptation
- **Responsive Design**: Fixed pixel overflow issues with proper text wrapping and flexible layouts

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

## 📦 Installation

```yaml
dependencies:
  flutter_otp_kit: ^2.0.0
```

## 🚀 Usage

### Basic Usage

```dart
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

OtpVerificationWidget(
  title: 'Verify Phone Number',
  subtitle: 'Enter the code sent to {contactInfo}',
  contactInfo: '+1 (555) 123-4567',
  maskingType: MaskingType.phone,
  buttonText: 'Verify',
  resendText: 'Resend Code',
  timerPrefix: 'in',
  enableAutoValidation: true, // Enable validation to prevent verify with missing fields
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

### Validation & Error Handling

The package now includes comprehensive validation with excellent UX:

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

### 🎯 External Validation Control (Complete Package Control)

**YES!** You can completely handle validation outside the package with `enableAutoValidation = false` (default) and everything will work perfectly! Here's exactly how:

#### **Method 1: Using `handleBackendState()` (Recommended)**

```dart
final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();

OtpVerificationWidget(
  key: otpKey,
  enableAutoValidation: false, // 🎯 DISABLE auto-validation
  onVerify: (otp) {
    // Your custom validation logic
    if (otp.length < 4) {
      // 🎯 SHOW VALIDATION: Package handles borders + message
      otpKey.currentState?.handleBackendState(
        isValidating: true,
        validationMessage: 'Please enter all 4 digits',
      );
      return; // Don't proceed with verification
    }
    
    // Your verification logic
    if (otp == '1234') {
      // ✅ SUCCESS: Package handles success state
      otpKey.currentState?.handleVerificationResult(true);
    } else {
      // ❌ ERROR: Package handles error state
      otpKey.currentState?.handleVerificationResult(
        false,
        errorMessage: 'Invalid OTP. Please try again.',
      );
    }
  },
  onResend: () => resendOtp(),
)
```

#### **Method 2: Direct State Management**

```dart
final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();

OtpVerificationWidget(
  key: otpKey,
  enableAutoValidation: false, // 🎯 DISABLE auto-validation
  onVerify: (otp) {
    // Custom validation logic
    if (otp.length < 4) {
      // 🎯 SHOW VALIDATION: Set validation state directly
      otpKey.currentState?.setValidationText('Please enter all 4 digits');
      return;
    }
    
    // Your verification logic
    if (otp == '1234') {
      // ✅ SUCCESS: Clear all states
      otpKey.currentState?.clearErrorState();
      otpKey.currentState?.clearValidationText();
    } else {
      // ❌ ERROR: Set error state
      otpKey.currentState?.setErrorState(true);
      otpKey.currentState?.setErrorText('Invalid OTP. Please try again.');
    }
  },
  onResend: () => resendOtp(),
)
```

#### **Method 3: Cubit/Bloc Integration**

```dart
// In your Cubit/Bloc
class OtpCubit extends Cubit<OtpState> {
  final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();
  
  void verifyOtp(String otp) {
    // Custom validation logic
    if (otp.length < 4) {
      // 🎯 SHOW VALIDATION: Package handles UI
      otpKey.currentState?.handleBackendState(
        isValidating: true,
        validationMessage: 'Please enter all 4 digits',
      );
      return;
    }
    
    emit(LoadingState());
    
    // Update package loading state
    otpKey.currentState?.handleBackendState(isLoading: true);
    
    try {
      final result = await api.verifyOtp(otp);
      emit(SuccessState());
      
      // ✅ SUCCESS: Package handles success state
      otpKey.currentState?.handleBackendState(
        isLoading: false,
        hasError: false,
      );
    } catch (e) {
      emit(ErrorState(e.message));
      
      // ❌ ERROR: Package handles error state
      otpKey.currentState?.handleBackendState(
        isLoading: false,
        hasError: true,
        errorMessage: e.message,
      );
    }
  }
}
```

#### **Method 4: Custom Validation Widget**

```dart
OtpVerificationWidget(
  enableAutoValidation: false, // 🎯 DISABLE auto-validation
  validationMessage: Container( // 🎨 CUSTOM VALIDATION WIDGET
    padding: const EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: Colors.orange.shade50,
      borderRadius: BorderRadius.circular(12.0),
      border: Border.all(color: Colors.orange.shade300, width: 1.5),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.warning_amber_rounded, color: Colors.orange.shade700, size: 18.0),
        const SizedBox(width: 12.0),
        Text(
          'Please enter all digits',
          style: TextStyle(
            color: Colors.orange.shade800,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  ),
  onVerify: (otp) {
    // Your custom validation logic
    if (otp.length < 4) {
      // 🎯 SHOW VALIDATION: Package shows your custom widget
      otpKey.currentState?.handleBackendState(
        isValidating: true,
        validationMessage: 'Please enter all 4 digits',
      );
      return;
    }
    
    // Your verification logic...
  },
  onResend: () => resendOtp(),
)
```

#### **🎯 Key Benefits of External Validation Control:**

- ✅ **Complete Control**: You handle all validation logic outside the package
- ✅ **Perfect Borders**: Package automatically handles red borders for validation/error states
- ✅ **Custom Messages**: Use your own validation messages and widgets
- ✅ **State Management**: Perfect integration with Cubit/Bloc patterns
- ✅ **Flexible Logic**: Implement any validation rules you need
- ✅ **Consistent UX**: Package handles all visual states (borders, colors, animations)
- ✅ **Real-time Updates**: Validation states update instantly when you call the methods

#### **🔧 Available External Control Methods:**

| Method | Purpose | Usage |
|--------|---------|-------|
| `handleBackendState()` | **Main method** - handles all states | `otpKey.currentState?.handleBackendState(isValidating: true, validationMessage: 'Custom message')` |
| `setValidationText()` | Set validation message directly | `otpKey.currentState?.setValidationText('Custom validation')` |
| `clearValidationText()` | Clear validation message | `otpKey.currentState?.clearValidationText()` |
| `setErrorState()` | Set error state | `otpKey.currentState?.setErrorState(true)` |
| `setErrorText()` | Set error message | `otpKey.currentState?.setErrorText('Custom error')` |
| `clearErrorState()` | Clear error state | `otpKey.currentState?.clearErrorState()` |
| `handleVerificationResult()` | Handle verification results | `otpKey.currentState?.handleVerificationResult(true/false, errorMessage: 'Error')` |

#### **🎨 Visual States Handled Automatically:**

- **🔴 Red Borders**: Automatically applied for validation and error states
- **🎨 Background Colors**: Error/validation background colors applied automatically
- **📝 Text Colors**: Error/validation text colors applied automatically
- **✨ Animations**: Smooth transitions between states
- **🔄 State Transitions**: Proper state hierarchy (Error > Focused > Completed > Filled > Empty)

### Customization Example

```dart
OtpVerificationWidget(
  title: 'Verification Code',
  subtitle: 'Enter the code sent to {contactInfo}',
  contactInfo: 'user@example.com',
  maskingType: MaskingType.email,
  buttonText: 'Submit',
  resendText: 'Send Again',
  timerPrefix: 'after',
  fieldCount: 6,
  fieldSpacing: 12.0,
  otpInputType: OtpInputType.numeric,
  layoutType: OtpLayoutType.responsive,
  primaryColor: Colors.blue,
  secondaryColor: Colors.grey,
  backgroundColor: Colors.white,
  defaultBorderColor: Colors.grey.shade300,
  focusedBorderColor: Colors.blue,
  completedFieldBorderColor: Colors.green,
  errorBorderColor: Colors.red,
  hasError: false,
  errorStateBehavior: ErrorStateBehavior.autoClear,
  autoClearErrorOnInput: true,
  onVerify: (otp) => verifyOtp(otp),
  onResend: () => resendOtp(),
  onChanged: (value) => print('OTP changed: $value'),
  onCompleted: (value) => print('OTP completed: $value'),
  onErrorStateChanged: () => print('Error state changed'),
)
```

### Advanced Backend Integration

```dart
// For Cubit/Bloc integration with comprehensive state management
final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();

OtpVerificationWidget(
  key: otpKey,
  title: 'Verification',
  subtitle: 'Enter OTP',
  buttonText: 'Verify',
  resendText: 'Resend',
  timerPrefix: 'in',
  onVerify: (otp) {
    // Your business logic
    verifyOtpWithBackend(otp);
  },
  onResend: () => resendOtpWithBackend(),
)

// In your Cubit/Bloc
void verifyOtpWithBackend(String otp) {
  emit(LoadingState());
  
  // Update package loading state
  otpKey.currentState?.handleBackendState(isLoading: true);
  
  try {
    final result = await api.verifyOtp(otp);
    emit(SuccessState());
    
    // Package handles success state automatically
    otpKey.currentState?.handleBackendState(
      isLoading: false,
      hasError: false,
    );
  } catch (e) {
    emit(ErrorState(e.message));
    
    // Package handles error state automatically
    otpKey.currentState?.handleBackendState(
      isLoading: false,
      hasError: true,
      errorMessage: e.message,
    );
  }
}
```

### Custom Widget with Real-time State Sync

```dart
// Custom resend widget that syncs with package timer
Widget _buildCustomResendWidget() {
  return GestureDetector(
    onTap: _customTimer == 0 ? () {
      // Trigger package resend functionality
      otpKey.currentState?.triggerResend();
    } : null,
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: _customTimer == 0 ? Colors.green : Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        _customTimer == 0 ? 'Custom Resend' : 'Resend in ${_customTimer}s',
        style: TextStyle(
          color: _customTimer == 0 ? Colors.green : Colors.grey,
        ),
      ),
    ),
  );
}

// Timer callback updates custom widget instantly
onTimerChanged: (remainingTime) {
  setState(() { _customTimer = remainingTime; });
},
```

### Widget-Based Customization

The package now supports complete widget-based customization with a fully rendered example showcasing:

- **Custom gradient containers** with shadows and borders
- **Multiple icons** throughout the interface (security, phone, verified user, message, clock, keyboard, info)
- **Rich text** with styled phone number display
- **Custom header** with gradient icon containers
- **Enhanced subtitle** with icons and rich text
- **Custom OTP fields container** with keyboard icon
- **Informative footer** with help text

```dart
OtpVerificationWidget(
  titleWidget: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade600, Colors.blue.shade600],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.shade300,
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Icon(Icons.security, color: Colors.white, size: 24),
      ),
      SizedBox(width: 12),
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.phone_android, color: Colors.purple.shade600, size: 20),
                SizedBox(width: 6),
                Flexible(
                  child: Text(
                    'Verify Phone Number',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.verified_user, color: Colors.green.shade600, size: 14),
                SizedBox(width: 4),
                Flexible(
                  child: Text(
                    'Secure Verification',
                    style: TextStyle(fontSize: 11, color: Colors.green.shade600),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  ),
  subtitleWidget: Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade300),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade100,
          blurRadius: 4,
          spreadRadius: 1,
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.message, color: Colors.blue.shade600, size: 18),
            SizedBox(width: 8),
            Text('SMS Code Sent', style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
        SizedBox(height: 8),
        Flexible(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              children: [
                TextSpan(text: 'Enter the code sent to '),
                TextSpan(
                  text: '+1 ********67',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple.shade600),
                ),
              ],
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.access_time, color: Colors.grey.shade500, size: 14),
            SizedBox(width: 4),
            Flexible(
              child: Text(
                'Code expires in 10 minutes',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade500, fontStyle: FontStyle.italic),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    ),
  ),
  buttonText: 'Verify',  // Fallback
  subtitle: 'Enter code',  // Fallback
  resendText: 'Resend',
  timerPrefix: 'in',
  onVerify: (otp) => verifyOtp(otp),
  onResend: () => resendOtp(),
)
```

## 🏗️ Architecture

Flutter OTP Kit is built with a modern widget-based architecture that emphasizes separation of concerns, maintainability, and flexibility. This architecture makes the package highly customizable, easy to extend, and simple to integrate into any Flutter application.

The package is built with a modular architecture for better maintainability:

### Widgets

The package is organized into several key widgets, each with a specific responsibility:

#### OtpVerificationWidget
The main widget that orchestrates all widgets. It serves as the entry point for the package and manages the overall state and behavior of the OTP verification process.

```dart
OtpVerificationWidget(
  title: 'Verify Phone Number',
  subtitle: 'Enter the code sent to {contactInfo}',
  contactInfo: '+1 (555) 123-4567',
  maskingType: MaskingType.phone,
  buttonText: 'Verify',
  resendText: 'Resend Code',
  timerPrefix: 'in',
  onVerify: (otp) => handleVerification(otp),
  onResend: () => handleResend(),
)
```

#### OtpField
Individual OTP input field with customizable styling and behavior. Each field manages its own state, styling, and input handling.

```dart
OtpField(
  controller: textController,
  focusNode: focusNode,
  fieldState: OtpFieldState.focused,
  hasError: false,
  onChanged: (value) => handleChange(value),
  config: fieldConfig,
  fieldColors: fieldColors,
  inputFormatters: inputFormatters,
  keyboardType: TextInputType.number,
  cursorAlignment: TextAlign.center,
  validator: validator,
)
```

#### OtpFieldsRow
Container for OTP fields that manages layout, spacing, and field arrangement. Supports different layout types (fixed, responsive) and handles overflow protection.

```dart
OtpFieldsRow(
  controllers: controllers,
  focusNodes: focusNodes,
  fieldStates: fieldStates,
  fieldHasError: fieldHasError,
  onDigitChanged: handleDigitChange,
  config: fieldConfig,
  getFieldColors: getFieldColors,
  inputFormatters: inputFormatters,
  keyboardType: keyboardType,
  validator: validator,
  layoutType: OtpLayoutType.responsive,
  fieldCount: 6,
  fieldSpacing: 10.0,
  cursorAlignment: TextAlign.center,
)
```

#### OtpHeader
Title and subtitle widget with support for masked contact information. Can be customized with widgets or strings.

```dart
OtpHeader(
  title: 'Verify Phone Number',
  subtitle: 'Enter the code sent to {contactInfo}',
  primaryColor: Colors.blue,
  secondaryColor: Colors.grey,
  spacing: 16.0,
  titleWidget: customTitleWidget, // Optional
  subtitleWidget: customSubtitleWidget, // Optional
  titleStyle: titleTextStyle,
  subtitleStyle: subtitleTextStyle,
  contactInfo: '+1 (555) 123-4567',
  maskingType: MaskingType.phone,
)
```

#### OtpFooter
Verify button, resend button, and timer widget. Manages loading states, timer countdown, and button styling.

```dart
OtpFooter(
  onVerifyPressed: handleVerify,
  onResendPressed: handleResend,
  isLoading: false,
  remainingTime: 30,
  primaryColor: Colors.blue,
  secondaryColor: Colors.grey,
  spacing: 16.0,
  buttonText: 'Verify',
  resendText: 'Resend Code',
  timerPrefix: 'in',
  verifyButtonWidget: customButtonWidget, // Optional
  resendWidget: customResendWidget, // Optional
  timerWidget: customTimerWidget, // Optional
)
```

#### OtpErrorDisplay
Error message display widget that can be customized with widgets or strings.

```dart
OtpErrorDisplay(
  errorText: 'Invalid OTP. Please try again.',
  errorWidget: customErrorWidget, // Optional
  errorStyle: errorTextStyle,
  errorColor: Colors.red,
  topSpacing: 8.0,
)
```

### State Management

State management is centralized in dedicated classes that handle all aspects of OTP state, error state, and field state transitions.

#### OtpStateManager
Centralized state management for the OTP verification process. Handles field state transitions, error state management, focus management, and input handling.

```dart
// Creating a state manager
final stateManager = OtpStateManager(
  fieldCount: 6,
  errorConfig: errorConfig,
  onErrorStateChanged: handleErrorStateChange,
  onOtpChanged: handleOtpChange,
  onOtpCompleted: handleOtpComplete,
);

// Managing OTP state
stateManager.clearOtp(refocus: true, clearError: true);
stateManager.setOtp('123456', clearFocus: true);
stateManager.resetFields(preserveFocus: false);
stateManager.setErrorState(true);
stateManager.clearErrorState();

// Accessing OTP state
final otpValue = stateManager.getOtpValue();
final isComplete = stateManager.isOtpComplete();
final isValid = stateManager.isOtpValid();
```

#### OtpFieldState
Enum that represents the state of an OTP field. Used for styling and behavior.

```dart
enum OtpFieldState {
  empty,     // Empty field
  focused,   // Field with focus
  filled,    // Field with content but not completed
  completed, // Field with content and all fields are filled
  error,     // Field with error
}
```

#### ErrorStateBehavior
Enum that defines how error states should behave.

```dart
enum ErrorStateBehavior {
  persistent, // Error state persists until manually cleared
  autoClear,  // Error state auto-clears based on configuration
  timed,      // Error state clears after specified duration
}
```

#### ErrorStatePriority
Enum that defines the priority of error state over other field states.

```dart
enum ErrorStatePriority {
  highest, // Error state overrides all other states
  normal,  // Error state follows normal priority rules
  lowest,  // Error state has lowest priority
}
```

### Styling

Styling is managed by dedicated classes that handle all aspects of OTP field appearance based on state.

#### OtpStyleManager
Manages styling for OTP fields based on state, configuration, and theme. Provides consistent styling across all fields.

```dart
// Creating a style manager
final styleManager = OtpStyleManager(
  fieldConfig: fieldConfig,
  errorConfig: errorConfig,
  primaryColor: Colors.blue,
  secondaryColor: Colors.grey,
  backgroundColor: Colors.white,
  defaultBorderColor: Colors.grey.shade300,
  focusedBorderColor: Colors.blue,
  completedFieldBorderColor: Colors.green,
  enableProgressiveHighlighting: true,
);

// Getting field colors based on state
final fieldColors = styleManager.getFieldColors(
  index,
  OtpFieldState.focused,
  hasError,
);
```

#### FieldColors
Represents the colors for an OTP field based on its state. Includes border color, background color, and text color.

```dart
final fieldColors = FieldColors(
  borderColor: Colors.blue,
  backgroundColor: Colors.white,
  textColor: Colors.black,
);

// Creating a copy with modified values
final errorColors = fieldColors.copyWith(
  borderColor: Colors.red,
);
```

### Configuration

Configuration is split into logical modules that handle specific aspects of the OTP verification process.

#### OtpFieldConfig
Configuration for OTP field appearance and behavior. Defines field dimensions, border properties, colors, and other visual aspects.

```dart
final fieldConfig = OtpFieldConfig(
  fieldWidth: 60.0,
  fieldHeight: 60.0,
  borderRadius: 16.0,
  borderWidth: 2.0,
  primaryColor: Colors.blue,
  secondaryColor: Colors.grey,
  backgroundColor: Colors.white,
  fieldStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  cursorColor: Colors.blue,
  cursorHeight: 24.0,
  cursorWidth: 2.0,
  enableShadow: true,
  shadowColor: Colors.blue.withOpacity(0.2),
  shadowBlurRadius: 8.0,
  shadowSpreadRadius: 0.0,
);
```

#### OtpErrorConfig
Configuration for error state behavior and appearance. Defines error state duration, auto-clear behavior, priority, and styling.

```dart
final errorConfig = OtpErrorConfig(
  hasError: false,
  errorStateDuration: Duration(seconds: 3),
  autoClearErrorOnInput: false,
  autoClearErrorOnResend: true,
  autoClearErrorOnComplete: true,
  errorStatePriority: ErrorStatePriority.highest,
  errorStateBehavior: ErrorStateBehavior.autoClear,
  errorBorderColor: Colors.red,
  errorBackgroundColor: Colors.red.withOpacity(0.1),
  errorTextColor: Colors.red,
  errorText: 'Invalid OTP. Please try again.',
  errorStyle: TextStyle(color: Colors.red, fontSize: 12),
);
```

#### OtpAnimationConfig
Configuration for animations. Defines animation duration, curves, and behavior.

```dart
final animationConfig = OtpAnimationConfig(
  enableAnimation: true,
  animationDuration: Duration(milliseconds: 300),
  animationCurve: Curves.easeInOut,
  enableFieldStateAnimation: true,
  enableFieldToFieldAnimation: true,
  fieldTransitionDuration: Duration(milliseconds: 150),
  fieldTransitionCurve: Curves.easeInOut,
  transitionHighlightColor: Colors.blue.withOpacity(0.3),
);
```

#### OtpConfig
Main configuration that combines all other configurations. Provides a single point of configuration for the entire widget.

```dart
final otpConfig = OtpConfig(
  fieldCount: 6,
  fieldSpacing: 10.0,
  spacing: 16.0,
  otpInputType: OtpInputType.numeric,
  layoutType: OtpLayoutType.responsive,
  cursorAlignment: TextAlign.center,
  obscureText: false,
  enableInteractiveSelection: true,
  autoFocus: true,
  enableAutoValidation: false,
  enablePaste: true,
  showTimer: true,
  timerDuration: 60,
  primaryColor: Colors.blue,
  secondaryColor: Colors.grey,
  backgroundColor: Colors.white,
  fieldConfig: fieldConfig,
  errorConfig: errorConfig,
  animationConfig: animationConfig,
);
```

### Utilities

Utility classes provide reusable functionality for common tasks in the OTP verification process.

#### OtpMasker
Utilities for masking contact information (phone numbers, email addresses) for privacy.

```dart
// Mask a phone number
final maskedPhone = OtpMasker.maskContactInfo(
  '+1 (555) 123-4567',
  MaskingType.phone,
); // Returns '+1 (555) ***-**67'

// Mask an email address
final maskedEmail = OtpMasker.maskContactInfo(
  'user@example.com',
  MaskingType.email,
); // Returns 'us****@example.com'
```

#### OtpValidator
Utilities for validating OTP input based on input type, length, and custom rules.

```dart
// Check if OTP is valid
final isValid = OtpValidator.isValidOtp(
  '123456',
  OtpInputType.numeric,
  6,
);

// Create a validator function
final validator = OtpValidator.createValidator(
  inputType: OtpInputType.numeric,
  fieldCount: 6,
  validationRegex: r'^[0-9]+$',
  validationMessage: 'Numbers only',
  customValidator: (value) {
    if (value == '000000') {
      return 'Invalid OTP';
    }
    return null;
  },
);
```

#### OtpFormatter
Utilities for formatting OTP input, including input formatters and keyboard type.

```dart
// Get input formatters based on OTP input type
final inputFormatters = OtpFormatter.getInputFormatters(
  OtpInputType.numeric,
  customFormatters: [
    FilteringTextInputFormatter.digitsOnly,
  ],
);

// Get keyboard type based on OTP input type
final keyboardType = OtpFormatter.getKeyboardType(
  OtpInputType.numeric,
  customKeyboardType: TextInputType.number,
);

// Format seconds into MM:SS format for timer display
final formattedTime = OtpFormatter.formatTime(65); // Returns '01:05'
```

## 🔧 Public Methods

### handleVerificationResult(bool, {String?})
**NEW**: Automatically handles verification results with comprehensive state management.

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
**NEW**: Comprehensive backend integration for Cubit/Bloc patterns.

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
**NEW**: Public method to trigger resend functionality programmatically.

```dart
final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();

// Trigger resend programmatically
otpKey.currentState?.triggerResend();
```

### remainingResendTime
**NEW**: Getter for current remaining resend time.

```dart
final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();

// Get remaining time
int remainingTime = otpKey.currentState?.remainingResendTime ?? 0;
```

### canResend
**NEW**: Getter to check if resend is currently available.

```dart
final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();

// Check if resend is available
bool canResend = otpKey.currentState?.canResend ?? false;
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

### hasErrorState
Gets the current error state.

```dart
final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();

// Check if error state is active
bool isErrorActive = otpKey.currentState?.hasErrorState ?? false;
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

### resetFields()
Resets all fields to empty state with configurable options.

```dart
final GlobalKey<OtpVerificationWidgetState> otpKey = GlobalKey();

// Basic usage
otpKey.currentState?.resetFields();

// Advanced usage with options
otpKey.currentState?.resetFields(
  preserveFocus: true,  // Keep focus on currently focused field
  preserveError: true   // Preserve error state
);
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

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
