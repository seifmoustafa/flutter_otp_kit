import 'package:flutter/material.dart';

/// Enhanced animation manager for OTP input
/// Provides comprehensive animation system for smooth transitions
class EnhancedAnimationManager {
  /// Creates a new enhanced animation manager
  const EnhancedAnimationManager({
    this.enabled = true,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.fieldTransitionDuration = const Duration(milliseconds: 150),
    this.fieldTransitionCurve = Curves.easeInOut,
    this.enableFieldStateAnimation = true,
    this.enableFieldToFieldAnimation = true,
    this.enableCursorAnimation = true,
    this.enableShakeAnimation = true,
    this.enableSuccessAnimation = true,
    this.enableErrorAnimation = true,
    this.customAnimations = const [],
  });

  /// Whether animations are enabled
  final bool enabled;

  /// Duration for main animations
  final Duration duration;

  /// Curve for main animations
  final Curve curve;

  /// Duration for field transitions
  final Duration fieldTransitionDuration;

  /// Curve for field transitions
  final Curve fieldTransitionCurve;

  /// Whether to enable field state animations
  final bool enableFieldStateAnimation;

  /// Whether to enable field-to-field animations
  final bool enableFieldToFieldAnimation;

  /// Whether to enable cursor animations
  final bool enableCursorAnimation;

  /// Whether to enable shake animations
  final bool enableShakeAnimation;

  /// Whether to enable success animations
  final bool enableSuccessAnimation;

  /// Whether to enable error animations
  final bool enableErrorAnimation;

  /// Custom animations
  final List<OtpCustomAnimation> customAnimations;

  /// Creates a copy with the given fields replaced
  EnhancedAnimationManager copyWith({
    bool? enabled,
    Duration? duration,
    Curve? curve,
    Duration? fieldTransitionDuration,
    Curve? fieldTransitionCurve,
    bool? enableFieldStateAnimation,
    bool? enableFieldToFieldAnimation,
    bool? enableCursorAnimation,
    bool? enableShakeAnimation,
    bool? enableSuccessAnimation,
    bool? enableErrorAnimation,
    List<OtpCustomAnimation>? customAnimations,
  }) {
    return EnhancedAnimationManager(
      enabled: enabled ?? this.enabled,
      duration: duration ?? this.duration,
      curve: curve ?? this.curve,
      fieldTransitionDuration:
          fieldTransitionDuration ?? this.fieldTransitionDuration,
      fieldTransitionCurve: fieldTransitionCurve ?? this.fieldTransitionCurve,
      enableFieldStateAnimation:
          enableFieldStateAnimation ?? this.enableFieldStateAnimation,
      enableFieldToFieldAnimation:
          enableFieldToFieldAnimation ?? this.enableFieldToFieldAnimation,
      enableCursorAnimation:
          enableCursorAnimation ?? this.enableCursorAnimation,
      enableShakeAnimation: enableShakeAnimation ?? this.enableShakeAnimation,
      enableSuccessAnimation:
          enableSuccessAnimation ?? this.enableSuccessAnimation,
      enableErrorAnimation: enableErrorAnimation ?? this.enableErrorAnimation,
      customAnimations: customAnimations ?? this.customAnimations,
    );
  }

