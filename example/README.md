# Flutter OTP Kit Example App

This is a comprehensive example app showcasing all the features and capabilities of the Flutter OTP Kit package.

## Features Demonstrated

### 🚀 Quick Start
- **Simple OTP Field**: Basic OTP field with default styling
- **Complete Verification**: Full verification flow with resend timer

### 🎨 Styling & Design
- **Predefined Styles**: Material, iOS, Rounded, Underlined styles
- **Custom Styling**: Complete customization with colors and shapes
- **Field Shapes**: Box, Circle, Underline, and custom shapes

### ⚡ Advanced Features
- **Animations**: Scale, Rotate, Slide, and Fade animations
- **Validation**: Real-time validation and error handling
- **Cursor Styles**: Custom cursor appearance and behavior
- **Platform Adaptive**: iOS and Android specific behaviors

### 🔧 Builder Pattern
- **OtpBuilder**: Chain methods to build custom OTP fields
- **Composable Fields**: Mix and match different field types

### 🌟 Real-world Examples
- **Login Flow**: Complete authentication with OTP
- **Registration**: User registration with phone verification
- **Password Reset**: Secure password reset flow

## Getting Started

1. Make sure you have Flutter installed
2. Navigate to the example directory
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the app

## Demo Screens

The app includes the following demo screens:

- **Home Screen**: Overview of all features
- **Simple OTP Demo**: Basic OTP field implementations
- **Verification Demo**: Complete verification flow with resend
- **Styles Demo**: All predefined styles with live preview
- **Animations Demo**: Animation controls and examples
- **Validation Demo**: Error handling and validation
- **Builder Demo**: OtpBuilder pattern with live code generation

## Key Features

- ✅ **Real-time Validation**: Instant feedback as user types
- ✅ **Error Animations**: Smooth animations for error states
- ✅ **Auto Error Clear**: Errors clear automatically when user types
- ✅ **Retry Logic**: Built-in retry mechanism with attempt tracking
- ✅ **Resend Timer**: Automatic resend timer with countdown
- ✅ **Loading States**: Visual feedback during verification
- ✅ **Custom Styling**: Complete control over appearance
- ✅ **Platform Adaptive**: iOS and Android specific behaviors
- ✅ **Accessibility**: Full accessibility support
- ✅ **Animations**: Smooth field animations

## Code Examples

### Simple OTP Field
```dart
FlexibleOtpField(
  length: 4,
  onChanged: (value) {
    // Handle value changes
  },
  onCompleted: (value) {
    // Handle completion
  },
)
```

### Complete Verification Flow
```dart
FlexibleOtpVerification(
  title: 'Verify Your Phone',
  subtitle: 'Enter the code sent to your phone',
  otpLength: 4,
  onVerify: (value) async {
    // Your verification logic
  },
  onResend: () {
    // Your resend logic
  },
)
```

### Builder Pattern
```dart
OtpBuilder()
    .length(4)
    .fieldWidth(50)
    .fieldHeight(60)
    .borderRadius(8)
    .borderColor(Colors.blue)
    .animateFields(true)
    .build(
      onChanged: (value) {},
      onCompleted: (value) {},
    )
```

## Contributing

Feel free to contribute to this example app by adding new demos or improving existing ones!

## License

This example app is part of the Flutter OTP Kit package and follows the same MIT license.