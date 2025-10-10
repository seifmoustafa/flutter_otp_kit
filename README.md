<div align="center">
  <h1 align="center" style="font-size: 56px; margin-bottom: 0;">🚀 Flutter OTP Kit</h1>
  <h3 style="margin-top: 8px; font-weight: normal;">The Ultimate OTP Verification Package for Flutter</h3>
  
  <p align="center">
    <img src="https://img.shields.io/pub/v/flutter_otp_kit.svg?label=pub&style=for-the-badge" alt="pub version" />
    <img src="https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge" alt="license" />
    <img src="https://img.shields.io/badge/Flutter-3.0%2B-blue.svg?style=for-the-badge" alt="flutter" />
    <img src="https://img.shields.io/badge/Platforms-5-brightgreen.svg?style=for-the-badge" alt="platforms" />
  </p>

  <p align="center">
    <strong>🎯 Complete OTP Solution</strong> • 
    <strong>🎨 Unlimited Customization</strong> • 
    <strong>🚀 Enterprise Ready</strong> • 
    <strong>♿ Accessibility First</strong>
  </p>

  <!-- Demo Video -->
  <p align="center">
    <img src="https://drive.google.com/file/d/1j_-U7ZyG4BZGF84nXek2OVGxPxl-E9Y2/view?usp=drive_link" alt="Flutter OTP Kit Demo" width="420" />
  </p>

  <div align="center" style="margin-top: 16px;">
    <a href="https://github.com/seifmoustafa" target="_blank" rel="noopener noreferrer" style="margin-right:8px;">
      <img src="https://img.shields.io/badge/GitHub-seifmoustafa-181717?logo=github&logoColor=white" alt="GitHub Profile" />
    </a>
    <a href="https://www.linkedin.com/in/seif-moustafa-60115f/" target="_blank" rel="noopener noreferrer">
      <img src="https://img.shields.io/badge/LinkedIn-Seif%20Moustafa-0A66C2?logo=linkedin&logoColor=white" alt="LinkedIn" />
    </a>
    <a href="https://buymeacoffee.com/seifmoustafa" target="_blank" rel="noopener noreferrer">
      <img src="https://img.shields.io/badge/Buy%20Me%20Coffee-seifmoustafa-FFDD00?logo=buymeacoffee&logoColor=black" alt="Buy Me Coffee" />
    </a>
  </div>
</div>

---

## 🌟 **Why Choose Flutter OTP Kit?**

**Flutter OTP Kit v3.0.0** is a **completely rewritten, enterprise-grade OTP verification package** that provides everything you need for secure, beautiful, and accessible OTP verification in your Flutter apps.

### ✨ **Key Highlights**

- 🎯 **Complete OTP Solution** - Timer, validation, masking, SMS autofill, everything in one package
- 🎨 **Unlimited Customization** - 16 cursor styles, 7+ field shapes, 10+ animation types, comprehensive theming
- 🚀 **Enterprise Ready** - Rate limiting, biometric integration, security monitoring, audit logging
- ♿ **Accessibility First** - Full screen reader support, keyboard navigation, reduced motion preferences
- 🌍 **Platform Optimized** - iOS, Android, Web, Desktop with platform-specific features
- ⚡ **Performance Optimized** - Lazy loading, memory optimization, animation pooling
- 🔒 **Security Focused** - Advanced validation, encryption support, anti-tampering measures

---

## 📋 **Table of Contents**

