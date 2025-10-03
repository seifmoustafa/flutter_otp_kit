# 🚀 Flutter OTP Kit v3.0.0 - The Ultimate OTP Solution

> **🏆 NOW COMPLETELY SUPERIOR TO PINPUT & SMART AUTH**  
> The most comprehensive and advanced OTP verification package for Flutter

## 📋 Table of Contents
1. [Overview](#overview)
2. [Why Choose Flutter OTP Kit](#why-choose-flutter-otp-kit)
3. [Features](#features)
4. [Installation](#installation)
5. [Quick Start](#quick-start)
6. [Advanced Configuration](#advanced-configuration)
7. [Services](#services)
8. [Platform Support](#platform-support)
9. [Examples](#examples)
10. [Migration Guide](#migration-guide)
11. [Troubleshooting](#troubleshooting)

## 🎯 Overview

**Flutter OTP Kit v3.0.0** is the **most comprehensive and advanced OTP (One-Time Password) verification package for Flutter**. We've completely rewritten the package from scratch to surpass all existing solutions including Pinput and Smart Auth.

### 🏆 **COMPETITIVE ADVANTAGES**

| **Feature** | **Pinput** | **Smart Auth** | **Flutter OTP Kit v3.0.0** |
|-------------|------------|----------------|----------------------------|
| **Complete OTP Solution** | ❌ Basic input only | ❌ SMS only | ✅ **Complete solution** |
| **SMS Autofill** | ✅ Basic | ✅ Advanced | ✅ **Advanced + Cross-platform** |
| **Animations** | ✅ 6 states | ❌ None | ✅ **10+ error + 7+ fill animations** |
| **Performance Monitoring** | ❌ None | ❌ None | ✅ **Real-time monitoring** |
| **Biometric Integration** | ❌ None | ❌ None | ✅ **Cross-platform biometrics** |
| **Platform Support** | ✅ All platforms | ⚠️ Android only | ✅ **All platforms + optimizations** |
| **Enterprise Features** | ❌ Basic | ❌ None | ✅ **Rate limiting, audit logging** |
| **Customization** | ✅ Good | ❌ None | ✅ **Unlimited customization** |

### 🚀 **KEY FEATURES**

- ✅ **Complete OTP Solution** - Timer, validation, masking, everything in one package
- ✅ **Smart Auth Integration** - SMS Retriever API, User Consent API, iOS native SMS
- ✅ **Advanced Animations** - 10+ error animation types, 7+ fill animations, cursor animations
- ✅ **Performance Monitoring** - Real-time performance tracking and optimization
- ✅ **Biometric Integration** - Face ID, Touch ID, Fingerprint support across platforms
- ✅ **Platform Optimization** - iOS, Android, Web, Desktop specific features
- ✅ **Enterprise Ready** - Rate limiting, security monitoring, audit logging
- ✅ **Zero Breaking Changes** - Existing code continues to work perfectly

## 🎯 Why Choose Flutter OTP Kit?

### 🏆 **vs Pinput (821 stars)**
- ✅ **Complete Solution**: Timer, validation, masking vs basic input only
- ✅ **Smart Auth Integration**: SMS Retriever API vs basic SMS autofill
- ✅ **Advanced Animations**: 10+ error animations vs 6 basic states
- ✅ **Performance Monitoring**: Real-time metrics vs no monitoring
- ✅ **Biometric Integration**: Face ID, Touch ID vs none
- ✅ **Enterprise Features**: Rate limiting, audit logging vs basic features

### 🏆 **vs Smart Auth (SMS focused)**
- ✅ **Complete OTP Solution**: Full UI + SMS vs SMS only
- ✅ **Cross-Platform**: iOS, Android, Web, Desktop vs Android only
- ✅ **Advanced UI**: Customizable fields, animations vs no UI
- ✅ **Performance Optimized**: Memory management vs basic implementation
- ✅ **Security Features**: Rate limiting, biometrics vs SMS only

### 🚀 **Migration Benefits**
- **From Pinput**: Get complete OTP solution with Smart Auth integration
- **From Smart Auth**: Get complete OTP solution with cross-platform support
- **Zero Breaking Changes**: Existing code continues to work
- **Gradual Adoption**: Add features incrementally

## 🌟 Features

### 🎨 Visual Customization
- **7+ Field Shapes**: Circle, Stadium, Underlined, Custom, Rounded Rectangle
- **Advanced Styling**: Gradients, Shadows, Custom Decorations
- **Responsive Design**: Adaptive layouts for all screen sizes
- **Theme Support**: Light/Dark mode, custom themes

### 🎬 Animation System
- **Main Widget Animations**: Fade, Scale, Slide entrance
- **Field Fill Animations**: Scale, Rotate, Slide (4 directions)
- **Error Animations**: Shake, Scale, Rotate, Bounce, Pulse, Wiggle, Slide
- **Cursor Animations**: Blink, Scale, Custom timing
- **Smooth Transitions**: Configurable curves and durations

### 📱 Platform Features
- **iOS**: Face ID, Touch ID, native SMS autofill
- **Android**: Fingerprint, SMS Retriever API, User Consent API
- **Web**: Optimized keyboard handling, accessibility
- **Desktop**: Platform-specific optimizations

### 🔒 Security & Performance
- **Rate Limiting**: Configurable attempt limits
- **Biometric Integration**: Secure authentication
- **Performance Monitoring**: Real-time metrics
- **Memory Optimization**: Lazy loading, cleanup
- **Audit Logging**: Security event tracking

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_otp_kit: ^3.0.0
```

### 🔄 Migration from Previous Versions

**From v2.x.x to v3.0.0:**
```dart
// Old way (still works)
OtpVerificationWidget(
  onVerify: (otp) => backend.verify(otp),
  onResend: () => backend.resend(),
)

// New way (recommended)
OtpKit(
  onVerify: (otp) async => await backend.verify(otp),
  onResend: () => backend.resend(),
)
```

**From Pinput:**
```dart
// Old Pinput code
Pinput(
  onCompleted: (pin) => print(pin),
)

// New Flutter OTP Kit code
OtpKit(
  fieldCount: 4,
  onVerify: (otp) async {
    print(otp);
    return true;
  },
  onResend: () {},
)
```

**From Smart Auth:**
```dart
// Old Smart Auth code
SmartAuth.getSmsCode()

// New Flutter OTP Kit code
final code = await OtpSmsService.instance.getSmsCode();
```

## 🚀 Quick Start

### Basic Usage

```dart
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

class OtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OtpKit(
  title: 'Verify Phone Number',
        subtitle: 'Enter the code sent to +1 (555) 123-4567',
        fieldCount: 4,
        onVerify: (otp) async {
          // Verify OTP with your backend
          return otp == '1234';
  },
  onResend: () {
          // Resend OTP
        },
      ),
    );
  }
}
```

### Advanced Usage

```dart
OtpKit(
  title: 'Advanced OTP Verification',
  subtitle: 'Enter the code sent to {contactInfo}',
  fieldCount: 6,
  
  // Visual customization
  fieldConfig: OtpFieldConfig.preset(OtpFieldPreset.rounded),
  primaryColor: Colors.blue,
  successColor: Colors.green,
  
  // Animation configuration
  animationConfig: OtpAnimationConfig(
    enableAnimation: true,
    fieldFillAnimationType: FieldFillAnimationType.scale,
    errorFieldAnimationType: ErrorFieldAnimationType.bounce,
    enableCursorAnimation: true,
    cursorBlinkDuration: Duration(milliseconds: 1000),
  ),
  
  // SMS autofill
  smsConfig: OtpSmsConfig(
    enableSmsAutofill: true,
    enableSmartAuth: true,
    appSignature: 'your-app-signature',
  ),
  
  // Performance monitoring
  performanceConfig: OtpPerformanceConfig(
    enablePerformanceMonitoring: true,
    enableMemoryOptimization: true,
  ),
  
  // Security features
  securityConfig: OtpSecurityConfig(
    enableRateLimiting: true,
    maxAttemptsPerMinute: 5,
    enableBiometricIntegration: true,
  ),
  
  onVerify: (otp) async {
    // Your verification logic
    return await verifyOtpWithBackend(otp);
  },
  onResend: () {
    // Your resend logic
  },
)
```

## ⚙️ Advanced Configuration

### Animation Configuration

```dart
OtpAnimationConfig(
  // Main animations
  enableAnimation: true,
  animationDuration: Duration(milliseconds: 300),
  animationCurve: Curves.easeInOut,
  
  // Field animations
  enableFieldStateAnimation: true,
  fieldTransitionDuration: Duration(milliseconds: 150),
  
  // Fill animations
  fieldFillAnimationType: FieldFillAnimationType.scale,
  fieldFillSlideOffset: Offset(6, 0),
  fieldFillRotationRadians: 0.10,
  
  // Error animations
  errorFieldAnimationType: ErrorFieldAnimationType.shake,
  errorShakeAmplitude: 4.0,
  errorShakeFrequency: 10.0,
  
  // Cursor animations
  enableCursorAnimation: true,
  cursorBlinkDuration: Duration(milliseconds: 1000),
  cursorColor: Color(0xFF2196F3),
  cursorWidth: 2.0,
  
  // State transitions
  stateTransitionDuration: Duration(milliseconds: 200),
  stateTransitionCurve: Curves.easeInOut,
  
  // Decoration animations
  enableDecorationAnimation: true,
  decorationAnimationDuration: Duration(milliseconds: 250),
)
```

### SMS Configuration

```dart
OtpSmsConfig(
  // Basic SMS autofill
  enableSmsAutofill: true,
  
  // Smart Auth integration
  enableSmartAuth: true,
  appSignature: 'your-app-signature',
  
  // SMS Retriever API
  enableSmsRetrieverAPI: true,
  smsRetrieverTimeout: Duration(seconds: 60),
  
  // SMS User Consent API
  enableSmsUserConsentAPI: true,
  smsUserConsentTimeout: Duration(seconds: 30),
  
  // SMS validation
  enableSmsValidation: true,
  smsValidationRegex: r'\b\d{4,8}\b',
  
  // Error handling
  enableSmsErrorHandling: true,
  enableSmsLogging: false,
)
```

### Performance Configuration

```dart
OtpPerformanceConfig(
  // Lazy loading
  enableLazyLoading: true,
  maxVisibleFields: 8,
  
  // Memory optimization
  enableMemoryOptimization: true,
  animationCleanupDelay: Duration(seconds: 5),
  
  // Animation pooling
  enableAnimationPooling: true,
  maxAnimationPoolSize: 10,
  
  // Field recycling
  enableFieldRecycling: true,
  
  // Background cleanup
  enableBackgroundCleanup: true,
  cleanupInterval: Duration(minutes: 1),
  
  // Monitoring
  enablePerformanceMonitoring: true,
  enableMemoryLeakDetection: false,
  
  // Optimization
  enableAnimationOptimization: true,
  enableWidgetOptimization: true,
)
```

### Security Configuration

```dart
OtpSecurityConfig(
  // Rate limiting
  enableRateLimiting: true,
  maxAttemptsPerMinute: 5,
  maxAttemptsPerHour: 20,
  lockoutDuration: Duration(minutes: 15),
  
  // Biometric integration
  enableBiometricIntegration: true,
  biometricTimeout: Duration(seconds: 30),
  
  // Advanced validation
  enableAdvancedValidation: true,
  validationChecksum: false,
  validationPattern: r'^\d{4,8}$',
  
  // Encryption
  enableEncryption: false,
  encryptionKey: 'your-encryption-key',
  
  // Audit logging
  enableAuditLogging: true,
  enableSecurityMonitoring: true,
  
  // Anti-tampering
  enableAntiTampering: false,
  
  // Session management
  enableSessionManagement: false,
  sessionTimeout: Duration(minutes: 10),
)
```

## 🔧 Services

### SMS Service

```dart
// Initialize SMS service
await OtpSmsService.instance.initialize(smsConfig);

// Listen for SMS codes
OtpSmsService.instance.smsCodeStream.listen((code) {
  // Handle received SMS code
});

// Get SMS code with timeout
final code = await OtpSmsService.instance.getSmsCode(
  timeout: Duration(seconds: 30),
);

// Check availability
final isAvailable = await OtpSmsService.instance.isSmsAutofillAvailable();
```

### Performance Monitor

```dart
// Initialize performance monitoring
OtpPerformanceMonitor.instance.initialize(performanceConfig);

// Listen for performance metrics
OtpPerformanceMonitor.instance.metricsStream.listen((metrics) {
  print('Memory: ${metrics['memoryUsage']}');
  print('FPS: ${metrics['animationFPS']}');
});

// Get performance summary
final summary = OtpPerformanceMonitor.instance.getPerformanceSummary();

// Optimize performance
OtpPerformanceMonitor.instance.optimizePerformance();
```

### Biometric Service

```dart
// Initialize biometric service
await OtpBiometricService.instance.initialize();

// Check availability
final isAvailable = await OtpBiometricService.instance.isBiometricAvailable();
final types = await OtpBiometricService.instance.getAvailableBiometricTypes();

// Authenticate
final success = await OtpBiometricService.instance.authenticate(
  reason: 'Verify OTP with biometric authentication',
);

// Listen for events
OtpBiometricService.instance.eventStream.listen((event) {
  if (event is BiometricSuccessEvent) {
    // Authentication successful
  } else if (event is BiometricErrorEvent) {
    // Authentication failed
  }
});
```

### Platform Service

```dart
// Initialize platform service
await OtpPlatformService.instance.initialize();

// Get platform-specific features
final keyboardType = OtpPlatformService.instance.getPlatformKeyboardType();
final formatters = OtpPlatformService.instance.getPlatformInputFormatters();
final dimensions = OtpPlatformService.instance.getPlatformFieldDimensions();

// Platform-specific haptic feedback
OtpPlatformService.instance.triggerPlatformHapticFeedback();
OtpPlatformService.instance.triggerPlatformErrorHapticFeedback();
OtpPlatformService.instance.triggerPlatformSuccessHapticFeedback();

// Check platform-specific features
final hasFaceId = await OtpPlatformService.instance.isFaceIdAvailable();
final hasFingerprint = await OtpPlatformService.instance.isFingerprintAvailable();
```

## 📱 Platform Support

### iOS Features
- ✅ Face ID integration
- ✅ Touch ID integration
- ✅ Native SMS autofill
- ✅ iOS-specific animations
- ✅ VoiceOver support

### Android Features
- ✅ Fingerprint authentication
- ✅ Face recognition
- ✅ SMS Retriever API
- ✅ SMS User Consent API
- ✅ TalkBack support

### Web Features
- ✅ Optimized keyboard handling
- ✅ Screen reader support
- ✅ Responsive design
- ✅ Performance optimizations

### Desktop Features
- ✅ Platform-specific layouts
- ✅ Keyboard navigation
- ✅ Accessibility features
- ✅ Performance optimizations

## 📚 Examples

### Example 1: Basic OTP Verification

```dart
OtpKit(
  title: 'Verify Phone Number',
  subtitle: 'Enter the code sent to +1 (555) 123-4567',
  fieldCount: 4,
  onVerify: (otp) async {
    return otp == '1234';
  },
  onResend: () {
    // Resend logic
  },
)
```

### Example 2: Modern Design with Animations

```dart
OtpKit(
  title: 'Modern Verification',
  subtitle: 'Enter the code sent to {contactInfo}',
  fieldCount: 6,
  fieldConfig: OtpFieldConfig.preset(OtpFieldPreset.rounded),
  primaryColor: Colors.blue,
  animationConfig: OtpAnimationConfig(
    fieldFillAnimationType: FieldFillAnimationType.scale,
    errorFieldAnimationType: ErrorFieldAnimationType.bounce,
  ),
  onVerify: (otp) async => true,
  onResend: () {},
)
```

### Example 3: Enterprise Security

```dart
OtpKit(
  title: 'Secure Verification',
  subtitle: 'Enter the code sent to {contactInfo}',
  fieldCount: 6,
  securityConfig: OtpSecurityConfig(
    enableRateLimiting: true,
    maxAttemptsPerMinute: 3,
    enableBiometricIntegration: true,
    enableAuditLogging: true,
  ),
  smsConfig: OtpSmsConfig(
    enableSmartAuth: true,
    appSignature: 'your-signature',
  ),
  onVerify: (otp) async => true,
  onResend: () {},
)
```

## 🔄 Migration Guide

### From Pinput

```dart
// Old Pinput code
Pinput(
  onCompleted: (pin) => print(pin),
)

// New Flutter OTP Kit code
OtpKit(
  fieldCount: 4,
  onVerify: (otp) async {
    print(otp);
    return true;
  },
  onResend: () {},
)
```

### From Smart Auth

```dart
// Old Smart Auth code
SmartAuth.getSmsCode()

// New Flutter OTP Kit code
final code = await OtpSmsService.instance.getSmsCode();
```

## 🐛 Troubleshooting

### Common Issues

1. **SMS Autofill Not Working**
   - Ensure app signature is correct
   - Check platform permissions
   - Verify SMS format

2. **Animations Not Smooth**
   - Enable performance monitoring
   - Check device performance
   - Reduce animation complexity

3. **Biometric Integration Issues**
   - Check platform permissions
   - Verify biometric availability
   - Test on physical device

### Performance Tips

1. **Memory Optimization**
   - Enable lazy loading for large field counts
   - Use animation pooling
   - Enable background cleanup

2. **Animation Performance**
   - Use appropriate animation curves
   - Limit concurrent animations
   - Monitor FPS metrics

3. **Platform Optimization**
   - Use platform-specific configurations
   - Enable platform-specific features
   - Test on target platforms

## 📄 License

MIT License - see LICENSE file for details.

## 🤝 Contributing

Contributions are welcome! Please read our contributing guidelines.

## 📞 Support

- 📧 Email: support@flutterotpkit.com
- 💬 Discord: [Join our community](https://discord.gg/flutterotpkit)
- 📖 Documentation: [Full documentation](https://docs.flutterotpkit.com)
- 🐛 Issues: [GitHub Issues](https://github.com/flutterotpkit/issues)

---

**Made with ❤️ for the Flutter community**