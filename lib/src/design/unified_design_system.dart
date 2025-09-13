import 'package:flutter/material.dart';

/// Unified design system for flutter_otp_kit
/// Handles all field customization and theming internally
class UnifiedDesignSystem {
  /// Creates a default theme
  static OtpFieldTheme defaultTheme() {
    return OtpFieldTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      focusedDecoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      completedDecoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.green.shade50,
      ),
      errorDecoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.red.shade50,
      ),
    );
  }

  /// Creates a rounded filled theme
  static OtpFieldTheme roundedFilledTheme({
    Color? fillColor,
    Color? textColor,
    double? borderRadius,
  }) {
    return OtpFieldTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textColor ?? Colors.white,
      ),
      decoration: BoxDecoration(
        color: fillColor ?? Colors.blue.shade600,
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
      ),
      focusedDecoration: BoxDecoration(
        color: fillColor ?? Colors.blue.shade700,
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        boxShadow: [
          BoxShadow(
            color: (fillColor ?? Colors.blue.shade600).withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      completedDecoration: BoxDecoration(
        color: Colors.green.shade600,
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
      ),
      errorDecoration: BoxDecoration(
        color: Colors.red.shade600,
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
      ),
    );
  }

  /// Creates a rounded theme with shadow
  static OtpFieldTheme roundedWithShadowTheme({
    Color? borderColor,
    Color? textColor,
    double? borderRadius,
  }) {
    return OtpFieldTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textColor ?? Colors.black87,
      ),
      decoration: BoxDecoration(
        border:
            Border.all(color: borderColor ?? Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      focusedDecoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      completedDecoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        color: Colors.green.shade50,
        boxShadow: [
          BoxShadow(
            color: Colors.green.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      errorDecoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        color: Colors.red.shade50,
        boxShadow: [
          BoxShadow(
            color: Colors.red.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    );
  }

  /// Creates a bottom cursor theme
  static OtpFieldTheme bottomCursorTheme({
    Color? cursorColor,
    Color? textColor,
  }) {
    return OtpFieldTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textColor ?? Colors.black87,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 2,
          ),
        ),
        color: Colors.transparent,
      ),
      focusedDecoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: cursorColor ?? Colors.blue,
            width: 3,
          ),
        ),
        color: Colors.transparent,
      ),
      completedDecoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.green,
            width: 3,
          ),
        ),
        color: Colors.transparent,
      ),
      errorDecoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.red,
            width: 3,
          ),
        ),
        color: Colors.transparent,
      ),
    );
  }

  /// Creates a dashed theme
  static OtpFieldTheme dashedTheme({
    Color? dashColor,
    Color? textColor,
  }) {
    return OtpFieldTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textColor ?? Colors.black87,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: dashColor ?? Colors.grey.shade300,
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
      ),
      focusedDecoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue.shade50,
      ),
      completedDecoration: BoxDecoration(
        border: Border.all(
          color: Colors.green,
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(8),
        color: Colors.green.shade50,
      ),
      errorDecoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(8),
        color: Colors.red.shade50,
      ),
    );
  }

  /// Creates a gradient theme
  static OtpFieldTheme gradientTheme({
    List<Color>? gradientColors,
    Color? textColor,
  }) {
    final colors = gradientColors ?? [Colors.purple, Colors.blue];
    return OtpFieldTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textColor ?? Colors.white,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: colors.first.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      focusedDecoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors.map((c) => c.withValues(alpha: 0.8)).toList(),
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: colors.first.withValues(alpha: 0.5),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      completedDecoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.green, Colors.greenAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      errorDecoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.red, Colors.redAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  /// Creates a neon glow theme
  static OtpFieldTheme neonGlowTheme({
    Color? glowColor,
    Color? textColor,
  }) {
    return OtpFieldTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textColor ?? Colors.white,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: glowColor ?? Colors.cyan, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: (glowColor ?? Colors.cyan).withValues(alpha: 0.5),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      focusedDecoration: BoxDecoration(
        border: Border.all(color: glowColor ?? Colors.cyan, width: 3),
        borderRadius: BorderRadius.circular(8),
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: (glowColor ?? Colors.cyan).withValues(alpha: 0.8),
            blurRadius: 15,
            spreadRadius: 3,
          ),
        ],
      ),
      completedDecoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 3),
        borderRadius: BorderRadius.circular(8),
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.green.withValues(alpha: 0.8),
            blurRadius: 15,
            spreadRadius: 3,
          ),
        ],
      ),
      errorDecoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 3),
        borderRadius: BorderRadius.circular(8),
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.red.withValues(alpha: 0.8),
            blurRadius: 15,
            spreadRadius: 3,
          ),
        ],
      ),
    );
  }

  /// Creates a glassmorphism theme
  static OtpFieldTheme glassmorphismTheme({
    Color? glassColor,
    Color? textColor,
  }) {
    return OtpFieldTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textColor ?? Colors.white,
      ),
      decoration: BoxDecoration(
        color: (glassColor ?? Colors.white).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      focusedDecoration: BoxDecoration(
        color: (glassColor ?? Colors.white).withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.3),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      completedDecoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.green.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      errorDecoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.red.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
    );
  }

  /// Creates a Material 3 theme
  static OtpFieldTheme material3Theme({
    Color? primaryColor,
    Color? textColor,
  }) {
    return OtpFieldTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: textColor ?? Colors.black87,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      focusedDecoration: BoxDecoration(
        color: (primaryColor ?? Colors.blue).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryColor ?? Colors.blue, width: 2),
      ),
      completedDecoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green, width: 2),
      ),
      errorDecoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.red, width: 2),
      ),
    );
  }

  /// Creates a dark theme
  static OtpFieldTheme darkTheme({
    Color? accentColor,
    Color? textColor,
  }) {
    return OtpFieldTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textColor ?? Colors.white,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade600, width: 1),
      ),
      focusedDecoration: BoxDecoration(
        color: Colors.grey.shade700,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: accentColor ?? Colors.blue, width: 2),
        boxShadow: [
          BoxShadow(
            color: (accentColor ?? Colors.blue).withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      completedDecoration: BoxDecoration(
        color: Colors.green.shade800,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 2),
      ),
      errorDecoration: BoxDecoration(
        color: Colors.red.shade800,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red, width: 2),
      ),
    );
  }

  /// Creates a cursorless theme - no visible cursor, just focus indication
  static OtpFieldTheme cursorlessTheme({
    Color? borderColor,
    Color? textColor,
    Color? focusColor,
  }) {
    return OtpFieldTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textColor ?? Colors.black87,
      ),
      decoration: BoxDecoration(
        border:
            Border.all(color: borderColor ?? Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      focusedDecoration: BoxDecoration(
        border: Border.all(color: focusColor ?? Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: (focusColor ?? Colors.blue).withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      completedDecoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.green.shade50,
      ),
      errorDecoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.red.shade50,
      ),
    );
  }
}

