import 'package:flutter/material.dart';

/// A utility class for validating OTP inputs.
class OtpValidator {
  /// Validates an OTP string based on the given validation options.
  static ValidationResult validate(
    String? otp, {
    required OtpValidationOptions options,
  }) {
    // Check if OTP is null or empty
    if (otp == null || otp.isEmpty) {
      return ValidationResult(
        isValid: false,
        errorMessage: options.emptyErrorMessage ?? 'OTP cannot be empty',
        errorType: ValidationErrorType.empty,
      );
    }

    // Check length requirements
    if (options.validateLength && options.expectedLength != null) {
      if (otp.length != options.expectedLength) {
        return ValidationResult(
          isValid: false,
          errorMessage: options.lengthErrorMessage ??
              'OTP must be ${options.expectedLength} digits',
          errorType: ValidationErrorType.length,
        );
      }
    }

    // Check content requirements based on content type
    if (options.validateContent) {
      switch (options.contentType) {
        case OtpContentType.numeric:
          if (!_isNumeric(otp)) {
            return ValidationResult(
              isValid: false,
              errorMessage: options.contentErrorMessage ??
                  'OTP must contain only numbers',
              errorType: ValidationErrorType.content,
            );
          }
          break;
        case OtpContentType.alphanumeric:
          if (!_isAlphanumeric(otp)) {
            return ValidationResult(
              isValid: false,
              errorMessage: options.contentErrorMessage ??
                  'OTP must contain only letters and numbers',
              errorType: ValidationErrorType.content,
            );
          }
          break;
        case OtpContentType.alphabetic:
          if (!_isAlphabetic(otp)) {
            return ValidationResult(
              isValid: false,
              errorMessage: options.contentErrorMessage ??
                  'OTP must contain only letters',
              errorType: ValidationErrorType.content,
            );
          }
          break;
        case OtpContentType.custom:
          if (options.customValidator != null) {
            final customResult = options.customValidator!(otp);
            if (customResult != null) {
              return ValidationResult(
                isValid: false,
                errorMessage: customResult,
                errorType: ValidationErrorType.custom,
              );
            }
          }
          break;
      }
    }

    // Check regex pattern if provided
    if (options.validatePattern &&
        options.pattern != null &&
        !RegExp(options.pattern!).hasMatch(otp)) {
      return ValidationResult(
        isValid: false,
        errorMessage: options.patternErrorMessage ??
            'OTP does not match required pattern',
        errorType: ValidationErrorType.pattern,
      );
    }

    // Check for specific validation rules
    if (options.validateSequential && _isSequential(otp)) {
      return ValidationResult(
        isValid: false,
        errorMessage:
            options.sequentialErrorMessage ?? 'OTP cannot be sequential digits',
        errorType: ValidationErrorType.sequential,
      );
    }

    if (options.validateRepeating && _isRepeating(otp)) {
      return ValidationResult(
        isValid: false,
        errorMessage: options.repeatingErrorMessage ??
            'OTP cannot contain repeating digits',
        errorType: ValidationErrorType.repeating,
      );
    }

    // Check with external validator if provided
    if (options.externalValidator != null) {
      final error = options.externalValidator!(otp);
      if (error != null) {
        return ValidationResult(
          isValid: false,
          errorMessage: error,
          errorType: ValidationErrorType.external,
        );
      }
    }

    // If all validations pass, return success
    return ValidationResult(
      isValid: true,
      errorMessage: null,
      errorType: null,
    );
  }

  /// Checks if a string is numeric (contains only digits).
  static bool _isNumeric(String str) {
    return RegExp(r'^[0-9]+$').hasMatch(str);
  }

  /// Checks if a string is alphabetic (contains only letters).
  static bool _isAlphabetic(String str) {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(str);
  }

  /// Checks if a string is alphanumeric (contains only letters and numbers).
  static bool _isAlphanumeric(String str) {
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(str);
  }

  /// Checks if a numeric string contains sequential digits (e.g., "1234", "4321").
  static bool _isSequential(String str) {
    if (!_isNumeric(str) || str.length < 3) return false;

    bool isAscending = true;
    bool isDescending = true;

    for (int i = 1; i < str.length; i++) {
      int prev = int.parse(str[i - 1]);
      int curr = int.parse(str[i]);

      if (curr != prev + 1) isAscending = false;
      if (curr != prev - 1) isDescending = false;

      if (!isAscending && !isDescending) return false;
    }

    return isAscending || isDescending;
  }

  /// Checks if all characters in a string are the same (e.g., "1111", "aaaa").
  static bool _isRepeating(String str) {
    if (str.length < 2) return false;
    final firstChar = str[0];
    return str.split('').every((char) => char == firstChar);
  }

  /// Checks if a string matches a keyboard pattern (e.g., "qwer", "asdf").
  static bool isKeyboardPattern(String str) {
    const List<String> keyboardRows = [
      '1234567890',
      'qwertyuiop',
      'asdfghjkl',
      'zxcvbnm',
    ];

    if (str.length < 3) return false;

    for (var row in keyboardRows) {
      for (int i = 0; i <= row.length - str.length; i++) {
        final subRow = row.substring(i, i + str.length);
        if (subRow.toLowerCase() == str.toLowerCase() ||
            subRow.toLowerCase().split('').reversed.join() ==
                str.toLowerCase()) {
          return true;
        }
      }
    }
    return false;
  }

  /// A comprehensive validation function for OTP fields.
  static FormFieldValidator<String> createValidator({
    required OtpValidationOptions options,
  }) {
    return (value) {
      final result = validate(value, options: options);
      return result.isValid ? null : result.errorMessage;
    };
  }

