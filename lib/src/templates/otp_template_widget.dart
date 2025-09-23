import 'package:flutter/material.dart';
import 'otp_template_config.dart';
import '../widgets/flexible_otp_verification.dart';
import '../config/otp_builder.dart';
import '../config/otp_field_style.dart';
import '../widgets/flexible_otp_field.dart';
import '../styling/otp_predefined_style.dart';

/// Easy-to-use OTP template widget
/// 
/// Users can simply pick a template and pass their content:
/// ```dart
/// OtpTemplateWidget(
///   template: OtpTemplate.modern,
///   title: 'Verify Your Account',
///   subtitle: 'Enter the code sent to {contactInfo}',
///   contactInfo: '+1 (555) 123-4567',
///   onVerify: (otp) => handleVerification(otp),
///   onResend: () => resendCode(),
/// )
/// ```
class OtpTemplateWidget extends StatelessWidget {
  /// The template to use
  final OtpTemplate template;
  
  /// Title text (overrides template default)
  final String? title;
  
  /// Subtitle text (overrides template default)
  final String? subtitle;
  
  /// Contact information to display
  final String? contactInfo;
  
  /// Button text (overrides template default)
  final String? buttonText;
  
  /// Resend text (overrides template default)
  final String? resendText;
  
  /// Timer prefix (overrides template default)
  final String? timerPrefix;
  
  /// Primary color (overrides template default)
  final Color? primaryColor;
  
  /// Secondary color (overrides template default)
  final Color? secondaryColor;
  
  /// Background color (overrides template default)
  final Color? backgroundColor;
  
  /// OTP length (overrides template default)
  final int? otpLength;
  
  /// Field spacing (overrides template default)
  final double? fieldSpacing;
  
  /// Whether to show timer (overrides template default)
  final bool? showTimer;
  
  /// Timer duration (overrides template default)
  final int? timerDuration;
  
  /// Whether to enable auto validation (overrides template default)
  final bool? enableAutoValidation;
  
  /// Whether to enable paste (overrides template default)
  final bool? enablePaste;
  
  /// Whether to enable haptic feedback (overrides template default)
  final bool? enableHapticFeedback;
  
  /// Whether to enable animations (overrides template default)
  final bool? enableAnimations;
  
  /// Cursor style (overrides template default)
  final CursorStyle? cursorStyle;
  
  /// Animation type (overrides template default)
  final FieldAnimationType? animationType;
  
  /// Predefined style (overrides template default)
  final OtpPredefinedStyle? predefinedStyle;
  
  /// Callback when verify button is pressed
  final Function(String) onVerify;
  
  /// Callback when resend button is pressed
  final VoidCallback onResend;
  
  /// Optional callback when OTP value changes
  final ValueChanged<String>? onChanged;
  
  /// Optional callback when OTP is completed
  final ValueChanged<String>? onCompleted;
  
  /// Optional callback when timer changes
  final ValueChanged<int>? onTimerChanged;
  
  /// Optional callback when error state changes
  final ValueChanged<bool>? onErrorStateChangedCallback;
  
  /// Optional callback when validation state changes
  final ValueChanged<bool>? onValidationStateChanged;
  
  /// Optional callback when completion state changes
  final ValueChanged<bool>? onCompletionStateChanged;
  
  /// Optional key for accessing widget state
  final Key? key;