  /// Creates a field state animation controller
  static AnimationController createFieldStateController({
    required TickerProvider vsync,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    return AnimationController(
      duration: duration,
      vsync: vsync,
    );
  }

  /// Creates a field transition animation
  static Animation<double> createFieldTransitionAnimation({
    required AnimationController controller,
    Curve curve = Curves.easeInOut,
    double begin = 0.0,
    double end = 1.0,
  }) {
    return Tween<double>(begin: begin, end: end).animate(
      CurvedAnimation(parent: controller, curve: curve),
    );
  }

  /// Creates a color transition animation
  static Animation<Color?> createColorTransitionAnimation({
    required AnimationController controller,
    required Color begin,
    required Color end,
    Curve curve = Curves.easeInOut,
  }) {
    return ColorTween(begin: begin, end: end).animate(
      CurvedAnimation(parent: controller, curve: curve),
    );
  }

  /// Creates a scale animation
  static Animation<double> createScaleAnimation({
    required AnimationController controller,
    double begin = 1.0,
    double end = 1.0,
    Curve curve = Curves.easeInOut,
  }) {
    return Tween<double>(begin: begin, end: end).animate(
      CurvedAnimation(parent: controller, curve: curve),
    );
  }

  /// Creates a rotation animation
  static Animation<double> createRotationAnimation({
    required AnimationController controller,
    double begin = 0.0,
    double end = 0.0,
    Curve curve = Curves.easeInOut,
  }) {
    return Tween<double>(begin: begin, end: end).animate(
      CurvedAnimation(parent: controller, curve: curve),
    );
  }

  /// Creates a shake animation
  static Animation<double> createShakeAnimation({
    required AnimationController controller,
    double intensity = 10.0,
    Curve curve = Curves.elasticIn,
  }) {
    return Tween<double>(begin: -intensity, end: intensity).animate(
      CurvedAnimation(parent: controller, curve: curve),
    );
  }

  /// Creates a pulse animation
  static Animation<double> createPulseAnimation({
    required AnimationController controller,
    double begin = 1.0,
    double end = 1.2,
    Curve curve = Curves.easeInOut,
  }) {
    return Tween<double>(begin: begin, end: end).animate(
      CurvedAnimation(parent: controller, curve: curve),
    );
  }

  /// Creates a fade animation
  static Animation<double> createFadeAnimation({
    required AnimationController controller,
    double begin = 0.0,
    double end = 1.0,
    Curve curve = Curves.easeInOut,
  }) {
    return Tween<double>(begin: begin, end: end).animate(
      CurvedAnimation(parent: controller, curve: curve),
    );
  }

  /// Creates a slide animation
  static Animation<Offset> createSlideAnimation({
    required AnimationController controller,
    Offset begin = Offset.zero,
    Offset end = Offset.zero,
    Curve curve = Curves.easeInOut,
  }) {
    return Tween<Offset>(begin: begin, end: end).animate(
      CurvedAnimation(parent: controller, curve: curve),
    );
  }

  /// Triggers a shake animation
  static Future<void> triggerShakeAnimation({
    required AnimationController controller,
    Duration duration = const Duration(milliseconds: 500),
    double intensity = 10.0,
  }) async {
    if (controller.isAnimating) return;

    controller.duration = duration;
    createShakeAnimation(
      controller: controller,
      intensity: intensity,
    );

    await controller.forward();
    await controller.reverse();
  }

  /// Triggers a success animation
  static Future<void> triggerSuccessAnimation({
    required AnimationController controller,
    Duration duration = const Duration(milliseconds: 300),
  }) async {
    if (controller.isAnimating) return;

    controller.duration = duration;
    createPulseAnimation(controller: controller);

    await controller.forward();
    await controller.reverse();
  }

  /// Triggers an error animation
  static Future<void> triggerErrorAnimation({
    required AnimationController controller,
    Duration duration = const Duration(milliseconds: 500),
  }) async {
    if (controller.isAnimating) return;

    controller.duration = duration;
    createShakeAnimation(controller: controller);

    await controller.forward();
    await controller.reverse();
  }

  /// Triggers a field state transition
  static Future<void> triggerFieldStateTransition({
    required AnimationController controller,
    Duration duration = const Duration(milliseconds: 200),
  }) async {
    if (controller.isAnimating) return;

    controller.duration = duration;
    await controller.forward();
  }

  /// Triggers a field-to-field transition
  static Future<void> triggerFieldToFieldTransition({
    required AnimationController controller,
    Duration duration = const Duration(milliseconds: 150),
  }) async {
    if (controller.isAnimating) return;

    controller.duration = duration;
    await controller.forward();
  }

  /// Triggers a cursor animation
  static Future<void> triggerCursorAnimation({
    required AnimationController controller,
    Duration duration = const Duration(milliseconds: 100),
  }) async {
    if (controller.isAnimating) return;

    controller.duration = duration;
    await controller.forward();
  }

  /// Triggers a custom animation
  static Future<void> triggerCustomAnimation({
    required AnimationController controller,
    required OtpCustomAnimation animation,
  }) async {
    if (controller.isAnimating) return;

    controller.duration = animation.duration;
    await controller.forward();
  }
}

/// Custom animation for OTP input
class OtpCustomAnimation {
  /// Creates a new custom animation
  const OtpCustomAnimation({
    required this.name,
    required this.duration,
    required this.curve,
    required this.animationBuilder,
    this.trigger = OtpAnimationTrigger.manual,
  });

