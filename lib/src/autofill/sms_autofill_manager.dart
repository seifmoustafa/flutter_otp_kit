import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

/// Enhanced SMS autofill manager for OTP input
/// Provides comprehensive SMS autofill support for iOS and Android
class SmsAutofillManager {
  /// Creates a new SMS autofill manager
  const SmsAutofillManager({
    this.enabled = true,
    this.platform = SmsAutofillPlatform.auto,
    this.appSignature,
    this.timeout = const Duration(seconds: 30),
    this.onSmsReceived,
    this.onError,
  });

  /// Whether SMS autofill is enabled
  final bool enabled;

  /// Platform-specific implementation to use
  final SmsAutofillPlatform platform;

  /// App signature for Android SMS Retriever API
  final String? appSignature;

  /// Timeout for SMS retrieval
  final Duration timeout;

  /// Callback when SMS is received
  final ValueChanged<String>? onSmsReceived;

  /// Callback when an error occurs
  final ValueChanged<String>? onError;

  /// Starts listening for SMS messages
  static Future<void> startListening({
    bool enabled = true,
    SmsAutofillPlatform platform = SmsAutofillPlatform.auto,
    String? appSignature,
    Duration timeout = const Duration(seconds: 30),
    ValueChanged<String>? onSmsReceived,
    ValueChanged<String>? onError,
  }) async {
    if (!enabled) return;

    try {
      switch (platform) {
        case SmsAutofillPlatform.auto:
          // Auto-detect platform - use default Android for now
          await _startAndroidListening(
              appSignature, timeout, onSmsReceived, onError);
          break;
        case SmsAutofillPlatform.ios:
          await _startIosListening(onSmsReceived, onError);
          break;
        case SmsAutofillPlatform.android:
          await _startAndroidListening(
              appSignature, timeout, onSmsReceived, onError);
          break;
        case SmsAutofillPlatform.web:
          await _startWebListening(onSmsReceived, onError);
          break;
      }
    } catch (e) {
      onError?.call('Failed to start SMS listening: $e');
    }
  }

  /// Starts iOS SMS listening
  static Future<void> _startIosListening(
    ValueChanged<String>? onSmsReceived,
    ValueChanged<String>? onError,
  ) async {
    try {
      // iOS SMS autofill works automatically with TextField
      // We just need to set up the proper configuration
      await _configureIosSmsAutofill();
    } catch (e) {
      onError?.call('iOS SMS autofill setup failed: $e');
    }
  }

  /// Starts Android SMS listening
  static Future<void> _startAndroidListening(
    String? appSignature,
    Duration timeout,
    ValueChanged<String>? onSmsReceived,
    ValueChanged<String>? onError,
  ) async {
    try {
      if (appSignature != null) {
        // Use SMS Retriever API
        await _startSmsRetriever(appSignature, timeout, onSmsReceived, onError);
      } else {
        // Use SMS User Consent API
        await _startSmsUserConsent(timeout, onSmsReceived, onError);
      }
    } catch (e) {
      onError?.call('Android SMS listening failed: $e');
    }
  }

  /// Starts web SMS listening
  static Future<void> _startWebListening(
    ValueChanged<String>? onSmsReceived,
    ValueChanged<String>? onError,
  ) async {
    try {
      // Web SMS autofill is handled by the browser
      // We just need to set up the proper configuration
      await _configureWebSmsAutofill();
    } catch (e) {
      onError?.call('Web SMS autofill setup failed: $e');
    }
  }

  /// Configures iOS SMS autofill
  static Future<void> _configureIosSmsAutofill() async {
    // iOS SMS autofill is handled automatically by the system
    // when using TextField with proper configuration
  }

  /// Starts SMS Retriever API (Android)
  static Future<void> _startSmsRetriever(
    String appSignature,
    Duration timeout,
    ValueChanged<String>? onSmsReceived,
    ValueChanged<String>? onError,
  ) async {
    try {
      // This would typically use a platform channel to native Android code
      // For now, we'll simulate the behavior
      await _simulateSmsRetriever(
          appSignature, timeout, onSmsReceived, onError);
    } catch (e) {
      onError?.call('SMS Retriever failed: $e');
    }
  }

  /// Starts SMS User Consent API (Android)
  static Future<void> _startSmsUserConsent(
    Duration timeout,
    ValueChanged<String>? onSmsReceived,
    ValueChanged<String>? onError,
  ) async {
    try {
      // This would typically use a platform channel to native Android code
      // For now, we'll simulate the behavior
      await _simulateSmsUserConsent(timeout, onSmsReceived, onError);
    } catch (e) {
      onError?.call('SMS User Consent failed: $e');
    }
  }

