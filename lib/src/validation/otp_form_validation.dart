import 'package:flutter/material.dart';

/// Enhanced form validation system for OTP input
/// Provides comprehensive validation with autovalidate modes
class OtpFormValidation {
  /// Creates a new OTP form validation
  const OtpFormValidation({
    this.autovalidateMode = AutovalidateMode.disabled,
    this.validator,
    this.onValidationChanged,
    this.validationMessage,
    this.errorMessage,
    this.enableRealTimeValidation = false,
    this.validationDelay = const Duration(milliseconds: 300),
    this.customValidationRules = const [],
  });

  /// Autovalidate mode for the form
  final AutovalidateMode autovalidateMode;

  /// Custom validator function
  final String? Function(String?)? validator;

  /// Callback when validation state changes
  final ValueChanged<bool>? onValidationChanged;

  /// Custom validation message
  final String? validationMessage;

  /// Custom error message
  final String? errorMessage;

  /// Whether to enable real-time validation
  final bool enableRealTimeValidation;

  /// Delay for real-time validation
  final Duration validationDelay;

  /// Custom validation rules
  final List<OtpValidationRule> customValidationRules;

  /// Creates a copy with the given fields replaced
  OtpFormValidation copyWith({
    AutovalidateMode? autovalidateMode,
    String? Function(String?)? validator,
    ValueChanged<bool>? onValidationChanged,
    String? validationMessage,
    String? errorMessage,
    bool? enableRealTimeValidation,
    Duration? validationDelay,
    List<OtpValidationRule>? customValidationRules,
  }) {
    return OtpFormValidation(
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      validator: validator ?? this.validator,
      onValidationChanged: onValidationChanged ?? this.onValidationChanged,
      validationMessage: validationMessage ?? this.validationMessage,
      errorMessage: errorMessage ?? this.errorMessage,
      enableRealTimeValidation:
          enableRealTimeValidation ?? this.enableRealTimeValidation,
      validationDelay: validationDelay ?? this.validationDelay,
      customValidationRules:
          customValidationRules ?? this.customValidationRules,
    );
  }

  /// Validates the given OTP value
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return validationMessage ?? 'Please enter all digits';
    }

    // Apply custom validation rules
    for (final rule in customValidationRules) {
      final result = rule.validate(value);
      if (result != null) {
        return result;
      }
    }

    // Apply custom validator if provided
    if (validator != null) {
      return validator!(value);
    }

    return null;
  }

  /// Checks if the value is valid
  bool isValid(String? value) {
    return validate(value) == null;
  }
}

/// A validation rule for OTP input
abstract class OtpValidationRule {
  /// Validates the given value
  String? validate(String value);

  /// Priority of this rule (higher priority rules are checked first)
  int get priority => 0;
}

/// Length validation rule
class LengthValidationRule extends OtpValidationRule {
  /// Creates a new length validation rule
  LengthValidationRule({
    required this.expectedLength,
    this.message,
  });

  /// Expected length of the OTP
  final int expectedLength;

  /// Custom error message
  final String? message;

  @override
  String? validate(String value) {
    if (value.length != expectedLength) {
      return message ?? 'OTP must be $expectedLength digits long';
    }
    return null;
  }

  @override
  int get priority => 100; // High priority
}

/// Numeric validation rule
class NumericValidationRule extends OtpValidationRule {
  /// Creates a new numeric validation rule
  NumericValidationRule({
    this.message,
  });

  /// Custom error message
  final String? message;

  @override
  String? validate(String value) {
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return message ?? 'Only numbers are allowed';
    }
    return null;
  }

  @override
  int get priority => 90;
}

/// Alphabetic validation rule
class AlphabeticValidationRule extends OtpValidationRule {
  /// Creates a new alphabetic validation rule
  AlphabeticValidationRule({
    this.message,
  });

  /// Custom error message
  final String? message;

  @override
  String? validate(String value) {
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return message ?? 'Only letters are allowed';
    }
    return null;
  }

  @override
  int get priority => 90;
}

/// Alphanumeric validation rule
class AlphanumericValidationRule extends OtpValidationRule {
  /// Creates a new alphanumeric validation rule
  AlphanumericValidationRule({
    this.message,
  });

  /// Custom error message
  final String? message;

  @override
  String? validate(String value) {
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      return message ?? 'Only letters and numbers are allowed';
    }
    return null;
  }

  @override
  int get priority => 90;
}

/// Regex validation rule
class RegexValidationRule extends OtpValidationRule {
  /// Creates a new regex validation rule
  RegexValidationRule({
    required this.pattern,
    this.message,
  });

  /// Regex pattern to match
  final String pattern;

  /// Custom error message
  final String? message;

  @override
  String? validate(String value) {
    if (!RegExp(pattern).hasMatch(value)) {
      return message ?? 'Invalid format';
    }
    return null;
  }

  @override
  int get priority => 80;
}

/// Custom validation rule
class CustomValidationRule extends OtpValidationRule {
  /// Creates a new custom validation rule
  CustomValidationRule({
    required this.validator,
    this.priority = 50,
  });

  /// Custom validator function
  final String? Function(String) validator;

  @override
  final int priority;

  @override
  String? validate(String value) {
    return validator(value);
  }
}

/// Validation state for OTP form
class OtpValidationState {
  /// Creates a new validation state
  const OtpValidationState({
    this.isValid = false,
    this.errorMessage,
    this.validationMessage,
    this.isValidating = false,
    this.hasError = false,
  });

  /// Whether the current value is valid
  final bool isValid;

  /// Error message to display
  final String? errorMessage;

  /// Validation message to display
  final String? validationMessage;

  /// Whether validation is in progress
  final bool isValidating;

  /// Whether there's an error
  final bool hasError;

  /// Creates a copy with the given fields replaced
  OtpValidationState copyWith({
    bool? isValid,
    String? errorMessage,
    String? validationMessage,
    bool? isValidating,
    bool? hasError,
  }) {
    return OtpValidationState(
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
      validationMessage: validationMessage ?? this.validationMessage,
      isValidating: isValidating ?? this.isValidating,
      hasError: hasError ?? this.hasError,
    );
  }

  /// Creates a valid state
  factory OtpValidationState.valid() {
    return const OtpValidationState(isValid: true, hasError: false);
  }

  /// Creates an invalid state with error message
  factory OtpValidationState.error(String message) {
    return OtpValidationState(
      isValid: false,
      hasError: true,
      errorMessage: message,
    );
  }

  /// Creates a validation state with message
  factory OtpValidationState.validation(String message) {
    return OtpValidationState(
      isValid: false,
      hasError: false,
      validationMessage: message,
    );
  }

  /// Creates a validating state
  factory OtpValidationState.validating() {
    return const OtpValidationState(
      isValid: false,
      isValidating: true,
      hasError: false,
    );
  }
}
