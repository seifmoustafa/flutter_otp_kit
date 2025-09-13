import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styling/field_colors.dart';
import '../config/otp_field_config.dart';
import '../state/otp_field_state.dart';
import '../otp_field_shape.dart';

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

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _borderColorAnimation;
  late Animation<Color?> _backgroundColorAnimation;
  late Animation<Color?> _textColorAnimation;
  late FocusNode _keyboardListenerFocusNode;

  Color? _prevBorderColor;
  Color? _prevBackgroundColor;
  Color? _prevTextColor;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _keyboardListenerFocusNode = FocusNode();

    _prevBorderColor = widget.fieldColors.borderColor;
    _prevBackgroundColor = widget.fieldColors.backgroundColor;
    _prevTextColor = widget.fieldColors.textColor;

    _setupAnimations();
  }

  @override
  void didUpdateWidget(OtpField oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If colors or state changed, animate to the new values
    if (oldWidget.fieldColors.borderColor != widget.fieldColors.borderColor ||
        oldWidget.fieldColors.backgroundColor !=
            widget.fieldColors.backgroundColor ||
        oldWidget.fieldColors.textColor != widget.fieldColors.textColor ||
        oldWidget.fieldState != widget.fieldState) {
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
  }

  @override
  void dispose() {
    _animationController.dispose();
    _keyboardListenerFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = widget.fieldWidth ?? widget.config.fieldWidth;
    final height = widget.fieldHeight ?? widget.config.fieldHeight;

    // The visual state is now handled entirely by the style manager
    // No need for special decoration logic here - the container handles all styling

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        // Handle custom decoration based on field shape
        BoxDecoration decoration;

        // Handle custom field shape or use default decoration
        if (widget.config.fieldShape == OtpFieldShape.custom &&
            widget.config.fieldShapeConfig?.decorationBuilder != null) {
          // Use custom decoration builder if provided
          decoration = widget.config.fieldShapeConfig!.decorationBuilder!(
            _borderColorAnimation.value ?? widget.fieldColors.borderColor,
            _backgroundColorAnimation.value ??
                widget.fieldColors.backgroundColor,
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
                color: _borderColorAnimation.value ??
                    widget.fieldColors.borderColor,
                width: widget.config.borderWidth,
              ),
            ),
          );
        } else {
          // Default decoration for regular fields
          decoration = BoxDecoration(
            borderRadius: BorderRadius.circular(
                widget.config.fieldShape == OtpFieldShape.circle ||
                        widget.config.fieldShape == OtpFieldShape.stadium
                    ? height /
                        2 // For circle/stadium, use height/2 for border radius
                    : widget.config.borderRadius),
            border: Border.all(
              color:
                  _borderColorAnimation.value ?? widget.fieldColors.borderColor,
              width: widget.config.borderWidth,
            ),
            color: _backgroundColorAnimation.value ??
                widget.fieldColors.backgroundColor,
            boxShadow: widget.config.enableShadow
                ? [
                    BoxShadow(
                      color: widget.config.shadowColor ??
                          widget.config.primaryColor
                              .withAlpha(51), // 0.2 opacity
                      blurRadius: widget.config.shadowBlurRadius,
                      spreadRadius: widget.config.shadowSpreadRadius,
                      offset: widget.config.shadowOffset,
                    ),
                  ]
                : null,
          );
        }

        return Container(
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
                // We're in an empty field and user pressed backspace
                // Call onChanged with empty string to trigger the deletion logic
                widget.onChanged('');
              }
            },
            child: Semantics(
              label: widget.index != null && widget.fieldCount != null
                  ? 'OTP field ${widget.index! + 1} of ${widget.fieldCount}'
                  : 'OTP field',
              textField: true,
              child: TextFormField(
                controller: widget.controller,
                focusNode: widget.focusNode,
                textAlign: widget.cursorAlignment,
                keyboardType: widget.keyboardType,
                textCapitalization: widget.textCapitalization,
                inputFormatters: widget.inputFormatters,
                obscureText: widget.obscureText,
                obscuringCharacter: widget.obscuringCharacter,
                enableInteractiveSelection: widget.enableInteractiveSelection,
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
                      height: 1.0, // Ensure consistent line height
                    ),
                decoration: InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: (height - 22) / 2, // Perfect vertical centering
                    horizontal: 0,
                  ),
                  isDense: true, // Reduce internal padding
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
            ),
          ),
        );
      },
    );
  }
}
