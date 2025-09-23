import 'package:flutter/material.dart';
import '../config/otp_field_style.dart';
import '../styling/otp_predefined_style.dart';
import '../widgets/flexible_otp_field.dart';

/// Predefined OTP templates for quick setup
enum OtpTemplate {
  /// Modern template with gradients and shadows
  modern,
  
  /// Minimal template with clean lines
  minimal,
  
  /// Corporate template with professional styling
  corporate,
  
  /// Playful template with rounded corners and animations
  playful,
  
  /// Elegant template with sophisticated styling
  elegant,
}

/// Template configuration for easy customization
class OtpTemplateConfig {
  final String title;
  final String subtitle;
  final String buttonText;
  final String resendText;
  final String timerPrefix;
  final String? contactInfo;
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final int otpLength;
  final double fieldSpacing;
  final bool showTimer;
  final int timerDuration;
  final bool enableAutoValidation;
  final bool enablePaste;
  final bool enableHapticFeedback;
  final bool enableAnimations;
  final CursorStyle cursorStyle;
  final FieldAnimationType animationType;
  final OtpPredefinedStyle predefinedStyle;

  const OtpTemplateConfig({
    required this.title,
    required this.subtitle,
    this.buttonText = 'Verify',
    this.resendText = 'Resend Code',
    this.timerPrefix = 'Resend in',
    this.contactInfo,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.otpLength = 4,
    this.fieldSpacing = 10.0,
    this.showTimer = true,
    this.timerDuration = 60,
    this.enableAutoValidation = true,
    this.enablePaste = true,
    this.enableHapticFeedback = true,
    this.enableAnimations = true,
    this.cursorStyle = CursorStyle.bottom,
    this.animationType = FieldAnimationType.scale,
    this.predefinedStyle = OtpPredefinedStyle.defaultStyle,
  });

  /// Create a copy with modified values
  OtpTemplateConfig copyWith({
    String? title,
    String? subtitle,
    String? buttonText,
    String? resendText,
    String? timerPrefix,
    String? contactInfo,
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    int? otpLength,
    double? fieldSpacing,
    bool? showTimer,
    int? timerDuration,
    bool? enableAutoValidation,
    bool? enablePaste,
    bool? enableHapticFeedback,
    bool? enableAnimations,
    CursorStyle? cursorStyle,
    FieldAnimationType? animationType,
    OtpPredefinedStyle? predefinedStyle,
  }) {
    return OtpTemplateConfig(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      buttonText: buttonText ?? this.buttonText,
      resendText: resendText ?? this.resendText,
      timerPrefix: timerPrefix ?? this.timerPrefix,
      contactInfo: contactInfo ?? this.contactInfo,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      otpLength: otpLength ?? this.otpLength,
      fieldSpacing: fieldSpacing ?? this.fieldSpacing,
      showTimer: showTimer ?? this.showTimer,
      timerDuration: timerDuration ?? this.timerDuration,
      enableAutoValidation: enableAutoValidation ?? this.enableAutoValidation,
      enablePaste: enablePaste ?? this.enablePaste,
      enableHapticFeedback: enableHapticFeedback ?? this.enableHapticFeedback,
      enableAnimations: enableAnimations ?? this.enableAnimations,
      cursorStyle: cursorStyle ?? this.cursorStyle,
      animationType: animationType ?? this.animationType,
      predefinedStyle: predefinedStyle ?? this.predefinedStyle,
    );
  }
}

/// Extension methods for OtpTemplate
extension OtpTemplateExtension on OtpTemplate {
  /// Get the name of the template
  String get name {
    switch (this) {
      case OtpTemplate.modern:
        return 'Modern';
      case OtpTemplate.minimal:
        return 'Minimal';
      case OtpTemplate.corporate:
        return 'Corporate';
      case OtpTemplate.playful:
        return 'Playful';
      case OtpTemplate.elegant:
        return 'Elegant';
    }
  }

  /// Get the description of the template
  String get description {
    switch (this) {
      case OtpTemplate.modern:
        return 'Modern design with gradients, shadows, and smooth animations';
      case OtpTemplate.minimal:
        return 'Clean and minimal design with focus on simplicity';
      case OtpTemplate.corporate:
        return 'Professional design suitable for business applications';
      case OtpTemplate.playful:
        return 'Fun and colorful design with rounded corners and animations';
      case OtpTemplate.elegant:
        return 'Sophisticated design with premium styling and effects';
    }
  }

