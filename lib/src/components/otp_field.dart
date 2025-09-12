import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styling/field_colors.dart';
import '../config/otp_field_config.dart';
import '../state/otp_field_state.dart';

/// A single OTP input field with customizable styling and behavior
class OtpField extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    final width = fieldWidth ?? config.fieldWidth;
    final height = fieldHeight ?? config.fieldHeight;
    
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(config.borderRadius),
        border: Border.all(
          color: fieldColors.borderColor,
          width: config.borderWidth,
        ),
        color: fieldColors.backgroundColor,
        boxShadow: config.enableShadow
            ? [
                BoxShadow(
                  color: config.shadowColor ??
                      config.primaryColor.withAlpha(51), // 0.2 opacity
                  blurRadius: config.shadowBlurRadius,
                  spreadRadius: config.shadowSpreadRadius,
                ),
              ]
            : null,
      ),
      child: Semantics(
        label: index != null && fieldCount != null 
            ? 'OTP field ${index! + 1} of $fieldCount' 
            : 'OTP field',
        textField: true,
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          textAlign: cursorAlignment,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          inputFormatters: inputFormatters,
          obscureText: obscureText,
          obscuringCharacter: obscuringCharacter,
          enableInteractiveSelection: enableInteractiveSelection,
          cursorColor: config.cursorColor ?? config.primaryColor,
          cursorHeight: config.cursorHeight ?? (height - 12),
          cursorWidth: config.cursorWidth,
          style: config.fieldStyle ??
              TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: fieldColors.textColor,
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
          ),
          validator: validator,
          onChanged: onChanged,
        ),
      ),
    );
  }
}