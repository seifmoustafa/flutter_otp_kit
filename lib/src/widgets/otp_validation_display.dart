import 'package:flutter/material.dart';

/// Widget for displaying OTP validation messages
/// This is separate from error messages and is used for validation feedback
/// Completely generic - can be any widget with any styling and animation
class OtpValidationDisplay extends StatelessWidget {
  /// Creates a new OTP validation display
  const OtpValidationDisplay({
    Key? key,
    this.validationMessageWidget,
    this.validationText,
    this.validationStyle,
    this.validationColor,
    this.topSpacing,
    this.leftSpacing,
    this.rightSpacing,
    this.bottomSpacing,
    this.maxLines,
    this.showValidationIcon,
    this.validationIcon,
  }) : super(key: key);

  /// Custom validation message widget (overrides validation text)
  final Widget? validationMessageWidget;

  /// Validation message text
  final String? validationText;

  /// Style for validation text
  final TextStyle? validationStyle;

  /// Color for validation text (optional - no default)
  final Color? validationColor;

  /// Top spacing between validation message and OTP fields (optional - no default)
  final double? topSpacing;

  /// Left spacing for validation text (optional - no default)
  final double? leftSpacing;

  /// Right spacing for validation text (optional - no default)
  final double? rightSpacing;

  /// Bottom spacing for validation text (optional - no default)
  final double? bottomSpacing;

  /// Maximum number of lines for validation message (optional - no default)
  final int? maxLines;

  /// Whether to show an icon with the validation message (optional - no default)
  final bool? showValidationIcon;

  /// Icon to display with validation message (optional - no default)
  final IconData? validationIcon;

  @override
  Widget build(BuildContext context) {
    // If no validation text or widget, don't show anything
    if (validationText == null && validationMessageWidget == null) {
      return const SizedBox.shrink();
    }

    // If custom validation widget is provided, use that
    if (validationMessageWidget != null) {
      // Only apply padding if spacing values are provided
      if (topSpacing != null ||
          leftSpacing != null ||
          rightSpacing != null ||
          bottomSpacing != null) {
        return Padding(
          padding: EdgeInsets.only(
            top: topSpacing ?? 0.0,
            left: leftSpacing ?? 0.0,
            right: rightSpacing ?? 0.0,
            bottom: bottomSpacing ?? 0.0,
          ),
          child: validationMessageWidget!,
        );
      }
      // No padding, return widget as-is
      return validationMessageWidget!;
    }

    // Otherwise, build the validation text widget with optional icon
    final validationTextWidget = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Validation icon if enabled
        if (showValidationIcon == true)
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Icon(
              validationIcon ?? Icons.warning_outlined,
              color: validationColor ?? Colors.orange,
              size: 16.0,
            ),
          ),
        // Validation text
        Flexible(
          child: Text(
            validationText!,
            style: validationStyle ??
                TextStyle(
                  color: validationColor ?? Colors.orange,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
            textAlign: TextAlign.center,
            maxLines: maxLines ?? 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );

    // Apply padding only if spacing values are provided
    if (topSpacing != null ||
        leftSpacing != null ||
        rightSpacing != null ||
        bottomSpacing != null) {
      return Padding(
        padding: EdgeInsets.only(
          top: topSpacing ?? 0.0,
          left: leftSpacing ?? 0.0,
          right: rightSpacing ?? 0.0,
          bottom: bottomSpacing ?? 0.0,
        ),
        child: validationTextWidget,
      );
    }

    // No padding, return widget as-is
    return validationTextWidget;
  }
}
