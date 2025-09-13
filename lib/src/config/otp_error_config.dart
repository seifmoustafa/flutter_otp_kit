import 'package:flutter/material.dart';
import '../state/otp_field_state.dart';

/// Configuration for OTP error state behavior
class OtpErrorConfig {
  /// Creates a new OTP error configuration
  const OtpErrorConfig({
    // Error state
    this.hasError = false,
    this.errorStateDuration = const Duration(seconds: 3),
    this.errorStatePriority = ErrorStatePriority.highest,
    this.errorStateBehavior = ErrorStateBehavior.autoClear,

    // Auto-clearing behavior
    this.autoClearErrorOnInput = false,
    this.autoClearErrorOnResend = true,
    this.autoClearErrorOnComplete = true,
    this.autoClearOnFocusChange = false,
    this.requireMinInputToAutoClear = false,
    this.minInputToAutoClear = 1,

    // Styling
    this.errorBorderColor,
    this.errorBackgroundColor,
    this.errorTextColor,
    this.errorGlowColor,
    this.errorBorderWidth,
    this.errorShakeEffect = false,
    this.errorShakeDuration = const Duration(milliseconds: 500),
    this.errorShakeCount = 3,

    // Error message
    this.errorText,
    this.errorStyle,
    this.errorIcon,
    this.showErrorIcon = true,
    this.errorAlignment = ErrorAlignment.bottom,
    this.errorTextMaxLines = 2,
    this.errorAnimationDuration = const Duration(milliseconds: 300),
    this.errorAnimationType = ErrorAnimationType.fadeIn,

    // Haptic feedback
    this.enableHapticFeedbackOnError = false,
    this.errorHapticFeedbackType = ErrorHapticFeedbackType.heavy,

    // Error recovery
    this.maxErrorRetries = 3,
    this.enableAutoFieldClear = false,
    this.clearFieldsOnError = false,
    this.enableFieldLockout = false,
    this.fieldLockoutDuration = const Duration(seconds: 30),
  });

  // Error state
  /// Whether the OTP is in error state
  final bool hasError;

  /// Duration to show error state before auto-clearing
  final Duration errorStateDuration;

  /// Priority of error state over other field states
  final ErrorStatePriority errorStatePriority;

  /// Behavior of error state (persistent, auto-clear, timed)
  final ErrorStateBehavior errorStateBehavior;

  // Auto-clearing behavior
  /// Whether to auto-clear error state on input
  final bool autoClearErrorOnInput;

  /// Whether to auto-clear error state on resend
  final bool autoClearErrorOnResend;

  /// Whether to auto-clear error state on completion
  final bool autoClearErrorOnComplete;

  /// Whether to auto-clear error state on focus change
  final bool autoClearOnFocusChange;

  /// Whether to require a minimum amount of input to auto-clear
  final bool requireMinInputToAutoClear;

  /// Minimum number of fields with input to trigger auto-clear
  final int minInputToAutoClear;

  // Styling
  /// Border color for fields in error state
  final Color? errorBorderColor;

  /// Background color for fields in error state
  final Color? errorBackgroundColor;

  /// Text color for fields in error state
  final Color? errorTextColor;

  /// Glow color for error state
  final Color? errorGlowColor;

  /// Border width for error state
  final double? errorBorderWidth;

  /// Whether to use a shake effect for fields in error state
  final bool errorShakeEffect;

  /// Duration of the shake effect
  final Duration errorShakeDuration;

  /// Number of shakes in the shake effect
  final int errorShakeCount;

  // Error message
  /// Error message to display
  final String? errorText;

  /// Style for error message
  final TextStyle? errorStyle;

  /// Icon to display with error message
  final IconData? errorIcon;

  /// Whether to show an icon with the error message
  final bool showErrorIcon;

  /// Alignment of the error message
  final ErrorAlignment errorAlignment;

  /// Maximum number of lines for the error message
  final int errorTextMaxLines;

  /// Duration of the error animation
  final Duration errorAnimationDuration;

  /// Type of animation for the error message
  final ErrorAnimationType errorAnimationType;

  // Haptic feedback
  /// Whether to enable haptic feedback on error
  final bool enableHapticFeedbackOnError;

  /// Type of haptic feedback for errors
  final ErrorHapticFeedbackType errorHapticFeedbackType;

