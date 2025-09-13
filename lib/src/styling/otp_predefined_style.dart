import 'package:flutter/material.dart';

/// Predefined styles for OTP fields
enum OtpPredefinedStyle {
  /// Default style
  defaultStyle,

  /// Rounded style
  rounded,

  /// Underlined style
  underlined,

  /// Boxed style
  boxed,

  /// Filled style
  filled,

  /// Outline style
  outline,

  /// Material style
  material,

  /// iOS style
  ios,

  /// Custom style
  custom,
}

/// Extension methods for OtpPredefinedStyle
extension OtpPredefinedStyleExtension on OtpPredefinedStyle {
  /// Get the name of the style
  String get name {
    switch (this) {
      case OtpPredefinedStyle.defaultStyle:
        return 'Default';
      case OtpPredefinedStyle.rounded:
        return 'Rounded';
      case OtpPredefinedStyle.underlined:
        return 'Underlined';
      case OtpPredefinedStyle.boxed:
        return 'Boxed';
      case OtpPredefinedStyle.filled:
        return 'Filled';
      case OtpPredefinedStyle.outline:
        return 'Outline';
      case OtpPredefinedStyle.material:
        return 'Material';
      case OtpPredefinedStyle.ios:
        return 'iOS';
      case OtpPredefinedStyle.custom:
        return 'Custom';
    }
  }

  /// Get the decoration for the style
  BoxDecoration getDecoration({Color? themeColor}) {
    final color = themeColor ?? Colors.blue;

    switch (this) {
      case OtpPredefinedStyle.defaultStyle:
        return BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        );
      case OtpPredefinedStyle.rounded:
        return BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(16),
        );
      case OtpPredefinedStyle.underlined:
        return const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey, width: 2),
          ),
        );
      case OtpPredefinedStyle.boxed:
        return BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.zero,
        );
      case OtpPredefinedStyle.filled:
        return BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        );
      case OtpPredefinedStyle.outline:
        return BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(8),
        );
      case OtpPredefinedStyle.material:
        return BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(4),
          color: color.withAlpha(26), // Equivalent to 0.1 opacity,
        );
      case OtpPredefinedStyle.ios:
        return BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade100,
        );
      case OtpPredefinedStyle.custom:
        return BoxDecoration(
          border: Border.all(color: Colors.transparent),
        );
    }
  }

  /// Get the focused decoration for the style
  BoxDecoration getFocusedDecoration({Color? themeColor}) {
    final color = themeColor ?? Colors.blue;

    switch (this) {
      case OtpPredefinedStyle.defaultStyle:
        return BoxDecoration(
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.circular(8),
        );
      case OtpPredefinedStyle.rounded:
        return BoxDecoration(
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.circular(16),
        );
      case OtpPredefinedStyle.underlined:
        return BoxDecoration(
          border: Border(
            bottom: BorderSide(color: color, width: 2),
          ),
        );
      case OtpPredefinedStyle.boxed:
        return BoxDecoration(
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.zero,
        );
      case OtpPredefinedStyle.filled:
        return BoxDecoration(
          color: color.withAlpha(51), // Equivalent to 0.2 opacity,
          borderRadius: BorderRadius.circular(8),
        );
      case OtpPredefinedStyle.outline:
        return BoxDecoration(
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.circular(8),
          color: color.withAlpha(13), // Equivalent to 0.05 opacity,
        );
      case OtpPredefinedStyle.material:
        return BoxDecoration(
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.circular(4),
          color: color.withAlpha(38), // Equivalent to 0.15 opacity,
        );
      case OtpPredefinedStyle.ios:
        return BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: color.withAlpha(77), // Equivalent to 0.3 opacity,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        );
      case OtpPredefinedStyle.custom:
        return BoxDecoration(
          border: Border.all(color: Colors.transparent),
        );
    }
  }
}
