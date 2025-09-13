import 'package:flutter/material.dart';
import '../state/otp_field_state.dart';
import '../config/otp_field_config.dart';
import '../config/otp_error_config.dart';
import '../config/otp_animation_config.dart';
import 'field_colors.dart';

/// Manages styling for OTP fields
class OtpStyleManager {
  /// Creates a new OTP style manager
  OtpStyleManager({
    required this.fieldConfig,
    required this.errorConfig,
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    this.defaultBorderColor,
    this.focusedBorderColor,
    this.completedFieldBorderColor,
    this.completedFieldBackgroundColor,
    this.completedFieldTextColor,
    this.filledFieldBackgroundColor,
    this.enableProgressiveHighlighting = false,
    this.animationConfig = const OtpAnimationConfig(),
  });

  /// Configuration for OTP fields
  final OtpFieldConfig fieldConfig;

  /// Configuration for error state
  final OtpErrorConfig errorConfig;

  /// Configuration for animations
  final OtpAnimationConfig animationConfig;

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

  /// Gets field colors based on state with proper priority
  FieldColors getFieldColors(
      int index, OtpFieldState fieldState, bool hasError) {
    // Clear visual hierarchy: Error > Focused > Completed > Filled > Empty

    // Default colors
    final defaultBorder =
        defaultBorderColor ?? Colors.grey.shade400; // Grey for empty/unfocused
    final focusColor =
        focusedBorderColor ?? Colors.blue.shade600; // Blue for focused
    final successColor = completedFieldBorderColor ??
        Colors.green.shade600; // Green for filled/completed
    final errorColor =
        errorConfig.errorBorderColor ?? Colors.red.shade600; // Red for error

    // 1. Error state (highest priority) - Red border + red fill
    if (hasError || fieldState == OtpFieldState.error) {
      return FieldColors(
        borderColor: errorColor,
        backgroundColor: errorConfig.errorBackgroundColor ??
            Colors.red.shade50, // Light red fill
        textColor: errorConfig.errorTextColor ?? Colors.red.shade800,
      );
    }

    // 2. Focused state - Blue border, no fill
    if (fieldState == OtpFieldState.focused) {
      return FieldColors(
        borderColor: focusColor,
        backgroundColor: backgroundColor, // No fill
        textColor: Colors.black87,
      );
    }

    // 3. Completed state - Green border + green fill (when all fields are complete)
    if (fieldState == OtpFieldState.completed) {
      return FieldColors(
        borderColor: successColor,
        backgroundColor: completedFieldBackgroundColor ??
            Colors.green.shade50, // Light green fill
        textColor: completedFieldTextColor ?? Colors.green.shade700,
      );
    }

    // 4. Filled state - Green border, no fill (field has value but not all complete)
    if (fieldState == OtpFieldState.filled) {
      return FieldColors(
        borderColor: successColor,
        backgroundColor: backgroundColor, // No fill
        textColor: Colors.green.shade700,
      );
    }

    // 5. Empty state (lowest priority) - Grey border, no fill
    return FieldColors(
      borderColor: defaultBorder,
      backgroundColor: backgroundColor, // No fill
      textColor: Colors.grey.shade600,
    );
  }

  /// Creates a box decoration for a field
  BoxDecoration createFieldDecoration(
    FieldColors colors,
    double borderRadius,
    double borderWidth,
    OtpFieldState fieldState,
  ) {
    // Base decoration with border and background
    BoxDecoration decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: colors.borderColor,
        width: borderWidth,
      ),
      color: colors.backgroundColor,
    );

    // Add shadows based on state
    List<BoxShadow> shadows = [];

    // Error state - subtle red shadow
    if (fieldState == OtpFieldState.error) {
      shadows.add(BoxShadow(
        color: Colors.red.shade600.withAlpha(30),
        blurRadius: 2.0,
        spreadRadius: 0.5,
        offset: const Offset(0, 1),
      ));
    }
    // Completed state - subtle green shadow
    else if (fieldState == OtpFieldState.completed) {
      shadows.add(BoxShadow(
        color: Colors.green.shade600.withAlpha(30),
        blurRadius: 2.0,
        spreadRadius: 0.5,
        offset: const Offset(0, 1),
      ));
    }
    // Focused state - blue shadow
    else if (fieldState == OtpFieldState.focused && fieldConfig.enableShadow) {
      shadows.add(BoxShadow(
        color: (focusedBorderColor ?? Colors.blue.shade600).withAlpha(40),
        blurRadius: fieldConfig.shadowBlurRadius,
        spreadRadius: fieldConfig.shadowSpreadRadius,
        offset: const Offset(0, 2),
      ));
    }
    // Filled state - subtle green shadow
    else if (fieldState == OtpFieldState.filled && fieldConfig.enableShadow) {
      shadows.add(BoxShadow(
        color: Colors.green.shade600.withAlpha(20),
        blurRadius: 1.0,
        spreadRadius: 0.0,
        offset: const Offset(0, 1),
      ));
    }

    if (shadows.isNotEmpty) {
      decoration = decoration.copyWith(boxShadow: shadows);
    }

    return decoration;
  }

  /// Creates a text style for a field
  TextStyle createFieldTextStyle(
      FieldColors colors, double fontSize, OtpFieldState fieldState) {
    // Base style with state-specific color
    TextStyle style = TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: colors.textColor,
      height: 1.0, // Ensure consistent line height
    );

    // Add letter spacing for better readability in numeric fields
    if (fieldState == OtpFieldState.completed ||
        fieldState == OtpFieldState.filled) {
      style = style.copyWith(letterSpacing: 0.5);
    }

    return style;
  }

  /// Gets animation configuration for the OTP fields
  OtpAnimationConfig getAnimationConfig() {
    return animationConfig;
  }
}
