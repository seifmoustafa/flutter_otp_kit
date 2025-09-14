import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import '../customization/advanced_field_customization.dart';

/// A highly flexible OTP field that can be fully customized.
///
/// This widget provides complete flexibility for styling and behavior:
/// - Custom field builders for complete visual control
/// - Support for any type of field design (box, underline, custom shapes)
/// - Focus management and keyboard control
/// - Platform adaptive behavior
/// - Animation support
/// - Accessibility features
class FlexibleOtpField extends StatefulWidget {
  /// Creates a new flexible OTP field.
  ///
  /// The [length] parameter determines how many digits the OTP code should have.
  const FlexibleOtpField({
    Key? key,
    required this.length,
    required this.onChanged,
    required this.onCompleted,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.keyboardType = TextInputType.number,
    this.inputFormatters,
    this.autofocus = true,
    this.enabled = true,
    this.enableSuggestions = false,
    this.enableInteractiveSelection = true,
    this.textCapitalization = TextCapitalization.none,
    this.autocorrect = false,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.validator,
    this.fieldWidth = 50,
    this.fieldHeight = 60,
    this.fieldSpacing = 10,
    this.textStyle,
    this.errorTextStyle,
    this.decoration,
    this.focusedDecoration,
    this.errorDecoration,
    this.completedDecoration,
    this.cursorColor,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.showCursor = true,
    this.cursorStyle,
    this.customCursorBuilder,
    this.cursorBlinkDuration = const Duration(milliseconds: 500),
    this.textAlign = TextAlign.center,
    this.textAlignVertical = TextAlignVertical.center,
    this.textDirection,
    this.readOnly = false,
    this.showKeyboard = true,
    this.autoDismissKeyboard = true,
    this.fieldBuilder,
    this.animateFields = false,
    this.fieldAnimationType = FieldAnimationType.scale,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.errorAnimationDuration = const Duration(milliseconds: 300),
    this.errorAnimationCurve = Curves.elasticOut,
    this.shakeAnimationDuration = const Duration(milliseconds: 600),
    this.shakeAnimationIntensity = 4.0,
    this.showErrorText = true,
    this.hapticFeedbackType = HapticFeedbackType.light,
    this.autoFillHints = const ['oneTimeCode'],
    this.enablePaste = true,
    this.onPaste,
    this.textController,
    this.focusNode,
  }) : super(key: key);

  /// The number of OTP fields to display.
  final int length;

  /// Callback when the OTP value changes.
  final ValueChanged<String> onChanged;

  /// Callback when the OTP input is completed.
  final ValueChanged<String> onCompleted;

  /// Whether to obscure the text input.
  final bool obscureText;

  /// Character to use for obscuring text.
  final String obscuringCharacter;

  /// The keyboard type for input.
  final TextInputType keyboardType;

  /// Input formatters for the text field.
  final List<TextInputFormatter>? inputFormatters;

  /// Whether to auto-focus the first field.
  final bool autofocus;

  /// Whether the field is enabled.
  final bool enabled;

  /// Whether to enable suggestions.
  final bool enableSuggestions;

  /// Whether to enable interactive text selection.
  final bool enableInteractiveSelection;

  /// Text capitalization for the input.
  final TextCapitalization textCapitalization;

  /// Whether to enable autocorrect.
  final bool autocorrect;

  /// Auto-validate mode for the field.
  final AutovalidateMode autovalidateMode;

  /// Validator function for the field.
  final FormFieldValidator<String>? validator;

  /// Width of each field.
  final double fieldWidth;

  /// Height of each field.
  final double fieldHeight;

  /// Spacing between fields.
  final double fieldSpacing;

  /// Text style for the input.
  final TextStyle? textStyle;

  /// Text style for error messages.
  final TextStyle? errorTextStyle;

  /// Decoration for the field.
  final BoxDecoration? decoration;

  /// Decoration for the field when focused.
  final BoxDecoration? focusedDecoration;

  /// Decoration for the field when there's an error.
  final BoxDecoration? errorDecoration;

