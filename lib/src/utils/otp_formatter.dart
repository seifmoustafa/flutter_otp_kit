import 'package:flutter/services.dart';
import '../otp_input_type.dart';

/// Utility class for formatting OTP input
class OtpFormatter {
  /// Gets input formatters based on OTP input type
  static List<TextInputFormatter> getInputFormatters(
    OtpInputType inputType, {
    List<TextInputFormatter>? customFormatters,
  }) {
    final formatters = <TextInputFormatter>[
      LengthLimitingTextInputFormatter(1),
    ];

    if (customFormatters != null) {
      formatters.addAll(customFormatters);
    } else {
      switch (inputType) {
        case OtpInputType.numeric:
          formatters.add(FilteringTextInputFormatter.digitsOnly);
          break;
        case OtpInputType.alphabetic:
          formatters.add(FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')));
          break;
        case OtpInputType.alphanumeric:
          formatters.add(FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')));
          break;
        case OtpInputType.custom:
          // Use custom formatters if provided
          break;
      }
    }

    return formatters;
  }

  /// Gets keyboard type based on OTP input type
  static TextInputType getKeyboardType(OtpInputType inputType, {TextInputType? customKeyboardType}) {
    if (customKeyboardType != null) {
      return customKeyboardType;
    }

    switch (inputType) {
      case OtpInputType.numeric:
        return TextInputType.number;
      case OtpInputType.alphabetic:
        return TextInputType.text;
      case OtpInputType.alphanumeric:
        return TextInputType.text;
      case OtpInputType.custom:
        return TextInputType.text;
    }
  }

  /// Formats seconds into MM:SS format for timer display
  static String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
