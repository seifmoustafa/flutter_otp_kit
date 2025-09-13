import 'package:flutter/material.dart';

/// Defines the style for OTP fields.
///
/// This class provides a way to define the appearance of OTP fields
/// in different states (default, focused, completed, error).
class OtpFieldStyle {
  /// Creates a new OTP field style.
  const OtpFieldStyle({
    this.decoration,
    this.focusedDecoration,
    this.completedDecoration,
    this.errorDecoration,
    this.textStyle,
    this.cursorColor,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.showCursor = true,
    this.cursorBlinkDuration = const Duration(milliseconds: 500),
  });

  /// The default decoration for the field.
  final BoxDecoration? decoration;

  /// The decoration for the field when it's focused.
  final BoxDecoration? focusedDecoration;

  /// The decoration for the field when it's completed.
  final BoxDecoration? completedDecoration;

  /// The decoration for the field when it has an error.
  final BoxDecoration? errorDecoration;

  /// The text style for the field.
  final TextStyle? textStyle;

  /// The color of the cursor.
  final Color? cursorColor;

  /// The width of the cursor.
  final double cursorWidth;

  /// The height of the cursor.
  final double? cursorHeight;

  /// Whether to show the cursor.
  final bool showCursor;

  /// The duration of the cursor blink animation.
  final Duration cursorBlinkDuration;

  /// Creates a copy of this style with the given fields replaced.
  OtpFieldStyle copyWith({
    BoxDecoration? decoration,
    BoxDecoration? focusedDecoration,
    BoxDecoration? completedDecoration,
    BoxDecoration? errorDecoration,
    TextStyle? textStyle,
    Color? cursorColor,
    double? cursorWidth,
    double? cursorHeight,
    bool? showCursor,
    Duration? cursorBlinkDuration,
  }) {
    return OtpFieldStyle(
      decoration: decoration ?? this.decoration,
      focusedDecoration: focusedDecoration ?? this.focusedDecoration,
      completedDecoration: completedDecoration ?? this.completedDecoration,
      errorDecoration: errorDecoration ?? this.errorDecoration,
      textStyle: textStyle ?? this.textStyle,
      cursorColor: cursorColor ?? this.cursorColor,
      cursorWidth: cursorWidth ?? this.cursorWidth,
      cursorHeight: cursorHeight ?? this.cursorHeight,
      showCursor: showCursor ?? this.showCursor,
      cursorBlinkDuration: cursorBlinkDuration ?? this.cursorBlinkDuration,
    );
  }

  /// Creates a default style with the given theme color.
  static OtpFieldStyle defaultStyle({Color? themeColor}) {
    final color = themeColor ?? Colors.blue;
    return OtpFieldStyle(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedDecoration: BoxDecoration(
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: color.withAlpha(26), // Equivalent to 0.1 opacity
      ),
      completedDecoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(8),
      ),
      errorDecoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(8),
        color: Colors.red.withAlpha(26), // Equivalent to 0.1 opacity
      ),
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      cursorColor: color,
    );
  }

  /// Creates a rounded style with the given theme color.
  static OtpFieldStyle rounded({Color? themeColor}) {
    final color = themeColor ?? Colors.blue;
    return OtpFieldStyle(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedDecoration: BoxDecoration(
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(16),
        color: color.withAlpha(26), // Equivalent to 0.1 opacity
      ),
      completedDecoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(16),
      ),
      errorDecoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(16),
        color: Colors.red.withAlpha(26), // Equivalent to 0.1 opacity
      ),
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      cursorColor: color,
    );
  }

  /// Creates an underlined style with the given theme color.
  static OtpFieldStyle underlined({Color? themeColor}) {
    final color = themeColor ?? Colors.blue;
    return OtpFieldStyle(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      focusedDecoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: color, width: 2),
        ),
      ),
      completedDecoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.green, width: 1),
        ),
      ),
      errorDecoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.red, width: 1),
        ),
      ),
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      cursorColor: color,
    );
  }

  /// Creates a filled style with the given theme color.
  static OtpFieldStyle filled({Color? themeColor}) {
    final color = themeColor ?? Colors.blue;
    return OtpFieldStyle(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      focusedDecoration: BoxDecoration(
        color: color.withAlpha(51), // Equivalent to 0.2 opacity
        borderRadius: BorderRadius.circular(8),
      ),
      completedDecoration: BoxDecoration(
        color: Colors.green.withAlpha(51), // Equivalent to 0.2 opacity
        borderRadius: BorderRadius.circular(8),
      ),
      errorDecoration: BoxDecoration(
        color: Colors.red.withAlpha(51), // Equivalent to 0.2 opacity
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      cursorColor: color,
    );
  }

  /// Creates a material style with the given theme color.
  static OtpFieldStyle material({Color? themeColor}) {
    final color = themeColor ?? Colors.blue;
    return OtpFieldStyle(
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(4),
        color: color.withAlpha(26), // Equivalent to 0.1 opacity
      ),
      focusedDecoration: BoxDecoration(
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(4),
        color: color.withAlpha(38), // Equivalent to 0.15 opacity
      ),
      completedDecoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(4),
        color: Colors.green.withAlpha(26), // Equivalent to 0.1 opacity
      ),
      errorDecoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(4),
        color: Colors.red.withAlpha(26), // Equivalent to 0.1 opacity
      ),
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      cursorColor: color,
    );
  }
}
