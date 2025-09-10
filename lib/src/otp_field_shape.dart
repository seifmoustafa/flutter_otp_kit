import 'package:flutter/material.dart';

/// Enum for different OTP field shapes
enum OtpFieldShape {
  /// Rectangle shape
  rectangle,

  /// Rounded rectangle shape
  roundedRectangle,

  /// Circle shape
  circle,

  /// Stadium shape (pill)
  stadium,

  /// Custom shape
  custom,
}

/// Class for custom field shape configuration
class OtpFieldShapeConfig {
  /// Custom border radius for each corner
  final BorderRadius? borderRadius;

  /// Custom border radius for circle shape
  final double? circleRadius;

  /// Custom path for completely custom shapes
  final Path Function(Size size)? customPath;

  /// Border style configuration
  final OtpBorderStyle borderStyle;

  const OtpFieldShapeConfig({
    this.borderRadius,
    this.circleRadius,
    this.customPath,
    this.borderStyle = OtpBorderStyle.solid,
  });
}

/// Enum for border styles
enum OtpBorderStyle {
  /// Solid border
  solid,

  /// Dashed border
  dashed,

  /// Dotted border
  dotted,

  /// No border
  none,
}
