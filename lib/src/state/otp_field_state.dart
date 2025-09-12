/// Represents the state of an OTP field
enum OtpFieldState {
  /// Empty field
  empty,

  /// Field with focus
  focused,

  /// Field with content but not completed
  filled,

  /// Field with content and all fields are filled
  completed,

  /// Field with error
  error,
}

/// Enum for error state priority
enum ErrorStatePriority {
  /// Error state overrides all other states
  highest,

  /// Error state follows normal priority rules
  normal,

  /// Error state has lowest priority
  lowest,
}

/// Enum for error state behavior
enum ErrorStateBehavior {
  /// Error state persists until manually cleared
  persistent,

  /// Error state auto-clears based on configuration
  autoClear,

  /// Error state clears after specified duration
  timed,
}

/// Enum for field state priority
enum FieldStatePriority {
  /// Error state (highest priority)
  error,

  /// Focused state
  focused,

  /// Completed state
  completed,

  /// Filled state
  filled,

  /// Empty state (lowest priority)
  empty,
}

/// Enum for cursor alignment within OTP fields
enum CursorAlignment {
  /// Left alignment
  left,

  /// Center alignment
  center,

  /// Right alignment
  right,
}
