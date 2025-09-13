import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/flexible_otp_field.dart';
import '../styling/otp_predefined_style.dart';

/// A builder class for creating highly customizable OTP inputs.
///
/// This class follows the builder pattern to provide a fluent API for configuring
/// OTP fields with full customization options.
class OtpBuilder {
  /// The number of OTP fields to display.
  int _length = 4;

  /// Default width for each OTP field.
  double _fieldWidth = 50;

  /// Default height for each OTP field.
  double _fieldHeight = 50;

  /// Spacing between fields.
  double _fieldSpacing = 10;

  /// Whether to obscure the text input.
  bool _obscureText = false;

  /// Character to use for obscuring text.
  String _obscuringCharacter = '•';

  /// Whether to enable haptic feedback.
  HapticFeedbackType _hapticFeedbackType = HapticFeedbackType.light;

  /// The keyboard type for input.
  TextInputType _keyboardType = TextInputType.number;

  /// Custom input formatters.
  List<TextInputFormatter>? _inputFormatters;

  /// Text style for the input.
  TextStyle? _textStyle;

  /// Error text style.
  TextStyle? _errorTextStyle;

  /// Whether to auto-focus the first field.
  bool _autofocus = true;

  /// Whether the field is enabled.
  bool _enabled = true;

  /// Whether to enable suggestions.
  bool _enableSuggestions = false;

  /// Whether to enable interactive text selection.
  bool _enableInteractiveSelection = true;

  /// Text capitalization for the input.
  TextCapitalization _textCapitalization = TextCapitalization.none;

  /// Whether to enable autocorrect.
  bool _autocorrect = false;

  /// Auto-validate mode for the field.
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  /// Validator function for the field.
  FormFieldValidator<String>? _validator;

  /// Decoration for the field.
  BoxDecoration? _decoration;

  /// Decoration for the field when focused.
  BoxDecoration? _focusedDecoration;

  /// Decoration for the field when there's an error.
  BoxDecoration? _errorDecoration;

  /// Decoration for the field when completed.
  BoxDecoration? _completedDecoration;

  /// Color of the cursor.
  Color? _cursorColor;

  /// Width of the cursor.
  double _cursorWidth = 2.0;

  /// Height of the cursor.
  double? _cursorHeight;

  /// Whether to show the cursor.
  bool _showCursor = true;

  /// Duration of the cursor blink animation.
  Duration _cursorBlinkDuration = const Duration(milliseconds: 500);

  /// Text alignment within the field.
  TextAlign _textAlign = TextAlign.center;

  /// Vertical text alignment within the field.
  TextAlignVertical _textAlignVertical = TextAlignVertical.center;

  /// Text direction for the input.
  TextDirection? _textDirection;

  /// Whether the field is read-only.
  bool _readOnly = false;

  /// Whether to show the keyboard.
  bool _showKeyboard = true;

  /// Whether to automatically dismiss the keyboard when input is complete.
  bool _autoDismissKeyboard = true;

  /// Custom builder for each field.
  Widget Function(BuildContext context, int index, OtpFieldState state)?
      _fieldBuilder;

  /// Whether to animate the fields.
  bool _animateFields = false;

  /// Type of animation to use for the fields.
  FieldAnimationType _fieldAnimationType = FieldAnimationType.scale;

  /// Duration of the animation.
  Duration _animationDuration = const Duration(milliseconds: 200);

  /// Curve for the animation.
  Curve _animationCurve = Curves.easeInOut;

  /// Duration of the error animation.
  Duration _errorAnimationDuration = const Duration(milliseconds: 300);

  /// Curve for the error animation.
  Curve _errorAnimationCurve = Curves.elasticOut;

  /// Duration for the shake animation.
  Duration _shakeAnimationDuration = const Duration(milliseconds: 600);

  /// Intensity of the shake animation (offset in pixels).
  double _shakeAnimationIntensity = 4.0;

  /// Whether to show error text below the fields.
  bool _showErrorText = true;

