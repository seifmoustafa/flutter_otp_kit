/// Configuration for SMS autofill features
///
/// Provides advanced SMS autofill capabilities including Smart Auth integration,
/// app signature support, and platform-specific optimizations.
class OtpSmsConfig {
  /// Creates a new SMS configuration
  const OtpSmsConfig({
    this.enableSmsAutofill = true,
    this.enableSmartAuth = false,
    this.appSignature,
    this.useUserConsentAPI = false,
    this.smsTimeout = const Duration(seconds: 30),
    this.enableSmsRetrieverAPI = false,
    this.smsRetrieverTimeout = const Duration(seconds: 60),
    this.enableSmsUserConsentAPI = false,
    this.smsUserConsentTimeout = const Duration(seconds: 30),
    this.enableSmsValidation = true,
    this.smsValidationRegex = r'\b\d{4,8}\b',
    this.enableSmsLogging = false,
    this.enableSmsErrorHandling = true,
  });

  /// Whether to enable SMS autofill
  final bool enableSmsAutofill;

  /// Whether to enable Smart Auth integration
  final bool enableSmartAuth;

  /// App signature for SMS Retriever API
  final String? appSignature;

  /// Whether to use SMS User Consent API
  final bool useUserConsentAPI;

  /// Timeout for SMS operations
  final Duration smsTimeout;

  /// Whether to enable SMS Retriever API
  final bool enableSmsRetrieverAPI;

  /// Timeout for SMS Retriever API
  final Duration smsRetrieverTimeout;

  /// Whether to enable SMS User Consent API
  final bool enableSmsUserConsentAPI;

  /// Timeout for SMS User Consent API
  final Duration smsUserConsentTimeout;

  /// Whether to enable SMS validation
  final bool enableSmsValidation;

  /// Regex pattern for SMS validation
  final String smsValidationRegex;

  /// Whether to enable SMS logging
  final bool enableSmsLogging;

  /// Whether to enable SMS error handling
  final bool enableSmsErrorHandling;

  /// Creates a copy of this object with the given fields replaced with the new values
  OtpSmsConfig copyWith({
    bool? enableSmsAutofill,
    bool? enableSmartAuth,
    String? appSignature,
    bool? useUserConsentAPI,
    Duration? smsTimeout,
    bool? enableSmsRetrieverAPI,
    Duration? smsRetrieverTimeout,
    bool? enableSmsUserConsentAPI,
    Duration? smsUserConsentTimeout,
    bool? enableSmsValidation,
    String? smsValidationRegex,
    bool? enableSmsLogging,
    bool? enableSmsErrorHandling,
  }) {
    return OtpSmsConfig(
      enableSmsAutofill: enableSmsAutofill ?? this.enableSmsAutofill,
      enableSmartAuth: enableSmartAuth ?? this.enableSmartAuth,
      appSignature: appSignature ?? this.appSignature,
      useUserConsentAPI: useUserConsentAPI ?? this.useUserConsentAPI,
      smsTimeout: smsTimeout ?? this.smsTimeout,
      enableSmsRetrieverAPI:
          enableSmsRetrieverAPI ?? this.enableSmsRetrieverAPI,
      smsRetrieverTimeout: smsRetrieverTimeout ?? this.smsRetrieverTimeout,
      enableSmsUserConsentAPI:
          enableSmsUserConsentAPI ?? this.enableSmsUserConsentAPI,
      smsUserConsentTimeout:
          smsUserConsentTimeout ?? this.smsUserConsentTimeout,
      enableSmsValidation: enableSmsValidation ?? this.enableSmsValidation,
      smsValidationRegex: smsValidationRegex ?? this.smsValidationRegex,
      enableSmsLogging: enableSmsLogging ?? this.enableSmsLogging,
      enableSmsErrorHandling:
          enableSmsErrorHandling ?? this.enableSmsErrorHandling,
    );
  }
}

/// SMS autofill callback types
typedef SmsReceivedCallback = void Function(String smsCode);
typedef SmsErrorCallback = void Function(String error);
typedef SmsTimeoutCallback = void Function();
typedef SmsValidationCallback = bool Function(String smsCode);
