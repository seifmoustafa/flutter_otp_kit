/// Enum for different types of OTP input
enum OtpInputType {
  /// Numeric input only (0-9)
  numeric,

  /// Alphabetic input only (a-z, A-Z)
  alphabetic,

  /// Alphanumeric input (0-9, a-z, A-Z)
  alphanumeric,

  /// Custom input with specific pattern
  custom,
}