  /// Custom cursor builder for when cursorStyle is CursorStyle.custom.
  Widget Function(BuildContext context, Color cursorColor)?
      _customCursorBuilder;

  /// Auto-fill hints for the input.
  List<String> _autoFillHints = const ['oneTimeCode'];

  /// Whether to enable paste functionality.
  bool _enablePaste = true;

  /// Callback when text is pasted.
  Function(String)? _onPaste;

  /// Custom text controller.
  TextEditingController? _textController;

  /// Custom focus node.
  FocusNode? _focusNode;

  /// Sets the number of OTP fields to display.
  OtpBuilder length(int length) {
    _length = length;
    return this;
  }

  /// Sets the width of each OTP field.
  OtpBuilder fieldWidth(double width) {
    _fieldWidth = width;
    return this;
  }

  /// Sets the height of each OTP field.
  OtpBuilder fieldHeight(double height) {
    _fieldHeight = height;
    return this;
  }

  /// Sets the spacing between OTP fields.
  OtpBuilder fieldSpacing(double spacing) {
    _fieldSpacing = spacing;
    return this;
  }

  /// Sets whether to obscure the text input.
  OtpBuilder obscureText(bool obscure) {
    _obscureText = obscure;
    return this;
  }

  /// Sets the character to use for obscuring text.
  OtpBuilder obscuringCharacter(String character) {
    _obscuringCharacter = character;
    return this;
  }

  /// Sets the type of haptic feedback to provide.
  OtpBuilder hapticFeedbackType(HapticFeedbackType type) {
    _hapticFeedbackType = type;
    return this;
  }

  /// Sets the keyboard type for input.
  OtpBuilder keyboardType(TextInputType type) {
    _keyboardType = type;
    return this;
  }

  /// Sets the input formatters for the field.
  OtpBuilder inputFormatters(List<TextInputFormatter> formatters) {
    _inputFormatters = formatters;
    return this;
  }

  /// Sets the text style for the input.
  OtpBuilder textStyle(TextStyle style) {
    _textStyle = style;
    return this;
  }

  /// Sets the error text style.
  OtpBuilder errorTextStyle(TextStyle style) {
    _errorTextStyle = style;
    return this;
  }

  /// Sets whether to auto-focus the first field.
  OtpBuilder autofocus(bool autofocus) {
    _autofocus = autofocus;
    return this;
  }

  /// Sets whether the field is enabled.
  OtpBuilder enabled(bool enabled) {
    _enabled = enabled;
    return this;
  }

  /// Sets whether to enable suggestions.
  OtpBuilder enableSuggestions(bool enable) {
    _enableSuggestions = enable;
    return this;
  }

  /// Sets whether to enable interactive text selection.
  OtpBuilder enableInteractiveSelection(bool enable) {
    _enableInteractiveSelection = enable;
    return this;
  }

  /// Sets the text capitalization for the input.
  OtpBuilder textCapitalization(TextCapitalization capitalization) {
    _textCapitalization = capitalization;
    return this;
  }

  /// Sets whether to enable autocorrect.
  OtpBuilder autocorrect(bool autocorrect) {
    _autocorrect = autocorrect;
    return this;
  }

  /// Sets the auto-validate mode for the field.
  OtpBuilder autovalidateMode(AutovalidateMode mode) {
    _autovalidateMode = mode;
    return this;
  }

  /// Sets the validator function for the field.
  OtpBuilder validator(FormFieldValidator<String> validator) {
    _validator = validator;
    return this;
  }

  /// Sets the decoration for the field.
  OtpBuilder decoration(BoxDecoration decoration) {
    _decoration = decoration;
    return this;
  }

  /// Sets the decoration for the field when focused.
  OtpBuilder focusedDecoration(BoxDecoration decoration) {
    _focusedDecoration = decoration;
    return this;
  }

  /// Sets the decoration for the field when there's an error.
  OtpBuilder errorDecoration(BoxDecoration decoration) {
    _errorDecoration = decoration;
    return this;
  }

