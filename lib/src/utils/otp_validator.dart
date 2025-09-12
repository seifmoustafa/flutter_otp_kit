import '../otp_input_type.dart';

/// Utility class for validating OTP input
class OtpValidator {
  /// Validates if the given text is a valid OTP based on input type
  static bool isValidOtp(String text, OtpInputType inputType, int fieldCount) {
    if (text.length != fieldCount) return false;

    switch (inputType) {
      case OtpInputType.numeric:
        return RegExp(r'^[0-9]+$').hasMatch(text);
      case OtpInputType.alphabetic:
        return RegExp(r'^[a-zA-Z]+$').hasMatch(text);
      case OtpInputType.alphanumeric:
        return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(text);
      case OtpInputType.custom:
        return true; // Custom validation handled by validator
    }
  }

  /// Creates a validator function based on validation parameters
  static String? Function(String?)? createValidator({
    required OtpInputType inputType,
    required int fieldCount,
    String? validationRegex,
    String? validationMessage,
    String? Function(String?)? customValidator,
  }) {
    if (customValidator != null) {
      return customValidator;
    }

    if (validationRegex != null) {
      return (value) {
        if (value == null || value.isEmpty) {
          return validationMessage ?? 'This field is required';
        }
        if (!RegExp(validationRegex).hasMatch(value)) {
          return validationMessage ?? 'Invalid input';
        }
        return null;
      };
    }

    switch (inputType) {
      case OtpInputType.numeric:
        return (value) {
          if (value == null || value.isEmpty) {
            return null; // Empty is allowed during input
          }
          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
            return validationMessage ?? 'Numbers only';
          }
          return null;
        };
      case OtpInputType.alphabetic:
        return (value) {
          if (value == null || value.isEmpty) {
            return null; // Empty is allowed during input
          }
          if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
            return validationMessage ?? 'Letters only';
          }
          return null;
        };
      case OtpInputType.alphanumeric:
        return (value) {
          if (value == null || value.isEmpty) {
            return null; // Empty is allowed during input
          }
          if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
            return validationMessage ?? 'Letters and numbers only';
          }
          return null;
        };
      case OtpInputType.custom:
        return null; // No default validation for custom type
    }
  }
}
