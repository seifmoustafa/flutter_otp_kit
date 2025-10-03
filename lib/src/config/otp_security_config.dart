/// Configuration for security and advanced validation features
///
/// Provides settings for rate limiting, biometric integration, and advanced
/// security measures to ensure secure OTP verification.
class OtpSecurityConfig {
  /// Creates a new security configuration
  const OtpSecurityConfig({
    this.enableRateLimiting = true,
    this.maxAttemptsPerMinute = 5,
    this.maxAttemptsPerHour = 20,
    this.lockoutDuration = const Duration(minutes: 15),
    this.enableBiometricIntegration = false,
    this.biometricTimeout = const Duration(seconds: 30),
    this.enableAdvancedValidation = false,
    this.validationChecksum = false,
    this.validationPattern = r'^\d{4,8}$',
    this.enableEncryption = false,
    this.encryptionKey,
    this.enableAuditLogging = false,
    this.enableSecurityMonitoring = false,
    this.enableAntiTampering = false,
    this.enableSessionManagement = false,
    this.sessionTimeout = const Duration(minutes: 10),
  });

  /// Whether to enable rate limiting
  final bool enableRateLimiting;

  /// Maximum attempts per minute
  final int maxAttemptsPerMinute;

  /// Maximum attempts per hour
  final int maxAttemptsPerHour;

  /// Duration of lockout after exceeding limits
  final Duration lockoutDuration;

  /// Whether to enable biometric integration
  final bool enableBiometricIntegration;

  /// Timeout for biometric operations
  final Duration biometricTimeout;

  /// Whether to enable advanced validation
  final bool enableAdvancedValidation;

  /// Whether to enable checksum validation
  final bool validationChecksum;

  /// Regex pattern for validation
  final String validationPattern;

  /// Whether to enable encryption
  final bool enableEncryption;

  /// Encryption key for secure operations
  final String? encryptionKey;

  /// Whether to enable audit logging
  final bool enableAuditLogging;

  /// Whether to enable security monitoring
  final bool enableSecurityMonitoring;

  /// Whether to enable anti-tampering measures
  final bool enableAntiTampering;

  /// Whether to enable session management
  final bool enableSessionManagement;

  /// Session timeout duration
  final Duration sessionTimeout;

  /// Creates a copy of this object with the given fields replaced with the new values
  OtpSecurityConfig copyWith({
    bool? enableRateLimiting,
    int? maxAttemptsPerMinute,
    int? maxAttemptsPerHour,
    Duration? lockoutDuration,
    bool? enableBiometricIntegration,
    Duration? biometricTimeout,
    bool? enableAdvancedValidation,
    bool? validationChecksum,
    String? validationPattern,
    bool? enableEncryption,
    String? encryptionKey,
    bool? enableAuditLogging,
    bool? enableSecurityMonitoring,
    bool? enableAntiTampering,
    bool? enableSessionManagement,
    Duration? sessionTimeout,
  }) {
    return OtpSecurityConfig(
      enableRateLimiting: enableRateLimiting ?? this.enableRateLimiting,
      maxAttemptsPerMinute: maxAttemptsPerMinute ?? this.maxAttemptsPerMinute,
      maxAttemptsPerHour: maxAttemptsPerHour ?? this.maxAttemptsPerHour,
      lockoutDuration: lockoutDuration ?? this.lockoutDuration,
      enableBiometricIntegration:
          enableBiometricIntegration ?? this.enableBiometricIntegration,
      biometricTimeout: biometricTimeout ?? this.biometricTimeout,
      enableAdvancedValidation:
          enableAdvancedValidation ?? this.enableAdvancedValidation,
      validationChecksum: validationChecksum ?? this.validationChecksum,
      validationPattern: validationPattern ?? this.validationPattern,
      enableEncryption: enableEncryption ?? this.enableEncryption,
      encryptionKey: encryptionKey ?? this.encryptionKey,
      enableAuditLogging: enableAuditLogging ?? this.enableAuditLogging,
      enableSecurityMonitoring:
          enableSecurityMonitoring ?? this.enableSecurityMonitoring,
      enableAntiTampering: enableAntiTampering ?? this.enableAntiTampering,
      enableSessionManagement:
          enableSessionManagement ?? this.enableSessionManagement,
      sessionTimeout: sessionTimeout ?? this.sessionTimeout,
    );
  }
}

/// Security callback types
typedef SecurityEventCallback = void Function(
    String event, Map<String, dynamic> data);
typedef BiometricCallback = Future<bool> Function();
typedef RateLimitCallback = void Function(int attempts, Duration remaining);
typedef AuditLogCallback = void Function(
    String action, Map<String, dynamic> details);
