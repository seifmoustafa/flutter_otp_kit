import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Core components
export 'widgets/flexible_otp_field.dart';
export 'widgets/flexible_otp_verification.dart';

// Configuration
export 'config/otp_builder.dart';

// Styling
export 'styling/otp_predefined_style.dart';

// Widget state for public API
import 'widgets/flexible_otp_field.dart';
import 'widgets/flexible_otp_verification.dart';
import 'config/otp_builder.dart';
import 'styling/otp_predefined_style.dart';

/// A simplified API for the Flutter OTP Kit.
///
/// This class provides static factory methods to create common OTP field configurations
/// with minimal setup, while still allowing for extensive customization when needed.
class FlutterOtpKit {
  /// Creates a simple OTP field with default styling.
  ///
  /// This is the quickest way to add an OTP field to your app.
  static FlexibleOtpField createSimpleOtpField({
    required ValueChanged<String> onChanged,
    required ValueChanged<String> onCompleted,
    int length = 4,
    Color? themeColor,
    OtpPredefinedStyle style = OtpPredefinedStyle.defaultStyle,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.number,
    bool autofocus = true,
  }) {
    return FlexibleOtpField(
      length: length,
      onChanged: onChanged,
      onCompleted: onCompleted,
      obscureText: obscureText,
      keyboardType: keyboardType,
      autofocus: autofocus,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedDecoration: BoxDecoration(
        border: Border.all(
          color: themeColor ?? Colors.blue,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
        color: (themeColor ?? Colors.blue)
            .withAlpha(26), // Equivalent to 0.1 opacity
      ),
    );
  }

  /// Creates a complete OTP verification screen with minimal setup.
  ///
  /// This includes OTP input, verification button, and resend functionality.
  static FlexibleOtpVerification createVerificationScreen({
    required Function(String) onVerify,
    required VoidCallback onResend,
    String? title,
    String? subtitle,
    int otpLength = 4,
    OtpPredefinedStyle otpStyle = OtpPredefinedStyle.defaultStyle,
    Color? themeColor,
    String buttonText = 'Verify',
    String resendText = 'Resend Code',
    bool obscureText = false,
  }) {
    return FlexibleOtpVerification(
      title: title,
      subtitle: subtitle,
      otpLength: otpLength,
      otpStyle: otpStyle,
      themeColor: themeColor,
      buttonText: buttonText,
      resendText: resendText,
      obscureText: obscureText,
      onVerify: onVerify,
      onResend: onResend,
    );
  }

  /// Creates an OTP field with the specified style.
  ///
  /// This method makes it easy to use any of the predefined styles.
  static FlexibleOtpField createStyledOtpField({
    required ValueChanged<String> onChanged,
    required ValueChanged<String> onCompleted,
    required OtpPredefinedStyle style,
    int length = 4,
    Color? themeColor,
    bool obscureText = false,
    bool autofocus = true,
  }) {
    final builder = OtpBuilder()
        .length(length)
        .obscureText(obscureText)
        .autofocus(autofocus)
        .applyStyle(style, primaryColor: themeColor);

    return builder.build(
      onChanged: onChanged,
      onCompleted: onCompleted,
    );
  }

  /// Creates a fully custom OTP field using the builder pattern.
  ///
  /// This provides complete control over all aspects of the OTP field.
  static FlexibleOtpField createCustomOtpField({
    required ValueChanged<String> onChanged,
    required ValueChanged<String> onCompleted,
    required OtpBuilder builder,
  }) {
    return builder.build(
      onChanged: onChanged,
      onCompleted: onCompleted,
    );
  }

  /// Creates an OTP verification screen with custom styling using the builder pattern.
  ///
  /// This provides complete control over all aspects of the verification screen.
  static FlexibleOtpVerification createCustomVerificationScreen({
    required Function(String) onVerify,
    required VoidCallback onResend,
    String? title,
    String? subtitle,
    required OtpBuilder otpBuilder,
    Color? themeColor,
    String buttonText = 'Verify',
    String resendText = 'Resend Code',
    Widget Function(BuildContext, String?, String?)? headerBuilder,
    Widget Function(BuildContext, VoidCallback, bool)? verifyButtonBuilder,
    Widget Function(BuildContext, VoidCallback, int)? resendBuilder,
  }) {
    return FlexibleOtpVerification(
      title: title,
      subtitle: subtitle,
      otpBuilder: otpBuilder,
      themeColor: themeColor,
      buttonText: buttonText,
      resendText: resendText,
      onVerify: onVerify,
      onResend: onResend,
      headerBuilder: headerBuilder,
      verifyButtonBuilder: verifyButtonBuilder,
      resendBuilder: resendBuilder,
    );
  }
}

/// Extension methods for [BuildContext] to access OTP functionality easily.
extension OtpContextExtension on BuildContext {
  /// Shows a simple OTP dialog with the specified configuration.
  ///
  /// This is a quick way to prompt the user for an OTP code.
  Future<String?> showOtpDialog({
    required String title,
    String? message,
    int otpLength = 4,
    OtpPredefinedStyle style = OtpPredefinedStyle.defaultStyle,
    Color? themeColor,
    String confirmButtonText = 'Confirm',
    String cancelButtonText = 'Cancel',
    bool barrierDismissible = true,
    bool obscureText = false,
  }) async {
    return showDialog<String>(
      context: this,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        String otpValue = '';

        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (message != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(message),
                ),
              FlutterOtpKit.createStyledOtpField(
                style: style,
                themeColor: themeColor,
                length: otpLength,
                obscureText: obscureText,
                onChanged: (value) {
                  otpValue = value;
                },
                onCompleted: (value) {
                  otpValue = value;
                  if (value.length == otpLength) {
                    Navigator.of(context).pop(value);
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(cancelButtonText),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(otpValue),
              child: Text(confirmButtonText),
            ),
          ],
        );
      },
    );
  }
}