  const OtpTemplateWidget({
    required this.template,
    required this.onVerify,
    required this.onResend,
    this.title,
    this.subtitle,
    this.contactInfo,
    this.buttonText,
    this.resendText,
    this.timerPrefix,
    this.primaryColor,
    this.secondaryColor,
    this.backgroundColor,
    this.otpLength,
    this.fieldSpacing,
    this.showTimer,
    this.timerDuration,
    this.enableAutoValidation,
    this.enablePaste,
    this.enableHapticFeedback,
    this.enableAnimations,
    this.cursorStyle,
    this.animationType,
    this.predefinedStyle,
    this.onChanged,
    this.onCompleted,
    this.onTimerChanged,
    this.onErrorStateChangedCallback,
    this.onValidationStateChanged,
    this.onCompletionStateChanged,
    this.key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get template configuration
    final templateConfig = template.getDefaultConfig();
    
    // Merge user overrides with template defaults
    final config = templateConfig.copyWith(
      title: title,
      subtitle: subtitle,
      buttonText: buttonText,
      resendText: resendText,
      timerPrefix: timerPrefix,
      contactInfo: contactInfo,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      backgroundColor: backgroundColor,
      otpLength: otpLength,
      fieldSpacing: fieldSpacing,
      showTimer: showTimer,
      timerDuration: timerDuration,
      enableAutoValidation: enableAutoValidation,
      enablePaste: enablePaste,
      enableHapticFeedback: enableHapticFeedback,
      enableAnimations: enableAnimations,
      cursorStyle: cursorStyle,
      animationType: animationType,
      predefinedStyle: predefinedStyle,
    );

    // Get custom decorations for the template
    final customDecorations = template.getCustomDecorations();
    
    // Get custom cursor builder for the template
    final customCursorBuilder = template.getCustomCursorBuilder();
    
    return FlexibleOtpVerification(
      key: key,
      title: config.title,
      subtitle: config.subtitle,
      otpLength: config.otpLength,
      spaceBetweenFields: config.fieldSpacing,
      buttonText: config.buttonText,
      resendText: config.resendText,
      timerText: config.showTimer ? '${config.timerPrefix} {time}s' : 'Resend Code',
      enableAutoValidation: config.enableAutoValidation,
      resendTimerDuration: config.timerDuration,
      hapticFeedbackType: config.enableHapticFeedback 
          ? HapticFeedbackType.light 
          : HapticFeedbackType.none,
      otpStyle: config.predefinedStyle,
      themeColor: config.primaryColor,
      buttonBackgroundColor: config.primaryColor,
      buttonTextColor: Colors.white,
      onVerify: onVerify,
      onResend: onResend,
      onOtpChanged: onChanged,
      onOtpCompleted: onCompleted,
      onTimerChanged: onTimerChanged,
      onErrorStateChanged: onErrorStateChangedCallback,
      otpBuilder: OtpBuilder()
          .length(config.otpLength)
          .cursorColor(config.primaryColor)
          .customCursorBuilder(customCursorBuilder ?? (context, color) => Container())
          .fieldAnimationType(config.animationType)
          .animationDuration(config.enableAnimations 
              ? const Duration(milliseconds: 300) 
              : const Duration(milliseconds: 0))
          .animationCurve(Curves.easeInOut)
          .applyStyle(config.predefinedStyle, primaryColor: config.primaryColor)
          .decoration(customDecorations['decoration'])
          .focusedDecoration(customDecorations['focusedDecoration'])
          .errorDecoration(customDecorations['errorDecoration'])
          .completedDecoration(customDecorations['completedDecoration']),
    );
  }
}

/// Template builder for fluent API
class OtpTemplateBuilder {
  OtpTemplate _template;
  String? _title;
  String? _subtitle;
  String? _contactInfo;
  String? _buttonText;
  String? _resendText;
  String? _timerPrefix;
  Color? _primaryColor;
  Color? _secondaryColor;
  Color? _backgroundColor;
  int? _otpLength;
  double? _fieldSpacing;
  bool? _showTimer;
  int? _timerDuration;
  bool? _enableAutoValidation;
  bool? _enablePaste;
  bool? _enableHapticFeedback;
  bool? _enableAnimations;
  CursorStyle? _cursorStyle;
  FieldAnimationType? _animationType;
  OtpPredefinedStyle? _predefinedStyle;
  ValueChanged<String>? _onChanged;
  ValueChanged<String>? _onCompleted;
  ValueChanged<int>? _onTimerChanged;
  ValueChanged<bool>? _onErrorStateChangedCallback;
  ValueChanged<bool>? _onValidationStateChanged;
  ValueChanged<bool>? _onCompletionStateChanged;
  Key? _key;

  OtpTemplateBuilder(this._template);

  /// Set the template
  OtpTemplateBuilder template(OtpTemplate template) {
    _template = template;
    return this;
  }

  /// Set the title
  OtpTemplateBuilder title(String title) {
    _title = title;
    return this;
  }

  /// Set the subtitle
  OtpTemplateBuilder subtitle(String subtitle) {
    _subtitle = subtitle;
    return this;
  }

  /// Set the contact information
  OtpTemplateBuilder contactInfo(String contactInfo) {
    _contactInfo = contactInfo;
    return this;
  }

  /// Set the button text
  OtpTemplateBuilder buttonText(String buttonText) {
    _buttonText = buttonText;
    return this;
  }

  /// Set the resend text
  OtpTemplateBuilder resendText(String resendText) {
    _resendText = resendText;
    return this;
  }

  /// Set the timer prefix
  OtpTemplateBuilder timerPrefix(String timerPrefix) {
    _timerPrefix = timerPrefix;
    return this;
  }

  /// Set the primary color
  OtpTemplateBuilder primaryColor(Color primaryColor) {
    _primaryColor = primaryColor;
    return this;
  }

  /// Set the secondary color
  OtpTemplateBuilder secondaryColor(Color secondaryColor) {
    _secondaryColor = secondaryColor;
    return this;
  }

  /// Set the background color
  OtpTemplateBuilder backgroundColor(Color backgroundColor) {
    _backgroundColor = backgroundColor;
    return this;
  }