  /// Sets the decoration for the field when completed.
  OtpBuilder completedDecoration(BoxDecoration decoration) {
    _completedDecoration = decoration;
    return this;
  }

  /// Sets the color of the cursor.
  OtpBuilder cursorColor(Color color) {
    _cursorColor = color;
    return this;
  }

  /// Sets the width of the cursor.
  OtpBuilder cursorWidth(double width) {
    _cursorWidth = width;
    return this;
  }

  /// Sets the height of the cursor.
  OtpBuilder cursorHeight(double? height) {
    _cursorHeight = height;
    return this;
  }

  /// Sets whether to show the cursor.
  OtpBuilder showCursor(bool show) {
    _showCursor = show;
    return this;
  }

  /// Sets the duration of the cursor blink animation.
  OtpBuilder cursorBlinkDuration(Duration duration) {
    _cursorBlinkDuration = duration;
    return this;
  }

  /// Sets the text alignment within the field.
  OtpBuilder textAlign(TextAlign align) {
    _textAlign = align;
    return this;
  }

  /// Sets the vertical text alignment within the field.
  OtpBuilder textAlignVertical(TextAlignVertical align) {
    _textAlignVertical = align;
    return this;
  }

  /// Sets the text direction for the input.
  OtpBuilder textDirection(TextDirection direction) {
    _textDirection = direction;
    return this;
  }

  /// Sets whether the field is read-only.
  OtpBuilder readOnly(bool readOnly) {
    _readOnly = readOnly;
    return this;
  }

  /// Sets whether to show the keyboard.
  OtpBuilder showKeyboard(bool show) {
    _showKeyboard = show;
    return this;
  }

  /// Sets whether to automatically dismiss the keyboard when input is complete.
  OtpBuilder autoDismissKeyboard(bool dismiss) {
    _autoDismissKeyboard = dismiss;
    return this;
  }

  /// Sets the custom builder for each field.
  OtpBuilder fieldBuilder(
      Widget Function(BuildContext context, int index, OtpFieldState state)
          builder) {
    _fieldBuilder = builder;
    return this;
  }

  /// Sets whether to animate the fields.
  OtpBuilder animateFields(bool animate) {
    _animateFields = animate;
    return this;
  }

  /// Sets the type of animation to use for the fields.
  OtpBuilder fieldAnimationType(FieldAnimationType type) {
    _fieldAnimationType = type;
    return this;
  }

  /// Sets the duration of the animation.
  OtpBuilder animationDuration(Duration duration) {
    _animationDuration = duration;
    return this;
  }

  /// Sets the curve for the animation.
  OtpBuilder animationCurve(Curve curve) {
    _animationCurve = curve;
    return this;
  }

  /// Sets the duration of the error animation.
  OtpBuilder errorAnimationDuration(Duration duration) {
    _errorAnimationDuration = duration;
    return this;
  }

  /// Sets the curve for the error animation.
  OtpBuilder errorAnimationCurve(Curve curve) {
    _errorAnimationCurve = curve;
    return this;
  }

  /// Sets the duration for the shake animation.
  OtpBuilder shakeAnimationDuration(Duration duration) {
    _shakeAnimationDuration = duration;
    return this;
  }

  /// Sets the intensity of the shake animation.
  OtpBuilder shakeAnimationIntensity(double intensity) {
    _shakeAnimationIntensity = intensity;
    return this;
  }

  /// Sets whether to show error text below the fields.
  OtpBuilder showErrorText(bool show) {
    _showErrorText = show;
    return this;
  }

  /// Sets a custom cursor builder for when cursorStyle is CursorStyle.custom.
  OtpBuilder customCursorBuilder(
      Widget Function(BuildContext context, Color cursorColor) builder) {
    _customCursorBuilder = builder;
    return this;
  }

  /// Sets the auto-fill hints for the input.
  OtpBuilder autoFillHints(List<String> hints) {
    _autoFillHints = hints;
    return this;
  }

