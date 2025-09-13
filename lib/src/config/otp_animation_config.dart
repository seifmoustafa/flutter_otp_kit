import 'package:flutter/material.dart';

/// Configuration for OTP animations
class OtpAnimationConfig {
  /// Creates a new animation configuration
  const OtpAnimationConfig({
    this.enableAnimation = true,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.enableFieldStateAnimation = true,
    this.enableFieldToFieldAnimation = true,
    this.fieldTransitionDuration = const Duration(milliseconds: 150),
    this.fieldTransitionCurve = Curves.easeInOut,
    this.transitionHighlightColor,
  });

  /// Whether to enable animations
  final bool enableAnimation;

  /// Duration for the main animation
  final Duration animationDuration;

  /// Curve for the main animation
  final Curve animationCurve;

  /// Whether to enable field state animation
  final bool enableFieldStateAnimation;

  /// Whether to enable field-to-field animation
  final bool enableFieldToFieldAnimation;

  /// Duration for field transition animation
  final Duration fieldTransitionDuration;

  /// Curve for field transition animation
  final Curve fieldTransitionCurve;

  /// Color for transition highlight
  final Color? transitionHighlightColor;

  /// Creates a copy of this object with the given fields replaced with the new values
  OtpAnimationConfig copyWith({
    bool? enableAnimation,
    Duration? animationDuration,
    Curve? animationCurve,
    bool? enableFieldStateAnimation,
    bool? enableFieldToFieldAnimation,
    Duration? fieldTransitionDuration,
    Curve? fieldTransitionCurve,
    Color? transitionHighlightColor,
  }) {
    return OtpAnimationConfig(
      enableAnimation: enableAnimation ?? this.enableAnimation,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      enableFieldStateAnimation:
          enableFieldStateAnimation ?? this.enableFieldStateAnimation,
      enableFieldToFieldAnimation:
          enableFieldToFieldAnimation ?? this.enableFieldToFieldAnimation,
      fieldTransitionDuration:
          fieldTransitionDuration ?? this.fieldTransitionDuration,
      fieldTransitionCurve: fieldTransitionCurve ?? this.fieldTransitionCurve,
      transitionHighlightColor:
          transitionHighlightColor ?? this.transitionHighlightColor,
    );
  }
}
