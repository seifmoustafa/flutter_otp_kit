import 'package:flutter/material.dart';

/// Comprehensive animation configuration for OTP widget
class OtpAnimationConfig {
  /// Main widget animation duration
  final Duration mainAnimationDuration;

  /// Main widget animation curve
  final Curve mainAnimationCurve;

  /// Field animation duration
  final Duration fieldAnimationDuration;

  /// Field animation curve
  final Curve fieldAnimationCurve;

  /// Error animation duration
  final Duration errorAnimationDuration;

  /// Error animation curve
  final Curve errorAnimationCurve;

  /// Success animation duration
  final Duration successAnimationDuration;

  /// Success animation curve
  final Curve successAnimationCurve;

  /// Focus animation duration
  final Duration focusAnimationDuration;

  /// Focus animation curve
  final Curve focusAnimationCurve;

  /// Enable field entrance animations
  final bool enableFieldEntranceAnimation;

  /// Enable field exit animations
  final bool enableFieldExitAnimation;

  /// Enable ripple effect on tap
  final bool enableRippleEffect;

  /// Enable bounce effect on focus
  final bool enableBounceEffect;

  /// Enable shake animation on error
  final bool enableShakeAnimation;

  /// Enable pulse animation on success
  final bool enablePulseAnimation;

  /// Stagger delay between field animations
  final Duration staggerDelay;

  /// Field-to-field transition duration
  final Duration fieldToFieldTransitionDuration;

  /// Field-to-field transition curve
  final Curve fieldToFieldTransitionCurve;

  /// Field state transition duration
  final Duration fieldStateTransitionDuration;

  /// Field state transition curve
  final Curve fieldStateTransitionCurve;

  /// Enable field-to-field animations
  final bool enableFieldToFieldAnimation;

  /// Enable field state animations
  final bool enableFieldStateAnimation;

  /// Enable progressive highlighting animations
  final bool enableProgressiveHighlighting;

  const OtpAnimationConfig({
    this.mainAnimationDuration = const Duration(milliseconds: 300),
    this.mainAnimationCurve = Curves.easeInOut,
    this.fieldAnimationDuration = const Duration(milliseconds: 200),
    this.fieldAnimationCurve = Curves.easeInOut,
    this.errorAnimationDuration = const Duration(milliseconds: 500),
    this.errorAnimationCurve = Curves.elasticOut,
    this.successAnimationDuration = const Duration(milliseconds: 400),
    this.successAnimationCurve = Curves.easeOutBack,
    this.focusAnimationDuration = const Duration(milliseconds: 150),
    this.focusAnimationCurve = Curves.easeInOut,
    this.enableFieldEntranceAnimation = true,
    this.enableFieldExitAnimation = true,
    this.enableRippleEffect = false,
    this.enableBounceEffect = true,
    this.enableShakeAnimation = true,
    this.enablePulseAnimation = true,
    this.staggerDelay = const Duration(milliseconds: 50),
    this.fieldToFieldTransitionDuration = const Duration(milliseconds: 150),
    this.fieldToFieldTransitionCurve = Curves.easeInOut,
    this.fieldStateTransitionDuration = const Duration(milliseconds: 200),
    this.fieldStateTransitionCurve = Curves.easeInOut,
    this.enableFieldToFieldAnimation = true,
    this.enableFieldStateAnimation = true,
    this.enableProgressiveHighlighting = true,
  });

  /// Default animation config
  static const OtpAnimationConfig defaultConfig = OtpAnimationConfig();

  /// Fast animation config
  static const OtpAnimationConfig fast = OtpAnimationConfig(
    mainAnimationDuration: Duration(milliseconds: 150),
    fieldAnimationDuration: Duration(milliseconds: 100),
    errorAnimationDuration: Duration(milliseconds: 200),
    successAnimationDuration: Duration(milliseconds: 200),
    focusAnimationDuration: Duration(milliseconds: 75),
  );

  /// Smooth animation config
  static const OtpAnimationConfig smooth = OtpAnimationConfig(
    mainAnimationDuration: Duration(milliseconds: 500),
    fieldAnimationDuration: Duration(milliseconds: 300),
    errorAnimationDuration: Duration(milliseconds: 800),
    successAnimationDuration: Duration(milliseconds: 600),
    focusAnimationDuration: Duration(milliseconds: 250),
    mainAnimationCurve: Curves.easeInOutCubic,
    fieldAnimationCurve: Curves.easeInOutCubic,
    errorAnimationCurve: Curves.elasticOut,
    successAnimationCurve: Curves.easeOutBack,
    focusAnimationCurve: Curves.easeInOutCubic,
  );

  /// Disabled animation config
  static const OtpAnimationConfig disabled = OtpAnimationConfig(
    mainAnimationDuration: Duration.zero,
    fieldAnimationDuration: Duration.zero,
    errorAnimationDuration: Duration.zero,
    successAnimationDuration: Duration.zero,
    focusAnimationDuration: Duration.zero,
    enableFieldEntranceAnimation: false,
    enableFieldExitAnimation: false,
    enableRippleEffect: false,
    enableBounceEffect: false,
    enableShakeAnimation: false,
    enablePulseAnimation: false,
  );
}