  /// Name of the animation
  final String name;

  /// Duration of the animation
  final Duration duration;

  /// Curve for the animation
  final Curve curve;

  /// Builder for the animation
  final Animation<double> Function(AnimationController) animationBuilder;

  /// Trigger for the animation
  final OtpAnimationTrigger trigger;
}

/// Enum for animation triggers
enum OtpAnimationTrigger {
  manual,
  onInput,
  onDeletion,
  onCompletion,
  onError,
  onSuccess,
  onFocusChange,
  onStateChange,
}

/// Predefined animation configurations
class OtpAnimations {
  /// Default field state transition
  static const OtpCustomAnimation defaultFieldStateTransition =
      OtpCustomAnimation(
    name: 'defaultFieldStateTransition',
    duration: Duration(milliseconds: 200),
    curve: Curves.easeInOut,
    animationBuilder: _defaultFieldStateTransitionBuilder,
    trigger: OtpAnimationTrigger.onStateChange,
  );

  /// Default field-to-field transition
  static const OtpCustomAnimation defaultFieldToFieldTransition =
      OtpCustomAnimation(
    name: 'defaultFieldToFieldTransition',
    duration: Duration(milliseconds: 150),
    curve: Curves.easeInOut,
    animationBuilder: _defaultFieldToFieldTransitionBuilder,
    trigger: OtpAnimationTrigger.onFocusChange,
  );

  /// Default shake animation
  static const OtpCustomAnimation defaultShakeAnimation = OtpCustomAnimation(
    name: 'defaultShakeAnimation',
    duration: Duration(milliseconds: 500),
    curve: Curves.elasticIn,
    animationBuilder: _defaultShakeAnimationBuilder,
    trigger: OtpAnimationTrigger.onError,
  );

  /// Default success animation
  static const OtpCustomAnimation defaultSuccessAnimation = OtpCustomAnimation(
    name: 'defaultSuccessAnimation',
    duration: Duration(milliseconds: 300),
    curve: Curves.easeInOut,
    animationBuilder: _defaultSuccessAnimationBuilder,
    trigger: OtpAnimationTrigger.onSuccess,
  );

  /// Default error animation
  static const OtpCustomAnimation defaultErrorAnimation = OtpCustomAnimation(
    name: 'defaultErrorAnimation',
    duration: Duration(milliseconds: 500),
    curve: Curves.elasticIn,
    animationBuilder: _defaultErrorAnimationBuilder,
    trigger: OtpAnimationTrigger.onError,
  );

  /// Default cursor animation
  static const OtpCustomAnimation defaultCursorAnimation = OtpCustomAnimation(
    name: 'defaultCursorAnimation',
    duration: Duration(milliseconds: 100),
    curve: Curves.easeInOut,
    animationBuilder: _defaultCursorAnimationBuilder,
    trigger: OtpAnimationTrigger.onInput,
  );

  /// Default field state transition builder
  static Animation<double> _defaultFieldStateTransitionBuilder(
      AnimationController controller) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
  }

  /// Default field-to-field transition builder
  static Animation<double> _defaultFieldToFieldTransitionBuilder(
      AnimationController controller) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
  }

  /// Default shake animation builder
  static Animation<double> _defaultShakeAnimationBuilder(
      AnimationController controller) {
    return Tween<double>(begin: -10.0, end: 10.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticIn),
    );
  }

  /// Default success animation builder
  static Animation<double> _defaultSuccessAnimationBuilder(
      AnimationController controller) {
    return Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
  }

  /// Default error animation builder
  static Animation<double> _defaultErrorAnimationBuilder(
      AnimationController controller) {
    return Tween<double>(begin: -10.0, end: 10.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticIn),
    );
  }

  /// Default cursor animation builder
  static Animation<double> _defaultCursorAnimationBuilder(
      AnimationController controller) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
  }
}
