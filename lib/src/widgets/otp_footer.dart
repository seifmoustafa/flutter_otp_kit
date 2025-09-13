import 'package:flutter/material.dart';
import '../utils/otp_formatter.dart';

/// Footer widget for OTP verification widget
class OtpFooter extends StatelessWidget {
  /// Creates a new OTP footer
  const OtpFooter({
    Key? key,
    required this.onVerifyPressed,
    required this.onResendPressed,
    required this.isLoading,
    required this.remainingTime,
    required this.primaryColor,
    required this.secondaryColor,
    required this.spacing,
    this.buttonText,
    this.resendText,
    this.timerPrefix,
    this.verifyButtonWidget,
    this.resendWidget,
    this.timerWidget,
    this.buttonStyle,
    this.resendStyle,
    this.timerStyle,
    this.showTimer = true,
    this.buttonBackgroundColor,
    this.buttonTextColor,
    this.buttonBorderRadius = 8.0,
    this.buttonHeight = 50.0,
    this.buttonWidth = double.infinity,
    this.buttonElevation = 0.0,
    this.loadingIndicatorColor,
    this.loadingIndicatorSize = 24.0,
  }) : super(key: key);

  /// Callback when verify button is pressed
  final VoidCallback onVerifyPressed;

  /// Callback when resend button is pressed
  final VoidCallback onResendPressed;

  /// Whether the verify button is loading
  final bool isLoading;

  /// Remaining time for resend timer
  final int remainingTime;

  /// Primary color for styling
  final Color primaryColor;

  /// Secondary color for styling
  final Color secondaryColor;

  /// Spacing between elements
  final double spacing;

  /// Text for verify button (optional - defaults to "Verify")
  final String? buttonText;

  /// Text for resend button (optional - defaults to "Resend Code")
  final String? resendText;

  /// Prefix for timer text (optional - defaults to "Resend in")
  final String? timerPrefix;

  /// Custom verify button widget
  final Widget? verifyButtonWidget;

  /// Custom resend widget
  final Widget? resendWidget;

  /// Custom timer widget
  final Widget? timerWidget;

  /// Style for button text
  final TextStyle? buttonStyle;

  /// Style for resend text
  final TextStyle? resendStyle;

  /// Style for timer text
  final TextStyle? timerStyle;

  /// Whether to show the timer
  final bool showTimer;

  /// Background color for the button
  final Color? buttonBackgroundColor;

  /// Text color for the button
  final Color? buttonTextColor;

  /// Border radius for the button
  final double buttonBorderRadius;

  /// Height for the button
  final double buttonHeight;

  /// Width for the button
  final double buttonWidth;

  /// Elevation for the button
  final double buttonElevation;

  /// Color for the loading indicator
  final Color? loadingIndicatorColor;

  /// Size for the loading indicator
  final double loadingIndicatorSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildVerifyButton(),
        SizedBox(height: spacing * 1.5),
        _buildResend(),
      ],
    );
  }

  /// Builds the verify button widget (custom or default)
  Widget _buildVerifyButton() {
    if (verifyButtonWidget != null) {
      return verifyButtonWidget!;
    }

    return _buildDefaultButton();
  }

  /// Builds the default verify button
  Widget _buildDefaultButton() {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: onVerifyPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonBackgroundColor ?? primaryColor,
          foregroundColor: buttonTextColor ?? Colors.white,
          elevation: buttonElevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonBorderRadius),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: loadingIndicatorSize,
                height: loadingIndicatorSize,
                child: CircularProgressIndicator(
                  color: loadingIndicatorColor ?? Colors.white,
                  strokeWidth: 2.0,
                ),
              )
            : Text(
                buttonText ?? 'Verify',
                style: buttonStyle,
              ),
      ),
    );
  }

  /// Builds the resend widget (custom or default)
  Widget _buildResend() {
    if (resendWidget != null) {
      return resendWidget!;
    }

    if (!showTimer) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: remainingTime == 0 ? onResendPressed : null,
          child: Text(
            resendText ?? 'Resend Code',
            style: resendStyle ??
                TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: remainingTime == 0 ? primaryColor : secondaryColor,
                  decoration: TextDecoration.underline,
                ),
          ),
        ),
        if (remainingTime > 0) _buildTimer(),
      ],
    );
  }

  /// Builds the timer widget (custom or default)
  Widget _buildTimer() {
    if (timerWidget != null) {
      return timerWidget!;
    }

    if (remainingTime > 0) {
      return Text(
        ' ${timerPrefix ?? 'Resend in'} ${OtpFormatter.formatTime(remainingTime)}',
        style: timerStyle ??
            TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: secondaryColor,
            ),
      );
    }

    return const SizedBox.shrink();
  }
}
