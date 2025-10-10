import 'dart:async';
import 'package:flutter/services.dart';
import '../config/otp_sms_config.dart';
import '../utils/platform_utils.dart';

/// Service for handling SMS autofill functionality
///
/// Provides platform-specific SMS autofill capabilities including:
/// - iOS native SMS autofill
/// - Android SMS Retriever API
/// - Android SMS User Consent API
/// - Smart Auth integration
class OtpSmsService {
  static const MethodChannel _channel = MethodChannel('flutter_otp_kit/sms');

  static OtpSmsService? _instance;
  static OtpSmsService get instance => _instance ??= OtpSmsService._();

  OtpSmsService._();

  /// Stream controller for SMS codes
  final StreamController<String> _smsCodeController =
      StreamController<String>.broadcast();

  /// Stream controller for SMS errors
  final StreamController<String> _smsErrorController =
      StreamController<String>.broadcast();

  /// Stream controller for SMS timeout
  final StreamController<void> _smsTimeoutController =
      StreamController<void>.broadcast();

  /// Stream of SMS codes
  Stream<String> get smsCodeStream => _smsCodeController.stream;

  /// Stream of SMS errors
  Stream<String> get smsErrorStream => _smsErrorController.stream;

  /// Stream of SMS timeouts
  Stream<void> get smsTimeoutStream => _smsTimeoutController.stream;

  /// Whether SMS service is currently listening
  bool _isListening = false;

  /// Current SMS configuration
  OtpSmsConfig? _currentConfig;

  /// Timer for SMS timeout
  Timer? _timeoutTimer;

  /// Initialize SMS service with configuration
  Future<void> initialize(OtpSmsConfig config) async {
    _currentConfig = config;

    if (config.enableSmsAutofill) {
      await _setupMethodChannel();
    }
  }

  /// Setup method channel for platform communication
  Future<void> _setupMethodChannel() async {
    try {
      _channel.setMethodCallHandler(_handleMethodCall);

      if (PlatformUtils.isAndroid) {
        await _setupAndroidSms();
      } else if (PlatformUtils.isIOS) {
        await _setupIosSms();
      }
    } catch (e) {
      _smsErrorController.add('Failed to setup SMS service: $e');
    }
  }

  /// Setup Android SMS autofill
  Future<void> _setupAndroidSms() async {
    if (_currentConfig == null) return;

    try {
      if (_currentConfig!.enableSmsRetrieverAPI) {
        await _channel.invokeMethod('startSmsRetriever', {
          'appSignature': _currentConfig!.appSignature,
          'timeout': _currentConfig!.smsRetrieverTimeout.inMilliseconds,
        });
      }

      if (_currentConfig!.enableSmsUserConsentAPI) {
        await _channel.invokeMethod('startSmsUserConsent', {
          'timeout': _currentConfig!.smsUserConsentTimeout.inMilliseconds,
        });
      }
    } catch (e) {
      _smsErrorController.add('Android SMS setup failed: $e');
    }
  }

  /// Setup iOS SMS autofill
  Future<void> _setupIosSms() async {
    try {
      await _channel.invokeMethod('setupIosSms');
    } catch (e) {
      _smsErrorController.add('iOS SMS setup failed: $e');
    }
  }

  /// Handle method calls from platform
  Future<dynamic> _handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'onSmsReceived':
        final String smsCode = call.arguments['code'] as String;
        if (_validateSmsCode(smsCode)) {
          _smsCodeController.add(smsCode);
          _stopListening();
        }
        break;

      case 'onSmsError':
        final String error = call.arguments['error'] as String;
        _smsErrorController.add(error);
        _stopListening();
        break;

      case 'onSmsTimeout':
        _smsTimeoutController.add(null);
        _stopListening();
        break;

      default:
        break;
    }
  }

  /// Validate SMS code using regex
  bool _validateSmsCode(String code) {
    if (_currentConfig == null || !_currentConfig!.enableSmsValidation) {
      return true;
    }

    try {
      final regex = RegExp(_currentConfig!.smsValidationRegex);
      return regex.hasMatch(code);
    } catch (e) {
      return false;
    }
  }

  /// Start listening for SMS codes
  Future<void> startListening() async {
    if (_isListening) return;

    _isListening = true;

    // Set timeout timer
    if (_currentConfig != null) {
      _timeoutTimer = Timer(_currentConfig!.smsTimeout, () {
        _smsTimeoutController.add(null);
        _stopListening();
      });
    }

    try {
      if (PlatformUtils.isAndroid) {
        await _channel.invokeMethod('startListening');
      } else if (PlatformUtils.isIOS) {
        await _channel.invokeMethod('startListening');
      }
    } catch (e) {
      _smsErrorController.add('Failed to start listening: $e');
      _stopListening();
    }
  }

  /// Stop listening for SMS codes
  Future<void> _stopListening() async {
    if (!_isListening) return;

    _isListening = false;
    _timeoutTimer?.cancel();
    _timeoutTimer = null;

    try {
      await _channel.invokeMethod('stopListening');
    } catch (e) {
      // Ignore errors when stopping
    }
  }

  /// Stop listening for SMS codes (public method)
  Future<void> stopListening() async {
    await _stopListening();
  }

  /// Get SMS code with timeout
  Future<String?> getSmsCode({
    Duration? timeout,
    bool validate = true,
  }) async {
    if (!_isListening) {
      await startListening();
    }

    try {
      final result = await smsCodeStream.first.timeout(
        timeout ?? _currentConfig?.smsTimeout ?? const Duration(seconds: 30),
      );

      if (validate && !_validateSmsCode(result)) {
        return null;
      }

      return result;
    } catch (e) {
      return null;
    }
  }

  /// Check if SMS autofill is available on current platform
  Future<bool> isSmsAutofillAvailable() async {
    try {
      if (PlatformUtils.isAndroid) {
        return await _channel.invokeMethod('isSmsRetrieverAvailable') ?? false;
      } else if (PlatformUtils.isIOS) {
        return await _channel.invokeMethod('isIosSmsAvailable') ?? false;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  /// Dispose the service
  void dispose() {
    _stopListening();
    _smsCodeController.close();
    _smsErrorController.close();
    _smsTimeoutController.close();
  }
}

/// Extension methods for easier SMS service usage
extension OtpSmsServiceExtension on OtpSmsService {
  /// Quick method to get SMS code with default configuration
  Future<String?> quickGetSmsCode() async {
    return await getSmsCode();
  }

  /// Method to get SMS code with custom validation
  Future<String?> getSmsCodeWithValidation(
      bool Function(String) validator) async {
    final code = await getSmsCode(validate: false);
    if (code != null && validator(code)) {
      return code;
    }
    return null;
  }
}
