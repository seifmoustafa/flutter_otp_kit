import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styling/field_colors.dart';
import '../config/otp_field_config.dart';
import '../state/otp_field_state.dart';
import '../otp_field_shape.dart';
import '../config/otp_animation_config.dart'
    show OtpAnimationConfig, FieldFillAnimationType, ErrorFieldAnimationType;
import 'dart:math' as math;

/// A single OTP input field with customizable styling and behavior
class OtpField extends StatefulWidget {
  /// Creates a new OTP field with customizable styling and behavior
  const OtpField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.fieldState,
    required this.hasError,
    required this.onChanged,
    required this.config,
    required this.fieldColors,
    required this.inputFormatters,
    required this.keyboardType,
    required this.cursorAlignment,
    required this.validator,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.enableInteractiveSelection = true,
    this.textCapitalization = TextCapitalization.none,
    this.fieldWidth,
    this.fieldHeight,
    this.index,
    this.fieldCount,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.transitionHighlightColor,
    this.animationConfig = const OtpAnimationConfig(),
    this.animationController,
  }) : super(key: key);

  /// Text controller for the field
  final TextEditingController controller;

  /// Focus node for the field
  final FocusNode focusNode;

  /// Current state of the field
  final OtpFieldState fieldState;

  /// Whether the field has an error
  final bool hasError;

  /// Callback when the field value changes
  final ValueChanged<String> onChanged;

  /// Configuration for the field
  final OtpFieldConfig config;

  /// Colors for the field based on state
  final FieldColors fieldColors;

  /// Input formatters for the field
  final List<TextInputFormatter> inputFormatters;

  /// Keyboard type for the field
  final TextInputType keyboardType;

  /// Alignment of the cursor within the field
  final TextAlign cursorAlignment;

  /// Validator function for the field
  final FormFieldValidator<String>? validator;

  /// Whether to obscure the text
  final bool obscureText;

  /// Character to use for obscuring text
  final String obscuringCharacter;

  /// Whether to enable interactive selection
  final bool enableInteractiveSelection;

  /// Text capitalization for the field
  final TextCapitalization textCapitalization;

  /// Width of the field (optional, uses config if not provided)
  final double? fieldWidth;

  /// Height of the field (optional, uses config if not provided)
  final double? fieldHeight;

  /// Index of the field (optional)
  final int? index;

  /// Total number of fields (optional)
  final int? fieldCount;

  /// Animation duration for state transitions
  final Duration animationDuration;

  /// Animation curve for state transitions
  final Curve animationCurve;

  /// Optional color for transition highlight
  final Color? transitionHighlightColor;

  /// Comprehensive animation configuration
  final OtpAnimationConfig animationConfig;

  /// External animation controller (optional)
  final AnimationController? animationController;

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _borderColorAnimation;
  late Animation<Color?> _backgroundColorAnimation;
  late Animation<Color?> _textColorAnimation;
  late FocusNode _keyboardListenerFocusNode;

  Color? _prevBorderColor;
  Color? _prevBackgroundColor;
  Color? _prevTextColor;

  // Shake value for error animation
  late Animation<double> _errorShakeAnimation;
  late Animation<double> _fillScaleAnimation;
  late Animation<double> _fillRotationAnimation;
  late Animation<Offset> _fillSlideAnimation;

  // Advanced cursor animation
  late AnimationController _cursorController;
  late Animation<double> _cursorBlinkAnimation;
  late Animation<double> _cursorScaleAnimation;

  @override
  void initState() {
    super.initState();

    // Use external animation controller if provided, otherwise create our own
    if (widget.animationController != null) {
      _animationController = widget.animationController!;
    } else {
      _animationController = AnimationController(
        vsync: this,
        duration: widget.animationDuration,
      );
    }

    _keyboardListenerFocusNode = FocusNode();

    _prevBorderColor = widget.fieldColors.borderColor;
    _prevBackgroundColor = widget.fieldColors.backgroundColor;
    _prevTextColor = widget.fieldColors.textColor;

    _setupAnimations();
    _setupCursorAnimations();

    // Don't listen to controller changes - let TextFormField handle it naturally

    // If using external controller, listen to its changes
    if (widget.animationController != null) {
      widget.animationController!.addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    }
  }

  @override
  void didUpdateWidget(OtpField oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If colors or state changed, animate to the new values
    if (oldWidget.fieldColors.borderColor != widget.fieldColors.borderColor ||
        oldWidget.fieldColors.backgroundColor !=
            widget.fieldColors.backgroundColor ||
        oldWidget.fieldColors.textColor != widget.fieldColors.textColor ||
        oldWidget.fieldState != widget.fieldState ||
        oldWidget.hasError != widget.hasError) {
      _setupAnimations();
      _animationController.reset();
      _animationController.forward();
    }
  }

  void _setupAnimations() {
    // Set up border color animation with smooth transition
    _borderColorAnimation = ColorTween(
      begin: _prevBorderColor,
      end: widget.fieldColors.borderColor,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut, // Smooth transition for all states
    ));

    // Set up background color animation with smooth transition
    _backgroundColorAnimation = ColorTween(
      begin: _prevBackgroundColor,
      end: widget.fieldColors.backgroundColor,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut, // Smooth transition for all states
    ));

    // Set up text color animation with smooth transition
    _textColorAnimation = ColorTween(
      begin: _prevTextColor,
      end: widget.fieldColors.textColor,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut, // Smooth transition for all states
    ));

    // Update previous colors for next animation
    _prevBorderColor = widget.fieldColors.borderColor;
    _prevBackgroundColor = widget.fieldColors.backgroundColor;
    _prevTextColor = widget.fieldColors.textColor;

    // Setup transform animations based on current state
    final fillType = widget.animationConfig.fieldFillAnimationType;
    final isFilled = widget.fieldState == OtpFieldState.filled ||
        widget.fieldState == OtpFieldState.completed;

    // Scale
    _fillScaleAnimation = Tween<double>(
      begin: 1.0,
      end:
          (isFilled && (fillType == FieldFillAnimationType.scale)) ? 1.06 : 1.0,
    ).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeOutBack));

    // Rotation
    _fillRotationAnimation = Tween<double>(
      begin: 0.0,
      end: (isFilled && (fillType == FieldFillAnimationType.rotate))
          ? widget.animationConfig.fieldFillRotationRadians
          : 0.0,
    ).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeOutBack));

    // Slide
    Offset slideOffset = Offset.zero;
    switch (fillType) {
      case FieldFillAnimationType.slideLeft:
        slideOffset =
            Offset(-widget.animationConfig.fieldFillSlideOffset.dx, 0);
        break;
      case FieldFillAnimationType.slideRight:
        slideOffset = Offset(widget.animationConfig.fieldFillSlideOffset.dx, 0);
        break;
      case FieldFillAnimationType.slideUp:
        slideOffset =
            Offset(0, -widget.animationConfig.fieldFillSlideOffset.dy);
        break;
      case FieldFillAnimationType.slideDown:
        slideOffset = Offset(0, widget.animationConfig.fieldFillSlideOffset.dy);
        break;
      case FieldFillAnimationType.autoSlide:
        // Default to LTR slide direction - will be corrected in build method
        slideOffset =
            Offset(-widget.animationConfig.fieldFillSlideOffset.dx, 0);
        break;
      default:
        slideOffset = Offset.zero;
    }
    _fillSlideAnimation = Tween<Offset>(
      begin: slideOffset == Offset.zero ? Offset.zero : slideOffset,
      end: Offset.zero,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut));

    // Error animations - different from fill animations
    if ((widget.fieldState == OtpFieldState.error || widget.hasError) &&
        widget.animationConfig.errorFieldAnimationType !=
            ErrorFieldAnimationType.none) {
      _errorShakeAnimation =
          Tween<double>(begin: 0, end: 1).animate(_animationController);
    } else {
      _errorShakeAnimation =
          Tween<double>(begin: 0, end: 0).animate(_animationController);
    }
  }

  void _setupCursorAnimations() {
    if (!widget.animationConfig.enableCursorAnimation) return;

    _cursorController = AnimationController(
      vsync: this,
      duration: widget.animationConfig.cursorBlinkDuration,
    );

    // Cursor blink animation
    _cursorBlinkAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _cursorController,
      curve: Curves.easeInOut,
    ));

    // Cursor scale animation for focus
    _cursorScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _cursorController,
      curve: Curves.elasticOut,
    ));

    // Start blinking when focused
    if (widget.focusNode.hasFocus) {
      _cursorController.repeat(reverse: true);
    }

    // Listen to focus changes
    widget.focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (widget.focusNode.hasFocus) {
      _cursorController.repeat(reverse: true);
    } else {
      _cursorController.stop();
      _cursorController.reset();
    }
  }

  void _handleBackspaceNavigation() {
    // Simple approach: just call onChanged with empty string
    // The parent will handle the focus management
    widget.onChanged('');
  }

  Alignment _textAlignToAlignment(TextAlign align) {
    switch (align) {
      case TextAlign.left:
      case TextAlign.start:
        return Alignment.centerLeft;
      case TextAlign.right:
      case TextAlign.end:
        return Alignment.centerRight;
      case TextAlign.center:
        return Alignment.center;
      case TextAlign.justify:
        return Alignment.center;
    }
  }

  Widget _buildCustomCursor(double fieldHeight, double fieldWidth) {
    final color = widget.config.cursorColor ?? widget.config.primaryColor;
    final width = widget.config.cursorWidth;
    final height = widget.config.cursorHeight ?? (fieldHeight - 12);

    switch (widget.config.cursorStyle) {
      case CursorStyle.none:
        return const SizedBox.shrink();
      case CursorStyle.system:
        return const SizedBox.shrink();
      case CursorStyle.bar:
        return Container(width: width, height: height, color: color);
      case CursorStyle.block:
        return Container(
          width: math.max(width * 6, 12),
          height: height,
          decoration: BoxDecoration(
              color: color.withAlpha(60),
              border: Border.all(color: color, width: 1),
              borderRadius: BorderRadius.circular(3)),
        );
      case CursorStyle.underline:
        return Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              width: math.max(fieldWidth * 0.6, 20),
              height: 2,
              color: color,
            ),
          ),
        );
      case CursorStyle.outline:
        return Container(
          width: math.max(fieldWidth * 0.7, 24),
          height: height,
          decoration: BoxDecoration(
            border: Border.all(color: color, width: 1.5),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      case CursorStyle.doubleBar:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: width, height: height, color: color),
            SizedBox(width: width * 0.8),
            Container(width: width, height: height, color: color),
          ],
        );
      case CursorStyle.dashedUnderline:
        final totalWidth = math.max(fieldWidth * 0.6, 20);
        final dashWidth = 6.0;
        final dashSpace = 4.0;
        final dashCount =
            ((totalWidth + dashSpace) / (dashWidth + dashSpace)).floor();
        return Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                  dashCount,
                  (i) => Container(
                        width: dashWidth,
                        height: 2,
                        color: color,
                        margin: EdgeInsets.only(
                            right: i == dashCount - 1 ? 0 : dashSpace),
                      )),
            ),
          ),
        );
      case CursorStyle.beamCap:
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(width: width, height: height, color: color),
            Positioned(
                top: 0,
                child: Container(width: width * 2, height: 2, color: color)),
            Positioned(
                bottom: 0,
                child: Container(width: width * 2, height: 2, color: color)),
          ],
        );
      case CursorStyle.beamNotch:
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(width: width, height: height, color: color),
            Container(
                width: width * 1.6,
                height: 2,
                color: widget.fieldColors.backgroundColor),
          ],
        );
      case CursorStyle.wedge:
        return CustomPaint(
            size: Size(width * 3, height),
            painter: _TriangleCaretPainter(color));
      case CursorStyle.ring:
        final double diameter = math.max(6, math.min(fieldHeight * 0.25, 14));
        return Container(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 2),
          ),
        );
      case CursorStyle.strikethrough:
        return Align(
          alignment: Alignment.center,
          child: Container(
              width: math.max(fieldWidth * 0.6, 20), height: 2, color: color),
        );
      case CursorStyle.doubleUnderline:
        return Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    width: math.max(fieldWidth * 0.6, 20),
                    height: 2,
                    color: color),
                const SizedBox(height: 3),
                Container(
                    width: math.max(fieldWidth * 0.6, 20),
                    height: 2,
                    color: color),
              ],
            ),
          ),
        );
      case CursorStyle.gradientBar:
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [color.withAlpha(200), color.withAlpha(80)],
            ),
          ),
        );
      case CursorStyle.glowBar:
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            boxShadow: [
              BoxShadow(
                  color: color.withAlpha(120), blurRadius: 8, spreadRadius: 1)
            ],
          ),
        );
    }
  }