  // Error recovery
  /// Maximum number of error retries before lockout
  final int maxErrorRetries;

  /// Whether to automatically clear fields on error
  final bool clearFieldsOnError;

  /// Whether to enable automatic field clearing after an error
  final bool enableAutoFieldClear;

  /// Whether to enable field lockout after multiple errors
  final bool enableFieldLockout;

  /// Duration of field lockout
  final Duration fieldLockoutDuration;

  /// Creates a copy of this object with the given fields replaced with the new values
  OtpErrorConfig copyWith({
    // Error state
    bool? hasError,
    Duration? errorStateDuration,
    ErrorStatePriority? errorStatePriority,
    ErrorStateBehavior? errorStateBehavior,

    // Auto-clearing behavior
    bool? autoClearErrorOnInput,
    bool? autoClearErrorOnResend,
    bool? autoClearErrorOnComplete,
    bool? autoClearOnFocusChange,
    bool? requireMinInputToAutoClear,
    int? minInputToAutoClear,

    // Styling
    Color? errorBorderColor,
    Color? errorBackgroundColor,
    Color? errorTextColor,
    Color? errorGlowColor,
    double? errorBorderWidth,
    bool? errorShakeEffect,
    Duration? errorShakeDuration,
    int? errorShakeCount,

    // Error message
    String? errorText,
    TextStyle? errorStyle,
    IconData? errorIcon,
    bool? showErrorIcon,
    ErrorAlignment? errorAlignment,
    int? errorTextMaxLines,
    Duration? errorAnimationDuration,
    ErrorAnimationType? errorAnimationType,

    // Haptic feedback
    bool? enableHapticFeedbackOnError,
    ErrorHapticFeedbackType? errorHapticFeedbackType,

    // Error recovery
    int? maxErrorRetries,
    bool? clearFieldsOnError,
    bool? enableAutoFieldClear,
    bool? enableFieldLockout,
    Duration? fieldLockoutDuration,
  }) {
    return OtpErrorConfig(
      // Error state
      hasError: hasError ?? this.hasError,
      errorStateDuration: errorStateDuration ?? this.errorStateDuration,
      errorStatePriority: errorStatePriority ?? this.errorStatePriority,
      errorStateBehavior: errorStateBehavior ?? this.errorStateBehavior,

      // Auto-clearing behavior
      autoClearErrorOnInput:
          autoClearErrorOnInput ?? this.autoClearErrorOnInput,
      autoClearErrorOnResend:
          autoClearErrorOnResend ?? this.autoClearErrorOnResend,
      autoClearErrorOnComplete:
          autoClearErrorOnComplete ?? this.autoClearErrorOnComplete,
      autoClearOnFocusChange:
          autoClearOnFocusChange ?? this.autoClearOnFocusChange,
      requireMinInputToAutoClear:
          requireMinInputToAutoClear ?? this.requireMinInputToAutoClear,
      minInputToAutoClear: minInputToAutoClear ?? this.minInputToAutoClear,

      // Styling
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      errorBackgroundColor: errorBackgroundColor ?? this.errorBackgroundColor,
      errorTextColor: errorTextColor ?? this.errorTextColor,
      errorGlowColor: errorGlowColor ?? this.errorGlowColor,
      errorBorderWidth: errorBorderWidth ?? this.errorBorderWidth,
      errorShakeEffect: errorShakeEffect ?? this.errorShakeEffect,
      errorShakeDuration: errorShakeDuration ?? this.errorShakeDuration,
      errorShakeCount: errorShakeCount ?? this.errorShakeCount,

      // Error message
      errorText: errorText ?? this.errorText,
      errorStyle: errorStyle ?? this.errorStyle,
      errorIcon: errorIcon ?? this.errorIcon,
      showErrorIcon: showErrorIcon ?? this.showErrorIcon,
      errorAlignment: errorAlignment ?? this.errorAlignment,
      errorTextMaxLines: errorTextMaxLines ?? this.errorTextMaxLines,
      errorAnimationDuration:
          errorAnimationDuration ?? this.errorAnimationDuration,
      errorAnimationType: errorAnimationType ?? this.errorAnimationType,

      // Haptic feedback
      enableHapticFeedbackOnError:
          enableHapticFeedbackOnError ?? this.enableHapticFeedbackOnError,
      errorHapticFeedbackType:
          errorHapticFeedbackType ?? this.errorHapticFeedbackType,

      // Error recovery
      maxErrorRetries: maxErrorRetries ?? this.maxErrorRetries,
      clearFieldsOnError: clearFieldsOnError ?? this.clearFieldsOnError,
      enableAutoFieldClear: enableAutoFieldClear ?? this.enableAutoFieldClear,
      enableFieldLockout: enableFieldLockout ?? this.enableFieldLockout,
      fieldLockoutDuration: fieldLockoutDuration ?? this.fieldLockoutDuration,
    );
  }

