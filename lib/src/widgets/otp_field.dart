import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

import '../styling/field_colors.dart';
import '../config/otp_field_config.dart';
import '../state/otp_field_state.dart';
import '../otp_field_shape.dart';
import '../config/otp_animation_config.dart';

/// A clean, modern OTP input field with customizable styling and animations
///
/// This widget handles:
/// - Text input with proper focus management
/// - Custom cursor styles and animations
/// - Field state animations (fill, error, etc.)
/// - Keyboard navigation (backspace handling)
/// - Accessibility support
class OtpField extends StatefulWidget {
  const OtpField({
    super.key,
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
    this.validator,
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
  });

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
  late AnimationController _cursorController;
  late FocusNode _keyboardListenerFocusNode;

  // Cursor animations
  late Animation<double> _cursorBlinkAnimation;
  late Animation<double> _cursorScaleAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _setupFocusListener();
  }

  @override
  void dispose() {
    _cursorController.dispose();
    _keyboardListenerFocusNode.dispose();
    widget.focusNode.removeListener(_onFocusChanged);
    super.dispose();
  }

  void _initializeAnimations() {
    // Initialize cursor controller
    _cursorController = AnimationController(
      vsync: this,
      duration: widget.animationConfig.cursorBlinkDuration,
    );

    // Initialize keyboard listener focus node
    _keyboardListenerFocusNode = FocusNode();

    _setupCursorAnimations();
  }

  void _setupCursorAnimations() {
    if (!widget.animationConfig.enableCursorAnimation) return;

    // Cursor blink animation
    _cursorBlinkAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _cursorController,
      curve: Curves.easeInOut,
    ));

    // Cursor scale animation
    _cursorScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _cursorController,
      curve: Curves.elasticOut,
    ));
  }

  void _setupFocusListener() {
    widget.focusNode.addListener(_onFocusChanged);

    // Start cursor animation if already focused
    if (widget.focusNode.hasFocus) {
      _startCursorAnimation();
    }
  }

  void _onFocusChanged() {
    if (widget.focusNode.hasFocus) {
      _startCursorAnimation();
    } else {
      _stopCursorAnimation();
    }
  }

  void _startCursorAnimation() {
    if (widget.animationConfig.enableCursorAnimation) {
      _cursorController.repeat(reverse: true);
    }
  }

  void _stopCursorAnimation() {
    if (widget.animationConfig.enableCursorAnimation) {
      _cursorController.stop();
      _cursorController.reset();
    }
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
            borderRadius: BorderRadius.circular(3),
          ),
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
        return _buildDashedUnderline(fieldWidth, color);
      case CursorStyle.beamCap:
        return _buildBeamCap(width, height, color);
      case CursorStyle.beamNotch:
        return _buildBeamNotch(width, height, color);
      case CursorStyle.wedge:
        return CustomPaint(
          size: Size(width * 3, height),
          painter: _TriangleCaretPainter(color),
        );
      case CursorStyle.ring:
        return _buildRingCursor(fieldHeight, color);
      case CursorStyle.strikethrough:
        return Align(
          alignment: Alignment.center,
          child: Container(
            width: math.max(fieldWidth * 0.6, 20),
            height: 2,
            color: color,
          ),
        );
      case CursorStyle.doubleUnderline:
        return _buildDoubleUnderline(fieldWidth, color);
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
                color: color.withAlpha(120),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ],
          ),
        );
    }
  }

  Widget _buildDashedUnderline(double fieldWidth, Color color) {
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
              margin:
                  EdgeInsets.only(right: i == dashCount - 1 ? 0 : dashSpace),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBeamCap(double width, double height, Color color) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(width: width, height: height, color: color),
        Positioned(
          top: 0,
          child: Container(width: width * 2, height: 2, color: color),
        ),
        Positioned(
          bottom: 0,
          child: Container(width: width * 2, height: 2, color: color),
        ),
      ],
    );
  }

  Widget _buildBeamNotch(double width, double height, Color color) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(width: width, height: height, color: color),
        Container(
          width: width * 1.6,
          height: 2,
          color: widget.fieldColors.backgroundColor,
        ),
      ],
    );
  }

  Widget _buildRingCursor(double fieldHeight, Color color) {
    final double diameter = math.max(6, math.min(fieldHeight * 0.25, 14));
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 2),
      ),
    );
  }

  Widget _buildDoubleUnderline(double fieldWidth, Color color) {
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
              color: color,
            ),
            const SizedBox(height: 3),
            Container(
              width: math.max(fieldWidth * 0.6, 20),
              height: 2,
              color: color,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    final borderColor = widget.fieldColors.borderColor;
    final backgroundColor = widget.fieldColors.backgroundColor;
    final height = widget.fieldHeight ?? widget.config.fieldHeight;

    // Handle custom field shapes
    if (widget.config.fieldShape == OtpFieldShape.custom &&
        widget.config.fieldShapeConfig?.decorationBuilder != null) {
      return widget.config.fieldShapeConfig!.decorationBuilder!(
        borderColor,
        backgroundColor,
        widget.config.borderWidth,
        widget.config.borderRadius,
      );
    }

    // Handle underlined fields
    if (widget.config.fieldShape == OtpFieldShape.underlined) {
      return BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: borderColor,
            width: widget.config.borderWidth,
          ),
        ),
      );
    }

    // Default decoration
    return BoxDecoration(
      borderRadius: BorderRadius.circular(
        widget.config.fieldShape == OtpFieldShape.circle ||
                widget.config.fieldShape == OtpFieldShape.stadium
            ? height / 2
            : widget.config.borderRadius,
      ),
      border: Border.all(
        color: borderColor,
        width: widget.config.borderWidth,
      ),
      color: backgroundColor,
      boxShadow: widget.config.enableShadow
          ? [
              BoxShadow(
                color: widget.config.shadowColor ??
                    widget.config.primaryColor.withAlpha(51),
                blurRadius: widget.config.shadowBlurRadius,
                spreadRadius: widget.config.shadowSpreadRadius,
                offset: widget.config.shadowOffset,
              ),
            ]
          : null,
    );
  }

  Widget _buildTextField(double width, double height) {
    final textColor = widget.fieldColors.textColor;

    return TextFormField(
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
      cursorColor: widget.config.cursorColor ?? widget.config.primaryColor,
      cursorHeight: widget.config.cursorHeight ?? (height - 12),
      cursorWidth: widget.config.cursorWidth,
      style: widget.config.fieldStyle ??
          TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: textColor,
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
      onTap: () {
        // Handle tap to ensure proper focus
        widget.focusNode.requestFocus();
      },
      onEditingComplete: () {
        // Handle editing complete
        FocusScope.of(context).nextFocus();
      },
    );
  }

  Widget _buildCustomCursorOverlay(double width, double height) {
    if (widget.config.cursorStyle == CursorStyle.system) {
      return const SizedBox.shrink();
    }

    final cursorWidget = _buildCustomCursor(height, width);

    if (!widget.animationConfig.enableCursorAnimation) {
      // Static cursor
      return Positioned.fill(
        child: IgnorePointer(
          child: Align(
            alignment: _textAlignToAlignment(widget.cursorAlignment),
            child: cursorWidget,
          ),
        ),
      );
    }

    // Animated cursor
    return AnimatedBuilder(
      animation: _cursorController,
      builder: (context, _) {
        return Align(
          alignment: _textAlignToAlignment(widget.cursorAlignment),
          child: FadeTransition(
            opacity: _cursorBlinkAnimation,
            child: ScaleTransition(
              scale: _cursorScaleAnimation,
              child: cursorWidget,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = widget.fieldWidth ?? widget.config.fieldWidth;
    final height = widget.fieldHeight ?? widget.config.fieldHeight;

    return Container(
      width: width,
      height: height,
      decoration: _buildDecoration(),
      child: KeyboardListener(
        focusNode: _keyboardListenerFocusNode,
        onKeyEvent: (KeyEvent event) {
          // Handle backspace on empty field
          if (event is KeyDownEvent &&
              event.logicalKey == LogicalKeyboardKey.backspace &&
              widget.controller.text.isEmpty) {
            widget.onChanged('');
          }
        },
        child: Semantics(
          label: widget.index != null && widget.fieldCount != null
              ? 'OTP field ${widget.index! + 1} of ${widget.fieldCount}'
              : 'OTP field',
          textField: true,
          child: Stack(
            children: [
              _buildTextField(width, height),
              if (widget.focusNode.hasFocus)
                _buildCustomCursorOverlay(width, height),
            ],
          ),
        ),
      ),
    );
  }
}

/// Custom painter for triangle caret cursor
class _TriangleCaretPainter extends CustomPainter {
  const _TriangleCaretPainter(this.color);

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
