import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../otp_input_type.dart';
import '../otp_layout_type.dart';
import 'otp_field_config.dart';
import 'otp_error_config.dart';
import 'otp_animation_config.dart';

/// Main configuration for OTP verification widget
class OtpConfig {
  /// Creates a new OTP configuration
  const OtpConfig({
    this.fieldCount = 4,
    this.fieldSpacing = 10.0,
    this.spacing = 16.0,
    this.otpInputType = OtpInputType.numeric,
    this.layoutType = OtpLayoutType.fixed,
    this.cursorAlignment = TextAlign.center,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.enableInteractiveSelection = true,
    this.textCapitalization = TextCapitalization.none,
    this.autoFocus = true,
    this.enableAutoValidation = false,
    this.enablePaste = true,
    this.showTimer = true,
    this.timerDuration = 60,
    this.primaryColor = const Color(0xFF018CC3),
    this.secondaryColor = const Color(0xFF8B8B8B),
    this.backgroundColor = Colors.white,
    this.defaultBorderColor,
    this.focusedBorderColor,
    this.completedFieldBorderColor,
    this.completedFieldBackgroundColor,
    this.completedFieldTextColor,
    this.filledFieldBackgroundColor,
    this.enableProgressiveHighlighting = false,
    this.fieldConfig = const OtpFieldConfig(),
    this.errorConfig = const OtpErrorConfig(),
    this.animationConfig = const OtpAnimationConfig(),
    this.customKeyboardType,
    this.inputFormatters,
    this.validationRegex,
    this.validationMessage,
    this.customValidator,
    this.semanticHint,
    this.semanticValue,
    this.enableScreenReaderSupport = true,
    this.customAccessibilityActions,
  });

  /// Number of OTP fields
  final int fieldCount;

  /// Spacing between fields
  final double fieldSpacing;

  /// General spacing for the widget
  final double spacing;

  /// Type of OTP input
  final OtpInputType otpInputType;

  /// Layout type for the fields
  final OtpLayoutType layoutType;

  /// Alignment of the cursor within the field
  final TextAlign cursorAlignment;

  /// Whether to obscure the text
  final bool obscureText;

  /// Character to use for obscuring text
  final String obscuringCharacter;

  /// Whether to enable interactive selection
  final bool enableInteractiveSelection;

  /// Text capitalization for the fields
  final TextCapitalization textCapitalization;

  /// Whether to auto-focus the first field
  final bool autoFocus;

  /// Whether to enable auto-validation
  final bool enableAutoValidation;

  /// Whether to enable paste functionality
  final bool enablePaste;

  /// Whether to show the timer
  final bool showTimer;

  /// Duration for the timer in seconds
  final int timerDuration;

  /// Primary color for the widget
  final Color primaryColor;

  /// Secondary color for the widget
  final Color secondaryColor;

  /// Background color for the widget
  final Color backgroundColor;

  /// Default border color for empty/unfocused fields
  final Color? defaultBorderColor;

  /// Border color for focused fields
  final Color? focusedBorderColor;

  /// Border color for completed fields
  final Color? completedFieldBorderColor;

  /// Background color for completed fields
  final Color? completedFieldBackgroundColor;

  /// Text color for completed fields
  final Color? completedFieldTextColor;

  /// Background color for filled fields
  final Color? filledFieldBackgroundColor;

  /// Whether to enable progressive highlighting of completed fields
  final bool enableProgressiveHighlighting;

  /// Configuration for OTP fields
  final OtpFieldConfig fieldConfig;

  /// Configuration for error state
  final OtpErrorConfig errorConfig;

  /// Configuration for animations
  final OtpAnimationConfig animationConfig;

  /// Custom keyboard type
  final TextInputType? customKeyboardType;

  /// Custom input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// Validation regex pattern
  final String? validationRegex;

  /// Validation message
  final String? validationMessage;

  /// Custom validator function
  final String? Function(String?)? customValidator;

  /// Semantic hint for accessibility
  final String? semanticHint;

  /// Semantic value for accessibility
  final String? semanticValue;

