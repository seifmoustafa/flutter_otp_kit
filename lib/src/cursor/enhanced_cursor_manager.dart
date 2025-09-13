import 'package:flutter/material.dart';

/// Enhanced cursor manager for OTP input
/// Provides comprehensive cursor handling and animation
class EnhancedCursorManager {
  /// Creates a new enhanced cursor manager
  const EnhancedCursorManager({
    this.enabled = true,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.showCursor = true,
    this.cursorAnimation,
    this.cursorBlinkRate = const Duration(milliseconds: 500),
    this.cursorFadeInDuration = const Duration(milliseconds: 100),
    this.cursorFadeOutDuration = const Duration(milliseconds: 100),
    this.cursorPulseAnimation = false,
    this.cursorPulseDuration = const Duration(milliseconds: 1000),
    this.cursorPulseScale = 1.2,
    this.customCursorWidget,
  });

  /// Whether cursor is enabled
  final bool enabled;

  /// Color of the cursor
  final Color? cursorColor;

  /// Height of the cursor
  final double? cursorHeight;

  /// Width of the cursor
  final double cursorWidth;

  /// Radius of the cursor
  final double? cursorRadius;

  /// Whether to show the cursor
  final bool showCursor;

  /// Animation for the cursor
  final CursorAnimation? cursorAnimation;

  /// Blink rate of the cursor
  final Duration cursorBlinkRate;

  /// Fade in duration for cursor
  final Duration cursorFadeInDuration;

  /// Fade out duration for cursor
  final Duration cursorFadeOutDuration;

  /// Whether to enable pulse animation
  final bool cursorPulseAnimation;

  /// Duration of pulse animation
  final Duration cursorPulseDuration;

  /// Scale for pulse animation
  final double cursorPulseScale;

  /// Custom cursor widget
  final Widget? customCursorWidget;

  /// Creates a copy with the given fields replaced
  EnhancedCursorManager copyWith({
    bool? enabled,
    Color? cursorColor,
    double? cursorHeight,
    double? cursorWidth,
    double? cursorRadius,
    bool? showCursor,
    CursorAnimation? cursorAnimation,
    Duration? cursorBlinkRate,
    Duration? cursorFadeInDuration,
    Duration? cursorFadeOutDuration,
    bool? cursorPulseAnimation,
    Duration? cursorPulseDuration,
    double? cursorPulseScale,
    Widget? customCursorWidget,
  }) {
    return EnhancedCursorManager(
      enabled: enabled ?? this.enabled,
      cursorColor: cursorColor ?? this.cursorColor,
      cursorHeight: cursorHeight ?? this.cursorHeight,
      cursorWidth: cursorWidth ?? this.cursorWidth,
      cursorRadius: cursorRadius ?? this.cursorRadius,
      showCursor: showCursor ?? this.showCursor,
      cursorAnimation: cursorAnimation ?? this.cursorAnimation,
      cursorBlinkRate: cursorBlinkRate ?? this.cursorBlinkRate,
      cursorFadeInDuration: cursorFadeInDuration ?? this.cursorFadeInDuration,
      cursorFadeOutDuration:
          cursorFadeOutDuration ?? this.cursorFadeOutDuration,
      cursorPulseAnimation: cursorPulseAnimation ?? this.cursorPulseAnimation,
      cursorPulseDuration: cursorPulseDuration ?? this.cursorPulseDuration,
      cursorPulseScale: cursorPulseScale ?? this.cursorPulseScale,
      customCursorWidget: customCursorWidget ?? this.customCursorWidget,
    );
  }

  /// Creates a cursor widget
  Widget createCursorWidget({
    required double fieldHeight,
    required double fieldWidth,
    Color? cursorColor,
    double? cursorHeight,
    double? cursorWidth,
    double? cursorRadius,
    bool? showCursor,
    CursorAnimation? cursorAnimation,
    Duration? cursorBlinkRate,
    Duration? cursorFadeInDuration,
    Duration? cursorFadeOutDuration,
    bool? cursorPulseAnimation,
    Duration? cursorPulseDuration,
    double? cursorPulseScale,
    Widget? customCursorWidget,
  }) {
    final isEnabled = enabled;
    final color = cursorColor ?? this.cursorColor ?? Colors.blue;
    final height = cursorHeight ?? this.cursorHeight ?? (fieldHeight - 12);
    final width = cursorWidth ?? this.cursorWidth;
    final radius = cursorRadius ?? this.cursorRadius;
    final isVisible = showCursor ?? this.showCursor;
    final animation = cursorAnimation ?? this.cursorAnimation;
    final blinkRate = cursorBlinkRate ?? this.cursorBlinkRate;
    final fadeInDuration = cursorFadeInDuration ?? this.cursorFadeInDuration;
    final fadeOutDuration = cursorFadeOutDuration ?? this.cursorFadeOutDuration;
    final pulseAnimation = cursorPulseAnimation ?? this.cursorPulseAnimation;
    final pulseDuration = cursorPulseDuration ?? this.cursorPulseDuration;
    final pulseScale = cursorPulseScale ?? this.cursorPulseScale;
    final customWidget = customCursorWidget ?? this.customCursorWidget;

    if (!isEnabled || !isVisible) {
      return const SizedBox.shrink();
    }

    if (customWidget != null) {
      return customWidget;
    }

    if (animation != null) {
      return _AnimatedCursorWidget(
        color: color,
        height: height,
        width: width,
        radius: radius,
        animation: animation,
        blinkRate: blinkRate,
        fadeInDuration: fadeInDuration,
        fadeOutDuration: fadeOutDuration,
        pulseAnimation: pulseAnimation,
        pulseDuration: pulseDuration,
        pulseScale: pulseScale,
      );
    }

    return _StaticCursorWidget(
      color: color,
      height: height,
      width: width,
      radius: radius,
    );
  }

