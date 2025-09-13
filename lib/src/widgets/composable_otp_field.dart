import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../state/reactive_otp_state.dart';

/// A composable OTP field that uses the reactive state system.
///
/// This widget is designed to be highly customizable and composable,
/// allowing developers to build complex OTP experiences by combining smaller parts.
class ComposableOtpField extends StatefulWidget {
  /// Creates a new composable OTP field.
  const ComposableOtpField({
    Key? key,
    required this.controller,
    required this.onChanged,
    this.onCompleted,
    this.fieldBuilder,
    this.keyboardType = TextInputType.number,
    this.inputFormatters,
    this.autoFocus = true,
    this.enabled = true,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.hapticFeedbackType = HapticFeedbackType.light,
    this.fieldSpacing = 8.0,
  }) : super(key: key);

  /// The controller for this OTP field.
  final OtpController controller;

  /// Callback when the OTP value changes.
  final ValueChanged<String> onChanged;

  /// Callback when all digits are filled.
  final ValueChanged<String>? onCompleted;

  /// Builder for creating custom OTP field items.
  final Widget Function(BuildContext, int, OtpFieldItemState)? fieldBuilder;

  /// Keyboard type for the OTP input.
  final TextInputType keyboardType;

  /// Input formatters for the OTP input.
  final List<TextInputFormatter>? inputFormatters;

  /// Whether to auto-focus the first field.
  final bool autoFocus;

  /// Whether the OTP field is enabled.
  final bool enabled;

  /// Whether to obscure the input.
  final bool obscureText;

  /// Character to use for obscuring text.
  final String obscuringCharacter;

  /// Type of haptic feedback to provide.
  final HapticFeedbackType hapticFeedbackType;

  /// Spacing between fields.
  final double fieldSpacing;

  @override
  State<ComposableOtpField> createState() => _ComposableOtpFieldState();
}

class _ComposableOtpFieldState extends State<ComposableOtpField> {
  late OtpController _controller;
  late List<TextEditingController> _textControllers;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _textControllers = List.generate(
      _controller.length,
      (index) => TextEditingController(),
    );

    // Sync the text controllers with the field values
    for (var i = 0; i < _controller.fieldValues.length; i++) {
      _controller.fieldValues[i].addListener(() {
        _updateTextController(i);
      });
      _updateTextController(i);
    }

