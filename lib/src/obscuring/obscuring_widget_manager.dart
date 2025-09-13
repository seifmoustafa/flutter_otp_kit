import 'package:flutter/material.dart';

/// Enhanced obscuring widget manager for OTP input
/// Provides comprehensive obscuring widget support
class ObscuringWidgetManager {
  /// Creates a new obscuring widget manager
  const ObscuringWidgetManager({
    this.enabled = false,
    this.obscuringCharacter = '•',
    this.obscuringWidget,
    this.obscuringAnimation,
    this.obscuringDelay = const Duration(milliseconds: 500),
    this.obscuringDuration = const Duration(milliseconds: 200),
  });

  /// Whether obscuring is enabled
  final bool enabled;

  /// Character to use for obscuring text
  final String obscuringCharacter;

  /// Widget to use for obscuring text (overrides obscuringCharacter)
  final Widget? obscuringWidget;

  /// Animation for obscuring
  final ObscuringAnimation? obscuringAnimation;

  /// Delay before obscuring
  final Duration obscuringDelay;

  /// Duration of obscuring animation
  final Duration obscuringDuration;

  /// Creates a copy with the given fields replaced
  ObscuringWidgetManager copyWith({
    bool? enabled,
    String? obscuringCharacter,
    Widget? obscuringWidget,
    ObscuringAnimation? obscuringAnimation,
    Duration? obscuringDelay,
    Duration? obscuringDuration,
  }) {
    return ObscuringWidgetManager(
      enabled: enabled ?? this.enabled,
      obscuringCharacter: obscuringCharacter ?? this.obscuringCharacter,
      obscuringWidget: obscuringWidget ?? this.obscuringWidget,
      obscuringAnimation: obscuringAnimation ?? this.obscuringAnimation,
      obscuringDelay: obscuringDelay ?? this.obscuringDelay,
      obscuringDuration: obscuringDuration ?? this.obscuringDuration,
    );
  }

  /// Creates an obscuring widget for the given text
  Widget createObscuringWidget(
    String text, {
    TextStyle? textStyle,
    TextAlign? textAlign,
    bool? enabled,
    String? obscuringCharacter,
    Widget? obscuringWidget,
    ObscuringAnimation? obscuringAnimation,
    Duration? obscuringDelay,
    Duration? obscuringDuration,
  }) {
    final isEnabled = enabled ?? this.enabled;
    final character = obscuringCharacter ?? this.obscuringCharacter;
    final widget = obscuringWidget ?? this.obscuringWidget;
    final animation = obscuringAnimation ?? this.obscuringAnimation;
    final delay = obscuringDelay ?? this.obscuringDelay;
    final duration = obscuringDuration ?? this.obscuringDuration;

    if (!isEnabled) {
      return Text(
        text,
        style: textStyle,
        textAlign: textAlign,
      );
    }

    if (widget != null) {
      return _createCustomObscuringWidget(
        text,
        widget,
        animation,
        delay,
        duration,
        textStyle,
        textAlign,
      );
    }

    return _createCharacterObscuringWidget(
      text,
      character,
      animation,
      delay,
      duration,
      textStyle,
      textAlign,
    );
  }

  /// Creates a custom obscuring widget
  Widget _createCustomObscuringWidget(
    String text,
    Widget obscuringWidget,
    ObscuringAnimation? animation,
    Duration delay,
    Duration duration,
    TextStyle? textStyle,
    TextAlign? textAlign,
  ) {
    if (animation != null) {
      return _AnimatedObscuringWidget(
        text: text,
        obscuringWidget: obscuringWidget,
        animation: animation,
        delay: delay,
        duration: duration,
        textStyle: textStyle,
        textAlign: textAlign,
      );
    }

    return obscuringWidget;
  }

  /// Creates a character obscuring widget
  Widget _createCharacterObscuringWidget(
    String text,
    String character,
    ObscuringAnimation? animation,
    Duration delay,
    Duration duration,
    TextStyle? textStyle,
    TextAlign? textAlign,
  ) {
    if (animation != null) {
      return _AnimatedObscuringWidget(
        text: text,
        obscuringWidget: Text(
          character * text.length,
          style: textStyle,
          textAlign: textAlign,
        ),
        animation: animation,
        delay: delay,
        duration: duration,
        textStyle: textStyle,
        textAlign: textAlign,
      );
    }

    return Text(
      character * text.length,
      style: textStyle,
      textAlign: textAlign,
    );
  }
}

/// Animation for obscuring widgets
class ObscuringAnimation {
  /// Creates a new obscuring animation
  const ObscuringAnimation({
    this.type = ObscuringAnimationType.fade,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
    this.delay = const Duration(milliseconds: 500),
  });

  /// Type of animation
  final ObscuringAnimationType type;

  /// Duration of animation
  final Duration duration;

  /// Curve for animation
  final Curve curve;

  /// Delay before animation starts
  final Duration delay;
}

