/// Enum representing different states of an OTP field
enum OtpFieldState {
  /// Field is empty with no input
  empty,

  /// Field is currently focused
  focused,

  /// Field has input but is not focused
  filled,

  /// Field is filled and validated (completed)
  completed,

  /// Field has a validation error
  error,
}

/// Extension methods for OtpFieldState
extension OtpFieldStateExtension on OtpFieldState {
  /// Returns true if the field has content
  bool get hasContent =>
      this == OtpFieldState.filled || this == OtpFieldState.completed;

  /// Returns true if the field is in an active state (focused or filled)
  bool get isActive =>
      this == OtpFieldState.focused ||
      this == OtpFieldState.filled ||
      this == OtpFieldState.completed;

  /// Returns true if the field is in an error state
  bool get hasError => this == OtpFieldState.error;

  /// Returns true if the field is completed successfully
  bool get isCompleted => this == OtpFieldState.completed;

  /// Returns true if the field is currently focused
  bool get isFocused => this == OtpFieldState.focused;

  /// Returns true if the field is empty
  bool get isEmpty => this == OtpFieldState.empty;
}