  /// Get the default configuration for the template
  OtpTemplateConfig getDefaultConfig() {
    switch (this) {
      case OtpTemplate.modern:
        return const OtpTemplateConfig(
          title: 'Verify Your Account',
          subtitle: 'Enter the verification code sent to your device',
          buttonText: 'Verify',
          resendText: 'Resend Code',
          timerPrefix: 'Resend in',
          primaryColor: Color(0xFF6366F1), // Indigo
          secondaryColor: Color(0xFF64748B), // Slate
          backgroundColor: Color(0xFFF8FAFC), // Slate 50
          otpLength: 4,
          fieldSpacing: 12.0,
          showTimer: true,
          timerDuration: 60,
          enableAutoValidation: true,
          enablePaste: true,
          enableHapticFeedback: true,
          enableAnimations: true,
          cursorStyle: CursorStyle.custom,
          animationType: FieldAnimationType.scale,
          predefinedStyle: OtpPredefinedStyle.rounded,
        );
      case OtpTemplate.minimal:
        return const OtpTemplateConfig(
          title: 'Enter Verification Code',
          subtitle: 'We sent a code to your registered number',
          buttonText: 'Continue',
          resendText: 'Send Again',
          timerPrefix: 'in',
          primaryColor: Color(0xFF000000), // Black
          secondaryColor: Color(0xFF6B7280), // Gray
          backgroundColor: Color(0xFFFFFFFF), // White
          otpLength: 4,
          fieldSpacing: 8.0,
          showTimer: true,
          timerDuration: 60,
          enableAutoValidation: true,
          enablePaste: true,
          enableHapticFeedback: false,
          enableAnimations: false,
          cursorStyle: CursorStyle.bottom,
          animationType: FieldAnimationType.none,
          predefinedStyle: OtpPredefinedStyle.underlined,
        );
      case OtpTemplate.corporate:
        return const OtpTemplateConfig(
          title: 'Security Verification',
          subtitle: 'Please enter the security code to continue',
          buttonText: 'Verify & Continue',
          resendText: 'Request New Code',
          timerPrefix: 'Code expires in',
          primaryColor: Color(0xFF1E40AF), // Blue 800
          secondaryColor: Color(0xFF475569), // Slate 600
          backgroundColor: Color(0xFFF1F5F9), // Slate 100
          otpLength: 6,
          fieldSpacing: 10.0,
          showTimer: true,
          timerDuration: 120,
          enableAutoValidation: true,
          enablePaste: true,
          enableHapticFeedback: true,
          enableAnimations: true,
          cursorStyle: CursorStyle.vertical,
          animationType: FieldAnimationType.fade,
          predefinedStyle: OtpPredefinedStyle.boxed,
        );
      case OtpTemplate.playful:
        return const OtpTemplateConfig(
          title: 'Let\'s Verify! 🎉',
          subtitle: 'Enter the fun code we sent you',
          buttonText: 'Let\'s Go!',
          resendText: 'Send Again',
          timerPrefix: 'Try again in',
          primaryColor: Color(0xFFEC4899), // Pink 500
          secondaryColor: Color(0xFF8B5CF6), // Violet 500
          backgroundColor: Color(0xFFFDF2F8), // Pink 50
          otpLength: 4,
          fieldSpacing: 16.0,
          showTimer: true,
          timerDuration: 60,
          enableAutoValidation: true,
          enablePaste: true,
          enableHapticFeedback: true,
          enableAnimations: true,
          cursorStyle: CursorStyle.custom,
          animationType: FieldAnimationType.scale,
          predefinedStyle: OtpPredefinedStyle.rounded,
        );
      case OtpTemplate.elegant:
        return const OtpTemplateConfig(
          title: 'Verification Required',
          subtitle: 'Enter the verification code to access your account',
          buttonText: 'Verify',
          resendText: 'Resend Code',
          timerPrefix: 'Resend in',
          primaryColor: Color(0xFF7C3AED), // Violet 600
          secondaryColor: Color(0xFF6B7280), // Gray 500
          backgroundColor: Color(0xFFFAFAFA), // Gray 50
          otpLength: 4,
          fieldSpacing: 14.0,
          showTimer: true,
          timerDuration: 90,
          enableAutoValidation: true,
          enablePaste: true,
          enableHapticFeedback: true,
          enableAnimations: true,
          cursorStyle: CursorStyle.custom,
          animationType: FieldAnimationType.fade,
          predefinedStyle: OtpPredefinedStyle.material,
        );
    }
  }

