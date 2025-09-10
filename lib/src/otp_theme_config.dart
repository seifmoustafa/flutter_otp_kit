import 'package:flutter/material.dart';

/// Comprehensive theme configuration for OTP widget
class OtpThemeConfig {
  /// Primary color scheme
  final Color primaryColor;

  /// Secondary color scheme
  final Color secondaryColor;

  /// Background color
  final Color backgroundColor;

  /// Field background color
  final Color fieldBackgroundColor;

  /// Filled field background color
  final Color filledFieldBackgroundColor;

  /// Error color
  final Color errorColor;

  /// Success color
  final Color successColor;

  /// Warning color
  final Color warningColor;

  /// Text color
  final Color textColor;

  /// Border color
  final Color borderColor;

  /// Focused border color
  final Color focusedBorderColor;

  /// Error border color
  final Color errorBorderColor;

  /// Success border color
  final Color successBorderColor;

  /// Cursor color
  final Color cursorColor;

  /// Selection color
  final Color selectionColor;

  /// Shadow color
  final Color shadowColor;

  /// Button colors
  final OtpButtonColors buttonColors;

  /// Text styles
  final OtpTextStyles textStyles;

  /// Border configuration
  final OtpBorderConfig borderConfig;

  /// Shadow configuration
  final OtpShadowConfig shadowConfig;

  /// Gradient configuration
  final OtpGradientConfig? gradientConfig;

  const OtpThemeConfig({
    this.primaryColor = const Color(0xFF018CC3),
    this.secondaryColor = const Color(0xFF8B8B8B),
    this.backgroundColor = Colors.white,
    this.fieldBackgroundColor = Colors.white,
    this.filledFieldBackgroundColor = const Color(0xFFE3F2FD),
    this.errorColor = Colors.red,
    this.successColor = Colors.green,
    this.warningColor = Colors.orange,
    this.textColor = Colors.black87,
    this.borderColor = const Color(0xFFE0E0E0),
    this.focusedBorderColor = const Color(0xFF018CC3),
    this.errorBorderColor = Colors.red,
    this.successBorderColor = Colors.green,
    this.cursorColor = const Color(0xFF018CC3),
    this.selectionColor = const Color(0xFF018CC3),
    this.shadowColor = const Color(0xFF000000),
    this.buttonColors = const OtpButtonColors(),
    this.textStyles = const OtpTextStyles(),
    this.borderConfig = const OtpBorderConfig(),
    this.shadowConfig = const OtpShadowConfig(),
    this.gradientConfig,
  });

  /// Material Design 3 theme
  static OtpThemeConfig material3(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return OtpThemeConfig(
      primaryColor: colorScheme.primary,
      secondaryColor: colorScheme.onSurfaceVariant,
      backgroundColor: colorScheme.surface,
      fieldBackgroundColor: colorScheme.surfaceContainerHighest,
      filledFieldBackgroundColor: colorScheme.primaryContainer,
      errorColor: colorScheme.error,
      successColor: colorScheme.tertiary,
      warningColor: colorScheme.secondary,
      textColor: colorScheme.onSurface,
      borderColor: colorScheme.outline,
      focusedBorderColor: colorScheme.primary,
      errorBorderColor: colorScheme.error,
      successBorderColor: colorScheme.tertiary,
      cursorColor: colorScheme.primary,
      selectionColor: colorScheme.primary,
      shadowColor: colorScheme.shadow,
    );
  }

  /// Dark theme
  static const OtpThemeConfig dark = OtpThemeConfig(
    primaryColor: Color(0xFF64B5F6),
    secondaryColor: Color(0xFFB0BEC5),
    backgroundColor: Color(0xFF121212),
    fieldBackgroundColor: Color(0xFF1E1E1E),
    filledFieldBackgroundColor: Color(0xFF1A237E),
    errorColor: Color(0xFFCF6679),
    successColor: Color(0xFF4CAF50),
    warningColor: Color(0xFFFF9800),
    textColor: Color(0xFFFFFFFF),
    borderColor: Color(0xFF424242),
    focusedBorderColor: Color(0xFF64B5F6),
    errorBorderColor: Color(0xFFCF6679),
    successBorderColor: Color(0xFF4CAF50),
    cursorColor: Color(0xFF64B5F6),
    selectionColor: Color(0xFF64B5F6),
    shadowColor: Color(0xFF000000),
  );

