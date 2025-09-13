import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/flexible_otp_field.dart';
import '../widgets/flexible_otp_verification.dart';

/// A compatibility layer for the legacy OTP verification widget API.
///
/// This class provides methods to convert from the old API to the new API,
/// ensuring backward compatibility for existing code.
class LegacyCompatibility {
  /// Creates a new OTP field using the legacy API parameters.
  static FlexibleOtpField createLegacyOtpField({
    required int fieldCount,
    required ValueChanged<String> onChanged,
    ValueChanged<String>? onCompleted,
    bool obscureText = false,
    String obscuringCharacter = '•',
    double? fieldWidth,
    double? fieldHeight,
    double? borderRadius,
    double? borderWidth,
    Color? defaultBorderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    Color? backgroundColor,
    Color? focusedBackgroundColor,
    Color? errorBackgroundColor,
    Color? textColor,
    Color? cursorColor,
    TextStyle? textStyle,
    bool autofocus = true,
    bool enabled = true,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    FormFieldValidator<String>? validator,
  }) {
    return FlexibleOtpField(
      length: fieldCount,
      onChanged: onChanged,
      onCompleted: onCompleted ?? (_) {},
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      fieldWidth: fieldWidth ?? 50,
      fieldHeight: fieldHeight ?? 60,
      autofocus: autofocus,
      enabled: enabled,
      keyboardType: keyboardType ?? TextInputType.number,
      inputFormatters: inputFormatters,
      validator: validator,
      textStyle: textStyle ??
          TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: textColor ?? Colors.black87,
          ),
      decoration: BoxDecoration(
        border: Border.all(
          color: defaultBorderColor ?? Colors.grey.shade300,
          width: borderWidth ?? 1.0,
        ),
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        color: backgroundColor ?? Colors.white,
      ),
      focusedDecoration: BoxDecoration(
        border: Border.all(
          color: focusedBorderColor ?? Colors.blue,
          width: borderWidth ?? 2.0,
        ),
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        color: focusedBackgroundColor ?? Colors.white,
      ),
      errorDecoration: BoxDecoration(
        border: Border.all(
          color: errorBorderColor ?? Colors.red,
          width: borderWidth ?? 2.0,
        ),
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        color: errorBackgroundColor ??
            Colors.red.withAlpha(26), // Equivalent to 0.1 opacity
      ),
      cursorColor: cursorColor,
    );
  }

  /// Creates a new OTP verification widget using the legacy API parameters.
  static FlexibleOtpVerification createLegacyOtpVerification({
    required Function(String) onVerify,
    required VoidCallback onResend,
    String? title,
    String? subtitle,
    String? buttonText,
    String? resendText,
    String? timerPrefix,
    String? contactInfo,
    bool obscureText = false,
    String obscuringCharacter = '•',
    int fieldCount = 4,
    double fieldSpacing = 10.0,
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? defaultBorderColor,
    Color? focusedBorderColor,
    Color? completedFieldBorderColor,
    Color? errorBorderColor,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    TextStyle? errorStyle,
    TextStyle? buttonStyle,
    TextStyle? resendStyle,
    TextStyle? timerStyle,
    String? errorText,
    Color? buttonBackgroundColor,
    Color? buttonTextColor,
    double buttonBorderRadius = 8.0,
    double buttonHeight = 50.0,
    double buttonWidth = double.infinity,
    double buttonElevation = 0.0,
    Color? loadingIndicatorColor,
    double loadingIndicatorSize = 24.0,
    bool enableAutoValidation = false,
    bool enablePaste = true,
    bool showTimer = true,
    int timerDuration = 60,
    bool autofocus = true,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onCompleted,
    ValueChanged<bool>? onErrorStateChanged,
    ValueChanged<int>? onTimerChanged,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    Widget? titleWidget,
    Widget? subtitleWidget,
    Widget? errorWidget,
    Widget? verifyButtonWidget,
    Widget? resendWidget,
    Widget? timerWidget,
  }) {
    return FlexibleOtpVerification(
      title: title,
      subtitle: subtitle,
      titleWidget: titleWidget,
      subtitleWidget: subtitleWidget,
      otpLength: fieldCount,
      verifyButtonBuilder: verifyButtonWidget != null
          ? (_, __, ___) => verifyButtonWidget
          : null,
      resendBuilder: resendWidget != null ? (_, __, ___) => resendWidget : null,
      errorBuilder: errorWidget != null ? (_, __) => errorWidget : null,
      timerBuilder: timerWidget != null ? (_, __) => timerWidget : null,
      spaceBetweenFields: fieldSpacing,
      buttonText: buttonText ?? 'Verify',
      resendText: resendText ?? 'Resend Code',
      timerText:
          timerPrefix != null ? '$timerPrefix {time}s' : 'Resend in {time}s',
      enableAutoValidation: enableAutoValidation,
      enableResend: showTimer,
      resendTimerDuration: timerDuration,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      themeColor: primaryColor,
      buttonBackgroundColor: buttonBackgroundColor,
      buttonTextColor: buttonTextColor,
      buttonBorderRadius: buttonBorderRadius,
      buttonHeight: buttonHeight,
      buttonWidth: buttonWidth,
      buttonElevation: buttonElevation,
      loadingIndicatorColor: loadingIndicatorColor,
      loadingIndicatorSize: loadingIndicatorSize,
      titleStyle: titleStyle,
      subtitleStyle: subtitleStyle,
      buttonStyle: buttonStyle,
      resendStyle: resendStyle,
      timerStyle: timerStyle,
      onVerify: onVerify,
      onResend: onResend,
      onOtpChanged: onChanged,
      onOtpCompleted: onCompleted,
      onErrorStateChanged: onErrorStateChanged,
      onTimerChanged: onTimerChanged,
    );
  }

  /// Converts a legacy OTP widget to the new flexible OTP verification widget.
  static FlexibleOtpVerification convertLegacyWidget({
    required Widget legacyWidget,
    required Function(String) onVerify,
    required VoidCallback onResend,
  }) {
    // Get parameters from legacy widget if possible
    // This is a simplified version, in practice you'd need to extract more parameters

    return FlexibleOtpVerification(
      title: 'Verification Code',
      subtitle: 'Enter the verification code',
      otpLength: 4,
      onVerify: onVerify,
      onResend: onResend,
    );
  }
}