  /// Decoration for the field when completed.
  final BoxDecoration? completedDecoration;

  /// Color of the cursor.
  final Color? cursorColor;

  /// Width of the cursor.
  final double cursorWidth;

  /// Height of the cursor.
  final double? cursorHeight;

  /// Whether to show the cursor.
  final bool showCursor;

  /// Style of the cursor.
  final CursorStyle? cursorStyle;

  /// Custom cursor builder for when cursorStyle is CursorStyle.custom.
  final Widget Function(BuildContext context, Color cursorColor)?
      customCursorBuilder;

  /// Duration of the cursor blink animation.
  final Duration cursorBlinkDuration;

  /// Text alignment within the field.
  final TextAlign textAlign;

  /// Vertical text alignment within the field.
  final TextAlignVertical textAlignVertical;

  /// Text direction for the input.
  final TextDirection? textDirection;

  /// Whether the field is read-only.
  final bool readOnly;

  /// Whether to show the keyboard.
  final bool showKeyboard;

  /// Whether to automatically dismiss the keyboard when input is complete.
  final bool autoDismissKeyboard;

  /// Custom builder for each field.
  final Widget Function(BuildContext context, int index, OtpFieldState state)?
      fieldBuilder;

  /// Whether to animate the fields.
  final bool animateFields;

  /// Type of animation to use for the fields.
  final FieldAnimationType fieldAnimationType;

  /// Duration of the animation.
  final Duration animationDuration;

  /// Curve for the animation.
  final Curve animationCurve;

  /// Duration of the error animation.
  final Duration errorAnimationDuration;

  /// Curve for the error animation.
  final Curve errorAnimationCurve;

  /// Duration for the shake animation.
  final Duration shakeAnimationDuration;

  /// Intensity of the shake animation (offset in pixels).
  final double shakeAnimationIntensity;

  /// Whether to show error text below the fields.
  final bool showErrorText;

  /// Type of haptic feedback to provide.
  final HapticFeedbackType hapticFeedbackType;

  /// Auto-fill hints for the input.
  final List<String> autoFillHints;

  /// Whether to enable paste functionality.
  final bool enablePaste;

  /// Callback when text is pasted.
  final Function(String)? onPaste;

  /// Custom text controller.
  final TextEditingController? textController;

  /// Custom focus node.
  final FocusNode? focusNode;

  @override
  State<FlexibleOtpField> createState() => FlexibleOtpFieldState();
}