    // Auto-focus the first field if enabled
    if (widget.autoFocus && _controller.focusNodes.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _controller.requestFocus(0);
      });
    }
  }

  void _updateTextController(int index) {
    if (_textControllers[index].text != _controller.fieldValues[index].value) {
      _textControllers[index].text = _controller.fieldValues[index].value;
    }
  }

  void _onDigitChanged(String value, int index) {
    if (value.length > 1) {
      value = value[0];
    }

    _controller.setFieldValue(index, value);
    widget.onChanged(_controller.value);

    // Provide haptic feedback if enabled
    if (value.isNotEmpty &&
        widget.hapticFeedbackType != HapticFeedbackType.none) {
      widget.hapticFeedbackType.trigger();
    }

    // Move to next field if this one is filled
    if (value.isNotEmpty && index < _controller.length - 1) {
      _controller.requestFocus(index + 1);
    }

    // Check if all fields are filled
    if (_controller.isCompleted && widget.onCompleted != null) {
      widget.onCompleted!(_controller.value);
    }
  }

  void _onKeyEvent(RawKeyEvent event, int index) {
    // Handle backspace to go to previous field
    if (event is RawKeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace &&
        _textControllers[index].text.isEmpty &&
        index > 0) {
      _controller.requestFocus(index - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _controller.length,
            (index) => Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: widget.fieldSpacing / 2),
              child: _buildField(index),
            ),
          ),
        );
      },
    );
  }

  Widget _buildField(int index) {
    if (widget.fieldBuilder != null) {
      return widget.fieldBuilder!(
        context,
        index,
        OtpFieldItemState(
          value: _controller.fieldValues[index].value,
          hasFocus: _controller.focusNodes[index].hasFocus,
          hasError: _controller.hasError,
          isCompleted: _controller.isCompleted,
          isFilled: _controller.fieldValues[index].value.isNotEmpty,
          index: index,
          controller: _textControllers[index],
          focusNode: _controller.focusNodes[index],
          onChanged: (value) => _onDigitChanged(value, index),
        ),
      );
    }

    return _buildDefaultField(index);
  }

  Widget _buildDefaultField(int index) {
    return SizedBox(
      width: 50,
      height: 50,
      child: OtpFieldItemBuilder(
        value: _controller.fieldValues[index],
        focusNode: _controller.focusNodes[index],
        hasError: _controller.hasError,
        controller: _textControllers[index],
        obscureText: widget.obscureText,
        obscuringCharacter: widget.obscuringCharacter,
        enabled: widget.enabled,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters ??
            [
              LengthLimitingTextInputFormatter(1),
              if (widget.keyboardType == TextInputType.number)
                FilteringTextInputFormatter.digitsOnly,
            ],
        onChanged: (value) => _onDigitChanged(value, index),
        onKeyEvent: (event) => _onKeyEvent(event, index),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _textControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}

/// A state object representing the state of an OTP field item.
class OtpFieldItemState {
  /// The current value of the field.
  final String value;

  /// Whether the field currently has focus.
  final bool hasFocus;

  /// Whether there's an error state.
  final bool hasError;

  /// Whether all fields are completed.
  final bool isCompleted;

  /// Whether this field has a value.
  final bool isFilled;

  /// The index of this field.
  final int index;

  /// The text controller for this field.
  final TextEditingController controller;

  /// The focus node for this field.
  final FocusNode focusNode;

  /// Callback when the value changes.
  final ValueChanged<String> onChanged;

  /// Creates a new OTP field item state.
  const OtpFieldItemState({
    required this.value,
    required this.hasFocus,
    required this.hasError,
    required this.isCompleted,
    required this.isFilled,
    required this.index,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });
}

/// A builder widget for creating OTP field items.
class OtpFieldItemBuilder extends StatelessWidget {
  /// Creates a new OTP field item builder.
  const OtpFieldItemBuilder({
    Key? key,
    required this.value,
    required this.focusNode,
    required this.hasError,
    required this.controller,
    required this.onChanged,
    this.onKeyEvent,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.enabled = true,
    this.keyboardType = TextInputType.number,
    this.inputFormatters,
  }) : super(key: key);

  /// The value notifier for the field.
  final ValueNotifier<String> value;

  /// The focus node for the field.
  final FocusNode focusNode;

  /// Whether the OTP has an error.
  final bool hasError;

  /// The text controller for the field.
  final TextEditingController controller;

  /// Callback when the value changes.
  final ValueChanged<String> onChanged;

  /// Callback for key events.
  final void Function(RawKeyEvent)? onKeyEvent;

  /// Whether to obscure the input.
  final bool obscureText;

  /// Character to use for obscuring text.
  final String obscuringCharacter;

  /// Whether the field is enabled.
  final bool enabled;

  /// Keyboard type for the field.
  final TextInputType keyboardType;

  /// Input formatters for the field.
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: value,
      builder: (context, fieldValue, _) {
        final isFilled = fieldValue.isNotEmpty;
        final hasFocus = focusNode.hasFocus;

        // Choose appropriate decoration based on state
        final decoration = BoxDecoration(
          border: Border.all(
            color: hasError
                ? Colors.red
                : hasFocus
                    ? Theme.of(context).primaryColor
                    : isFilled
                        ? Theme.of(context)
                            .primaryColor
                            .withAlpha(128) // Equivalent to 0.5 opacity
                        : Colors.grey.shade300,
            width: hasFocus ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
          color: hasError
              ? Colors.red.withAlpha(13) // Equivalent to 0.05 opacity
              : hasFocus
                  ? Theme.of(context)
                      .primaryColor
                      .withAlpha(13) // Equivalent to 0.05 opacity
                  : null,
        );

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: decoration,
          alignment: Alignment.center,
          child: RawKeyboardListener(
            focusNode: FocusNode(),
            onKey: onKeyEvent != null ? onKeyEvent! : (_) {},
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
              obscureText: obscureText,
              obscuringCharacter: obscuringCharacter,
              enabled: enabled,
              onChanged: onChanged,
            ),
          ),
        );
      },
    );
  }
}

/// Type definitions for haptic feedback types.
enum HapticFeedbackType {
  /// No haptic feedback.
  none,

  /// Light haptic feedback.
  light,

  /// Medium haptic feedback.
  medium,

  /// Heavy haptic feedback.
  heavy,

  /// Selection click feedback.
  selection,
}

/// Extension for [HapticFeedbackType] to provide haptic feedback.
extension HapticFeedbackTypeExtension on HapticFeedbackType {
  /// Provides the appropriate haptic feedback.
  void trigger() {
    switch (this) {
      case HapticFeedbackType.none:
        break;
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
    }
  }
}