  /// Set the OTP length
  OtpTemplateBuilder otpLength(int otpLength) {
    _otpLength = otpLength;
    return this;
  }

  /// Set the field spacing
  OtpTemplateBuilder fieldSpacing(double fieldSpacing) {
    _fieldSpacing = fieldSpacing;
    return this;
  }

  /// Set whether to show timer
  OtpTemplateBuilder showTimer(bool showTimer) {
    _showTimer = showTimer;
    return this;
  }

  /// Set the timer duration
  OtpTemplateBuilder timerDuration(int timerDuration) {
    _timerDuration = timerDuration;
    return this;
  }

  /// Set whether to enable auto validation
  OtpTemplateBuilder enableAutoValidation(bool enableAutoValidation) {
    _enableAutoValidation = enableAutoValidation;
    return this;
  }

  /// Set whether to enable paste
  OtpTemplateBuilder enablePaste(bool enablePaste) {
    _enablePaste = enablePaste;
    return this;
  }

  /// Set whether to enable haptic feedback
  OtpTemplateBuilder enableHapticFeedback(bool enableHapticFeedback) {
    _enableHapticFeedback = enableHapticFeedback;
    return this;
  }

  /// Set whether to enable animations
  OtpTemplateBuilder enableAnimations(bool enableAnimations) {
    _enableAnimations = enableAnimations;
    return this;
  }

  /// Set the cursor style
  OtpTemplateBuilder cursorStyle(CursorStyle cursorStyle) {
    _cursorStyle = cursorStyle;
    return this;
  }

  /// Set the animation type
  OtpTemplateBuilder animationType(FieldAnimationType animationType) {
    _animationType = animationType;
    return this;
  }

  /// Set the predefined style
  OtpTemplateBuilder predefinedStyle(OtpPredefinedStyle predefinedStyle) {
    _predefinedStyle = predefinedStyle;
    return this;
  }

  /// Set the onChanged callback
  OtpTemplateBuilder onChanged(ValueChanged<String> onChanged) {
    _onChanged = onChanged;
    return this;
  }

  /// Set the onCompleted callback
  OtpTemplateBuilder onCompleted(ValueChanged<String> onCompleted) {
    _onCompleted = onCompleted;
    return this;
  }

  /// Set the onTimerChanged callback
  OtpTemplateBuilder onTimerChanged(ValueChanged<int> onTimerChanged) {
    _onTimerChanged = onTimerChanged;
    return this;
  }

  /// Set the onErrorStateChangedCallback callback
  OtpTemplateBuilder onErrorStateChangedCallback(ValueChanged<bool> onErrorStateChangedCallback) {
    _onErrorStateChangedCallback = onErrorStateChangedCallback;
    return this;
  }

  /// Set the onValidationStateChanged callback
  OtpTemplateBuilder onValidationStateChanged(ValueChanged<bool> onValidationStateChanged) {
    _onValidationStateChanged = onValidationStateChanged;
    return this;
  }

  /// Set the onCompletionStateChanged callback
  OtpTemplateBuilder onCompletionStateChanged(ValueChanged<bool> onCompletionStateChanged) {
    _onCompletionStateChanged = onCompletionStateChanged;
    return this;
  }

  /// Set the key
  OtpTemplateBuilder key(Key key) {
    _key = key;
    return this;
  }

  /// Build the template widget
  OtpTemplateWidget build({
    required Function(String) onVerify,
    required VoidCallback onResend,
  }) {
    return OtpTemplateWidget(
      template: _template,
      title: _title,
      subtitle: _subtitle,
      contactInfo: _contactInfo,
      buttonText: _buttonText,
      resendText: _resendText,
      timerPrefix: _timerPrefix,
      primaryColor: _primaryColor,
      secondaryColor: _secondaryColor,
      backgroundColor: _backgroundColor,
      otpLength: _otpLength,
      fieldSpacing: _fieldSpacing,
      showTimer: _showTimer,
      timerDuration: _timerDuration,
      enableAutoValidation: _enableAutoValidation,
      enablePaste: _enablePaste,
      enableHapticFeedback: _enableHapticFeedback,
      enableAnimations: _enableAnimations,
      cursorStyle: _cursorStyle,
      animationType: _animationType,
      predefinedStyle: _predefinedStyle,
      onChanged: _onChanged,
      onCompleted: _onCompleted,
      onTimerChanged: _onTimerChanged,
      onErrorStateChangedCallback: _onErrorStateChangedCallback,
      onValidationStateChanged: _onValidationStateChanged,
      onCompletionStateChanged: _onCompletionStateChanged,
      key: _key,
      onVerify: onVerify,
      onResend: onResend,
    );
  }
}
