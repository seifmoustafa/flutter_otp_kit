import 'package:flutter/material.dart';
import '../otp_field_shape.dart';

/// Configuration for OTP field appearance and behavior
class OtpFieldConfig {
  /// Creates a new OTP field configuration
  const OtpFieldConfig({
    this.fieldWidth = 55.125,
    this.fieldHeight = 60.731,
    this.borderRadius = 17.752,
    this.borderWidth = 1.869,
    this.primaryColor = const Color(0xFF018CC3),
    this.secondaryColor = const Color(0xFF8B8B8B),
    this.backgroundColor = Colors.white,
    this.fieldStyle,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth = 1.0,
    this.enableShadow = false,
    this.shadowColor,
    this.shadowBlurRadius = 10.0,
    this.shadowSpreadRadius = 0.0,
    this.fieldShape = OtpFieldShape.roundedRectangle,
    this.fieldShapeConfig,
    this.enableGradient = false,
    this.gradientConfig,
    this.enableCustomDecoration = false,
    this.customDecoration,
  });

  /// Width of the field
  final double fieldWidth;

  /// Height of the field
  final double fieldHeight;

  /// Border radius of the field
  final double borderRadius;

  /// Border width of the field
  final double borderWidth;

  /// Primary color for the field
  final Color primaryColor;

  /// Secondary color for the field
  final Color secondaryColor;

  /// Background color for the field
  final Color backgroundColor;

  /// Text style for the field
  final TextStyle? fieldStyle;

  /// Color of the cursor
  final Color? cursorColor;

  /// Height of the cursor
  final double? cursorHeight;

  /// Width of the cursor
  final double cursorWidth;

  /// Whether to enable shadow for the field
  final bool enableShadow;

  /// Color of the shadow
  final Color? shadowColor;

  /// Blur radius of the shadow
  final double shadowBlurRadius;

  /// Spread radius of the shadow
  final double shadowSpreadRadius;

  /// Shape of the field
  final OtpFieldShape fieldShape;

  /// Configuration for custom field shape
  final OtpFieldShapeConfig? fieldShapeConfig;

  /// Whether to enable gradient background
  final bool enableGradient;

  /// Configuration for gradient background
  final OtpGradientConfig? gradientConfig;

  /// Whether to enable custom decoration
  final bool enableCustomDecoration;

  /// Custom decoration for the field
  final BoxDecoration? customDecoration;

  /// Creates a copy of this object with the given fields replaced with the new values
  OtpFieldConfig copyWith({
    double? fieldWidth,
    double? fieldHeight,
    double? borderRadius,
    double? borderWidth,
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    TextStyle? fieldStyle,
    Color? cursorColor,
    double? cursorHeight,
    double? cursorWidth,
    bool? enableShadow,
    Color? shadowColor,
    double? shadowBlurRadius,
    double? shadowSpreadRadius,
    OtpFieldShape? fieldShape,
    OtpFieldShapeConfig? fieldShapeConfig,
    bool? enableGradient,
    OtpGradientConfig? gradientConfig,
    bool? enableCustomDecoration,
    BoxDecoration? customDecoration,
  }) {
    return OtpFieldConfig(
      fieldWidth: fieldWidth ?? this.fieldWidth,
      fieldHeight: fieldHeight ?? this.fieldHeight,
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      fieldStyle: fieldStyle ?? this.fieldStyle,
      cursorColor: cursorColor ?? this.cursorColor,
      cursorHeight: cursorHeight ?? this.cursorHeight,
      cursorWidth: cursorWidth ?? this.cursorWidth,
      enableShadow: enableShadow ?? this.enableShadow,
      shadowColor: shadowColor ?? this.shadowColor,
      shadowBlurRadius: shadowBlurRadius ?? this.shadowBlurRadius,
      shadowSpreadRadius: shadowSpreadRadius ?? this.shadowSpreadRadius,
      fieldShape: fieldShape ?? this.fieldShape,
      fieldShapeConfig: fieldShapeConfig ?? this.fieldShapeConfig,
      enableGradient: enableGradient ?? this.enableGradient,
      gradientConfig: gradientConfig ?? this.gradientConfig,
      enableCustomDecoration: enableCustomDecoration ?? this.enableCustomDecoration,
      customDecoration: customDecoration ?? this.customDecoration,
    );
  }
}

/// Configuration for gradient background
class OtpGradientConfig {
  /// Creates a new gradient configuration
  const OtpGradientConfig({
    required this.colors,
    this.type = GradientType.linear,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.center,
    this.radius = 0.5,
    this.stops,
    this.tileMode = TileMode.clamp,
    this.focal,
    this.focalRadius = 0.0,
  });

  /// Colors for the gradient
  final List<Color> colors;

  /// Type of gradient
  final GradientType type;

  /// Start alignment for linear gradient
  final Alignment begin;

  /// End alignment for linear gradient
  final Alignment end;

  /// Center point for radial gradient
  final Alignment? center;

  /// Radius for radial gradient
  final double radius;

  /// Stops for the gradient
  final List<double>? stops;

  /// Tile mode for the gradient
  final TileMode tileMode;

  /// Focal point for radial gradient
  final Alignment? focal;

  /// Focal radius for radial gradient
  final double focalRadius;

  /// Creates a copy of this object with the given fields replaced with the new values
  OtpGradientConfig copyWith({
    List<Color>? colors,
    GradientType? type,
    Alignment? begin,
    Alignment? end,
    Alignment? center,
    double? radius,
    List<double>? stops,
    TileMode? tileMode,
    Alignment? focal,
    double? focalRadius,
  }) {
    return OtpGradientConfig(
      colors: colors ?? this.colors,
      type: type ?? this.type,
      begin: begin ?? this.begin,
      end: end ?? this.end,
      center: center ?? this.center,
      radius: radius ?? this.radius,
      stops: stops ?? this.stops,
      tileMode: tileMode ?? this.tileMode,
      focal: focal ?? this.focal,
      focalRadius: focalRadius ?? this.focalRadius,
    );
  }
}

/// Type of gradient
enum GradientType {
  /// Linear gradient
  linear,

  /// Radial gradient
  radial,

  /// Sweep gradient
  sweep,
}
