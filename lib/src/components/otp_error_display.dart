import 'package:flutter/material.dart';

/// Error display component for OTP verification widget
class OtpErrorDisplay extends StatelessWidget {
  /// Creates a new OTP error display
  const OtpErrorDisplay({
    Key? key,
    this.errorText,
    this.errorWidget,
    this.errorStyle,
    this.errorColor = Colors.red,
    this.topSpacing = 8.0,
  }) : super(key: key);

  /// Error text to display
  final String? errorText;

  /// Custom error widget
  final Widget? errorWidget;

  /// Style for error text
  final TextStyle? errorStyle;

  /// Color for error text
  final Color errorColor;

  /// Spacing above the error
  final double topSpacing;

  @override
  Widget build(BuildContext context) {
    if (errorWidget != null) {
      return errorWidget!;
    }

    if (errorText != null) {
      return Padding(
        padding: EdgeInsets.only(top: topSpacing),
        child: Text(
          errorText!,
          style: errorStyle ??
              TextStyle(
                color: errorColor,
                fontSize: 12,
              ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