// moved to top-level at end of file

  @override
  void dispose() {
    // Only dispose if we created the animation controller ourselves
    if (widget.animationController == null) {
      _animationController.dispose();
    }

    // Dispose cursor controller
    if (widget.animationConfig.enableCursorAnimation) {
      _cursorController.dispose();
      widget.focusNode.removeListener(_onFocusChanged);
    }

    // No controller listener to remove

    _keyboardListenerFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = widget.fieldWidth ?? widget.config.fieldWidth;
    final height = widget.fieldHeight ?? widget.config.fieldHeight;

    // The visual state is now handled entirely by the style manager
    // No need for special decoration logic here - the container handles all styling

    return widget.animationConfig.enableFieldStateAnimation
        ? AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return _buildFieldContent(height, width);
            },
          )
        : _buildFieldContent(height, width);
  }

  Widget _buildFieldContent(double height, double width) {
    // Handle custom decoration based on field shape
    BoxDecoration decoration;

    // Handle custom field shape or use default decoration
    if (widget.config.fieldShape == OtpFieldShape.custom &&
        widget.config.fieldShapeConfig?.decorationBuilder != null) {
      // Use custom decoration builder if provided
      decoration = widget.config.fieldShapeConfig!.decorationBuilder!(
        _borderColorAnimation.value ?? widget.fieldColors.borderColor,
        _backgroundColorAnimation.value ?? widget.fieldColors.backgroundColor,
        widget.config.borderWidth,
        widget.config.borderRadius,
      );
    } else if (widget.config.fieldShape == OtpFieldShape.underlined) {
      // Special case for underlined fields
      decoration = BoxDecoration(
        color: _backgroundColorAnimation.value ??
            widget.fieldColors.backgroundColor,
        border: Border(
          bottom: BorderSide(
            color:
                _borderColorAnimation.value ?? widget.fieldColors.borderColor,
            width: widget.config.borderWidth,
          ),
        ),
      );
    } else {
      // Default decoration for regular fields
      decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(widget.config.fieldShape ==
                    OtpFieldShape.circle ||
                widget.config.fieldShape == OtpFieldShape.stadium
            ? height / 2 // For circle/stadium, use height/2 for border radius
            : widget.config.borderRadius),
        border: Border.all(
          color: _borderColorAnimation.value ?? widget.fieldColors.borderColor,
          width: widget.config.borderWidth,
        ),
        color: _backgroundColorAnimation.value ??
            widget.fieldColors.backgroundColor,
        boxShadow: widget.config.enableShadow
            ? [
                BoxShadow(
                  color: widget.config.shadowColor ??
                      widget.config.primaryColor.withAlpha(51), // 0.2 opacity
                  blurRadius: widget.config.shadowBlurRadius,
                  spreadRadius: widget.config.shadowSpreadRadius,
                  offset: widget.config.shadowOffset,
                ),
              ]
            : null,
      );
    }

    // Base field content (no transforms)
    Widget baseContent = Container(
      width: width,
      height: height,
      decoration: decoration,
      child: KeyboardListener(
        focusNode: _keyboardListenerFocusNode,
        onKeyEvent: (KeyEvent event) {
          // Detect backspace on empty field
          if (widget.controller.text.isEmpty &&
              event is KeyDownEvent &&
              event.logicalKey == LogicalKeyboardKey.backspace) {
            // Handle backspace navigation directly
            _handleBackspaceNavigation();
          }
        },
        child: Semantics(
          label: widget.index != null && widget.fieldCount != null
              ? 'OTP field ${widget.index! + 1} of ${widget.fieldCount}'
              : 'OTP field',
          textField: true,
          child: Stack(
            children: [
              TextFormField(
                controller: widget.controller,
                focusNode: widget.focusNode,
                textAlign: widget.cursorAlignment,
                keyboardType: widget.keyboardType,
                textCapitalization: widget.textCapitalization,
                inputFormatters: widget.inputFormatters,
                obscureText: widget.obscureText,
                obscuringCharacter: widget.obscuringCharacter,
                enableInteractiveSelection: widget.enableInteractiveSelection,
                showCursor: widget.config.cursorStyle == CursorStyle.system,
                cursorColor:
                    widget.config.cursorColor ?? widget.config.primaryColor,
                cursorHeight: widget.config.cursorHeight ?? (height - 12),
                cursorWidth: widget.config.cursorWidth,
                style: widget.config.fieldStyle ??
                    TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: _textColorAnimation.value ??
                          widget.fieldColors.textColor,
                      height: 1.0,
                    ),
                decoration: InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: (height - 22) / 2,
                    horizontal: 0,
                  ),
                  isDense: true,
                  hintText: widget.config.showPlaceholder
                      ? widget.config.placeholderCharacter
                      : null,
                  hintStyle: widget.config.placeholderStyle ??
                      TextStyle(
                        color: widget.config.placeholderColor ??
                            widget.fieldColors.borderColor.withAlpha(128),
                        fontSize: widget.config.fieldFontSize,
                      ),
                ),
                validator: widget.validator,
                onChanged: widget.onChanged,
              ),
              // Base custom cursor (non-animated) only when animation is disabled
              if (widget.focusNode.hasFocus &&
                  widget.config.cursorStyle != CursorStyle.system &&
                  !widget.animationConfig.enableCursorAnimation)
                Positioned.fill(
                  child: IgnorePointer(
                    child: Align(
                      alignment: _textAlignToAlignment(widget.cursorAlignment),
                      child: _buildCustomCursor(height, width),
                    ),
                  ),
                ),

              // Animated overlay for custom cursor when enabled
              if (widget.animationConfig.enableCursorAnimation &&
                  widget.focusNode.hasFocus &&
                  widget.config.cursorStyle != CursorStyle.system)
                AnimatedBuilder(
                  animation: _cursorController,
                  builder: (context, _) {
                    return Align(
                      alignment: _textAlignToAlignment(widget.cursorAlignment),
                      child: FadeTransition(
                        opacity: _cursorBlinkAnimation,
                        child: ScaleTransition(
                          scale: _cursorScaleAnimation,
                          child: _buildCustomCursor(height, width),
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );

    // Apply exactly ONE fill animation (style) when filled/completed AND animations are enabled
    final isFilled = widget.fieldState == OtpFieldState.filled ||
        widget.fieldState == OtpFieldState.completed;
    Widget transformed = baseContent;
    if (isFilled && widget.animationConfig.enableFieldStateAnimation) {
      switch (widget.animationConfig.fieldFillAnimationType) {
        case FieldFillAnimationType.scale:
          transformed = Transform.scale(
            scale: _fillScaleAnimation.value,
            child: baseContent,
          );
          break;
        case FieldFillAnimationType.rotate:
          transformed = Transform.rotate(
            angle: _fillRotationAnimation.value,
            child: baseContent,
          );
          break;
        case FieldFillAnimationType.slideLeft:
        case FieldFillAnimationType.slideRight:
        case FieldFillAnimationType.slideUp:
        case FieldFillAnimationType.slideDown:
          transformed = SlideTransition(
            position: _fillSlideAnimation,
            child: baseContent,
          );
          break;
        case FieldFillAnimationType.autoSlide:
          // Handle autoSlide with direction detection in build method
          final textDirection = Directionality.of(context);
          final slideOffset = textDirection == TextDirection.ltr
              ? Offset(-widget.animationConfig.fieldFillSlideOffset.dx, 0)
              : Offset(widget.animationConfig.fieldFillSlideOffset.dx, 0);

          // Create a custom slide animation for autoSlide
          final autoSlideAnimation = Tween<Offset>(
            begin: slideOffset,
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOut,
          ));

          transformed = SlideTransition(
            position: autoSlideAnimation,
            child: baseContent,
          );
          break;
        case FieldFillAnimationType.none:
          transformed = baseContent;
          break;
      }
    }

    // Apply error animations based on type - different from fill animations
    if ((widget.fieldState == OtpFieldState.error || widget.hasError) &&
        widget.animationConfig.enableFieldStateAnimation &&
        widget.animationConfig.errorFieldAnimationType !=
            ErrorFieldAnimationType.none) {
      switch (widget.animationConfig.errorFieldAnimationType) {
        case ErrorFieldAnimationType.shake:
          // Horizontal shake - aggressive side-to-side movement
          final amplitude = widget.animationConfig.errorShakeAmplitude *
              3; // More aggressive than fill
          final freq = widget.animationConfig.errorShakeFrequency *
              1.5; // Faster frequency
          final dx = amplitude *
              math.sin(_errorShakeAnimation.value * freq * math.pi * 2);
          transformed =
              Transform.translate(offset: Offset(dx, 0), child: transformed);
          break;

        case ErrorFieldAnimationType.scale:
          // Scale down dramatically then bounce back - different from fill scale
          final scale = 1.0 -
              (0.3 *
                  _errorShakeAnimation.value *
                  math.sin(_errorShakeAnimation.value * math.pi * 2));
          transformed = Transform.scale(scale: scale, child: transformed);
          break;

        case ErrorFieldAnimationType.rotate:
          // Aggressive rotation wobble - different from fill rotation
          final angle = 0.2 *
              math.sin(
                  _errorShakeAnimation.value * math.pi * 6); // More aggressive
          transformed = Transform.rotate(angle: angle, child: transformed);
          break;

        case ErrorFieldAnimationType.bounce:
          // Vertical bounce - up and down movement
          final amplitude = widget.animationConfig.errorShakeAmplitude * 2;
          final dy = amplitude *
              math.sin(_errorShakeAnimation.value * math.pi * 4).abs();
          transformed =
              Transform.translate(offset: Offset(0, -dy), child: transformed);
          break;

        case ErrorFieldAnimationType.pulse:
          // Pulse effect - scale in and out rapidly
          final scale =
              1.0 + (0.2 * math.sin(_errorShakeAnimation.value * math.pi * 8));
          transformed = Transform.scale(scale: scale, child: transformed);
          break;

        case ErrorFieldAnimationType.wiggle:
          // Wiggle - combination of rotation and translation
          final amplitude = widget.animationConfig.errorShakeAmplitude * 2;
          final angle =
              0.15 * math.sin(_errorShakeAnimation.value * math.pi * 4);
          final dx =
              amplitude * math.sin(_errorShakeAnimation.value * math.pi * 3);
          transformed =
              Transform.translate(offset: Offset(dx, 0), child: transformed);
          transformed = Transform.rotate(angle: angle, child: transformed);
          break;

        case ErrorFieldAnimationType.slideDown:
          // Slide down and back up
          final amplitude = widget.animationConfig.errorShakeAmplitude * 2;
          final dy = amplitude * math.sin(_errorShakeAnimation.value * math.pi);
          transformed =
              Transform.translate(offset: Offset(0, dy), child: transformed);
          break;

        case ErrorFieldAnimationType.slideUp:
          // Slide up and back down
          final amplitude = widget.animationConfig.errorShakeAmplitude * 2;
          final dy =
              -amplitude * math.sin(_errorShakeAnimation.value * math.pi);
          transformed =
              Transform.translate(offset: Offset(0, dy), child: transformed);
          break;

        case ErrorFieldAnimationType.slideLeft:
          // Slide left and back
          final amplitude = widget.animationConfig.errorShakeAmplitude * 2;
          final dx =
              -amplitude * math.sin(_errorShakeAnimation.value * math.pi);
          transformed =
              Transform.translate(offset: Offset(dx, 0), child: transformed);
          break;

        case ErrorFieldAnimationType.slideRight:
          // Slide right and back
          final amplitude = widget.animationConfig.errorShakeAmplitude * 2;
          final dx = amplitude * math.sin(_errorShakeAnimation.value * math.pi);
          transformed =
              Transform.translate(offset: Offset(dx, 0), child: transformed);
          break;

        case ErrorFieldAnimationType.none:
          // No animation
          break;
      }
    }

    return transformed;
  }
}

class _TriangleCaretPainter extends CustomPainter {
  _TriangleCaretPainter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
