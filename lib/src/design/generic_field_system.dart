import 'package:flutter/material.dart';

/// Completely generic field customization system
/// Allows developers to create any field design they want
class GenericFieldSystem {
  /// Creates a completely custom field theme
  static OtpFieldTheme createCustomTheme({
    required double width,
    required double height,
    required TextStyle textStyle,
    required BoxDecoration decoration,
    required BoxDecoration focusedDecoration,
    required BoxDecoration completedDecoration,
    required BoxDecoration errorDecoration,
    required CursorStyle cursorStyle,
  }) {
    return OtpFieldTheme(
      width: width,
      height: height,
      textStyle: textStyle,
      decoration: decoration,
      focusedDecoration: focusedDecoration,
      completedDecoration: completedDecoration,
      errorDecoration: errorDecoration,
      cursorStyle: cursorStyle,
    );
  }

  /// Creates a field with custom border
  static OtpFieldTheme createBorderTheme({
    double width = 56,
    double height = 56,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? completedBorderColor,
    Color? errorBorderColor,
    double borderWidth = 1,
    double borderRadius = 8,
    Color? backgroundColor,
    Color? focusedBackgroundColor,
    Color? completedBackgroundColor,
    Color? errorBackgroundColor,
    TextStyle? textStyle,
    CursorStyle cursorStyle = CursorStyle.vertical,
  }) {
    return OtpFieldTheme(
      width: width,
      height: height,
      textStyle: textStyle ??
          const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor ?? Colors.grey.shade300,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor ?? Colors.white,
      ),
      focusedDecoration: BoxDecoration(
        border: Border.all(
          color: focusedBorderColor ?? Colors.blue,
          width: borderWidth + 1,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        color: focusedBackgroundColor ?? Colors.white,
      ),
      completedDecoration: BoxDecoration(
        border: Border.all(
          color: completedBorderColor ?? Colors.green,
          width: borderWidth + 1,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        color: completedBackgroundColor ?? Colors.green.shade50,
      ),
      errorDecoration: BoxDecoration(
        border: Border.all(
          color: errorBorderColor ?? Colors.red,
          width: borderWidth + 1,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        color: errorBackgroundColor ?? Colors.red.shade50,
      ),
      cursorStyle: cursorStyle,
    );
  }

  /// Creates a field with custom fill
  static OtpFieldTheme createFillTheme({
    double width = 56,
    double height = 56,
    Color? fillColor,
    Color? focusedFillColor,
    Color? completedFillColor,
    Color? errorFillColor,
    double borderRadius = 12,
    TextStyle? textStyle,
    CursorStyle cursorStyle = CursorStyle.vertical,
  }) {
    return OtpFieldTheme(
      width: width,
      height: height,
      textStyle: textStyle ??
          TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
      decoration: BoxDecoration(
        color: fillColor ?? Colors.blue.shade600,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      focusedDecoration: BoxDecoration(
        color: focusedFillColor ?? Colors.blue.shade700,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: (focusedFillColor ?? Colors.blue.shade700)
                .withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      completedDecoration: BoxDecoration(
        color: completedFillColor ?? Colors.green.shade600,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      errorDecoration: BoxDecoration(
        color: errorFillColor ?? Colors.red.shade600,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      cursorStyle: cursorStyle,
    );
  }

  /// Creates a field with custom gradient
  static OtpFieldTheme createGradientTheme({
    double width = 56,
    double height = 56,
    List<Color>? gradientColors,
    List<Color>? focusedGradientColors,
    List<Color>? completedGradientColors,
    List<Color>? errorGradientColors,
    double borderRadius = 12,
    TextStyle? textStyle,
    CursorStyle cursorStyle = CursorStyle.vertical,
  }) {
    return OtpFieldTheme(
      width: width,
      height: height,
      textStyle: textStyle ??
          const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors ?? [Colors.purple, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      focusedDecoration: BoxDecoration(
        gradient: LinearGradient(
          colors: focusedGradientColors ??
              [Colors.purple.shade700, Colors.blue.shade700],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: (focusedGradientColors?.first ?? Colors.purple)
                .withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      completedDecoration: BoxDecoration(
        gradient: LinearGradient(
          colors: completedGradientColors ?? [Colors.green, Colors.greenAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      errorDecoration: BoxDecoration(
        gradient: LinearGradient(
          colors: errorGradientColors ?? [Colors.red, Colors.redAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      cursorStyle: cursorStyle,
    );
  }

  /// Creates a field with custom shadow
  static OtpFieldTheme createShadowTheme({
    double width = 56,
    double height = 56,
    Color? shadowColor,
    Color? focusedShadowColor,
    double shadowBlurRadius = 4,
    double focusedShadowBlurRadius = 8,
    double borderRadius = 12,
    Color? backgroundColor,
    TextStyle? textStyle,
    CursorStyle cursorStyle = CursorStyle.vertical,
  }) {
    return OtpFieldTheme(
      width: width,
      height: height,
      textStyle: textStyle ??
          const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: (shadowColor ?? Colors.grey).withValues(alpha: 0.1),
            blurRadius: shadowBlurRadius,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      focusedDecoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: (focusedShadowColor ?? Colors.blue).withValues(alpha: 0.2),
            blurRadius: focusedShadowBlurRadius,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      completedDecoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withValues(alpha: 0.2),
            blurRadius: focusedShadowBlurRadius,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      errorDecoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withValues(alpha: 0.2),
            blurRadius: focusedShadowBlurRadius,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      cursorStyle: cursorStyle,
    );
  }

  /// Creates a field with custom glow effect
  static OtpFieldTheme createGlowTheme({
    double width = 56,
    double height = 56,
    Color? glowColor,
    Color? focusedGlowColor,
    double glowRadius = 10,
    double focusedGlowRadius = 15,
    double borderRadius = 8,
    Color? backgroundColor,
    TextStyle? textStyle,
    CursorStyle cursorStyle = CursorStyle.vertical,
  }) {
    return OtpFieldTheme(
      width: width,
      height: height,
      textStyle: textStyle ??
          TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.black,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: glowColor ?? Colors.cyan,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: (glowColor ?? Colors.cyan).withValues(alpha: 0.5),
            blurRadius: glowRadius,
            spreadRadius: 2,
          ),
        ],
      ),
      focusedDecoration: BoxDecoration(
        color: backgroundColor ?? Colors.black,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: focusedGlowColor ?? Colors.cyan,
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: (focusedGlowColor ?? Colors.cyan).withValues(alpha: 0.8),
            blurRadius: focusedGlowRadius,
            spreadRadius: 3,
          ),
        ],
      ),
      completedDecoration: BoxDecoration(
        color: backgroundColor ?? Colors.black,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: Colors.green,
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withValues(alpha: 0.8),
            blurRadius: focusedGlowRadius,
            spreadRadius: 3,
          ),
        ],
      ),
      errorDecoration: BoxDecoration(
        color: backgroundColor ?? Colors.black,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: Colors.red,
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withValues(alpha: 0.8),
            blurRadius: focusedGlowRadius,
            spreadRadius: 3,
          ),
        ],
      ),
      cursorStyle: cursorStyle,
    );
  }
}

/// Cursor style options
enum CursorStyle {
  /// No visible cursor
  none,

  /// Standard vertical blinking cursor
  vertical,

  /// Bottom border cursor (underline)
  bottom,

  /// Custom cursor (user-defined)
  custom,
}

/// Completely generic OTP field theme
class OtpFieldTheme {
  /// Creates a new generic OTP field theme
  const OtpFieldTheme({
    required this.width,
    required this.height,
    required this.textStyle,
    required this.decoration,
    required this.focusedDecoration,
    required this.completedDecoration,
    required this.errorDecoration,
    required this.cursorStyle,
  });

  /// Field width
  final double width;

  /// Field height
  final double height;

  /// Text style for the field
  final TextStyle textStyle;

  /// Default decoration
  final BoxDecoration decoration;

  /// Decoration when field is focused
  final BoxDecoration focusedDecoration;

  /// Decoration when field is completed
  final BoxDecoration completedDecoration;

  /// Decoration when field has error
  final BoxDecoration errorDecoration;

  /// Cursor style
  final CursorStyle cursorStyle;

  /// Creates a copy with updated properties
  OtpFieldTheme copyWith({
    double? width,
    double? height,
    TextStyle? textStyle,
    BoxDecoration? decoration,
    BoxDecoration? focusedDecoration,
    BoxDecoration? completedDecoration,
    BoxDecoration? errorDecoration,
    CursorStyle? cursorStyle,
  }) {
    return OtpFieldTheme(
      width: width ?? this.width,
      height: height ?? this.height,
      textStyle: textStyle ?? this.textStyle,
      decoration: decoration ?? this.decoration,
      focusedDecoration: focusedDecoration ?? this.focusedDecoration,
      completedDecoration: completedDecoration ?? this.completedDecoration,
      errorDecoration: errorDecoration ?? this.errorDecoration,
      cursorStyle: cursorStyle ?? this.cursorStyle,
    );
  }
}

/// Predefined field templates with generic cursor options
class FieldTemplates {
  /// Default template with customizable cursor
  static OtpFieldTheme defaultTemplate(
      {CursorStyle cursorStyle = CursorStyle.vertical}) {
    return GenericFieldSystem.createBorderTheme(cursorStyle: cursorStyle);
  }

  /// Rounded filled template with customizable cursor
  static OtpFieldTheme roundedFilled(
      {CursorStyle cursorStyle = CursorStyle.vertical}) {
    return GenericFieldSystem.createFillTheme(cursorStyle: cursorStyle);
  }

  /// Gradient template with customizable cursor
  static OtpFieldTheme gradient(
      {CursorStyle cursorStyle = CursorStyle.vertical}) {
    return GenericFieldSystem.createGradientTheme(cursorStyle: cursorStyle);
  }

  /// Shadow template with customizable cursor
  static OtpFieldTheme shadow(
      {CursorStyle cursorStyle = CursorStyle.vertical}) {
    return GenericFieldSystem.createShadowTheme(cursorStyle: cursorStyle);
  }

  /// Glow template with customizable cursor
  static OtpFieldTheme glow({CursorStyle cursorStyle = CursorStyle.vertical}) {
    return GenericFieldSystem.createGlowTheme(cursorStyle: cursorStyle);
  }

  /// Bottom cursor template (specialized for bottom cursor style)
  static OtpFieldTheme bottomCursor(
      {CursorStyle cursorStyle = CursorStyle.bottom}) {
    return GenericFieldSystem.createBorderTheme(
      borderWidth: 0,
      borderRadius: 0,
      cursorStyle: cursorStyle,
    );
  }

  /// Custom template (user can modify everything including cursor)
  static OtpFieldTheme custom({
    double width = 56,
    double height = 56,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? completedBorderColor,
    Color? errorBorderColor,
    double borderWidth = 1,
    double borderRadius = 8,
    Color? backgroundColor,
    Color? focusedBackgroundColor,
    Color? completedBackgroundColor,
    Color? errorBackgroundColor,
    TextStyle? textStyle,
    CursorStyle cursorStyle = CursorStyle.vertical,
  }) {
    return GenericFieldSystem.createBorderTheme(
      width: width,
      height: height,
      borderColor: borderColor,
      focusedBorderColor: focusedBorderColor,
      completedBorderColor: completedBorderColor,
      errorBorderColor: errorBorderColor,
      borderWidth: borderWidth,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      focusedBackgroundColor: focusedBackgroundColor,
      completedBackgroundColor: completedBackgroundColor,
      errorBackgroundColor: errorBackgroundColor,
      textStyle: textStyle,
      cursorStyle: cursorStyle,
    );
  }

  /// Helper method to apply cursor style to any template
  static OtpFieldTheme applyCursorStyle(
      OtpFieldTheme theme, CursorStyle cursorStyle) {
    return theme.copyWith(cursorStyle: cursorStyle);
  }
}
