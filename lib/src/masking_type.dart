/// Enum for different types of contact information masking
enum MaskingType {
  /// Phone number masking (e.g., 010****56)
  phone,

  /// Email masking (e.g., us***@example.com)
  email,

  /// No masking - shows the full contact info
  none,
}
