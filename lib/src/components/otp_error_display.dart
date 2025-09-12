import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../config/otp_error_config.dart';
import 'dart:math' as math;

/// Widget for displaying OTP error messages with animation and styling options
class OtpErrorDisplay extends StatefulWidget {
  /// Creates a new OTP error display
  const OtpErrorDisplay({
    Key? key,
    this.errorText,
    this.errorWidget,
    this.errorStyle,
    this.errorColor = Colors.red,
    this.topSpacing = 8.0,
    this.leftSpacing = 0.0,
    this.rightSpacing = 0.0,
    this.bottomSpacing = 0.0,
    this.alignment = ErrorAlignment.bottom,
    this.animationType = ErrorAnimationType.fadeIn,
    this.animationDuration = const Duration(milliseconds: 300),
    this.showErrorIcon = false,
    this.errorIcon,
    this.maxLines = 2,
    this.enableHapticFeedback = false,
    this.hapticFeedbackType = ErrorHapticFeedbackType.heavy,
  }) : super(key: key);

  /// Error message to display
  final String? errorText;

  /// Custom error widget (overrides error text)
  final Widget? errorWidget;

  /// Style for error text
  final TextStyle? errorStyle;

  /// Color for error text
  final Color errorColor;

  /// Top spacing between error and OTP fields
  final double topSpacing;

  /// Left spacing for error text
  final double leftSpacing;

  /// Right spacing for error text
  final double rightSpacing;

  /// Bottom spacing for error text
  final double bottomSpacing;

  /// Alignment of error message relative to OTP fields
  final ErrorAlignment alignment;

  /// Animation type for error appearance
  final ErrorAnimationType animationType;

  /// Duration of animation
  final Duration animationDuration;

  /// Whether to show an icon with the error
  final bool showErrorIcon;

  /// Icon to display with error (default is error outline)
  final IconData? errorIcon;

  /// Maximum number of lines for error message
  final int maxLines;

  /// Whether to provide haptic feedback when error appears
  final bool enableHapticFeedback;

  /// Type of haptic feedback
  final ErrorHapticFeedbackType hapticFeedbackType;

  @override
  State<OtpErrorDisplay> createState() => _OtpErrorDisplayState();
}

class _OtpErrorDisplayState extends State<OtpErrorDisplay>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  String? _previousErrorText;
  bool _isFirstBuild = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _setupAnimations();

    _previousErrorText = widget.errorText;
  }

  void _setupAnimations() {
    // Opacity animation for fade effects
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Slide animation for slide effects
    Offset beginOffset;
    switch (widget.animationType) {
      case ErrorAnimationType.slideInBottom:
        beginOffset = const Offset(0.0, 1.0);
        break;
      case ErrorAnimationType.slideInTop:
        beginOffset = const Offset(0.0, -1.0);
        break;
      default:
        beginOffset = Offset.zero;
        break;
    }

    _slideAnimation = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    // Scale animation for scale effects
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));
  }

  void _triggerAnimation() {
    _animationController.reset();
    _animationController.forward();

    // Trigger haptic feedback if enabled
    if (widget.enableHapticFeedback) {
      switch (widget.hapticFeedbackType) {
        case ErrorHapticFeedbackType.light:
          HapticFeedback.lightImpact();
          break;
        case ErrorHapticFeedbackType.medium:
          HapticFeedback.mediumImpact();
          break;
        case ErrorHapticFeedbackType.heavy:
          HapticFeedback.heavyImpact();
          break;
        case ErrorHapticFeedbackType.vibrate:
          HapticFeedback.vibrate();
          break;
      }
    }
  }

  @override
  void didUpdateWidget(OtpErrorDisplay oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If animation parameters changed, update animations
    if (oldWidget.animationType != widget.animationType ||
        oldWidget.animationDuration != widget.animationDuration) {
      _setupAnimations();
    }

    // Trigger animation when error text changes
    if (_previousErrorText != widget.errorText && widget.errorText != null) {
      _triggerAnimation();
    }

    _previousErrorText = widget.errorText;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // If no error text, don't show anything (even if errorWidget is provided)
    if (widget.errorText == null) {
      return const SizedBox.shrink();
    }

    // Only animate if this is not the first build
    if (!_isFirstBuild && widget.errorText != null) {
      // Don't need to trigger here as didUpdateWidget handles it
    } else if (widget.errorText != null) {
      // First time showing an error
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _triggerAnimation();
      });
      _isFirstBuild = false;
    }

    // If custom error widget is provided, use that
    if (widget.errorWidget != null) {
      return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return _buildAnimatedWidget(widget.errorWidget!);
        },
      );
    }

    // Otherwise, build the error text widget with optional icon
    final errorTextWidget = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Error icon if enabled
        if (widget.showErrorIcon)
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Icon(
              widget.errorIcon ?? Icons.error_outline,
              color: widget.errorColor,
              size: 16.0,
            ),
          ),
        // Error text
        Flexible(
          child: Text(
            widget.errorText!,
            style: widget.errorStyle ??
                TextStyle(
                  color: widget.errorColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
            textAlign: TextAlign.center,
            maxLines: widget.maxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );

    // Apply padding based on alignment
    Widget paddedWidget = Padding(
      padding: EdgeInsets.only(
        top: widget.topSpacing,
        left: widget.leftSpacing,
        right: widget.rightSpacing,
        bottom: widget.bottomSpacing,
      ),
      child: errorTextWidget,
    );

    // Apply animation
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return _buildAnimatedWidget(paddedWidget);
      },
    );
  }

  Widget _buildAnimatedWidget(Widget child) {
    // Apply different animations based on type
    switch (widget.animationType) {
      case ErrorAnimationType.fadeIn:
        return FadeTransition(
          opacity: _opacityAnimation,
          child: child,
        );

      case ErrorAnimationType.slideInBottom:
      case ErrorAnimationType.slideInTop:
        return SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _opacityAnimation,
            child: child,
          ),
        );

      case ErrorAnimationType.scaleUp:
        return ScaleTransition(
          scale: _scaleAnimation,
          child: FadeTransition(
            opacity: _opacityAnimation,
            child: child,
          ),
        );

      case ErrorAnimationType.shakeAndFade:
        // For shake effect, use a combination of custom animation and fade
        final shakeAnimation = Tween<double>(
          begin: -3.0,
          end: 0.0,
        )
            .chain(CurveTween(
              curve: Curves.elasticOut,
            ))
            .animate(_animationController);

        return FadeTransition(
          opacity: _opacityAnimation,
          child: AnimatedBuilder(
            animation: shakeAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(
                  // Use a sine wave for shake effect
                  shakeAnimation.value *
                      (1 - _animationController.value) *
                      math.sin(_animationController.value * 10 * math.pi),
                  0,
                ),
                child: child,
              );
            },
            child: child,
          ),
        );

      case ErrorAnimationType.none:
        return child;
    }
  }
}
