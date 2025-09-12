/// Enum for different OTP field layout types
enum OtpLayoutType {
  /// Single row layout with fixed width fields (default)
  fixed,

  /// Single row layout with responsive field widths
  responsive,

  /// Wrap layout for responsive design
  wrap,

  /// Grid layout with specified columns
  grid,

  /// Custom layout with user-defined arrangement
  custom,
}

/// Enum for field alignment within layout
enum OtpFieldAlignment {
  /// Center alignment
  center,

  /// Start alignment (left/top)
  start,

  /// End alignment (right/bottom)
  end,

  /// Space between fields
  spaceBetween,

  /// Space around fields
  spaceAround,

  /// Space evenly
  spaceEvenly,
}

/// Enum for field arrangement direction
enum OtpFieldDirection {
  /// Horizontal arrangement (left to right)
  horizontal,

  /// Vertical arrangement (top to bottom)
  vertical,
}