  /// Creates a cursor configuration for TextField
  static CursorConfiguration createCursorConfiguration({
    required EnhancedCursorManager manager,
    required double fieldHeight,
    Color? cursorColor,
    double? cursorHeight,
    double? cursorWidth,
    double? cursorRadius,
  }) {
    return CursorConfiguration(
      color: cursorColor ?? manager.cursorColor ?? Colors.blue,
      height: cursorHeight ?? manager.cursorHeight ?? (fieldHeight - 12),
      width: cursorWidth ?? manager.cursorWidth,
      radius: cursorRadius ?? manager.cursorRadius,
    );
  }
}

/// Cursor configuration for TextField
class CursorConfiguration {
  /// Creates a new cursor configuration
  const CursorConfiguration({
    required this.color,
    required this.height,
    required this.width,
    this.radius,
  });

  /// Color of the cursor
  final Color color;

  /// Height of the cursor
  final double height;

  /// Width of the cursor
  final double width;

  /// Radius of the cursor
  final double? radius;
}

/// Animation for cursor
class CursorAnimation {
  /// Creates a new cursor animation
  const CursorAnimation({
    this.type = CursorAnimationType.blink,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOut,
    this.repeat = true,
    this.reverse = false,
  });

  /// Type of animation
  final CursorAnimationType type;

  /// Duration of animation
  final Duration duration;

  /// Curve for animation
  final Curve curve;

  /// Whether to repeat the animation
  final bool repeat;

  /// Whether to reverse the animation
  final bool reverse;
}

/// Enum for cursor animation types
enum CursorAnimationType {
  blink,
  fade,
  pulse,
  scale,
  rotate,
  slide,
  custom,
}

/// Static cursor widget
class _StaticCursorWidget extends StatelessWidget {
  /// Creates a new static cursor widget
  const _StaticCursorWidget({
    required this.color,
    required this.height,
    required this.width,
    this.radius,
  });

  /// Color of the cursor
  final Color color;

  /// Height of the cursor
  final double height;

  /// Width of the cursor
  final double width;

  /// Radius of the cursor
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: radius != null ? BorderRadius.circular(radius!) : null,
      ),
    );
  }
}

/// Animated cursor widget
class _AnimatedCursorWidget extends StatefulWidget {
  /// Creates a new animated cursor widget
  const _AnimatedCursorWidget({
    required this.color,
    required this.height,
    required this.width,
    this.radius,
    required this.animation,
    required this.blinkRate,
    required this.fadeInDuration,
    required this.fadeOutDuration,
    required this.pulseAnimation,
    required this.pulseDuration,
    required this.pulseScale,
  });

  /// Color of the cursor
  final Color color;

  /// Height of the cursor
  final double height;

  /// Width of the cursor
  final double width;

  /// Radius of the cursor
  final double? radius;

  /// Animation configuration
  final CursorAnimation animation;

  /// Blink rate
  final Duration blinkRate;

  /// Fade in duration
  final Duration fadeInDuration;

  /// Fade out duration
  final Duration fadeOutDuration;

  /// Whether to enable pulse animation
  final bool pulseAnimation;

  /// Duration of pulse animation
  final Duration pulseDuration;

  /// Scale for pulse animation
  final double pulseScale;

  @override
  State<_AnimatedCursorWidget> createState() => _AnimatedCursorWidgetState();
}