  /// Sets whether to enable paste functionality.
  OtpBuilder enablePaste(bool enable) {
    _enablePaste = enable;
    return this;
  }

  /// Sets the callback when text is pasted.
  OtpBuilder onPaste(Function(String) callback) {
    _onPaste = callback;
    return this;
  }

  /// Sets the custom text controller.
  OtpBuilder textController(TextEditingController controller) {
    _textController = controller;
    return this;
  }

  /// Sets the custom focus node.
  OtpBuilder focusNode(FocusNode node) {
    _focusNode = node;
    return this;
  }

  /// Sets the border radius for the field.
  OtpBuilder borderRadius(double radius) {
    final decoration = _decoration ??
        BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(radius),
        );

    final focusedDecoration = _focusedDecoration ??
        BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(radius),
          color: Colors.blue.withAlpha(26), // Equivalent to 0.1 opacity
        );

    final errorDecoration = _errorDecoration ??
        BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(radius),
          color: Colors.red.withAlpha(26), // Equivalent to 0.1 opacity
        );

    final completedDecoration = _completedDecoration ??
        BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(radius),
          color: Colors.green.withAlpha(13), // Equivalent to 0.05 opacity
        );

    _decoration = decoration;
    _focusedDecoration = focusedDecoration;
    _errorDecoration = errorDecoration;
    _completedDecoration = completedDecoration;

    return this;
  }

  /// Sets the border width for the field.
  OtpBuilder borderWidth(double width) {
    final decoration = _decoration ??
        BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: width),
          borderRadius: BorderRadius.circular(8),
        );

    final focusedDecoration = _focusedDecoration ??
        BoxDecoration(
          border: Border.all(color: Colors.blue, width: width + 1),
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue.withAlpha(26), // Equivalent to 0.1 opacity
        );

    final errorDecoration = _errorDecoration ??
        BoxDecoration(
          border: Border.all(color: Colors.red, width: width),
          borderRadius: BorderRadius.circular(8),
          color: Colors.red.withAlpha(26), // Equivalent to 0.1 opacity
        );

    final completedDecoration = _completedDecoration ??
        BoxDecoration(
          border: Border.all(color: Colors.green, width: width),
          borderRadius: BorderRadius.circular(8),
          color: Colors.green.withAlpha(13), // Equivalent to 0.05 opacity
        );

    _decoration = decoration;
    _focusedDecoration = focusedDecoration;
    _errorDecoration = errorDecoration;
    _completedDecoration = completedDecoration;

    return this;
  }

  /// Sets the border color for the field.
  OtpBuilder borderColor(Color color) {
    final decoration = _decoration ??
        BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(8),
        );

    _decoration = decoration;

    return this;
  }

  /// Sets the focused border color for the field.
  OtpBuilder focusedBorderColor(Color color) {
    final focusedDecoration = _focusedDecoration ??
        BoxDecoration(
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.circular(8),
          color: color.withAlpha(26), // Equivalent to 0.1 opacity
        );

    _focusedDecoration = focusedDecoration;
    _cursorColor = _cursorColor ?? color;

    return this;
  }

  /// Sets the completed border color for the field.
  OtpBuilder completedBorderColor(Color color) {
    final completedDecoration = _completedDecoration ??
        BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(8),
          color: color.withAlpha(13), // Equivalent to 0.05 opacity
        );

    _completedDecoration = completedDecoration;

    return this;
  }

  /// Sets the error border color for the field.
  OtpBuilder errorBorderColor(Color color) {
    final errorDecoration = _errorDecoration ??
        BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(8),
          color: color.withAlpha(26), // Equivalent to 0.1 opacity
        );

    _errorDecoration = errorDecoration;

    return this;
  }

  /// Sets the background color for the field.
  OtpBuilder backgroundColor(Color color) {
    final decoration = _decoration ??
        BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
          color: color,
        );

    _decoration = decoration;

    return this;
  }

  /// Sets the focused background color for the field.
  OtpBuilder focusedBackgroundColor(Color color) {
    final focusedDecoration = _focusedDecoration ??
        BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(8),
          color: color,
        );

    _focusedDecoration = focusedDecoration;

    return this;
  }

  /// Sets the completed background color for the field.
  OtpBuilder completedBackgroundColor(Color color) {
    final completedDecoration = _completedDecoration ??
        BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(8),
          color: color,
        );

    _completedDecoration = completedDecoration;

    return this;
  }

  /// Sets the error background color for the field.
  OtpBuilder errorBackgroundColor(Color color) {
    final errorDecoration = _errorDecoration ??
        BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
          color: color,
        );

    _errorDecoration = errorDecoration;

    return this;
  }

  /// Applies a predefined style to the OTP field.
  OtpBuilder applyStyle(OtpPredefinedStyle style, {Color? primaryColor}) {
    _decoration = style.getDecoration(themeColor: primaryColor);
    _focusedDecoration = style.getFocusedDecoration(themeColor: primaryColor);
    _cursorColor = primaryColor;

    return this;
  }

  /// Enables or disables animations for the OTP field.
  OtpBuilder withAnimations(
    bool enable, {
    FieldAnimationType? animationType,
    Duration? duration,
    Curve? curve,
  }) {
    _animateFields = enable;

    if (animationType != null) {
      _fieldAnimationType = animationType;
    }

    if (duration != null) {
      _animationDuration = duration;
    }

    if (curve != null) {
      _animationCurve = curve;
    }

    return this;
  }

  /// Builds the OTP field with the configured options.
  FlexibleOtpField build({
    required ValueChanged<String> onChanged,
    required ValueChanged<String> onCompleted,
    Key? key,
  }) {
    return FlexibleOtpField(
      key: key,
      length: _length,
      onChanged: onChanged,
      onCompleted: onCompleted,
      obscureText: _obscureText,
      obscuringCharacter: _obscuringCharacter,
      keyboardType: _keyboardType,
      inputFormatters: _inputFormatters,
      autofocus: _autofocus,
      enabled: _enabled,
      enableSuggestions: _enableSuggestions,
      enableInteractiveSelection: _enableInteractiveSelection,
      textCapitalization: _textCapitalization,
      autocorrect: _autocorrect,
      autovalidateMode: _autovalidateMode,
      validator: _validator,
      fieldWidth: _fieldWidth,
      fieldHeight: _fieldHeight,
      fieldSpacing: _fieldSpacing,
      textStyle: _textStyle,
      errorTextStyle: _errorTextStyle,
      decoration: _decoration,
      focusedDecoration: _focusedDecoration,
      errorDecoration: _errorDecoration,
      completedDecoration: _completedDecoration,
      cursorColor: _cursorColor,
      cursorWidth: _cursorWidth,
      cursorHeight: _cursorHeight,
      showCursor: _showCursor,
      cursorBlinkDuration: _cursorBlinkDuration,
      textAlign: _textAlign,
      textAlignVertical: _textAlignVertical,
      textDirection: _textDirection,
      readOnly: _readOnly,
      showKeyboard: _showKeyboard,
      autoDismissKeyboard: _autoDismissKeyboard,
      fieldBuilder: _fieldBuilder,
      animateFields: _animateFields,
      fieldAnimationType: _fieldAnimationType,
      animationDuration: _animationDuration,
      animationCurve: _animationCurve,
      errorAnimationDuration: _errorAnimationDuration,
      errorAnimationCurve: _errorAnimationCurve,
      shakeAnimationDuration: _shakeAnimationDuration,
      shakeAnimationIntensity: _shakeAnimationIntensity,
      showErrorText: _showErrorText,
      customCursorBuilder: _customCursorBuilder,
      hapticFeedbackType: _hapticFeedbackType,
      autoFillHints: _autoFillHints,
      enablePaste: _enablePaste,
      onPaste: _onPaste,
      textController: _textController,
      focusNode: _focusNode,
    );
  }
}
