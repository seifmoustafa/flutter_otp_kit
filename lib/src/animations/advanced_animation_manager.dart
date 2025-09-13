import 'package:flutter/material.dart';

/// An enhanced animation manager for OTP input with optimized transitions and animations.
///
/// This class provides a variety of animation options and effects specifically designed
/// for OTP fields, including focus animations, error animations, and transitions between fields.
class AdvancedAnimationManager {
  /// Creates an animation manager with the specified configuration.
  const AdvancedAnimationManager({
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.errorAnimationDuration = const Duration(milliseconds: 400),
    this.errorAnimationCurve = Curves.elasticIn,
    this.focusAnimationDuration = const Duration(milliseconds: 200),
    this.focusAnimationCurve = Curves.easeOutCubic,
    this.fieldTransitionDuration = const Duration(milliseconds: 150),
    this.fieldTransitionCurve = Curves.easeInOut,
    this.completionAnimationDuration = const Duration(milliseconds: 300),
    this.completionAnimationCurve = Curves.bounceOut,
  });

  /// Duration for standard animations.
  final Duration animationDuration;

  /// Curve for standard animations.
  final Curve animationCurve;

  /// Duration for error state animations.
  final Duration errorAnimationDuration;

  /// Curve for error state animations.
  final Curve errorAnimationCurve;

  /// Duration for focus animations.
  final Duration focusAnimationDuration;

  /// Curve for focus animations.
  final Curve focusAnimationCurve;

  /// Duration for field-to-field transitions.
  final Duration fieldTransitionDuration;

  /// Curve for field-to-field transitions.
  final Curve fieldTransitionCurve;

  /// Duration for completion animations.
  final Duration completionAnimationDuration;

  /// Curve for completion animations.
  final Curve completionAnimationCurve;

  /// Creates an error animation controller.
  AnimationController createErrorAnimationController(TickerProvider vsync) {
    return AnimationController(
      duration: errorAnimationDuration,
      vsync: vsync,
    );
  }

  /// Creates an error shake animation.
  Animation<double> createErrorShakeAnimation(AnimationController controller) {
    return TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: -10.0)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 25.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: -10.0, end: 10.0)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 10.0, end: 0.0)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 25.0,
      ),
    ]).animate(controller);
  }

  /// Creates a focus animation controller.
  AnimationController createFocusAnimationController(TickerProvider vsync) {
    return AnimationController(
      duration: focusAnimationDuration,
      vsync: vsync,
    );
  }

  /// Creates a focus pulse animation.
  Animation<double> createFocusPulseAnimation(AnimationController controller) {
    return TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.05)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 40.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.05, end: 1.0)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 60.0,
      ),
    ]).animate(controller);
  }

  /// Creates a completion animation controller.
  AnimationController createCompletionAnimationController(
      TickerProvider vsync) {
    return AnimationController(
      duration: completionAnimationDuration,
      vsync: vsync,
    );
  }

  /// Creates a completion animation.
  Animation<double> createCompletionAnimation(AnimationController controller) {
    return TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.1)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 30.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.1, end: 1.0)
            .chain(CurveTween(curve: Curves.bounceOut)),
        weight: 70.0,
      ),
    ]).animate(controller);
  }
}

/// A widget that provides optimized animations for OTP fields.
///
/// This widget wraps an OTP field and provides various animations based on its state.
class AnimatedOtpField extends StatefulWidget {
  /// Creates an animated OTP field.
  const AnimatedOtpField({
    Key? key,
    required this.child,
    required this.hasFocus,
    required this.hasError,
    required this.isCompleted,
    this.animationManager = const AdvancedAnimationManager(),
    this.enableFocusAnimation = true,
    this.enableErrorAnimation = true,
    this.enableCompletionAnimation = true,
  }) : super(key: key);

  /// The child widget to animate.
  final Widget child;

  /// Whether the field has focus.
  final bool hasFocus;

  /// Whether the field has an error.
  final bool hasError;

  /// Whether the field is completed.
  final bool isCompleted;

  /// The animation manager to use.
  final AdvancedAnimationManager animationManager;

  /// Whether to enable focus animations.
  final bool enableFocusAnimation;

  /// Whether to enable error animations.
  final bool enableErrorAnimation;

  /// Whether to enable completion animations.
  final bool enableCompletionAnimation;

  @override
  State<AnimatedOtpField> createState() => _AnimatedOtpFieldState();
}

