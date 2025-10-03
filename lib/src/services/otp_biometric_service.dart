import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';

/// Service for biometric authentication integration
///
/// Provides platform-specific biometric authentication including:
/// - iOS Face ID and Touch ID
/// - Android fingerprint and face recognition
/// - Biometric fallback options
class OtpBiometricService {
  static const MethodChannel _channel =
      MethodChannel('flutter_otp_kit/biometric');

  static OtpBiometricService? _instance;
  static OtpBiometricService get instance =>
      _instance ??= OtpBiometricService._();

  OtpBiometricService._();

  /// Stream controller for biometric events
  final StreamController<BiometricEvent> _eventController =
      StreamController<BiometricEvent>.broadcast();

  /// Stream of biometric events
  Stream<BiometricEvent> get eventStream => _eventController.stream;

  /// Whether biometric service is available
  bool _isAvailable = false;

  /// Available biometric types
  List<BiometricType> _availableTypes = [];

  /// Initialize biometric service
  Future<void> initialize() async {
    try {
      _channel.setMethodCallHandler(_handleMethodCall);

      if (Platform.isAndroid) {
        await _initializeAndroid();
      } else if (Platform.isIOS) {
        await _initializeIOS();
      }
    } catch (e) {
      _eventController.add(BiometricEvent.error('Initialization failed: $e'));
    }
  }

  /// Initialize Android biometric service
  Future<void> _initializeAndroid() async {
    try {
      final result = await _channel.invokeMethod('checkBiometricAvailability');
      _isAvailable = result['available'] ?? false;
      _availableTypes = (result['types'] as List?)
              ?.map((type) => BiometricType.fromString(type))
              .toList() ??
          [];

      _eventController
          .add(BiometricEvent.initialized(_isAvailable, _availableTypes));
    } catch (e) {
      _eventController
          .add(BiometricEvent.error('Android initialization failed: $e'));
    }
  }

  /// Initialize iOS biometric service
  Future<void> _initializeIOS() async {
    try {
      final result = await _channel.invokeMethod('checkBiometricAvailability');
      _isAvailable = result['available'] ?? false;
      _availableTypes = (result['types'] as List?)
              ?.map((type) => BiometricType.fromString(type))
              .toList() ??
          [];

      _eventController
          .add(BiometricEvent.initialized(_isAvailable, _availableTypes));
    } catch (e) {
      _eventController
          .add(BiometricEvent.error('iOS initialization failed: $e'));
    }
  }

  /// Handle method calls from platform
  Future<dynamic> _handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'onBiometricSuccess':
        _eventController.add(BiometricEvent.success());
        break;

      case 'onBiometricError':
        final String error = call.arguments['error'] ?? 'Unknown error';
        _eventController.add(BiometricEvent.error(error));
        break;

      case 'onBiometricCancel':
        _eventController.add(BiometricEvent.cancelled());
        break;

      default:
        break;
    }
  }

  /// Check if biometric authentication is available
  Future<bool> isBiometricAvailable() async {
    try {
      final result = await _channel.invokeMethod('checkBiometricAvailability');
      return result['available'] ?? false;
    } catch (e) {
      return false;
    }
  }

  /// Get available biometric types
  Future<List<BiometricType>> getAvailableBiometricTypes() async {
    try {
      final result = await _channel.invokeMethod('getBiometricTypes');
      return (result['types'] as List?)
              ?.map((type) => BiometricType.fromString(type))
              .toList() ??
          [];
    } catch (e) {
      return [];
    }
  }

  /// Authenticate with biometrics
  Future<bool> authenticate({
    String? reason,
    String? fallbackTitle,
    bool allowCredentials = true,
  }) async {
    try {
      final result = await _channel.invokeMethod('authenticate', {
        'reason': reason ?? 'Authenticate to verify OTP',
        'fallbackTitle': fallbackTitle ?? 'Use Password',
        'allowCredentials': allowCredentials,
      });

      return result['success'] ?? false;
    } catch (e) {
      _eventController.add(BiometricEvent.error('Authentication failed: $e'));
      return false;
    }
  }

  /// Quick biometric authentication with default settings
  Future<bool> quickAuthenticate() async {
    return await authenticate(
      reason: 'Verify OTP with biometric authentication',
    );
  }

  /// Cancel ongoing biometric authentication
  Future<void> cancelAuthentication() async {
    try {
      await _channel.invokeMethod('cancelAuthentication');
    } catch (e) {
      // Ignore errors when cancelling
    }
  }

  /// Dispose the service
  void dispose() {
    _eventController.close();
  }
}

/// Biometric event types
abstract class BiometricEvent {
  const BiometricEvent();

  factory BiometricEvent.initialized(
      bool available, List<BiometricType> types) = BiometricInitializedEvent;
  factory BiometricEvent.success() = BiometricSuccessEvent;
  factory BiometricEvent.error(String message) = BiometricErrorEvent;
  factory BiometricEvent.cancelled() = BiometricCancelledEvent;
}

/// Biometric initialized event
class BiometricInitializedEvent extends BiometricEvent {
  final bool available;
  final List<BiometricType> types;

  const BiometricInitializedEvent(this.available, this.types);
}

/// Biometric success event
class BiometricSuccessEvent extends BiometricEvent {
  const BiometricSuccessEvent();
}

/// Biometric error event
class BiometricErrorEvent extends BiometricEvent {
  final String message;

  const BiometricErrorEvent(this.message);
}

/// Biometric cancelled event
class BiometricCancelledEvent extends BiometricEvent {
  const BiometricCancelledEvent();
}

/// Biometric type enumeration
enum BiometricType {
  fingerprint,
  face,
  iris,
  voice,
  unknown;

  static BiometricType fromString(String type) {
    switch (type.toLowerCase()) {
      case 'fingerprint':
        return BiometricType.fingerprint;
      case 'face':
        return BiometricType.face;
      case 'iris':
        return BiometricType.iris;
      case 'voice':
        return BiometricType.voice;
      default:
        return BiometricType.unknown;
    }
  }

  String get displayName {
    switch (this) {
      case BiometricType.fingerprint:
        return 'Fingerprint';
      case BiometricType.face:
        return 'Face ID';
      case BiometricType.iris:
        return 'Iris';
      case BiometricType.voice:
        return 'Voice';
      case BiometricType.unknown:
        return 'Unknown';
    }
  }
}
