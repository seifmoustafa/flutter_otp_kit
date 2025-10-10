import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../utils/platform_utils.dart';

/// Platform-specific features and optimizations
///
/// Provides platform-specific implementations for:
/// - iOS Face ID integration
/// - Android fingerprint integration
/// - Web-specific keyboard handling
/// - Desktop-specific features
class OtpPlatformService {
  static const MethodChannel _channel =
      MethodChannel('flutter_otp_kit/platform');

  static OtpPlatformService? _instance;
  static OtpPlatformService get instance =>
      _instance ??= OtpPlatformService._();

  OtpPlatformService._();

  /// Initialize platform-specific features
  Future<void> initialize() async {
    try {
      if (PlatformUtils.isWeb) {
        await _initializeWeb();
      } else if (PlatformUtils.isIOS) {
        await _initializeIOS();
      } else if (PlatformUtils.isAndroid) {
        await _initializeAndroid();
      } else if (PlatformUtils.isDesktop) {
        await _initializeDesktop();
      }
    } catch (e) {
      // Platform initialization failed, continue without platform features
    }
  }

  /// Initialize iOS-specific features
  Future<void> _initializeIOS() async {
    try {
      await _channel.invokeMethod('initializeIOS');
    } catch (e) {
      // iOS initialization failed
    }
  }

  /// Initialize Android-specific features
  Future<void> _initializeAndroid() async {
    try {
      await _channel.invokeMethod('initializeAndroid');
    } catch (e) {
      // Android initialization failed
    }
  }

  /// Initialize desktop-specific features
  Future<void> _initializeDesktop() async {
    try {
      await _channel.invokeMethod('initializeDesktop');
    } catch (e) {
      // Desktop initialization failed
    }
  }

  /// Initialize web-specific features
  Future<void> _initializeWeb() async {
    try {
      await _channel.invokeMethod('initializeWeb');
    } catch (e) {
      // Web initialization failed
    }
  }

  /// Check if Face ID is available (iOS)
  Future<bool> isFaceIdAvailable() async {
    if (!PlatformUtils.isIOS) return false;

    try {
      final result = await _channel.invokeMethod('isFaceIdAvailable');
      return result ?? false;
    } catch (e) {
      return false;
    }
  }

  /// Check if Touch ID is available (iOS)
  Future<bool> isTouchIdAvailable() async {
    if (!PlatformUtils.isIOS) return false;

    try {
      final result = await _channel.invokeMethod('isTouchIdAvailable');
      return result ?? false;
    } catch (e) {
      return false;
    }
  }

  /// Check if fingerprint is available (Android)
  Future<bool> isFingerprintAvailable() async {
    if (!PlatformUtils.isAndroid) return false;

    try {
      final result = await _channel.invokeMethod('isFingerprintAvailable');
      return result ?? false;
    } catch (e) {
      return false;
    }
  }

  /// Check if face recognition is available (Android)
  Future<bool> isFaceRecognitionAvailable() async {
    if (!PlatformUtils.isAndroid) return false;

    try {
      final result = await _channel.invokeMethod('isFaceRecognitionAvailable');
      return result ?? false;
    } catch (e) {
      return false;
    }
  }

  /// Get platform-specific keyboard type
  TextInputType getPlatformKeyboardType() {
    if (PlatformUtils.isIOS) {
      return TextInputType.numberWithOptions(signed: false, decimal: false);
    } else if (PlatformUtils.isAndroid) {
      return TextInputType.number;
    } else if (kIsWeb) {
      return TextInputType.number;
    } else {
      return TextInputType.number;
    }
  }

  /// Get platform-specific input formatters
  List<TextInputFormatter> getPlatformInputFormatters() {
    if (PlatformUtils.isIOS) {
      return [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(1),
      ];
    } else if (PlatformUtils.isAndroid) {
      return [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(1),
      ];
    } else if (kIsWeb) {
      return [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(1),
      ];
    } else {
      return [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(1),
      ];
    }
  }

  /// Get platform-specific haptic feedback
  void triggerPlatformHapticFeedback() {
    if (PlatformUtils.isIOS) {
      HapticFeedback.lightImpact();
    } else if (PlatformUtils.isAndroid) {
      HapticFeedback.vibrate();
    } else if (kIsWeb) {
      // Web doesn't support haptic feedback
    } else {
      // Desktop doesn't support haptic feedback
    }
  }