class _AnimatedOtpFieldState extends State<AnimatedOtpField>
    with TickerProviderStateMixin {
  late AnimationController _errorAnimationController;
  late Animation<double> _errorAnimation;
  late AnimationController _focusAnimationController;
  late Animation<double> _focusAnimation;
  late AnimationController _completionAnimationController;
  late Animation<double> _completionAnimation;

  bool _previousHasError = false;
  bool _previousHasFocus = false;
  bool _previousIsCompleted = false;

  @override
  void initState() {
    super.initState();

    _errorAnimationController =
        widget.animationManager.createErrorAnimationController(this);
    _errorAnimation = widget.animationManager
        .createErrorShakeAnimation(_errorAnimationController);

    _focusAnimationController =
        widget.animationManager.createFocusAnimationController(this);
    _focusAnimation = widget.animationManager
        .createFocusPulseAnimation(_focusAnimationController);

    _completionAnimationController =
        widget.animationManager.createCompletionAnimationController(this);
    _completionAnimation = widget.animationManager
        .createCompletionAnimation(_completionAnimationController);

    _previousHasError = widget.hasError;
    _previousHasFocus = widget.hasFocus;
    _previousIsCompleted = widget.isCompleted;
  }

  @override
  void didUpdateWidget(AnimatedOtpField oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Handle error state change
    if (!_previousHasError && widget.hasError && widget.enableErrorAnimation) {
      _errorAnimationController.forward().then((_) {
        _errorAnimationController.reset();
      });
    }

    // Handle focus change
    if (!_previousHasFocus && widget.hasFocus && widget.enableFocusAnimation) {
      _focusAnimationController.forward();
    } else if (_previousHasFocus &&
        !widget.hasFocus &&
        widget.enableFocusAnimation) {
      _focusAnimationController.reverse();
    }

    // Handle completion
    if (!_previousIsCompleted &&
        widget.isCompleted &&
        widget.enableCompletionAnimation) {
      _completionAnimationController.forward().then((_) {
        _completionAnimationController.reset();
      });
    }

    _previousHasError = widget.hasError;
    _previousHasFocus = widget.hasFocus;
    _previousIsCompleted = widget.isCompleted;
  }

  @override
  void dispose() {
    _errorAnimationController.dispose();
    _focusAnimationController.dispose();
    _completionAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _errorAnimationController,
        _focusAnimationController,
        _completionAnimationController,
      ]),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_errorAnimation.value, 0),
          child: Transform.scale(
            scale: _focusAnimationController.isAnimating
                ? _focusAnimation.value
                : _completionAnimationController.isAnimating
                    ? _completionAnimation.value
                    : 1.0,
            child: widget.child,
          ),
        );
      },
    );
  }
}

/// A transition widget for OTP fields.
///
/// This widget provides smooth transitions between different states of an OTP field.
class OtpFieldTransition extends StatelessWidget {
  /// Creates an OTP field transition.
  const OtpFieldTransition({
    Key? key,
    required this.child,
    required this.decoration,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
  }) : super(key: key);

  /// The child widget.
  final Widget child;

  /// The decoration for the OTP field.
  final BoxDecoration decoration;

  /// The duration of the transition.
  final Duration duration;

  /// The curve of the transition.
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      curve: curve,
      decoration: decoration,
      child: child,
    );
  }
}

/// A widget that provides optimized field-to-field transitions for OTP fields.
///
/// This widget handles the animation of focus between OTP fields.
class FieldTransitionManager extends StatefulWidget {
  /// Creates a field transition manager.
  const FieldTransitionManager({
    Key? key,
    required this.children,
    required this.focusIndex,
    this.duration = const Duration(milliseconds: 150),
    this.curve = Curves.easeInOut,
  }) : super(key: key);

  /// The OTP field widgets.
  final List<Widget> children;

  /// The index of the currently focused field.
  final int focusIndex;

  /// The duration of the transition.
  final Duration duration;

  /// The curve of the transition.
  final Curve curve;

  @override
  State<FieldTransitionManager> createState() => _FieldTransitionManagerState();
}

class _FieldTransitionManagerState extends State<FieldTransitionManager>
    with TickerProviderStateMixin {
  late int _previousFocusIndex;

  @override
  void initState() {
    super.initState();
    _previousFocusIndex = widget.focusIndex;
  }

  @override
  void didUpdateWidget(FieldTransitionManager oldWidget) {
    super.didUpdateWidget(oldWidget);
    _previousFocusIndex = oldWidget.focusIndex;
  }

  @override
  Widget build(BuildContext context) {
    final direction = widget.focusIndex > _previousFocusIndex ? 1 : -1;
    final isMoving = widget.focusIndex != _previousFocusIndex;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.children.length, (index) {
        // Only animate if we're moving and this is either the previous or current focus
        final shouldAnimate = isMoving &&
            (index == widget.focusIndex || index == _previousFocusIndex);

        if (shouldAnimate) {
          return TweenAnimationBuilder<double>(
            key: ValueKey('field_$index'),
            tween: Tween<double>(
              begin: index == _previousFocusIndex
                  ? 0.0
                  : direction.toDouble() * 0.2,
              end: index == widget.focusIndex
                  ? 0.0
                  : -direction.toDouble() * 0.2,
            ),
            duration: widget.duration,
            curve: widget.curve,
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(value * 10, 0),
                child: Opacity(
                  opacity: 1.0 - value.abs() * 0.2,
                  child: child,
                ),
              );
            },
            child: widget.children[index],
          );
        } else {
          return widget.children[index];
        }
      }),
    );
  }
}