/// State for the [FlexibleOtpField] widget.
class FlexibleOtpFieldState extends State<FlexibleOtpField>
    with SingleTickerProviderStateMixin {
  late final FocusNode _focusNode;
  late final TextEditingController _textEditingController;
  late List<String> _otpValues;
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;
  late bool _hasError;
  AnimationController? _errorAnimationController;
  Animation<double>? _errorAnimation;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _textEditingController = widget.textController ?? TextEditingController();
    _otpValues = List<String>.filled(widget.length, '');
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _hasError = false;

    _setupErrorAnimation();
    _setupFocusNodes();
    _setupPasteListener();

    // Auto-focus the first field if enabled
    if (widget.autofocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNodes[0].requestFocus();
      });
    }
  }

  @override
  void dispose() {
    // Clean up controllers and focus nodes
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }

    if (widget.textController == null) {
      _textEditingController.dispose();
    }

    if (widget.focusNode == null) {
      _focusNode.dispose();
    }

    _errorAnimationController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.length, (index) {
            // Use builder if provided for complete customization
            if (widget.fieldBuilder != null) {
              final state = OtpFieldState(
                value: _otpValues[index],
                hasFocus: _focusNodes[index].hasFocus,
                hasError: _hasError,
                isCompleted: _isCompleted(),
                isFilled: _otpValues[index].isNotEmpty,
                index: index,
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                onChanged: (value) => _onDigitChanged(value, index),
                onBackspace: () => _onDigitBackspace(index),
              );

              return widget.fieldBuilder!(context, index, state);
            }

            // Otherwise, build default field with customization options
            return Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: widget.fieldSpacing / 2),
              child: _buildDefaultField(index),
            );
          }),
        ),

        // Error text display
        if (widget.showErrorText && _hasError && _errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              _errorMessage!,
              style: widget.errorTextStyle ??
                  TextStyle(color: Colors.red[700], fontSize: 12),
            ),
          ),
      ],
    );
  }

  Widget _buildDefaultField(int index) {
    final bool hasValue = _otpValues[index].isNotEmpty;
    final bool hasFocus = _focusNodes[index].hasFocus;

    // Determine the appropriate decoration based on state
    final BoxDecoration effectiveDecoration = _hasError
        ? (widget.errorDecoration ?? _getDefaultErrorDecoration(context))
        : hasFocus
            ? (widget.focusedDecoration ??
                _getDefaultFocusedDecoration(context))
            : _isCompleted() && hasValue
                ? (widget.completedDecoration ??
                    _getDefaultCompletedDecoration(context))
                : (widget.decoration ?? _getDefaultDecoration(context));

    // Apply error animation if needed
    Widget field = AnimatedContainer(
      duration: widget.animationDuration,
      curve: widget.animationCurve,
      width: widget.fieldWidth,
      height: widget.fieldHeight,
      decoration: effectiveDecoration,
      child: Center(
        child: KeyboardListener(
          focusNode: FocusNode(),
          onKeyEvent: (KeyEvent event) {
            if (event is KeyDownEvent &&
                event.logicalKey == LogicalKeyboardKey.backspace &&
                _otpValues[index].isEmpty &&
                index > 0) {
              // Move to previous field when backspace is pressed on empty field
              _moveToPreviousField(index);
            }
          },
          child: Stack(
            children: [
              TextField(
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                textAlign: widget.textAlign,
                textAlignVertical: widget.textAlignVertical,
                style: widget.textStyle ??
                    TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                keyboardType: widget.keyboardType,
                inputFormatters: widget.inputFormatters ??
                    [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  counterText: '',
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                ),
                obscureText: widget.obscureText,
                obscuringCharacter: widget.obscuringCharacter,
                enableSuggestions: widget.enableSuggestions,
                enableInteractiveSelection: widget.enableInteractiveSelection,
                textCapitalization: widget.textCapitalization,
                autocorrect: widget.autocorrect,
                showCursor: _shouldShowTextFieldCursor(hasFocus),
                readOnly: widget.readOnly,
                autofillHints: widget.autoFillHints,
                enabled: widget.enabled,
                cursorColor:
                    widget.cursorColor ?? Theme.of(context).primaryColor,
                cursorWidth: widget.cursorWidth,
                cursorHeight: widget.cursorHeight,
                textDirection: widget.textDirection,
                onChanged: (value) => _onDigitChanged(value, index),
              ),
              // Custom cursor overlay
              if (hasFocus && _shouldShowCustomCursor()) _buildCustomCursor(),
            ],
          ),
        ),
      ),
    );

    // Add field animation if enabled
    if (widget.animateFields && hasValue) {
      switch (widget.fieldAnimationType) {
        case FieldAnimationType.scale:
          field = AnimatedScale(
            scale: hasValue ? 1.05 : 1.0,
            duration: widget.animationDuration,
            curve: widget.animationCurve,
            child: field,
          );
          break;
        case FieldAnimationType.rotate:
          field = AnimatedRotation(
            turns: hasValue ? 0.05 : 0,
            duration: widget.animationDuration,
            curve: widget.animationCurve,
            child: field,
          );
          break;
        case FieldAnimationType.slide:
          field = AnimatedSlide(
            offset: hasValue ? const Offset(0, -0.05) : Offset.zero,
            duration: widget.animationDuration,
            curve: widget.animationCurve,
            child: field,
          );
          break;
        case FieldAnimationType.fade:
          field = AnimatedOpacity(
            opacity: hasValue ? 1.0 : 0.7,
            duration: widget.animationDuration,
            curve: widget.animationCurve,
            child: field,
          );
          break;
        case FieldAnimationType.none:
          // No animation
          break;
      }
    }

    // Add error animation if needed
    if (_hasError && _errorAnimation != null) {
      field = AnimatedBuilder(
        animation: _errorAnimation!,
        builder: (context, child) {
          // Create smooth shake effect that returns to center
          final shakeValue = _errorAnimation!.value;
          // Use configurable intensity to prevent overlapping
          final shakeOffset = shakeValue * widget.shakeAnimationIntensity;

          return Transform.translate(
            offset: Offset(shakeOffset, 0),
            child: child,
          );
        },
        child: field,
      );
    }

    return field;
  }

  void _setupErrorAnimation() {
    _errorAnimationController = AnimationController(
      duration: widget.shakeAnimationDuration,
      vsync: this,
    );

    // Create a smooth shake animation that returns to center
    _errorAnimation = TweenSequence<double>([
      // First shake left
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: -1.0).chain(
          CurveTween(curve: Curves.easeOut),
        ),
        weight: 1,
      ),
      // Return to center
      TweenSequenceItem(
        tween: Tween<double>(begin: -1.0, end: 0.0).chain(
          CurveTween(curve: Curves.easeIn),
        ),
        weight: 1,
      ),
      // Second shake right
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 1.0).chain(
          CurveTween(curve: Curves.easeOut),
        ),
        weight: 1,
      ),
      // Return to center
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 0.0).chain(
          CurveTween(curve: Curves.easeIn),
        ),
        weight: 1,
      ),
      // Final small shake left
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: -0.5).chain(
          CurveTween(curve: Curves.easeOut),
        ),
        weight: 1,
      ),
      // Final return to center
      TweenSequenceItem(
        tween: Tween<double>(begin: -0.5, end: 0.0).chain(
          CurveTween(curve: Curves.easeIn),
        ),
        weight: 1,
      ),
    ]).animate(_errorAnimationController!);

    _errorAnimation!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _errorAnimationController!.reset();
      }
    });
  }

  void _setupFocusNodes() {
    for (int i = 0; i < widget.length; i++) {
      final focusNode = _focusNodes[i];
      final controller = _controllers[i];

      // Add listener to handle field navigation
      focusNode.addListener(() {
        if (focusNode.hasFocus) {
          // Select all text when focusing on a field with content
          if (controller.text.isNotEmpty) {
            controller.selection = TextSelection(
              baseOffset: 0,
              extentOffset: controller.text.length,
            );
          }
        }
      });
    }
  }

  void _setupPasteListener() {
    // Use a timestamp to track last paste operation
    DateTime lastPasteTime =
        DateTime.now().subtract(const Duration(seconds: 1));

    for (int i = 0; i < _focusNodes.length; i++) {
      final focusNode = _focusNodes[i];
      final index = i;

      focusNode.addListener(() async {
        if (focusNode.hasFocus && widget.enablePaste) {
          final now = DateTime.now();
          if (now.difference(lastPasteTime).inMilliseconds < 500) {
            return;
          }
          lastPasteTime = now;

          try {
            final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
            if (clipboardData != null && clipboardData.text != null) {
              final text = clipboardData.text!.trim();
              widget.onPaste?.call(text);

              if (text.length == widget.length) {
                _pasteOtp(text);
              } else if (text.length == 1) {
                _controllers[index].text = text;
                _otpValues[index] = text;
                _updateOtpValue();
                _moveToNextField(index);
              }
            }
          } catch (e) {
            // Clipboard access may fail on some platforms
            debugPrint('Clipboard access failed: $e');
          }
        }
      });
    }
  }

  void _pasteOtp(String otp) {
    if (otp.length != widget.length) return;

    for (int i = 0; i < widget.length; i++) {
      _controllers[i].text = otp[i];
      _otpValues[i] = otp[i];
    }

    _updateOtpValue();

    if (widget.autoDismissKeyboard) {
      _focusNodes.last.unfocus();
    }

    widget.onCompleted(_getOtpValue());
  }

  void _onDigitChanged(String value, int index) {
    if (_hasError) {
      setState(() {
        _hasError = false;
        _errorMessage = null;
      });
    }

    if (value.isEmpty) {
      _otpValues[index] = '';
      _updateOtpValue();
      _moveToPreviousField(index);
    } else {
      // Take only the first character if multiple characters are entered
      final digit = value.substring(0, 1);
      _otpValues[index] = digit;
      _updateOtpValue();
      _moveToNextField(index);

      // Trigger haptic feedback
      _triggerHapticFeedback();
    }
  }

  void _onDigitBackspace(int index) {
    if (_otpValues[index].isEmpty && index > 0) {
      _moveToPreviousField(index);
    }
  }

  void _moveToNextField(int index) {
    if (index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (widget.autoDismissKeyboard) {
      _focusNodes.last.unfocus();

      // Trigger onCompleted callback when all fields are filled
      if (_isCompleted()) {
        widget.onCompleted(_getOtpValue());
      }
    }
  }

  void _moveToPreviousField(int index) {
    if (index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  void _updateOtpValue() {
    setState(() {});
    widget.onChanged(_getOtpValue());
  }

  String _getOtpValue() {
    return _otpValues.join();
  }

  bool _isCompleted() {
    return _otpValues.every((value) => value.isNotEmpty);
  }

  void setError(String? errorMessage) {
    setState(() {
      _hasError = errorMessage != null;
      _errorMessage = errorMessage;
    });

    if (_hasError && _errorAnimationController != null) {
      _errorAnimationController!.forward().then((_) {
        // Start animation again after a short delay for better effect
        Future.delayed(const Duration(milliseconds: 300), () {
          if (_hasError &&
              _errorAnimationController != null &&
              !_errorAnimationController!.isAnimating) {
            _errorAnimationController!.forward();
          }
        });
      });
    }
  }

  void clearError() {
    setState(() {
      _hasError = false;
      _errorMessage = null;
    });
  }

  void clearOtp() {
    setState(() {
      for (int i = 0; i < widget.length; i++) {
        _controllers[i].clear();
        _otpValues[i] = '';
      }
      _hasError = false;
      _errorMessage = null;
    });

    widget.onChanged('');

    if (widget.autofocus) {
      _focusNodes[0].requestFocus();
    }
  }

  void setOtp(String otp) {
    clearOtp();

    setState(() {
      for (int i = 0; i < widget.length && i < otp.length; i++) {
        _controllers[i].text = otp[i];
        _otpValues[i] = otp[i];
      }
    });

    widget.onChanged(_getOtpValue());

    if (_isCompleted()) {
      widget.onCompleted(_getOtpValue());
      if (widget.autoDismissKeyboard) {
        _focusNodes.last.unfocus();
      }
    }
  }

  void _triggerHapticFeedback() {
    switch (widget.hapticFeedbackType) {
      case HapticFeedbackType.light:
        HapticFeedback.lightImpact();
        break;
      case HapticFeedbackType.medium:
        HapticFeedback.mediumImpact();
        break;
      case HapticFeedbackType.heavy:
        HapticFeedback.heavyImpact();
        break;
      case HapticFeedbackType.selection:
        HapticFeedback.selectionClick();
        break;
      case HapticFeedbackType.none:
        // No feedback
        break;
    }
  }

  bool _shouldShowTextFieldCursor(bool hasFocus) {
    if (!widget.showCursor || !hasFocus) return false;

    switch (widget.cursorStyle) {
      case CursorStyle.none:
        return false;
      case CursorStyle.vertical:
        return true; // Use TextField's built-in vertical cursor
      case CursorStyle.bottom:
      case CursorStyle.custom:
        return false; // Use custom cursor implementations
      case null:
        return true; // Default behavior
    }
  }

  bool _shouldShowCustomCursor() {
    if (!widget.showCursor) return false;

    switch (widget.cursorStyle) {
      case CursorStyle.bottom:
      case CursorStyle.custom:
        return true;
      case CursorStyle.none:
      case CursorStyle.vertical:
      case null:
        return false;
    }
  }

  Widget _buildCustomCursor() {
    final cursorColor = widget.cursorColor ?? Theme.of(context).primaryColor;

    switch (widget.cursorStyle) {
      case CursorStyle.bottom:
        // Bottom cursor should be a small underline like "_" - better styled
        return Positioned(
          bottom: 6, // Better positioned from bottom
          left: widget.fieldWidth / 2 - 8, // Better centered
          child: Container(
            width: 16, // Better width for visibility
            height: 3, // Slightly thicker for better visibility
            decoration: BoxDecoration(
              color: cursorColor,
              borderRadius: BorderRadius.circular(1.5),
              boxShadow: [
                BoxShadow(
                  color: cursorColor.withValues(alpha: 0.3),
                  blurRadius: 2,
                  spreadRadius: 0.5,
                ),
              ],
            ),
          ),
        );
      case CursorStyle.custom:
        // Use developer's custom cursor builder
        if (widget.customCursorBuilder != null) {
          return Positioned.fill(
            child: Center(
              child: widget.customCursorBuilder!(context, cursorColor),
            ),
          );
        }
        return const SizedBox.shrink();
      default:
        return const SizedBox.shrink();
    }
  }

  BoxDecoration _getDefaultDecoration(BuildContext context) {
    return BoxDecoration(
      border: Border.all(
        color: Colors.grey.shade300,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }

  BoxDecoration _getDefaultFocusedDecoration(BuildContext context) {
    return BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context)
            .primaryColor
            .withAlpha(26) // Equivalent to 0.1 opacity
        );
  }

  BoxDecoration _getDefaultCompletedDecoration(BuildContext context) {
    return BoxDecoration(
      border: Border.all(
        color: Colors.green,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(8),
      color: Colors.green.withValues(alpha: 0.1),
    );
  }

  BoxDecoration _getDefaultErrorDecoration(BuildContext context) {
    return BoxDecoration(
      border: Border.all(
        color: Colors.red,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(8),
      color: Colors.red.withValues(alpha: 0.1),
    );
  }
}

/// Represents the state of a single OTP field.
class OtpFieldState {
  /// Creates a new OTP field state.
  OtpFieldState({
    required this.value,
    required this.hasFocus,
    required this.hasError,
    required this.isCompleted,
    required this.isFilled,
    required this.index,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onBackspace,
  });

  /// The current value of the field.
  final String value;

  /// Whether the field has focus.
  final bool hasFocus;

  /// Whether the field has an error.
  final bool hasError;

  /// Whether all fields are completed.
  final bool isCompleted;

  /// Whether this field is filled.
  final bool isFilled;

  /// The index of this field.
  final int index;

  /// The controller for this field.
  final TextEditingController controller;

  /// The focus node for this field.
  final FocusNode focusNode;

  /// Callback when the field value changes.
  final ValueChanged<String> onChanged;

  /// Callback when backspace is pressed in an empty field.
  final VoidCallback onBackspace;
}

/// Types of field animations.
enum FieldAnimationType {
  /// No animation.
  none,

  /// Scale animation.
  scale,

  /// Rotate animation.
  rotate,

  /// Slide animation.
  slide,

  /// Fade animation.
  fade,
}

/// Types of haptic feedback.
enum HapticFeedbackType {
  /// No haptic feedback.
  none,

  /// Light haptic feedback.
  light,

  /// Medium haptic feedback.
  medium,

  /// Heavy haptic feedback.
  heavy,

  /// Selection click haptic feedback.
  selection,
}

/// Extension for Color to support withValues
extension ColorWithValues on Color {
  /// Creates a copy of this color with specified values.
  Color withValues({
    int? red,
    int? green,
    int? blue,
    double? opacity,
  }) {
    return Color.fromARGB(
      (opacity != null
          ? (opacity * 255).round()
          : (this.opacity * 255).round() & 0xff),
      red ?? ((this.red * 255).round() & 0xff),
      green ?? ((this.green * 255).round() & 0xff),
      blue ?? ((this.blue * 255).round() & 0xff),
    );
  }
}