/// OTP field theme configuration
class OtpFieldTheme {
  /// Creates a new OTP field theme
  const OtpFieldTheme({
    required this.width,
    required this.height,
    required this.textStyle,
    required this.decoration,
    required this.focusedDecoration,
    required this.completedDecoration,
    required this.errorDecoration,
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

  /// Creates a copy with updated properties
  OtpFieldTheme copyWith({
    double? width,
    double? height,
    TextStyle? textStyle,
    BoxDecoration? decoration,
    BoxDecoration? focusedDecoration,
    BoxDecoration? completedDecoration,
    BoxDecoration? errorDecoration,
  }) {
    return OtpFieldTheme(
      width: width ?? this.width,
      height: height ?? this.height,
      textStyle: textStyle ?? this.textStyle,
      decoration: decoration ?? this.decoration,
      focusedDecoration: focusedDecoration ?? this.focusedDecoration,
      completedDecoration: completedDecoration ?? this.completedDecoration,
      errorDecoration: errorDecoration ?? this.errorDecoration,
    );
  }
}

/// OTP design style options
enum OtpDesignStyle {
  defaultStyle,
  roundedFilled,
  roundedWithShadow,
  bottomCursor,
  dashed,
  gradient,
  neonGlow,
  glassmorphism,
  material3,
  dark,
  cursorless,
}

/// Predefined OTP design themes
class OtpDesignThemes {
  /// Default theme
  static final defaultTheme = UnifiedDesignSystem.defaultTheme();

  /// Rounded filled theme
  static final roundedFilled = UnifiedDesignSystem.roundedFilledTheme();

  /// Rounded with shadow theme
  static final roundedWithShadow = UnifiedDesignSystem.roundedWithShadowTheme();

  /// Bottom cursor theme
  static final bottomCursor = UnifiedDesignSystem.bottomCursorTheme();

  /// Dashed theme
  static final dashed = UnifiedDesignSystem.dashedTheme();

  /// Gradient theme
  static final gradient = UnifiedDesignSystem.gradientTheme();

  /// Neon glow theme
  static final neonGlow = UnifiedDesignSystem.neonGlowTheme();

  /// Glassmorphism theme
  static final glassmorphism = UnifiedDesignSystem.glassmorphismTheme();

  /// Material 3 theme
  static final material3 = UnifiedDesignSystem.material3Theme();

  /// Dark theme
  static final dark = UnifiedDesignSystem.darkTheme();

  /// Cursorless theme
  static final cursorless = UnifiedDesignSystem.cursorlessTheme();
}

/// Field customization options
class FieldCustomizationOptions {
  /// Creates field customization options
  const FieldCustomizationOptions({
    this.enableAnimatedDecoration = false,
    this.enableCursorAnimation = false,
    this.enableObscuringAnimation = false,
    this.enableHapticFeedback = false,
    this.enableFieldAnimation = false,
    this.enableGradientBorder = false,
    this.enableShadowAnimation = false,
    this.enableRippleEffect = false,
    this.animationDuration = const Duration(milliseconds: 200),
    this.fieldAnimationType = FieldAnimationType.none,
    this.cursorBlinkDuration = const Duration(milliseconds: 500),
    this.obscuringAnimationDuration = const Duration(milliseconds: 300),
    this.gradientColors = const [Colors.blue, Colors.purple],
    this.shadowColor = Colors.grey,
    this.shadowBlurRadius = 4.0,
    this.rippleColor = Colors.blue,
  });

  /// Enable animated decoration switching
  final bool enableAnimatedDecoration;

  /// Enable cursor animation
  final bool enableCursorAnimation;

  /// Enable obscuring animation
  final bool enableObscuringAnimation;

  /// Enable haptic feedback
  final bool enableHapticFeedback;

  /// Enable field animation
  final bool enableFieldAnimation;

  /// Enable gradient border
  final bool enableGradientBorder;

  /// Enable shadow animation
  final bool enableShadowAnimation;

  /// Enable ripple effect
  final bool enableRippleEffect;

  /// Animation duration
  final Duration animationDuration;

  /// Field animation type
  final FieldAnimationType fieldAnimationType;

  /// Cursor blink duration
  final Duration cursorBlinkDuration;

  /// Obscuring animation duration
  final Duration obscuringAnimationDuration;

  /// Gradient colors
  final List<Color> gradientColors;

  /// Shadow color
  final Color shadowColor;

  /// Shadow blur radius
  final double shadowBlurRadius;

  /// Ripple color
  final Color rippleColor;

  /// Creates a copy with updated properties
  FieldCustomizationOptions copyWith({
    bool? enableAnimatedDecoration,
    bool? enableCursorAnimation,
    bool? enableObscuringAnimation,
    bool? enableHapticFeedback,
    bool? enableFieldAnimation,
    bool? enableGradientBorder,
    bool? enableShadowAnimation,
    bool? enableRippleEffect,
    Duration? animationDuration,
    FieldAnimationType? fieldAnimationType,
    Duration? cursorBlinkDuration,
    Duration? obscuringAnimationDuration,
    List<Color>? gradientColors,
    Color? shadowColor,
    double? shadowBlurRadius,
    Color? rippleColor,
  }) {
    return FieldCustomizationOptions(
      enableAnimatedDecoration:
          enableAnimatedDecoration ?? this.enableAnimatedDecoration,
      enableCursorAnimation:
          enableCursorAnimation ?? this.enableCursorAnimation,
      enableObscuringAnimation:
          enableObscuringAnimation ?? this.enableObscuringAnimation,
      enableHapticFeedback: enableHapticFeedback ?? this.enableHapticFeedback,
      enableFieldAnimation: enableFieldAnimation ?? this.enableFieldAnimation,
      enableGradientBorder: enableGradientBorder ?? this.enableGradientBorder,
      enableShadowAnimation:
          enableShadowAnimation ?? this.enableShadowAnimation,
      enableRippleEffect: enableRippleEffect ?? this.enableRippleEffect,
      animationDuration: animationDuration ?? this.animationDuration,
      fieldAnimationType: fieldAnimationType ?? this.fieldAnimationType,
      cursorBlinkDuration: cursorBlinkDuration ?? this.cursorBlinkDuration,
      obscuringAnimationDuration:
          obscuringAnimationDuration ?? this.obscuringAnimationDuration,
      gradientColors: gradientColors ?? this.gradientColors,
      shadowColor: shadowColor ?? this.shadowColor,
      shadowBlurRadius: shadowBlurRadius ?? this.shadowBlurRadius,
      rippleColor: rippleColor ?? this.rippleColor,
    );
  }
}

/// Field animation types
enum FieldAnimationType {
  none,
  scale,
  rotate,
  slide,
  fade,
}