  /// Configures web SMS autofill
  static Future<void> _configureWebSmsAutofill() async {
    // Web SMS autofill is handled by the browser
    // We just need to set up the proper configuration
  }

  /// Simulates SMS Retriever API behavior
  static Future<void> _simulateSmsRetriever(
    String appSignature,
    Duration timeout,
    ValueChanged<String>? onSmsReceived,
    ValueChanged<String>? onError,
  ) async {
    // This is a simulation - in a real implementation, this would
    // use platform channels to communicate with native Android code
    await Future.delayed(timeout);
    onError?.call('SMS Retriever timeout - no SMS received');
  }

  /// Simulates SMS User Consent API behavior
  static Future<void> _simulateSmsUserConsent(
    Duration timeout,
    ValueChanged<String>? onSmsReceived,
    ValueChanged<String>? onError,
  ) async {
    // This is a simulation - in a real implementation, this would
    // use platform channels to communicate with native Android code
    await Future.delayed(timeout);
    onError?.call('SMS User Consent timeout - no SMS received');
  }

  /// Stops listening for SMS messages
  static Future<void> stopListening() async {
    try {
      // Stop any active SMS listening
      await _stopSmsListening();
    } catch (e) {
      // Handle error silently
    }
  }

  /// Stops SMS listening
  static Future<void> _stopSmsListening() async {
    // This would typically use a platform channel to native code
    // For now, we'll just return
  }

  /// Extracts OTP from SMS text
  static String? extractOtpFromSms(
    String smsText, {
    int? expectedLength,
    String? pattern,
  }) {
    try {
      // Default pattern for OTP extraction
      final defaultPattern = expectedLength != null
          ? RegExp(r'\b\d{' + expectedLength.toString() + r'}\b')
          : RegExp(r'\b\d{4,8}\b');

      final regex = pattern != null ? RegExp(pattern) : defaultPattern;
      final match = regex.firstMatch(smsText);

      return match?.group(0);
    } catch (e) {
      return null;
    }
  }

  /// Validates SMS format for OTP
  static bool isValidOtpSms(
    String smsText, {
    int? expectedLength,
    String? appSignature,
  }) {
    try {
      // Check if SMS contains OTP
      final hasOtp =
          extractOtpFromSms(smsText, expectedLength: expectedLength) != null;

      // Check app signature if provided
      if (appSignature != null) {
        final hasSignature = smsText.contains(appSignature);
        return hasOtp && hasSignature;
      }

      return hasOtp;
    } catch (e) {
      return false;
    }
  }

  /// Gets app signature for Android SMS Retriever API
  static Future<String?> getAppSignature() async {
    try {
      // This would typically use a platform channel to native Android code
      // For now, we'll return null
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Checks if SMS autofill is supported on current platform
  static bool isSupported() {
    try {
      // Check if SMS autofill is supported
      return true; // Simplified for now
    } catch (e) {
      return false;
    }
  }
}

/// Enum for SMS autofill platforms
enum SmsAutofillPlatform {
  auto,
  ios,
  android,
  web,
}

/// SMS autofill configuration
class SmsAutofillConfig {
  /// Creates a new SMS autofill configuration
  const SmsAutofillConfig({
    this.enabled = true,
    this.platform = SmsAutofillPlatform.auto,
    this.appSignature,
    this.timeout = const Duration(seconds: 30),
    this.expectedLength,
    this.pattern,
    this.onSmsReceived,
    this.onError,
  });

  /// Whether SMS autofill is enabled
  final bool enabled;

  /// Platform-specific implementation to use
  final SmsAutofillPlatform platform;

  /// App signature for Android SMS Retriever API
  final String? appSignature;

  /// Timeout for SMS retrieval
  final Duration timeout;

  /// Expected length of OTP
  final int? expectedLength;

  /// Custom pattern for OTP extraction
  final String? pattern;

  /// Callback when SMS is received
  final ValueChanged<String>? onSmsReceived;

  /// Callback when an error occurs
  final ValueChanged<String>? onError;

  /// Creates a copy with the given fields replaced
  SmsAutofillConfig copyWith({
    bool? enabled,
    SmsAutofillPlatform? platform,
    String? appSignature,
    Duration? timeout,
    int? expectedLength,
    String? pattern,
    ValueChanged<String>? onSmsReceived,
    ValueChanged<String>? onError,
  }) {
    return SmsAutofillConfig(
      enabled: enabled ?? this.enabled,
      platform: platform ?? this.platform,
      appSignature: appSignature ?? this.appSignature,
      timeout: timeout ?? this.timeout,
      expectedLength: expectedLength ?? this.expectedLength,
      pattern: pattern ?? this.pattern,
      onSmsReceived: onSmsReceived ?? this.onSmsReceived,
      onError: onError ?? this.onError,
    );
  }
}
