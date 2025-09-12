import 'package:flutter/material.dart';

/// Enum for different OTP field shapes
enum OtpFieldShape {
  /// Rectangle shape with square corners
  rectangle,

  /// Rectangle with rounded corners
  roundedRectangle,

  /// Circle shape
  circle,

  /// Stadium shape (pill) - completely rounded sides
  stadium,
  
  /// Underlined shape - only bottom border
  underlined,
  
  /// Outlined shape - material design outlined input
  outlined,

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
  
  /// Custom dash pattern for dashed border style
  final List<double>? dashPattern;
  
  /// Border sides configuration
  final BorderSide Function(Color color, double width)? borderSideBuilder;
  
  /// Create a BoxDecoration for the field
  final BoxDecoration Function(Color borderColor, Color backgroundColor, double borderWidth, double borderRadius)? decorationBuilder;

  const OtpFieldShapeConfig({
    this.borderRadius,
    this.circleRadius,
    this.customPath,
    this.borderStyle = OtpBorderStyle.solid,
    this.dashPattern,
    this.borderSideBuilder,
    this.decorationBuilder,
  });
  
  /// Creates a configuration for a specific border style
  factory OtpFieldShapeConfig.forStyle(OtpBorderStyle style) {
    switch (style) {
      case OtpBorderStyle.bottomOnly:
        return OtpFieldShapeConfig(
          borderStyle: style,
          decorationBuilder: (borderColor, backgroundColor, borderWidth, borderRadius) {
            return BoxDecoration(
              color: backgroundColor,
              border: Border(
                bottom: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
            );
          },
        );
        
      case OtpBorderStyle.topOnly:
        return OtpFieldShapeConfig(
          borderStyle: style,
          decorationBuilder: (borderColor, backgroundColor, borderWidth, borderRadius) {
            return BoxDecoration(
              color: backgroundColor,
              border: Border(
                top: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
            );
          },
        );
        
      case OtpBorderStyle.leftOnly:
        return OtpFieldShapeConfig(
          borderStyle: style,
          decorationBuilder: (borderColor, backgroundColor, borderWidth, borderRadius) {
            return BoxDecoration(
              color: backgroundColor,
              border: Border(
                left: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
            );
          },
        );
        
      case OtpBorderStyle.rightOnly:
        return OtpFieldShapeConfig(
          borderStyle: style,
          decorationBuilder: (borderColor, backgroundColor, borderWidth, borderRadius) {
            return BoxDecoration(
              color: backgroundColor,
              border: Border(
                right: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
            );
          },
        );
        
      case OtpBorderStyle.dashed:
        return OtpFieldShapeConfig(
          borderStyle: style,
          dashPattern: [6, 3],
        );
        
      case OtpBorderStyle.dotted:
        return OtpFieldShapeConfig(
          borderStyle: style,
          dashPattern: [1, 3],
        );
        
      default:
        return const OtpFieldShapeConfig(
          borderStyle: OtpBorderStyle.solid,
        );
    }
  }
}

/// Enum for border styles
enum OtpBorderStyle {
  /// Solid border all sides
  solid,

  /// Dashed border
  dashed,

  /// Dotted border
  dotted,

  /// No border
  none,
  
  /// Only bottom border
  bottomOnly,
  
  /// Only top border
  topOnly,
  
  /// Only left border
  leftOnly,
  
  /// Only right border
  rightOnly,
  
  /// Inner border
  inner,
}