/// Enum for obscuring animation types
enum ObscuringAnimationType {
  fade,
  slide,
  scale,
  rotate,
  flip,
  custom,
}

/// Animated obscuring widget
class _AnimatedObscuringWidget extends StatefulWidget {
  /// Creates a new animated obscuring widget
  const _AnimatedObscuringWidget({
    required this.text,
    required this.obscuringWidget,
    required this.animation,
    required this.delay,
    required this.duration,
    this.textStyle,
    this.textAlign,
  });

  /// Text to obscure
  final String text;

  /// Widget to use for obscuring
  final Widget obscuringWidget;

  /// Animation configuration
  final ObscuringAnimation animation;

  /// Delay before animation starts
  final Duration delay;

  /// Duration of animation
  final Duration duration;

  /// Text style
  final TextStyle? textStyle;

  /// Text alignment
  final TextAlign? textAlign;

  @override
  State<_AnimatedObscuringWidget> createState() =>
      _AnimatedObscuringWidgetState();
}

class _AnimatedObscuringWidgetState extends State<_AnimatedObscuringWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isObscured = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _setupAnimation();
    _startObscuringTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setupAnimation() {
    switch (widget.animation.type) {
      case ObscuringAnimationType.fade:
        _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: widget.animation.curve),
        );
        break;
      case ObscuringAnimationType.slide:
        _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: widget.animation.curve),
        );
        break;
      case ObscuringAnimationType.scale:
        _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: widget.animation.curve),
        );
        break;
      case ObscuringAnimationType.rotate:
        _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: widget.animation.curve),
        );
        break;
      case ObscuringAnimationType.flip:
        _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: widget.animation.curve),
        );
        break;
      case ObscuringAnimationType.custom:
        _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: widget.animation.curve),
        );
        break;
    }
  }

  void _startObscuringTimer() {
    Future.delayed(widget.delay, () {
      if (mounted) {
        setState(() {
          _isObscured = true;
        });
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isObscured) {
      return Text(
        widget.text,
        style: widget.textStyle,
        textAlign: widget.textAlign,
      );
    }

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        switch (widget.animation.type) {
          case ObscuringAnimationType.fade:
            return FadeTransition(
              opacity: _animation,
              child: widget.obscuringWidget,
            );
          case ObscuringAnimationType.slide:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(_animation),
              child: widget.obscuringWidget,
            );
          case ObscuringAnimationType.scale:
            return ScaleTransition(
              scale: _animation,
              child: widget.obscuringWidget,
            );
          case ObscuringAnimationType.rotate:
            return RotationTransition(
              turns: _animation,
              child: widget.obscuringWidget,
            );
          case ObscuringAnimationType.flip:
            return AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(_animation.value * 3.14159),
                  child: widget.obscuringWidget,
                );
              },
            );
          case ObscuringAnimationType.custom:
            return widget.obscuringWidget;
        }
      },
    );
  }
}

/// Predefined obscuring widgets
class ObscuringWidgets {
  /// Default dot obscuring widget
  static Widget dot({String character = '•', TextStyle? style}) {
    return Text(character, style: style);
  }

  /// Default asterisk obscuring widget
  static Widget asterisk({String character = '*', TextStyle? style}) {
    return Text(character, style: style);
  }

  /// Default circle obscuring widget
  static Widget circle({Color? color, double? size}) {
    return Container(
      width: size ?? 8,
      height: size ?? 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? Colors.black,
      ),
    );
  }

  /// Default square obscuring widget
  static Widget square({Color? color, double? size}) {
    return Container(
      width: size ?? 8,
      height: size ?? 8,
      decoration: BoxDecoration(
        color: color ?? Colors.black,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  /// Default diamond obscuring widget
  static Widget diamond({Color? color, double? size}) {
    return Container(
      width: size ?? 8,
      height: size ?? 8,
      decoration: BoxDecoration(
        color: color ?? Colors.black,
        borderRadius: BorderRadius.circular(2),
      ),
      transform: Matrix4.rotationZ(0.785398), // 45 degrees
    );
  }

  /// Default star obscuring widget
  static Widget star({Color? color, double? size}) {
    return Icon(
      Icons.star,
      color: color ?? Colors.black,
      size: size ?? 16,
    );
  }

  /// Default heart obscuring widget
  static Widget heart({Color? color, double? size}) {
    return Icon(
      Icons.favorite,
      color: color ?? Colors.red,
      size: size ?? 16,
    );
  }

  /// Default lock obscuring widget
  static Widget lock({Color? color, double? size}) {
    return Icon(
      Icons.lock,
      color: color ?? Colors.black,
      size: size ?? 16,
    );
  }

  /// Default key obscuring widget
  static Widget key({Color? color, double? size}) {
    return Icon(
      Icons.vpn_key,
      color: color ?? Colors.black,
      size: size ?? 16,
    );
  }

  /// Default shield obscuring widget
  static Widget shield({Color? color, double? size}) {
    return Icon(
      Icons.security,
      color: color ?? Colors.black,
      size: size ?? 16,
    );
  }
}
