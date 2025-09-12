import 'package:flutter/material.dart';

/// Represents the colors for an OTP field based on its state
class FieldColors {
  /// Creates a new set of field colors
  const FieldColors({
    required this.borderColor,
    required this.backgroundColor,
    required this.textColor,
  });

  /// Color for the field border
  final Color borderColor;

  /// Color for the field background
  final Color backgroundColor;

  /// Color for the field text
  final Color textColor;

  /// Creates a copy of this object with the given fields replaced with the new values
  FieldColors copyWith({
    Color? borderColor,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return FieldColors(
      borderColor: borderColor ?? this.borderColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }
}