  /// Get platform-specific error haptic feedback
  void triggerPlatformErrorHapticFeedback() {
    if (PlatformUtils.isIOS) {
      HapticFeedback.heavyImpact();
    } else if (PlatformUtils.isAndroid) {
      HapticFeedback.vibrate();
    } else if (kIsWeb) {
      // Web doesn't support haptic feedback
    } else {
      // Desktop doesn't support haptic feedback
    }
  }

  /// Get platform-specific success haptic feedback
  void triggerPlatformSuccessHapticFeedback() {
    if (PlatformUtils.isIOS) {
      HapticFeedback.mediumImpact();
    } else if (PlatformUtils.isAndroid) {
      HapticFeedback.lightImpact();
    } else if (kIsWeb) {
      // Web doesn't support haptic feedback
    } else {
      // Desktop doesn't support haptic feedback
    }
  }

  /// Get platform-specific field dimensions
  Map<String, double> getPlatformFieldDimensions() {
    if (PlatformUtils.isIOS) {
      return {
        'width': 56.0,
        'height': 56.0,
        'borderRadius': 12.0,
        'borderWidth': 2.0,
      };
    } else if (PlatformUtils.isAndroid) {
      return {
        'width': 56.0,
        'height': 56.0,
        'borderRadius': 8.0,
        'borderWidth': 2.0,
      };
    } else if (kIsWeb) {
      return {
        'width': 48.0,
        'height': 48.0,
        'borderRadius': 8.0,
        'borderWidth': 1.0,
      };
    } else {
      return {
        'width': 48.0,
        'height': 48.0,
        'borderRadius': 8.0,
        'borderWidth': 1.0,
      };
    }
  }

  /// Get platform-specific animation durations
  Map<String, Duration> getPlatformAnimationDurations() {
    if (PlatformUtils.isIOS) {
      return {
        'fieldTransition': const Duration(milliseconds: 200),
        'errorAnimation': const Duration(milliseconds: 300),
        'successAnimation': const Duration(milliseconds: 400),
        'cursorBlink': const Duration(milliseconds: 1000),
      };
    } else if (PlatformUtils.isAndroid) {
      return {
        'fieldTransition': const Duration(milliseconds: 150),
        'errorAnimation': const Duration(milliseconds: 250),
        'successAnimation': const Duration(milliseconds: 300),
        'cursorBlink': const Duration(milliseconds: 1000),
      };
    } else if (kIsWeb) {
      return {
        'fieldTransition': const Duration(milliseconds: 100),
        'errorAnimation': const Duration(milliseconds: 200),
        'successAnimation': const Duration(milliseconds: 250),
        'cursorBlink': const Duration(milliseconds: 1000),
      };
    } else {
      return {
        'fieldTransition': const Duration(milliseconds: 100),
        'errorAnimation': const Duration(milliseconds: 200),
        'successAnimation': const Duration(milliseconds: 250),
        'cursorBlink': const Duration(milliseconds: 1000),
      };
    }
  }

  /// Get platform-specific accessibility features
  Map<String, dynamic> getPlatformAccessibilityFeatures() {
    if (PlatformUtils.isIOS) {
      return {
        'enableVoiceOver': true,
        'enableSwitchControl': true,
        'enableVoiceControl': true,
        'semanticHints': true,
      };
    } else if (PlatformUtils.isAndroid) {
      return {
        'enableTalkBack': true,
        'enableSwitchAccess': true,
        'enableVoiceAccess': true,
        'semanticHints': true,
      };
    } else if (kIsWeb) {
      return {
        'enableScreenReader': true,
        'enableKeyboardNavigation': true,
        'enableVoiceControl': false,
        'semanticHints': true,
      };
    } else {
      return {
        'enableScreenReader': true,
        'enableKeyboardNavigation': true,
        'enableVoiceControl': false,
        'semanticHints': true,
      };
    }
  }
}

/// Platform-specific configuration
class PlatformConfig {
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final Map<String, double> fieldDimensions;
  final Map<String, Duration> animationDurations;
  final Map<String, dynamic> accessibilityFeatures;

  const PlatformConfig({
    required this.keyboardType,
    required this.inputFormatters,
    required this.fieldDimensions,
    required this.animationDurations,
    required this.accessibilityFeatures,
  });

  factory PlatformConfig.fromPlatform() {
    final service = OtpPlatformService.instance;

    return PlatformConfig(
      keyboardType: service.getPlatformKeyboardType(),
      inputFormatters: service.getPlatformInputFormatters(),
      fieldDimensions: service.getPlatformFieldDimensions(),
      animationDurations: service.getPlatformAnimationDurations(),
      accessibilityFeatures: service.getPlatformAccessibilityFeatures(),
    );
  }
}
