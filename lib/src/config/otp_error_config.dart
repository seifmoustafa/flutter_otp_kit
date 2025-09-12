import 'package:flutter/material.dart';
import '../state/otp_field_state.dart';

/// Configuration for OTP error state behavior
class OtpErrorConfig {
  /// Creates a new OTP error configuration
  const OtpErrorConfig({
    this.hasError = false,
    this.errorStateDuration = const Duration(seconds: 3),
    this.autoClearErrorOnInput = false,
    this.autoClearErrorOnResend = true,
    this.autoClearErrorOnComplete = true,
    this.errorStatePriority = ErrorStatePriority.highest,
    this.errorStateBehavior = ErrorStateBehavior.autoClear,
    this.errorBorderColor,
    this.errorBackgroundColor,
    this.errorTextColor,
    this.errorText,
    this.errorStyle,
  });

  /// Whether the OTP is in error state
  final bool hasError;

  /// Duration to show error state before auto-clearing
  final Duration errorStateDuration;

  /// Whether to auto-clear error state on input
  final bool autoClearErrorOnInput;

  /// Whether to auto-clear error state on resend
  final bool autoClearErrorOnResend;

  /// Whether to auto-clear error state on completion
  final bool autoClearErrorOnComplete;

  /// Priority of error state over other field states
  final ErrorStatePriority errorStatePriority;

  /// Behavior of error state (persistent, auto-clear, timed)
  final ErrorStateBehavior errorStateBehavior;

  /// Border color for fields in error state
  final Color? errorBorderColor;

  /// Background color for fields in error state
  final Color? errorBackgroundColor;

  /// Text color for fields in error state
  final Color? errorTextColor;

  /// Error message to display
  final String? errorText;

  /// Style for error message
  final TextStyle? errorStyle;

  /// Creates a copy of this object with the given fields replaced with the new values
  OtpErrorConfig copyWith({
    bool? hasError,
    Duration? errorStateDuration,
    bool? autoClearErrorOnInput,
    bool? autoClearErrorOnResend,
    bool? autoClearErrorOnComplete,
    ErrorStatePriority? errorStatePriority,
    ErrorStateBehavior? errorStateBehavior,
    Color? errorBorderColor,
    Color? errorBackgroundColor,
    Color? errorTextColor,
    String? errorText,
    TextStyle? errorStyle,
  }) {
    return OtpErrorConfig(
      hasError: hasError ?? this.hasError,
      errorStateDuration: errorStateDuration ?? this.errorStateDuration,
      autoClearErrorOnInput: autoClearErrorOnInput ?? this.autoClearErrorOnInput,
      autoClearErrorOnResend: autoClearErrorOnResend ?? this.autoClearErrorOnResend,
      autoClearErrorOnComplete: autoClearErrorOnComplete ?? this.autoClearErrorOnComplete,
      errorStatePriority: errorStatePriority ?? this.errorStatePriority,
      errorStateBehavior: errorStateBehavior ?? this.errorStateBehavior,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      errorBackgroundColor: errorBackgroundColor ?? this.errorBackgroundColor,
      errorTextColor: errorTextColor ?? this.errorTextColor,
      errorText: errorText ?? this.errorText,
      errorStyle: errorStyle ?? this.errorStyle,
    );
  }
}
