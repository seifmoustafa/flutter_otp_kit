import 'package:flutter/material.dart';
import '../state/otp_field_state.dart';
import '../config/otp_field_config.dart';
import '../config/otp_error_config.dart';
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
  });

  /// Configuration for OTP fields
  final OtpFieldConfig fieldConfig;

  /// Configuration for error state
  final OtpErrorConfig errorConfig;

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
  FieldColors getFieldColors(int index, OtpFieldState fieldState, bool hasError) {
    // Priority order: Error > Focused > Completed > Filled > Empty

    // Get default border color for unfocused/empty fields
    final defaultBorder = defaultBorderColor ?? secondaryColor.withAlpha(204); // 0.8 opacity

    // 1. Error state (highest priority)
    if (hasError && errorConfig.errorStatePriority == ErrorStatePriority.highest) {
      return FieldColors(
        borderColor: errorConfig.errorBorderColor ?? Colors.red,
        backgroundColor: errorConfig.errorBackgroundColor ?? backgroundColor,
        textColor: errorConfig.errorTextColor ?? Colors.black87,
      );
    }

    // 2. Focused state
    if (fieldState == OtpFieldState.focused) {
      return FieldColors(
        borderColor: focusedBorderColor ?? primaryColor,
        backgroundColor: backgroundColor,
        textColor: Colors.black87,
      );
    }

    // 3. Completed state (only if progressive highlighting is enabled)
    if (fieldState == OtpFieldState.completed && enableProgressiveHighlighting) {
      return FieldColors(
        borderColor: completedFieldBorderColor ?? Colors.green,
        backgroundColor: completedFieldBackgroundColor ?? backgroundColor,
        textColor: completedFieldTextColor ?? Colors.green,
      );
    }

    // 4. Filled state
    if (fieldState == OtpFieldState.filled) {
      return FieldColors(
        borderColor: secondaryColor.withAlpha(204), // 0.8 opacity
        backgroundColor: filledFieldBackgroundColor ?? backgroundColor,
        textColor: Colors.black87,
      );
    }

    // 5. Empty state (lowest priority) - use default color, not primary
    return FieldColors(
      borderColor: defaultBorder,
      backgroundColor: backgroundColor,
      textColor: Colors.black87,
    );
  }

  /// Creates a box decoration for a field
  BoxDecoration createFieldDecoration(FieldColors colors, double borderRadius, double borderWidth) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: colors.borderColor,
        width: borderWidth,
      ),
      color: colors.backgroundColor,
    );
  }

  /// Creates a text style for a field
  TextStyle createFieldTextStyle(FieldColors colors, double fontSize) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: colors.textColor,
      height: 1.0, // Ensure consistent line height
    );
  }
}