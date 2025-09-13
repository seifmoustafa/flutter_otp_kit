import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/flexible_otp_field.dart';

/// Provides platform-adaptive OTP field styles and behaviors.
///
/// This class helps ensure that OTP fields look and behave in a way that's
/// natural for each platform (iOS, Android, Web, etc.).
class PlatformAdaptiveOtp {
  /// Private constructor to prevent instantiation
  PlatformAdaptiveOtp._();

  /// Gets the default platform-specific decoration for an OTP field.
  static BoxDecoration getDefaultDecoration(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return _getIOSDecoration(context);
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return _getAndroidDecoration(context);
    } else if (kIsWeb) {
      return _getWebDecoration(context);
    } else {
      return _getFallbackDecoration(context);
    }
  }

  /// Gets iOS-styled decoration.
  static BoxDecoration _getIOSDecoration(BuildContext context) {
    return BoxDecoration(
      border: Border.all(
        color: CupertinoColors.systemGrey4.resolveFrom(context),
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(8.0),
      color: CupertinoColors.systemBackground.resolveFrom(context),
    );
  }

  /// Gets Android-styled decoration.
  static BoxDecoration _getAndroidDecoration(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return BoxDecoration(
      border: Border.all(
        color: colorScheme.outline,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(4.0),
      color: colorScheme.surface,
    );
  }

  /// Gets web-styled decoration.
  static BoxDecoration _getWebDecoration(BuildContext context) {
    return BoxDecoration(
      border: Border.all(
        color: Colors.grey.shade300,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(4.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(13), // Equivalent to 0.05 opacity
          blurRadius: 2.0,
          offset: const Offset(0, 1),
        ),
      ],
    );
  }

  /// Gets fallback decoration for other platforms.
  static BoxDecoration _getFallbackDecoration(BuildContext context) {
    return BoxDecoration(
      border: Border.all(
        color: Colors.grey.shade400,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(6.0),
    );
  }

  /// Gets the focused decoration for an OTP field.
  static BoxDecoration getFocusedDecoration(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return BoxDecoration(
        border: Border.all(
          color: CupertinoColors.activeBlue,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
        color: CupertinoColors.systemBackground.resolveFrom(context),
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return BoxDecoration(
          border: Border.all(
            color: primaryColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(4.0),
          color: primaryColor.withAlpha(13) // Equivalent to 0.05 opacity,
          );
    } else if (kIsWeb) {
      return BoxDecoration(
        border: Border.all(
          color: primaryColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(4.0),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withAlpha(26), // Equivalent to 0.1 opacity
            blurRadius: 4.0,
            offset: const Offset(0, 2),
          ),
        ],
      );
    } else {
      return BoxDecoration(
          border: Border.all(
            color: primaryColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
          color: primaryColor.withAlpha(13) // Equivalent to 0.05 opacity,
          );
    }
  }

  /// Gets the error decoration for an OTP field.
  static BoxDecoration getErrorDecoration(BuildContext context) {
    final errorColor = Theme.of(context).colorScheme.error;

    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return BoxDecoration(
          border: Border.all(
            color: CupertinoColors.systemRed,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
          color: CupertinoColors.systemRed
              .withAlpha(26) // Equivalent to 0.1 opacity,
          );
    } else {
      return BoxDecoration(
          border: Border.all(
            color: errorColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(
              defaultTargetPlatform == TargetPlatform.android ? 4.0 : 6.0),
          color: errorColor.withAlpha(13) // Equivalent to 0.05 opacity,
          );
    }
  }

  /// Gets the text style for an OTP field based on the platform.
  static TextStyle getTextStyle(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );
    } else {
      return const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      );
    }
  }

  /// Gets the default field dimensions based on the platform.
  static Size getFieldSize() {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return const Size(50, 56);
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return const Size(48, 56);
    } else if (kIsWeb) {
      return const Size(56, 60);
    } else {
      return const Size(50, 56);
    }
  }

  /// Gets the platform-specific haptic feedback type.
  static HapticFeedbackType getHapticFeedbackType() {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return HapticFeedbackType.light;
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return HapticFeedbackType.selection;
    } else {
      return HapticFeedbackType.none;
    }
  }

  /// Gets the platform-specific spacing between fields.
  static double getFieldSpacing() {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return 10.0;
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return 8.0;
    } else {
      return 12.0;
    }
  }

  /// Creates a platform-adaptive button style for the verify button.
  static ButtonStyle getVerifyButtonStyle(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return ButtonStyle(
        backgroundColor: MaterialStateProperty.all(CupertinoColors.activeBlue),
        foregroundColor: MaterialStateProperty.all(CupertinoColors.white),
        padding:
            MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 16)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        )),
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
        foregroundColor:
            MaterialStateProperty.all(Theme.of(context).colorScheme.onPrimary),
        padding:
            MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12)),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        )),
      );
    } else {
      return ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
        foregroundColor:
            MaterialStateProperty.all(Theme.of(context).colorScheme.onPrimary),
        padding:
            MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 16)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        )),
      );
    }
  }

  /// Creates a platform-adaptive widget for OTP verification.
  static Widget buildPlatformOtpVerification({
    required BuildContext context,
    required Widget child,
  }) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoTheme(
        data: CupertinoThemeData(
          brightness: Theme.of(context).brightness,
          primaryColor: CupertinoColors.activeBlue,
        ),
        child: child,
      );
    } else {
      return child;
    }
  }

  /// Creates a platform-adaptive error widget.
  static Widget buildErrorWidget(BuildContext context, String errorText) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: CupertinoColors.systemRed
              .withAlpha(26), // Equivalent to 0.1 opacity
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              CupertinoIcons.exclamationmark_circle,
              color: CupertinoColors.systemRed,
              size: 18,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                errorText,
                style: TextStyle(
                  color: CupertinoColors.systemRed,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .error
              .withAlpha(26), // Equivalent to 0.1 opacity
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Theme.of(context)
                .colorScheme
                .error
                .withAlpha(51), // Equivalent to 0.2 opacity
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              color: Theme.of(context).colorScheme.error,
              size: 16,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                errorText,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