  /// Whether to enable screen reader support
  final bool enableScreenReaderSupport;

  /// Custom accessibility actions
  final List<Map<String, dynamic>>? customAccessibilityActions;

  /// Creates a copy of this object with the given fields replaced with the new values
  OtpConfig copyWith({
    int? fieldCount,
    double? fieldSpacing,
    double? spacing,
    OtpInputType? otpInputType,
    OtpLayoutType? layoutType,
    TextAlign? cursorAlignment,
    bool? obscureText,
    String? obscuringCharacter,
    bool? enableInteractiveSelection,
    TextCapitalization? textCapitalization,
    bool? autoFocus,
    bool? enableAutoValidation,
    bool? enablePaste,
    bool? showTimer,
    int? timerDuration,
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? defaultBorderColor,
    Color? focusedBorderColor,
    Color? completedFieldBorderColor,
    Color? completedFieldBackgroundColor,
    Color? completedFieldTextColor,
    Color? filledFieldBackgroundColor,
    bool? enableProgressiveHighlighting,
    OtpFieldConfig? fieldConfig,
    OtpErrorConfig? errorConfig,
    OtpAnimationConfig? animationConfig,
    TextInputType? customKeyboardType,
    List<TextInputFormatter>? inputFormatters,
    String? validationRegex,
    String? validationMessage,
    String? Function(String?)? customValidator,
    String? semanticHint,
    String? semanticValue,
    bool? enableScreenReaderSupport,
    List<Map<String, dynamic>>? customAccessibilityActions,
  }) {
    return OtpConfig(
      fieldCount: fieldCount ?? this.fieldCount,
      fieldSpacing: fieldSpacing ?? this.fieldSpacing,
      spacing: spacing ?? this.spacing,
      otpInputType: otpInputType ?? this.otpInputType,
      layoutType: layoutType ?? this.layoutType,
      cursorAlignment: cursorAlignment ?? this.cursorAlignment,
      obscureText: obscureText ?? this.obscureText,
      obscuringCharacter: obscuringCharacter ?? this.obscuringCharacter,
      enableInteractiveSelection: enableInteractiveSelection ?? this.enableInteractiveSelection,
      textCapitalization: textCapitalization ?? this.textCapitalization,
      autoFocus: autoFocus ?? this.autoFocus,
      enableAutoValidation: enableAutoValidation ?? this.enableAutoValidation,
      enablePaste: enablePaste ?? this.enablePaste,
      showTimer: showTimer ?? this.showTimer,
      timerDuration: timerDuration ?? this.timerDuration,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      defaultBorderColor: defaultBorderColor ?? this.defaultBorderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      completedFieldBorderColor: completedFieldBorderColor ?? this.completedFieldBorderColor,
      completedFieldBackgroundColor: completedFieldBackgroundColor ?? this.completedFieldBackgroundColor,
      completedFieldTextColor: completedFieldTextColor ?? this.completedFieldTextColor,
      filledFieldBackgroundColor: filledFieldBackgroundColor ?? this.filledFieldBackgroundColor,
      enableProgressiveHighlighting: enableProgressiveHighlighting ?? this.enableProgressiveHighlighting,
      fieldConfig: fieldConfig ?? this.fieldConfig,
      errorConfig: errorConfig ?? this.errorConfig,
      animationConfig: animationConfig ?? this.animationConfig,
      customKeyboardType: customKeyboardType ?? this.customKeyboardType,
      inputFormatters: inputFormatters ?? this.inputFormatters,
      validationRegex: validationRegex ?? this.validationRegex,
      validationMessage: validationMessage ?? this.validationMessage,
      customValidator: customValidator ?? this.customValidator,
      semanticHint: semanticHint ?? this.semanticHint,
      semanticValue: semanticValue ?? this.semanticValue,
      enableScreenReaderSupport: enableScreenReaderSupport ?? this.enableScreenReaderSupport,
      customAccessibilityActions: customAccessibilityActions ?? this.customAccessibilityActions,
    );
  }
}