  /// Creates a simple numeric OTP validator.
  static FormFieldValidator<String> numericValidator({
    required int length,
    String? lengthErrorMessage,
    String? emptyErrorMessage,
    String? contentErrorMessage,
  }) {
    return createValidator(
      options: OtpValidationOptions(
        expectedLength: length,
        validateLength: true,
        validateContent: true,
        contentType: OtpContentType.numeric,
        emptyErrorMessage: emptyErrorMessage,
        lengthErrorMessage: lengthErrorMessage,
        contentErrorMessage: contentErrorMessage,
      ),
    );
  }

  /// Creates a simple alphanumeric OTP validator.
  static FormFieldValidator<String> alphanumericValidator({
    required int length,
    String? lengthErrorMessage,
    String? emptyErrorMessage,
    String? contentErrorMessage,
  }) {
    return createValidator(
      options: OtpValidationOptions(
        expectedLength: length,
        validateLength: true,
        validateContent: true,
        contentType: OtpContentType.alphanumeric,
        emptyErrorMessage: emptyErrorMessage,
        lengthErrorMessage: lengthErrorMessage,
        contentErrorMessage: contentErrorMessage,
      ),
    );
  }
}

/// Options for OTP validation.
class OtpValidationOptions {
  /// Creates OTP validation options.
  const OtpValidationOptions({
    this.expectedLength,
    this.validateLength = true,
    this.validateContent = true,
    this.validatePattern = false,
    this.validateSequential = false,
    this.validateRepeating = false,
    this.contentType = OtpContentType.numeric,
    this.pattern,
    this.customValidator,
    this.externalValidator,
    this.emptyErrorMessage,
    this.lengthErrorMessage,
    this.contentErrorMessage,
    this.patternErrorMessage,
    this.sequentialErrorMessage,
    this.repeatingErrorMessage,
  });

  /// The expected length of the OTP.
  final int? expectedLength;

  /// Whether to validate the OTP length.
  final bool validateLength;

  /// Whether to validate the OTP content type.
  final bool validateContent;

  /// Whether to validate the OTP against a pattern.
  final bool validatePattern;

  /// Whether to validate if the OTP contains sequential characters.
  final bool validateSequential;

  /// Whether to validate if the OTP contains repeating characters.
  final bool validateRepeating;

  /// The type of content expected in the OTP.
  final OtpContentType contentType;

  /// A regex pattern to validate the OTP against.
  final String? pattern;

  /// A custom validator function.
  final String? Function(String)? customValidator;

  /// An external validator function.
  final String? Function(String)? externalValidator;

  /// Error message for empty OTP.
  final String? emptyErrorMessage;

  /// Error message for incorrect OTP length.
  final String? lengthErrorMessage;

  /// Error message for incorrect OTP content.
  final String? contentErrorMessage;

  /// Error message for OTP not matching the pattern.
  final String? patternErrorMessage;

  /// Error message for sequential OTP.
  final String? sequentialErrorMessage;

  /// Error message for repeating OTP.
  final String? repeatingErrorMessage;

  /// Creates a copy with the given fields replaced.
  OtpValidationOptions copyWith({
    int? expectedLength,
    bool? validateLength,
    bool? validateContent,
    bool? validatePattern,
    bool? validateSequential,
    bool? validateRepeating,
    OtpContentType? contentType,
    String? pattern,
    String? Function(String)? customValidator,
    String? Function(String)? externalValidator,
    String? emptyErrorMessage,
    String? lengthErrorMessage,
    String? contentErrorMessage,
    String? patternErrorMessage,
    String? sequentialErrorMessage,
    String? repeatingErrorMessage,
  }) {
    return OtpValidationOptions(
      expectedLength: expectedLength ?? this.expectedLength,
      validateLength: validateLength ?? this.validateLength,
      validateContent: validateContent ?? this.validateContent,
      validatePattern: validatePattern ?? this.validatePattern,
      validateSequential: validateSequential ?? this.validateSequential,
      validateRepeating: validateRepeating ?? this.validateRepeating,
      contentType: contentType ?? this.contentType,
      pattern: pattern ?? this.pattern,
      customValidator: customValidator ?? this.customValidator,
      externalValidator: externalValidator ?? this.externalValidator,
      emptyErrorMessage: emptyErrorMessage ?? this.emptyErrorMessage,
      lengthErrorMessage: lengthErrorMessage ?? this.lengthErrorMessage,
      contentErrorMessage: contentErrorMessage ?? this.contentErrorMessage,
      patternErrorMessage: patternErrorMessage ?? this.patternErrorMessage,
      sequentialErrorMessage:
          sequentialErrorMessage ?? this.sequentialErrorMessage,
      repeatingErrorMessage:
          repeatingErrorMessage ?? this.repeatingErrorMessage,
    );
  }
}

/// The type of content expected in the OTP.
enum OtpContentType {
  /// OTP should contain only digits (0-9).
  numeric,

  /// OTP should contain only letters (a-z, A-Z).
  alphabetic,

  /// OTP should contain only letters and digits.
  alphanumeric,

  /// Custom OTP content validation.
  custom,
}

/// Type of validation error.
enum ValidationErrorType {
  /// OTP is empty.
  empty,

  /// OTP has incorrect length.
  length,

  /// OTP content type is incorrect.
  content,

  /// OTP does not match the pattern.
  pattern,

  /// OTP contains sequential characters.
  sequential,

  /// OTP contains repeating characters.
  repeating,

  /// Custom validation error.
  custom,

  /// External validation error.
  external,
}

/// Result of OTP validation.
class ValidationResult {
  /// Creates a validation result.
  const ValidationResult({
    required this.isValid,
    this.errorMessage,
    this.errorType,
  });

  /// Whether the OTP is valid.
  final bool isValid;

  /// Error message if the OTP is invalid.
  final String? errorMessage;

  /// Type of validation error.
  final ValidationErrorType? errorType;
}
