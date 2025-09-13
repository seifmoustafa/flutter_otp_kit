import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Provides platform-specific SMS autofill implementation.
class PlatformSmsAutofill {
  /// Creates a new platform SMS autofill manager.
  PlatformSmsAutofill._();

  /// The shared instance.
  static final PlatformSmsAutofill instance = PlatformSmsAutofill._();

  /// The channel for platform communication.
  final MethodChannel _channel =
      const MethodChannel('flutter_otp_kit/sms_autofill');

  /// Starts listening for SMS messages.
  ///
  /// Returns a Stream of SMS messages that can be listened to.
  Stream<String> listenForSms() {
    final controller = StreamController<String>.broadcast();

    _channel.invokeMethod('listenForSms').then((_) {
      // Setup method call handler
      _channel.setMethodCallHandler((call) async {
        if (call.method == 'onSmsReceived') {
          final smsText = call.arguments as String?;
          if (smsText != null) {
            controller.add(smsText);
          }
        } else if (call.method == 'onSmsTimeout') {
          controller.addError('SMS timeout');
        } else if (call.method == 'onSmsError') {
          final errorMessage = call.arguments as String? ?? 'Unknown error';
          controller.addError(errorMessage);
        }
        return null;
      });
    }).catchError((error) {
      controller.addError('Failed to listen for SMS: $error');
    });

    return controller.stream;
  }

  /// Stops listening for SMS messages.
  Future<void> stopListening() async {
    try {
      await _channel.invokeMethod('stopListening');
    } catch (e) {
      debugPrint('Error stopping SMS listening: $e');
    }
  }

  /// Gets the app signature for Android SMS Retriever API.
  Future<String?> getAppSignature() async {
    try {
      return await _channel.invokeMethod('getAppSignature');
    } catch (e) {
      debugPrint('Error getting app signature: $e');
      return null;
    }
  }

  /// Checks if SMS autofill is supported on this device.
  Future<bool> isSupported() async {
    try {
      return await _channel.invokeMethod('isSupported') ?? false;
    } catch (e) {
      return false;
    }
  }

  /// Requests a one-time code via SMS (Android only).
  Future<bool> requestSms({
    required String phoneNumber,
    required String senderPhoneNumber,
  }) async {
    try {
      return await _channel.invokeMethod('requestSms', {
            'phoneNumber': phoneNumber,
            'senderPhoneNumber': senderPhoneNumber,
          }) ??
          false;
    } catch (e) {
      debugPrint('Error requesting SMS: $e');
      return false;
    }
  }

  /// Sets an app context for iOS autofill.
  Future<bool> setAppContext({String? bundleId}) async {
    try {
      return await _channel.invokeMethod('setAppContext', {
            'bundleId': bundleId,
          }) ??
          false;
    } catch (e) {
      debugPrint('Error setting app context: $e');
      return false;
    }
  }

  /// Extracts OTP from SMS text.
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
}

/// A manager for SMS autofill functionality.
class EnhancedSmsAutofillManager {
  /// Creates a new SMS autofill manager.
  const EnhancedSmsAutofillManager({
    this.enabled = true,
    this.platform = SmsAutofillPlatform.auto,
    this.timeout = const Duration(seconds: 30),
    this.expectedLength = 6,
    this.extractionPattern,
    this.appSignature,
    this.onCodeReceived,
    this.onError,
    this.onTimeout,
  });

  /// Whether SMS autofill is enabled.
  final bool enabled;

  /// The platform to use for SMS autofill.
  final SmsAutofillPlatform platform;

  /// The timeout for SMS autofill.
  final Duration timeout;

  /// The expected length of the OTP code.
  final int expectedLength;

  /// A custom pattern for extracting the OTP code.
  final String? extractionPattern;

  /// The app signature for Android SMS Retriever API.
  final String? appSignature;

  /// Callback when a code is received.
  final ValueChanged<String>? onCodeReceived;

  /// Callback when an error occurs.
  final ValueChanged<String>? onError;

  /// Callback when the timeout is reached.
  final VoidCallback? onTimeout;

  /// Starts listening for SMS messages.
  Future<void> startListening() async {
    if (!enabled) return;

    try {
      final isSupported = await PlatformSmsAutofill.instance.isSupported();
      if (!isSupported) {
        onError?.call('SMS autofill is not supported on this device');
        return;
      }

      // Start listening for SMS
      final subscription = PlatformSmsAutofill.instance.listenForSms().listen(
        (smsText) {
          final code = PlatformSmsAutofill.extractOtpFromSms(
            smsText,
            expectedLength: expectedLength,
            pattern: extractionPattern,
          );

          if (code != null) {
            onCodeReceived?.call(code);
          }
        },
        onError: (error) {
          onError?.call(error.toString());
        },
      );

      // Set up timeout
      Future.delayed(timeout, () {
        subscription.cancel();
        onTimeout?.call();
        PlatformSmsAutofill.instance.stopListening();
      });
    } catch (e) {
      onError?.call('Failed to start SMS listening: $e');
    }
  }

  /// Stops listening for SMS messages.
  Future<void> stopListening() async {
    await PlatformSmsAutofill.instance.stopListening();
  }
}

/// The platform to use for SMS autofill.
enum SmsAutofillPlatform {
  /// Auto-detect the platform.
  auto,

  /// Use iOS-specific implementation.
  ios,

  /// Use Android-specific implementation.
  android,

  /// Use web-specific implementation.
  web,
}