  /// Creates a preset error configuration
  factory OtpErrorConfig.preset(ErrorConfigPreset preset) {
    switch (preset) {
      case ErrorConfigPreset.standard:
        return const OtpErrorConfig(
          errorBorderColor: Colors.red,
          errorTextColor: Colors.red,
          errorStateBehavior: ErrorStateBehavior.autoClear,
          autoClearErrorOnInput: true,
          autoClearErrorOnResend: true,
          errorAnimationType: ErrorAnimationType.fadeIn,
        );

      case ErrorConfigPreset.gentle:
        return const OtpErrorConfig(
          errorBorderColor: Color(0xFFF44336), // Slightly less aggressive red
          errorTextColor: Color(0xFFF44336),
          errorStateBehavior: ErrorStateBehavior.autoClear,
          autoClearErrorOnInput: true,
          autoClearOnFocusChange: true,
          errorAnimationType: ErrorAnimationType.fadeIn,
        );

      case ErrorConfigPreset.assertive:
        return OtpErrorConfig(
          errorBorderColor: Colors.red.shade700,
          errorTextColor: Colors.red.shade700,
          errorStateBehavior: ErrorStateBehavior.timed,
          errorStateDuration: const Duration(seconds: 5),
          errorShakeEffect: true,
          enableHapticFeedbackOnError: true,
          errorHapticFeedbackType: ErrorHapticFeedbackType.heavy,
          errorIcon: Icons.error_outline,
          showErrorIcon: true,
          errorAnimationType: ErrorAnimationType.shakeAndFade,
        );

      case ErrorConfigPreset.minimal:
        return const OtpErrorConfig(
          errorBorderColor: Colors.red,
          errorTextColor: Colors.red,
          errorStateBehavior: ErrorStateBehavior.autoClear,
          autoClearErrorOnInput: true,
          showErrorIcon: false,
          errorAnimationType: ErrorAnimationType.fadeIn,
        );

      case ErrorConfigPreset.secure:
        return OtpErrorConfig(
          errorBorderColor: Colors.red.shade800,
          errorTextColor: Colors.red.shade800,
          errorStateBehavior: ErrorStateBehavior.persistent,
          clearFieldsOnError: true,
          enableFieldLockout: true,
          maxErrorRetries: 3,
          fieldLockoutDuration: const Duration(seconds: 30),
          errorIcon: Icons.security,
          errorAnimationType: ErrorAnimationType.fadeIn,
        );
    }
  }
}

/// Alignment of the error message
enum ErrorAlignment {
  /// Above the OTP fields
  top,

  /// Below the OTP fields
  bottom,

  /// To the left of the OTP fields
  left,

  /// To the right of the OTP fields
  right,

  /// Hidden (no error message)
  none,
}

/// Type of animation for the error message
enum ErrorAnimationType {
  /// Fade in
  fadeIn,

  /// Slide in from bottom
  slideInBottom,

  /// Slide in from top
  slideInTop,

  /// Scale up
  scaleUp,

  /// Shake and fade
  shakeAndFade,

  /// No animation
  none,
}

/// Type of haptic feedback for errors
enum ErrorHapticFeedbackType {
  /// Light impact
  light,

  /// Medium impact
  medium,

  /// Heavy impact
  heavy,

  /// Vibrate
  vibrate,
}

/// Preset configurations for error handling
enum ErrorConfigPreset {
  /// Standard error handling
  standard,

  /// Gentle error handling with subtle effects
  gentle,

  /// Assertive error handling with strong visual and haptic feedback
  assertive,

  /// Minimal error handling with limited visual effects
  minimal,

  /// Secure error handling for sensitive applications
  secure,
}
