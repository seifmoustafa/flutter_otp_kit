import 'package:flutter/material.dart';

/// Configuration for OTP animations
/// Configuration for OTP animations
///
/// Controls global widget animation and per-field animations for both
/// normal state transitions (fill/completed) and error states.
class OtpAnimationConfig {
  /// Creates a new animation configuration
  const OtpAnimationConfig({
    this.enableAnimation = false,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.enableFieldStateAnimation = false,
    this.enableFieldToFieldAnimation = false,
    this.fieldTransitionDuration = const Duration(milliseconds: 150),
    this.fieldTransitionCurve = Curves.easeInOut,
    this.transitionHighlightColor,

    // Field fill/completion animation
    this.fieldFillAnimationType = FieldFillAnimationType.scale,
    this.fieldFillSlideOffset = const Offset(6, 0),
    this.fieldFillRotationRadians = 0.10,

    // Error field animation
    this.errorFieldAnimationType = ErrorFieldAnimationType.shake,
    this.errorShakeAmplitude = 4.0,
    this.errorShakeFrequency = 10.0,

    // Cursor animation configuration
    this.enableCursorAnimation = false,
    this.cursorBlinkDuration = const Duration(milliseconds: 1000),
    this.cursorColor = const Color(0xFF2196F3),
    this.cursorWidth = 2.0,

    // Smooth state transitions
    this.stateTransitionDuration = const Duration(milliseconds: 200),
    this.stateTransitionCurve = Curves.easeInOut,

    // Decoration animations
    this.enableDecorationAnimation = false,
    this.decorationAnimationDuration = const Duration(milliseconds: 250),
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

  /// Field fill/completed animation type
  final FieldFillAnimationType fieldFillAnimationType;

  /// Offset used for slide animations (direction and magnitude)
  final Offset fieldFillSlideOffset;

  /// Rotation (in radians) used for rotation animations
  final double fieldFillRotationRadians;

  /// Error animation type for fields
  final ErrorFieldAnimationType errorFieldAnimationType;

  /// Amplitude (logical pixels) for shake animation on error
  final double errorShakeAmplitude;

  /// Frequency factor for shake oscillation
  final double errorShakeFrequency;

  /// Whether to enable cursor animation
  final bool enableCursorAnimation;

  /// Duration for cursor blink animation
  final Duration cursorBlinkDuration;

  /// Color of the cursor
  final Color cursorColor;

  /// Width of the cursor
  final double cursorWidth;

  /// Duration for smooth state transitions
  final Duration stateTransitionDuration;

  /// Curve for state transitions
  final Curve stateTransitionCurve;

  /// Whether to enable decoration animations
  final bool enableDecorationAnimation;

  /// Duration for decoration animations
  final Duration decorationAnimationDuration;

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
    FieldFillAnimationType? fieldFillAnimationType,
    Offset? fieldFillSlideOffset,
    double? fieldFillRotationRadians,
    ErrorFieldAnimationType? errorFieldAnimationType,
    double? errorShakeAmplitude,
    double? errorShakeFrequency,
    bool? enableCursorAnimation,
    Duration? cursorBlinkDuration,
    Color? cursorColor,
    double? cursorWidth,
    Duration? stateTransitionDuration,
    Curve? stateTransitionCurve,
    bool? enableDecorationAnimation,
    Duration? decorationAnimationDuration,
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
      fieldFillAnimationType:
          fieldFillAnimationType ?? this.fieldFillAnimationType,
      fieldFillSlideOffset: fieldFillSlideOffset ?? this.fieldFillSlideOffset,
      fieldFillRotationRadians:
          fieldFillRotationRadians ?? this.fieldFillRotationRadians,
      errorFieldAnimationType:
          errorFieldAnimationType ?? this.errorFieldAnimationType,
      errorShakeAmplitude: errorShakeAmplitude ?? this.errorShakeAmplitude,
      errorShakeFrequency: errorShakeFrequency ?? this.errorShakeFrequency,
      enableCursorAnimation:
          enableCursorAnimation ?? this.enableCursorAnimation,
      cursorBlinkDuration: cursorBlinkDuration ?? this.cursorBlinkDuration,
      cursorColor: cursorColor ?? this.cursorColor,
      cursorWidth: cursorWidth ?? this.cursorWidth,
      stateTransitionDuration:
          stateTransitionDuration ?? this.stateTransitionDuration,
      stateTransitionCurve: stateTransitionCurve ?? this.stateTransitionCurve,
      enableDecorationAnimation:
          enableDecorationAnimation ?? this.enableDecorationAnimation,
      decorationAnimationDuration:
          decorationAnimationDuration ?? this.decorationAnimationDuration,
    );
  }
}

/// Animation types applied when a field transitions to filled/completed
enum FieldFillAnimationType {
  /// No transform animation
  none,

  /// Scale slightly then settle
  scale,

  /// Rotate slightly then settle
  rotate,

  /// Slide from left towards place
  slideLeft,

  /// Slide from right towards place
  slideRight,

  /// Slide from top towards place
  slideUp,

  /// Slide from bottom towards place
  slideDown,

  /// Auto-detect text direction and slide accordingly (LTR: slideLeft, RTL: slideRight)
  autoSlide,
}

/// Animation types applied when a field enters error state
enum ErrorFieldAnimationType {
  /// No transform animation
  none,

  /// Horizontal shake - aggressive side-to-side movement
  shake,

  /// Scale down dramatically then bounce back
  scale,

  /// Aggressive rotation wobble
  rotate,

  /// Vertical bounce - up and down movement
  bounce,

  /// Pulse effect - scale in and out rapidly
  pulse,

  /// Wiggle - combination of rotation and translation
  wiggle,

  /// Slide down and back up
  slideDown,

  /// Slide up and back down
  slideUp,

  /// Slide left and back
  slideLeft,

  /// Slide right and back
  slideRight,
}