  /// Get the custom cursor builder for the template
  Widget Function(BuildContext, Color)? getCustomCursorBuilder() {
    switch (this) {
      case OtpTemplate.modern:
        return (context, color) => Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 6,
                spreadRadius: 1,
              ),
            ],
          ),
        );
      case OtpTemplate.minimal:
        return null; // Use default bottom cursor
      case OtpTemplate.corporate:
        return null; // Use default vertical cursor
      case OtpTemplate.playful:
        return (context, color) => Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color, color.withOpacity(0.7)],
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
        );
      case OtpTemplate.elegant:
        return (context, color) => Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.2),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
        );
    }
  }

  /// Get the custom field decorations for the template
  Map<String, BoxDecoration> getCustomDecorations() {
    final config = getDefaultConfig();
    final primaryColor = config.primaryColor;
    final secondaryColor = config.secondaryColor;

    switch (this) {
      case OtpTemplate.modern:
        return {
          'decoration': BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey.shade50],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          'focusedDecoration': BoxDecoration(
            gradient: LinearGradient(
              colors: [primaryColor.withOpacity(0.1), primaryColor.withOpacity(0.05)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primaryColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          'errorDecoration': BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red.withOpacity(0.1), Colors.red.withOpacity(0.05)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.red, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.red.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          'completedDecoration': BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green.withOpacity(0.1), Colors.green.withOpacity(0.05)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        };
      case OtpTemplate.minimal:
        return {
          'decoration': const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          'focusedDecoration': const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black, width: 2),
            ),
          ),
          'errorDecoration': const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.red, width: 2),
            ),
          ),
          'completedDecoration': const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.green, width: 2),
            ),
          ),
        };
      case OtpTemplate.corporate:
        return {
          'decoration': BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.zero,
            color: Colors.white,
          ),
          'focusedDecoration': BoxDecoration(
            border: Border.all(color: primaryColor, width: 2),
            borderRadius: BorderRadius.zero,
            color: primaryColor.withOpacity(0.05),
          ),
          'errorDecoration': BoxDecoration(
            border: Border.all(color: Colors.red, width: 2),
            borderRadius: BorderRadius.zero,
            color: Colors.red.withOpacity(0.05),
          ),
          'completedDecoration': BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.zero,
            color: Colors.green.withOpacity(0.05),
          ),
        };
      case OtpTemplate.playful:
        return {
          'decoration': BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.pink.shade50],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.pink.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.pink.shade100,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          'focusedDecoration': BoxDecoration(
            gradient: LinearGradient(
              colors: [primaryColor.withOpacity(0.1), primaryColor.withOpacity(0.05)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: primaryColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          'errorDecoration': BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red.withOpacity(0.1), Colors.red.withOpacity(0.05)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.red, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.red.withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          'completedDecoration': BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green.withOpacity(0.1), Colors.green.withOpacity(0.05)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.green, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
        };
      case OtpTemplate.elegant:
        return {
          'decoration': BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 8,
                offset: const Offset(0, 4),
                spreadRadius: 1,
              ),
            ],
          ),
          'focusedDecoration': BoxDecoration(
            color: primaryColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: primaryColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.15),
                blurRadius: 12,
                offset: const Offset(0, 6),
                spreadRadius: 2,
              ),
            ],
          ),
          'errorDecoration': BoxDecoration(
            color: Colors.red.withOpacity(0.05),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.red, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.red.withOpacity(0.15),
                blurRadius: 12,
                offset: const Offset(0, 6),
                spreadRadius: 2,
              ),
            ],
          ),
          'completedDecoration': BoxDecoration(
            color: Colors.green.withOpacity(0.05),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.green, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.15),
                blurRadius: 12,
                offset: const Offset(0, 6),
                spreadRadius: 2,
              ),
            ],
          ),
        };
    }
  }
}
