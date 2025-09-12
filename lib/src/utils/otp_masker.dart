import '../masking_type.dart';

/// Utility class for masking contact information
class OtpMasker {
  /// Masks contact information based on the specified masking type
  static String maskContactInfo(String contactInfo, MaskingType type) {
    switch (type) {
      case MaskingType.phone:
        if (contactInfo.length < 4) return contactInfo;
        final start = contactInfo.substring(0, 3);
        final end = contactInfo.substring(contactInfo.length - 2);
        final masked = '*' * (contactInfo.length - 5);
        return '$start$masked$end';

      case MaskingType.email:
        if (!contactInfo.contains('@')) return contactInfo;
        final parts = contactInfo.split('@');
        if (parts[0].length < 2) return contactInfo;
        final username = parts[0];
        final domain = parts[1];
        final maskedUsername =
            username.substring(0, 2) + '*' * (username.length - 2);
        return '$maskedUsername@$domain';

      case MaskingType.none:
        return contactInfo;
    }
  }
}