  /// Light theme
  static const OtpThemeConfig light = OtpThemeConfig(
    primaryColor: Color(0xFF1976D2),
    secondaryColor: Color(0xFF757575),
    backgroundColor: Color(0xFFFFFFFF),
    fieldBackgroundColor: Color(0xFFFAFAFA),
    filledFieldBackgroundColor: Color(0xFFE3F2FD),
    errorColor: Color(0xFFD32F2F),
    successColor: Color(0xFF388E3C),
    warningColor: Color(0xFFF57C00),
    textColor: Color(0xFF212121),
    borderColor: Color(0xFFE0E0E0),
    focusedBorderColor: Color(0xFF1976D2),
    errorBorderColor: Color(0xFFD32F2F),
    successBorderColor: Color(0xFF388E3C),
    cursorColor: Color(0xFF1976D2),
    selectionColor: Color(0xFF1976D2),
    shadowColor: Color(0xFF000000),
  );
}

/// Button color configuration
class OtpButtonColors {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color disabledBackgroundColor;
  final Color disabledForegroundColor;
  final Color hoverBackgroundColor;
  final Color pressedBackgroundColor;

  const OtpButtonColors({
    this.backgroundColor = const Color(0xFF018CC3),
    this.foregroundColor = Colors.white,
    this.disabledBackgroundColor = const Color(0xFFE0E0E0),
    this.disabledForegroundColor = const Color(0xFF9E9E9E),
    this.hoverBackgroundColor = const Color(0xFF0277BD),
    this.pressedBackgroundColor = const Color(0xFF01579B),
  });
}

/// Text styles configuration
class OtpTextStyles {
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final TextStyle fieldStyle;
  final TextStyle buttonStyle;
  final TextStyle resendStyle;
  final TextStyle timerStyle;
  final TextStyle errorStyle;
  final TextStyle successStyle;

  const OtpTextStyles({
    this.titleStyle = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    this.subtitleStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xFF8B8B8B),
    ),
    this.fieldStyle = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    this.buttonStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    this.resendStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xFF018CC3),
    ),
    this.timerStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Color(0xFF8B8B8B),
    ),
    this.errorStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.red,
    ),
    this.successStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.green,
    ),
  });
}

/// Border configuration
class OtpBorderConfig {
  final double width;
  final double focusedWidth;
  final double errorWidth;
  final double successWidth;
  final BorderStyle style;
  final BorderStyle focusedStyle;
  final BorderStyle errorStyle;
  final BorderStyle successStyle;

  const OtpBorderConfig({
    this.width = 1.0,
    this.focusedWidth = 2.0,
    this.errorWidth = 2.0,
    this.successWidth = 2.0,
    this.style = BorderStyle.solid,
    this.focusedStyle = BorderStyle.solid,
    this.errorStyle = BorderStyle.solid,
    this.successStyle = BorderStyle.solid,
  });
}

/// Shadow configuration
class OtpShadowConfig {
  final bool enabled;
  final Color color;
  final double blurRadius;
  final double spreadRadius;
  final Offset offset;
  final List<BoxShadow>? customShadows;

  const OtpShadowConfig({
    this.enabled = false,
    this.color = const Color(0xFF000000),
    this.blurRadius = 4.0,
    this.spreadRadius = 0.0,
    this.offset = const Offset(0, 2),
    this.customShadows,
  });
}

/// Gradient configuration
class OtpGradientConfig {
  final List<Color> colors;
  final Alignment begin;
  final Alignment end;
  final GradientType type;

  const OtpGradientConfig({
    required this.colors,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.type = GradientType.linear,
  });
}

/// Gradient type enum
enum GradientType {
  linear,
  radial,
  sweep,
}
