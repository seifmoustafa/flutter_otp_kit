import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../state/otp_field_state.dart';
import '../styling/field_colors.dart';
import '../config/otp_field_config.dart';
import '../config/otp_animation_config.dart';
import '../otp_layout_type.dart';
import 'otp_field.dart';

/// A row of OTP input fields
class OtpFieldsRow extends StatefulWidget {
  /// Creates a new OTP fields row
  const OtpFieldsRow({
    Key? key,
    required this.controllers,
    required this.focusNodes,
    required this.fieldStates,
    required this.fieldHasError,
    required this.onDigitChanged,
    required this.config,
    required this.getFieldColors,
    required this.inputFormatters,
    required this.keyboardType,
    required this.validator,
    required this.layoutType,
    required this.fieldCount,
    required this.fieldSpacing,
    required this.cursorAlignment,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.enableInteractiveSelection = true,
    this.textCapitalization = TextCapitalization.none,
    this.hasInternalError = false,
    this.animationConfig = const OtpAnimationConfig(),
  }) : super(key: key);

  /// Text controllers for the fields
  final List<TextEditingController> controllers;

  /// Focus nodes for the fields
  final List<FocusNode> focusNodes;

  /// States of the fields
  final List<OtpFieldState> fieldStates;

  /// Whether each field has an error
  final List<bool> fieldHasError;

  /// Callback when a digit changes
  final Function(String, int) onDigitChanged;

  /// Configuration for the fields
  final OtpFieldConfig config;

  /// Function to get field colors based on state
  final FieldColors Function(int, OtpFieldState, bool) getFieldColors;

  /// Input formatters for the fields
  final List<TextInputFormatter> inputFormatters;

  /// Keyboard type for the fields
  final TextInputType keyboardType;

  /// Validator function for the fields
  final FormFieldValidator<String>? validator;

  /// Layout type for the fields
  final OtpLayoutType layoutType;

  /// Number of fields
  final int fieldCount;

  /// Spacing between fields
  final double fieldSpacing;

  /// Alignment of the cursor within the field
  final TextAlign cursorAlignment;

  /// Whether to obscure the text
  final bool obscureText;

  /// Character to use for obscuring text
  final String obscuringCharacter;

  /// Whether to enable interactive selection
  final bool enableInteractiveSelection;

  /// Text capitalization for the fields
  final TextCapitalization textCapitalization;

  /// Whether the widget has an internal error
  final bool hasInternalError;

  /// Animation configuration for the fields
  final OtpAnimationConfig animationConfig;

  @override
  State<OtpFieldsRow> createState() => _OtpFieldsRowState();
}

class _OtpFieldsRowState extends State<OtpFieldsRow> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive field width calculation
        double? calculatedFieldWidth;
        if (widget.layoutType == OtpLayoutType.responsive) {
          // Calculate field width based on available width and spacing
          final totalSpacing = widget.fieldSpacing * (widget.fieldCount - 1);
          calculatedFieldWidth =
              (constraints.maxWidth - totalSpacing) / widget.fieldCount;

          // Ensure a minimum reasonable size
          final minWidth = widget.config.minResponsiveWidth;
          if (calculatedFieldWidth < minWidth) {
            calculatedFieldWidth = minWidth;
          }
        }

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.fieldCount,
              (index) {
                // Get field colors based on state and error
                final hasError =
                    widget.fieldHasError[index] || widget.hasInternalError;
                final fieldState = widget.fieldStates[index];
                final fieldColors =
                    widget.getFieldColors(index, fieldState, hasError);

                // Handle RTL/LTR directionality for spacing
                final isRTL = Directionality.of(context) == TextDirection.rtl;
                final spacing = EdgeInsets.only(
                  right: !isRTL && index < widget.fieldCount - 1
                      ? widget.fieldSpacing
                      : 0,
                  left: isRTL && index < widget.fieldCount - 1
                      ? widget.fieldSpacing
                      : 0,
                );

                return Padding(
                  padding: spacing,
                  child: OtpField(
                    controller: widget.controllers[index],
                    focusNode: widget.focusNodes[index],
                    fieldState: fieldState,
                    hasError: hasError,
                    onChanged: (value) => widget.onDigitChanged(value, index),
                    config: widget.config,
                    fieldColors: fieldColors,
                    inputFormatters: widget.inputFormatters,
                    keyboardType: widget.keyboardType,
                    cursorAlignment: widget.cursorAlignment,
                    validator: widget.validator,
                    obscureText: widget.obscureText,
                    obscuringCharacter: widget.obscuringCharacter,
                    enableInteractiveSelection:
                        widget.enableInteractiveSelection,
                    textCapitalization: widget.textCapitalization,
                    fieldWidth: calculatedFieldWidth,
                    index: index,
                    fieldCount: widget.fieldCount,
                    animationDuration:
                        widget.animationConfig.fieldTransitionDuration,
                    animationCurve: widget.animationConfig.fieldTransitionCurve,
                    transitionHighlightColor:
                        widget.animationConfig.transitionHighlightColor,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