1. [Quick Start](#-quick-start)
2. [Video Demos](#-video-demos)
3. [Features](#-features)
4. [Installation](#-installation)
5. [Basic Usage](#-basic-usage)
6. [Advanced Configuration](#-advanced-configuration)
7. [Animation System](#-animation-system)
8. [SMS Autofill](#-sms-autofill)
9. [Security Features](#-security-features)
10. [Platform Support](#-platform-support)
11. [Accessibility](#-accessibility)
12. [Examples](#-examples)
13. [API Reference](#-api-reference)
14. [Migration Guide](#-migration-guide)
15. [Contributing](#-contributing)

---

## 🚀 **Quick Start**

Add to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_otp_kit: ^3.0.0
```

**Super Simple Usage:**

```dart
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

OtpKit(
  title: 'Verify Phone Number',
  subtitle: 'Enter the code sent to {contactInfo}',
  fieldCount: 4,
  onVerify: (otp) async {
    // Your verification logic
    return otp == '1234';
  },
  onResend: () {
    // Your resend logic
  },
)
```

**That's it!** 🎉 Your OTP verification is ready with:
- ✅ Automatic field navigation
- ✅ Smart backspace handling
- ✅ Paste support
- ✅ Timer functionality
- ✅ Error handling
- ✅ Accessibility support

---

## 🎬 **Video Demos**

### 1. **Basic Demo**
[![Basic Demo](https://img.shields.io/badge/▶️-Basic%20Demo-blue?style=for-the-badge)](https://your-video-url-1.com)
*Simple 4-field OTP with default styling and basic functionality*

### 2. **Rotate Animation Demo**
[![Rotate Animation](https://img.shields.io/badge/▶️-Rotate%20Animation-green?style=for-the-badge)](https://your-video-url-2.com)
*Fields rotate slightly when filled with smooth animation effects*

### 3. **Rounded Fields Demo**
[![Rounded Fields](https://img.shields.io/badge/▶️-Rounded%20Fields-purple?style=for-the-badge)](https://your-video-url-3.com)
*Circular OTP fields with modern rounded design*

### 4. **Scale Fields Demo**
[![Scale Fields](https://img.shields.io/badge/▶️-Scale%20Fields-orange?style=for-the-badge)](https://your-video-url-4.com)
*Fields scale up when filled with bounce animation*

### 5. **Underline Fields Demo**
[![Underline Fields](https://img.shields.io/badge/▶️-Underline%20Fields-teal?style=for-the-badge)](https://your-video-url-5.com)
*Minimal underlined design with smart slide animations*

### 6. **Cursor Styles Demo**
[![Cursor Styles](https://img.shields.io/badge/▶️-Cursor%20Styles-red?style=for-the-badge)](https://your-video-url-6.com)
*16 different cursor styles including bar, block, underline, glow, and more*

---

## ✨ **Features**

### 🎨 **Visual Customization**
- **7+ Field Shapes**: Rectangle, rounded, circle, stadium, underlined, outlined, custom
- **16 Cursor Styles**: System, bar, block, underline, outline, doubleBar, dashedUnderline, beamCap, beamNotch, wedge, ring, strikethrough, doubleUnderline, gradientBar, glowBar, none
- **Advanced Styling**: Gradients, shadows, custom decorations, haptic feedback
- **Responsive Design**: Adaptive layouts for all screen sizes
- **Theme Support**: Light/Dark mode, Material Design 3, custom themes

### 🎬 **Animation System**
- **Main Widget Animations**: Fade, scale, slide entrance
- **Field Fill Animations**: Scale, rotate, slide (4 directions), autoSlide
- **Error Animations**: Shake, bounce, rotate, pulse, wiggle, slide (4 directions)
- **Cursor Animations**: Blink, scale, custom timing
- **Smart Direction-Aware**: Auto-detects RTL/LTR for perfect animations
- **Performance Optimized**: All animations disabled by default for maximum performance

### 📱 **Platform Features**
- **iOS**: Face ID, Touch ID, native SMS autofill, VoiceOver support
- **Android**: Fingerprint, face recognition, SMS Retriever API, TalkBack support
- **Web**: Optimized keyboard handling, screen reader support
- **Desktop**: Platform-specific optimizations, keyboard navigation

### 🔒 **Security & Performance**
- **Rate Limiting**: Configurable attempt limits with automatic lockout
- **Biometric Integration**: Face ID, Touch ID, Fingerprint support
- **Performance Monitoring**: Real-time metrics and optimization
- **Memory Optimization**: Lazy loading, cleanup, animation pooling
- **Audit Logging**: Security event tracking and monitoring

### ♿ **Accessibility**
- **Screen Readers**: Full VoiceOver, TalkBack, screen reader support
- **Keyboard Navigation**: Complete keyboard accessibility
- **Reduced Motion**: Automatic animation reduction for accessibility
- **High Contrast**: Automatic theme adaptation
- **Semantic Labels**: Proper semantic information for assistive technologies

---

## 📦 **Installation**

Add to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_otp_kit: ^3.0.0
```

Then run:

```bash
flutter pub get
```

### **Platform Setup**

#### **Android**
Add to `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.RECEIVE_SMS" />
<uses-permission android:name="android.permission.READ_SMS" />
```

#### **iOS**
Add to `ios/Runner/Info.plist`:

```xml
<key>NSFaceIDUsageDescription</key>
<string>Use Face ID to verify your identity</string>
```

---

## 🎯 **Basic Usage**

### **Minimal Setup**

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
          return await verifyOtpWithBackend(otp);
        },
        onResend: () {
          // Resend OTP
          resendOtp();
        },
      ),
    );
  }
}
```

### **With Contact Info Masking**

```dart
OtpKit(
  title: 'Verify Email',
  subtitle: 'Enter the code sent to {contactInfo}',
  contactInfo: 'user@example.com',
  maskingType: MaskingType.email, // Shows: us***@example.com
  fieldCount: 6,
  onVerify: (otp) async => await verifyOtp(otp),
  onResend: () => resendOtp(),
)
```

---

## ⚙️ **Advanced Configuration**

### **Field Configuration**

```dart
OtpKit(
  title: 'Custom Styled OTP',
  fieldCount: 4,
  fieldConfig: OtpFieldConfig(
    // Dimensions
    fieldWidth: 60,
    fieldHeight: 60,
    borderRadius: 15,
    borderWidth: 2,
    
    // Colors
    primaryColor: Colors.purple,
    backgroundColor: Colors.purple.shade50,
    
    // Effects
    enableShadow: true,
    shadowBlurRadius: 8,
    focusEffect: FocusEffect.glow,
    
    // Cursor
    cursorStyle: CursorStyle.glowBar,
    cursorWidth: 3,
  ),
  onVerify: (otp) async => true,
  onResend: () {},
)
```

### **Animation Configuration**

```dart
OtpKit(
  title: 'Animated OTP',
  fieldCount: 4,
  animationConfig: OtpAnimationConfig(
    // Enable animations
    enableAnimation: true,
    enableFieldStateAnimation: true,
    
    // Fill animations
    fieldFillAnimationType: FieldFillAnimationType.rotate,
    fieldFillRotationRadians: 0.15,
    
    // Error animations
    errorFieldAnimationType: ErrorFieldAnimationType.bounce,
    errorShakeAmplitude: 6.0,
    
    // Cursor animations
    enableCursorAnimation: true,
    cursorBlinkDuration: Duration(milliseconds: 700),
  ),
  onVerify: (otp) async => true,
  onResend: () {},
)
```

### **SMS Autofill Configuration**

```dart
OtpKit(
  title: 'SMS Autofill OTP',
  fieldCount: 4,
  smsConfig: OtpSmsConfig(
    enableSmsAutofill: true,
    enableSmartAuth: true,
    appSignature: 'your-app-signature',
    enableSmsRetrieverAPI: true,
    enableSmsUserConsentAPI: true,
  ),
  onVerify: (otp) async => true,
  onResend: () {},
)
```

### **Security Configuration**

```dart
OtpKit(
  title: 'Secure OTP',
  fieldCount: 4,
  securityConfig: OtpSecurityConfig(
    enableRateLimiting: true,
    maxAttemptsPerMinute: 3,
    enableBiometricIntegration: true,
    enableAuditLogging: true,
  ),
  onVerify: (otp) async => true,
  onResend: () {},
)
```

---

## 🎬 **Animation System**

### **Default Behavior: NO ANIMATIONS**
By default, all animations are **disabled** for maximum performance:

```dart
// Default - NO animations, maximum performance
OtpKit(
  title: 'High Performance OTP',
  fieldCount: 4,
  // No animationConfig needed - defaults to no animations!
  onVerify: (otp) async => true,
  onResend: () {},
)
```

### **Enabling Animations**

```dart
OtpKit(
  title: 'Animated OTP',
  fieldCount: 4,
  animationConfig: OtpAnimationConfig(
    // Main widget animations
    enableAnimation: true,
    animationDuration: Duration(milliseconds: 300),
    
    // Field state animations
    enableFieldStateAnimation: true,
    fieldFillAnimationType: FieldFillAnimationType.scale,
    errorFieldAnimationType: ErrorFieldAnimationType.shake,
    
    // Cursor animations
    enableCursorAnimation: true,
    cursorBlinkDuration: Duration(milliseconds: 1000),
  ),
  onVerify: (otp) async => true,
  onResend: () {},
)
```

### **Animation Types**

#### **Field Fill Animations:**
- `FieldFillAnimationType.scale` - Field scales up slightly
- `FieldFillAnimationType.rotate` - Field rotates slightly
- `FieldFillAnimationType.slideLeft/Right/Up/Down` - Field slides in direction
- `FieldFillAnimationType.autoSlide` - **Smart direction detection** (LTR: left, RTL: right)
- `FieldFillAnimationType.none` - No fill animation

#### **Error Animations:**
- `ErrorFieldAnimationType.shake` - Horizontal shake
- `ErrorFieldAnimationType.bounce` - Vertical bounce
- `ErrorFieldAnimationType.rotate` - Rotation wobble
- `ErrorFieldAnimationType.pulse` - Scale in/out rapidly
- `ErrorFieldAnimationType.wiggle` - Combination of rotation and translation
- `ErrorFieldAnimationType.slideDown/Up/Left/Right` - Slide in direction
- `ErrorFieldAnimationType.none` - No error animation

### **Smart Direction-Aware Animation**

```dart
OtpKit(
  title: 'Smart Animation',
  fieldCount: 4,
  fieldConfig: OtpFieldConfig.preset(OtpFieldPreset.underlined),
  animationConfig: OtpAnimationConfig(
    enableFieldStateAnimation: true,
    fieldFillAnimationType: FieldFillAnimationType.autoSlide,
    // Automatically detects LTR/RTL and slides accordingly
  ),
  onVerify: (otp) async => true,
  onResend: () {},
)
```

---

## 📱 **SMS Autofill**

### **Basic SMS Autofill**

```dart
OtpKit(
  title: 'SMS Autofill',
  fieldCount: 4,
  smsConfig: OtpSmsConfig(
    enableSmsAutofill: true,
  ),
  onVerify: (otp) async => true,
  onResend: () {},
)
```

### **Advanced SMS Configuration**

```dart
OtpKit(
  title: 'Advanced SMS',
  fieldCount: 4,
  smsConfig: OtpSmsConfig(
    enableSmsAutofill: true,
    enableSmartAuth: true,
    appSignature: 'your-app-signature',
    enableSmsRetrieverAPI: true,
    enableSmsUserConsentAPI: true,
    smsValidationRegex: r'\b\d{4,8}\b',
    enableSmsErrorHandling: true,
  ),
  onVerify: (otp) async => true,
  onResend: () {},
)
```

### **Platform-Specific Features**

#### **iOS:**
- Native SMS autofill integration
- Automatic code detection
- No additional setup required

#### **Android:**
- SMS Retriever API support
- SMS User Consent API support
- App signature validation
- Smart Auth integration

---

## 🔒 **Security Features**

### **Rate Limiting**

```dart
OtpKit(
  title: 'Rate Limited OTP',
  fieldCount: 4,
  securityConfig: OtpSecurityConfig(
    enableRateLimiting: true,
    maxAttemptsPerMinute: 5,
    maxAttemptsPerHour: 20,
    lockoutDuration: Duration(minutes: 15),
  ),
  onVerify: (otp) async => true,
  onResend: () {},
)
```

### **Biometric Integration**

```dart
OtpKit(
  title: 'Biometric OTP',
  fieldCount: 4,
  securityConfig: OtpSecurityConfig(
    enableBiometricIntegration: true,
    biometricTimeout: Duration(seconds: 30),
  ),
  onVerify: (otp) async => true,
  onResend: () {},
)
```

### **Advanced Security**

```dart
OtpKit(
  title: 'Enterprise OTP',
  fieldCount: 4,
  securityConfig: OtpSecurityConfig(
    enableRateLimiting: true,
    enableBiometricIntegration: true,
    enableAdvancedValidation: true,
    validationPattern: r'^\d{6}$',
    enableEncryption: true,
    enableAuditLogging: true,
    enableSecurityMonitoring: true,
  ),
  onVerify: (otp) async => true,
  onResend: () {},
)
```

---

## 🌍 **Platform Support**

### **iOS Features**
- ✅ Face ID integration
- ✅ Touch ID integration
- ✅ Native SMS autofill
- ✅ iOS-specific animations
- ✅ VoiceOver support

### **Android Features**
- ✅ Fingerprint authentication
- ✅ Face recognition
- ✅ SMS Retriever API
- ✅ SMS User Consent API
- ✅ TalkBack support

### **Web Features**
- ✅ Optimized keyboard handling
- ✅ Screen reader support
- ✅ Responsive design
- ✅ Performance optimizations

### **Desktop Features**
- ✅ Platform-specific layouts
- ✅ Keyboard navigation
- ✅ Accessibility features
- ✅ Performance optimizations

---

## ♿ **Accessibility**

### **Screen Reader Support**

```dart
OtpKit(
  title: 'Accessible OTP',
  fieldCount: 4,
  enableScreenReaderSupport: true,
  semanticLabel: 'OTP verification',
  semanticHint: 'Enter verification code',
  semanticValue: 'Enter 4-digit verification code',
  onVerify: (otp) async => true,
  onResend: () {},
)
```

### **Keyboard Navigation**
- Full keyboard accessibility
- Tab navigation between fields
- Enter to verify
- Escape to cancel
- Arrow key navigation

### **Reduced Motion**
- Automatic animation reduction
- Respects system accessibility settings
- Configurable motion preferences

### **High Contrast**
- Automatic theme adaptation
- Color contrast compliance
- Customizable contrast ratios

---

## 📚 **Examples**

### **Example 1: Modern Design**

```dart
OtpKit(
  title: 'Modern Verification',
  subtitle: 'Enter the code sent to {contactInfo}',
  fieldCount: 6,
  fieldConfig: OtpFieldConfig.preset(OtpFieldPreset.modern),
  primaryColor: Colors.blue,
  successColor: Colors.green,
  animationConfig: OtpAnimationConfig(
    enableAnimation: true,
    fieldFillAnimationType: FieldFillAnimationType.scale,
    errorFieldAnimationType: ErrorFieldAnimationType.bounce,
  ),
  onVerify: (otp) async => true,
  onResend: () {},
)
```

### **Example 2: Rounded Fields**

```dart
OtpKit(
  title: 'Circular Design',
  fieldCount: 4,
  fieldConfig: OtpFieldConfig.preset(OtpFieldPreset.rounded),
  primaryColor: Colors.orange,
  animationConfig: OtpAnimationConfig(
    enableFieldStateAnimation: true,
    fieldFillAnimationType: FieldFillAnimationType.rotate,
  ),
  onVerify: (otp) async => true,
  onResend: () {},
)
```

### **Example 3: Underlined Style**

```dart
OtpKit(
  title: 'Minimal Design',
  fieldCount: 4,
  fieldConfig: OtpFieldConfig.preset(OtpFieldPreset.underlined),
  primaryColor: Colors.black,
  animationConfig: OtpAnimationConfig(
    enableFieldStateAnimation: true,
    fieldFillAnimationType: FieldFillAnimationType.autoSlide,
  ),
  onVerify: (otp) async => true,
  onResend: () {},
)
```

### **Example 4: Custom Cursor Styles**

```dart
OtpKit(
  title: 'Custom Cursors',
  fieldCount: 4,
  fieldConfig: OtpFieldConfig(
    cursorStyle: CursorStyle.glowBar,
    cursorWidth: 3,
  ),
  animationConfig: OtpAnimationConfig(
    enableCursorAnimation: true,
    cursorBlinkDuration: Duration(milliseconds: 750),
  ),
  onVerify: (otp) async => true,
  onResend: () {},
)
```

### **Example 5: Enterprise Security**

```dart
OtpKit(
  title: 'Enterprise OTP',
  fieldCount: 4,
  smsConfig: OtpSmsConfig(
    enableSmsAutofill: true,
    enableSmartAuth: true,
  ),
  securityConfig: OtpSecurityConfig(
    enableRateLimiting: true,
    enableBiometricIntegration: true,
    enableAuditLogging: true,
  ),
  performanceConfig: OtpPerformanceConfig(
    enablePerformanceMonitoring: true,
    enableMemoryOptimization: true,
  ),
  onVerify: (otp) async => true,
  onResend: () {},
)
```

---

## 📖 **API Reference**

### **OtpKit Parameters**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `onVerify` | `Future<bool> Function(String)` | ✅ | - | Verify OTP callback |
| `onResend` | `VoidCallback` | ✅ | - | Resend OTP callback |
| `title` | `String?` | ❌ | `null` | Title text |
| `subtitle` | `String?` | ❌ | `null` | Subtitle text |
| `fieldCount` | `int` | ❌ | `4` | Number of OTP fields |
| `fieldConfig` | `OtpFieldConfig?` | ❌ | `null` | Field styling configuration |
| `animationConfig` | `OtpAnimationConfig` | ❌ | `const OtpAnimationConfig()` | Animation configuration |
| `smsConfig` | `OtpSmsConfig` | ❌ | `const OtpSmsConfig()` | SMS autofill configuration |
| `securityConfig` | `OtpSecurityConfig` | ❌ | `const OtpSecurityConfig()` | Security configuration |
| `performanceConfig` | `OtpPerformanceConfig` | ❌ | `const OtpPerformanceConfig()` | Performance configuration |

### **OtpFieldConfig Parameters**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `fieldWidth` | `double` | `55.125` | Field width |
| `fieldHeight` | `double` | `60.731` | Field height |
| `borderRadius` | `double` | `17.752` | Border radius |
| `borderWidth` | `double` | `1.869` | Border width |
| `primaryColor` | `Color` | `Color(0xFF018CC3)` | Primary color |
| `cursorStyle` | `CursorStyle` | `CursorStyle.system` | Cursor style |
| `enableShadow` | `bool` | `false` | Enable shadow |
| `fieldShape` | `OtpFieldShape` | `OtpFieldShape.roundedRectangle` | Field shape |

### **OtpAnimationConfig Parameters**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `enableAnimation` | `bool` | `false` | Enable main animations |
| `enableFieldStateAnimation` | `bool` | `false` | Enable field animations |
| `fieldFillAnimationType` | `FieldFillAnimationType` | `FieldFillAnimationType.scale` | Fill animation type |
| `errorFieldAnimationType` | `ErrorFieldAnimationType` | `ErrorFieldAnimationType.shake` | Error animation type |
| `enableCursorAnimation` | `bool` | `false` | Enable cursor animation |
| `cursorBlinkDuration` | `Duration` | `Duration(milliseconds: 1000)` | Cursor blink duration |

---

## 🔄 **Migration Guide**

### **From v2.x.x to v3.0.0**

**Old way (still works):**
```dart
OtpVerificationWidget(
  onVerify: (otp) => backend.verify(otp),
  onResend: () => backend.resend(),
)
```

**New way (recommended):**
```dart
OtpKit(
  onVerify: (otp) async => await backend.verify(otp),
  onResend: () => backend.resend(),
)
```

### **From Other OTP Packages**

Replace your existing OTP input with `OtpKit`:

```dart
// Before
OTPTextField(
  length: 4,
  onCompleted: (pin) {
    // Handle completion
  },
)

// After
OtpKit(
  fieldCount: 4,
  onVerify: (otp) async {
    // Handle verification
    return true;
  },
  onResend: () {
    // Handle resend
  },
)
```

---

## 🤝 **Contributing**

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

### **Development Setup**

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### **Reporting Issues**

Please use the [GitHub issue tracker](https://github.com/seifmoustafa/flutter_otp_kit/issues) to report bugs or request features.

---

## 📄 **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 **Acknowledgments**

- Flutter team for the amazing framework
- The Flutter community for inspiration and feedback
- All contributors who have helped improve this package

---

## 📞 **Support**

- 📖 **Documentation**: [GitHub README](https://github.com/seifmoustafa/flutter_otp_kit)
- 🐛 **Issues**: [GitHub Issues](https://github.com/seifmoustafa/flutter_otp_kit/issues)
- 🧑‍💻 **GitHub**: [seifmoustafa](https://github.com/seifmoustafa)
- 🔗 **LinkedIn**: [Seif Moustafa](https://www.linkedin.com/in/seif-moustafa-60115f/)
- ☕ **Buy me a coffee**: [buymeacoffee.com/seifmoustafa](https://buymeacoffee.com/seifmoustafa)

---

<div align="center">
  <p><strong>Made with ❤️ for the Flutter community</strong></p>
  <p>If this package helps you, please consider giving it a ⭐ on GitHub!</p>
</div>