class _AnimatedCursorWidgetState extends State<_AnimatedCursorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animation.duration,
      vsync: this,
    );

    _setupAnimation();
    _startBlinking();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setupAnimation() {
    switch (widget.animation.type) {
      case CursorAnimationType.blink:
        _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: widget.animation.curve),
        );
        break;
      case CursorAnimationType.fade:
        _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: widget.animation.curve),
        );
        break;
      case CursorAnimationType.pulse:
        _animation = Tween<double>(begin: 1.0, end: widget.pulseScale).animate(
          CurvedAnimation(parent: _controller, curve: widget.animation.curve),
        );
        break;
      case CursorAnimationType.scale:
        _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: widget.animation.curve),
        );
        break;
      case CursorAnimationType.rotate:
        _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: widget.animation.curve),
        );
        break;
      case CursorAnimationType.slide:
        _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: widget.animation.curve),
        );
        break;
      case CursorAnimationType.custom:
        _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: widget.animation.curve),
        );
        break;
    }
  }

  void _startBlinking() {
    if (widget.animation.type == CursorAnimationType.blink) {
      _controller.repeat(reverse: true);
    } else if (widget.animation.repeat) {
      _controller.repeat(reverse: widget.animation.reverse);
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        switch (widget.animation.type) {
          case CursorAnimationType.blink:
            return Opacity(
              opacity: _animation.value,
              child: _StaticCursorWidget(
                color: widget.color,
                height: widget.height,
                width: widget.width,
                radius: widget.radius,
              ),
            );
          case CursorAnimationType.fade:
            return FadeTransition(
              opacity: _animation,
              child: _StaticCursorWidget(
                color: widget.color,
                height: widget.height,
                width: widget.width,
                radius: widget.radius,
              ),
            );
          case CursorAnimationType.pulse:
            return ScaleTransition(
              scale: _animation,
              child: _StaticCursorWidget(
                color: widget.color,
                height: widget.height,
                width: widget.width,
                radius: widget.radius,
              ),
            );
          case CursorAnimationType.scale:
            return ScaleTransition(
              scale: _animation,
              child: _StaticCursorWidget(
                color: widget.color,
                height: widget.height,
                width: widget.width,
                radius: widget.radius,
              ),
            );
          case CursorAnimationType.rotate:
            return RotationTransition(
              turns: _animation,
              child: _StaticCursorWidget(
                color: widget.color,
                height: widget.height,
                width: widget.width,
                radius: widget.radius,
              ),
            );
          case CursorAnimationType.slide:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(_animation),
              child: _StaticCursorWidget(
                color: widget.color,
                height: widget.height,
                width: widget.width,
                radius: widget.radius,
              ),
            );
          case CursorAnimationType.custom:
            return _StaticCursorWidget(
              color: widget.color,
              height: widget.height,
              width: widget.width,
              radius: widget.radius,
            );
        }
      },
    );
  }
}

/// Predefined cursor configurations
class CursorConfigurations {
  /// Default cursor configuration
  static const EnhancedCursorManager defaultCursor = EnhancedCursorManager(
    enabled: true,
    cursorColor: Colors.blue,
    cursorWidth: 2.0,
    showCursor: true,
    cursorAnimation: CursorAnimation(
      type: CursorAnimationType.blink,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      repeat: true,
      reverse: true,
    ),
  );

  /// Animated cursor configuration
  static const EnhancedCursorManager animatedCursor = EnhancedCursorManager(
    enabled: true,
    cursorColor: Colors.blue,
    cursorWidth: 2.0,
    showCursor: true,
    cursorAnimation: CursorAnimation(
      type: CursorAnimationType.pulse,
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      repeat: true,
      reverse: true,
    ),
    cursorPulseAnimation: true,
    cursorPulseDuration: Duration(milliseconds: 1000),
    cursorPulseScale: 1.2,
  );

  /// Fade cursor configuration
  static const EnhancedCursorManager fadeCursor = EnhancedCursorManager(
    enabled: true,
    cursorColor: Colors.blue,
    cursorWidth: 2.0,
    showCursor: true,
    cursorAnimation: CursorAnimation(
      type: CursorAnimationType.fade,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      repeat: true,
      reverse: true,
    ),
  );

  /// Scale cursor configuration
  static const EnhancedCursorManager scaleCursor = EnhancedCursorManager(
    enabled: true,
    cursorColor: Colors.blue,
    cursorWidth: 2.0,
    showCursor: true,
    cursorAnimation: CursorAnimation(
      type: CursorAnimationType.scale,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      repeat: true,
      reverse: true,
    ),
  );

  /// Rotate cursor configuration
  static const EnhancedCursorManager rotateCursor = EnhancedCursorManager(
    enabled: true,
    cursorColor: Colors.blue,
    cursorWidth: 2.0,
    showCursor: true,
    cursorAnimation: CursorAnimation(
      type: CursorAnimationType.rotate,
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      repeat: true,
      reverse: true,
    ),
  );

  /// Slide cursor configuration
  static const EnhancedCursorManager slideCursor = EnhancedCursorManager(
    enabled: true,
    cursorColor: Colors.blue,
    cursorWidth: 2.0,
    showCursor: true,
    cursorAnimation: CursorAnimation(
      type: CursorAnimationType.slide,
      duration: Duration(milliseconds: 350),
      curve: Curves.easeInOut,
      repeat: true,
      reverse: true,
    ),
  );
}
