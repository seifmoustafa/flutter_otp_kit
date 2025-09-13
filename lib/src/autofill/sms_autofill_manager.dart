import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'platform_sms_autofill.dart';

/// A comprehensive SMS autofill manager for OTP input
///
/// This class provides SMS autofill functionality for both iOS and Android platforms,
/// with a simple API for listening for SMS messages.
class SmsAutofillManager {
  /// Creates a new SMS autofill manager
  const SmsAutofillManager({
    this.enabled = true,
    this.platform = SmsAutofillPlatform.auto,
    this.appSignature,
    this.timeout = const Duration(seconds: 30),
    this.expectedLength = 6,
    this.extractionPattern,
    this.onSmsReceived,
    this.onError,
    this.onTimeout,
  });

  /// Whether SMS autofill is enabled
  final bool enabled;

  /// Platform-specific implementation to use
  final SmsAutofillPlatform platform;

  /// App signature for Android SMS Retriever API
  final String? appSignature;

  /// Timeout for SMS retrieval
  final Duration timeout;

  /// Expected length of OTP code
  final int expectedLength;

  /// Custom pattern for extracting OTP code
  final String? extractionPattern;

  /// Callback when SMS is received
  final ValueChanged<String>? onSmsReceived;

  /// Callback when an error occurs
  final ValueChanged<String>? onError;

  /// Callback when timeout occurs
  final VoidCallback? onTimeout;

  /// Starts listening for SMS messages
  static Future<void> startListening({
    bool enabled = true,
    SmsAutofillPlatform platform = SmsAutofillPlatform.auto,
    String? appSignature,
    Duration timeout = const Duration(seconds: 30),
    int expectedLength = 6,
    String? extractionPattern,
    ValueChanged<String>? onSmsReceived,
    ValueChanged<String>? onError,
    VoidCallback? onTimeout,
  }) async {
    if (!enabled) return;

    final manager = EnhancedSmsAutofillManager(
      enabled: enabled,
      platform: platform,
      appSignature: appSignature,
      timeout: timeout,
      expectedLength: expectedLength,
      extractionPattern: extractionPattern,
      onCodeReceived: onSmsReceived,
      onError: onError,
      onTimeout: onTimeout,
    );

    await manager.startListening();
  }

  /// Stops listening for SMS messages
  static Future<void> stopListening() async {
    try {
      await PlatformSmsAutofill.instance.stopListening();
    } catch (e) {
      debugPrint('Failed to stop SMS listening: $e');
    }
  }

  /// Gets app signature for Android SMS Retriever API
  static Future<String?> getAppSignature() async {
    try {
      return await PlatformSmsAutofill.instance.getAppSignature();
    } catch (e) {
      debugPrint('Failed to get app signature: $e');
      return null;
    }
  }

  /// Checks if SMS autofill is supported on current platform
  static Future<bool> isSupported() async {
    try {
      return await PlatformSmsAutofill.instance.isSupported();
    } catch (e) {
      return false;
    }
  }

  /// Extracts OTP from SMS text
  static String? extractOtpFromSms(
    String smsText, {
    int? expectedLength,
    String? pattern,
  }) {
    return PlatformSmsAutofill.extractOtpFromSms(
      smsText,
      expectedLength: expectedLength,
      pattern: pattern,
    );
  }

  /// Creates autofill input formatters for use with TextField
  static List<TextInputFormatter> createInputFormatters({int maxLength = 1}) {
    return [
      LengthLimitingTextInputFormatter(maxLength),
      FilteringTextInputFormatter.digitsOnly,
    ];
  }

  /// Creates autofill configuration for TextField
  static InputDecoration createAutofillDecoration() {
    return const InputDecoration(
      border: InputBorder.none,
      counterText: '',
      contentPadding: EdgeInsets.zero,
      isDense: true,
    );
  }

  /// Sets up a TextField for iOS autofill
  static void setupIOSAutofill(TextInputConfiguration configuration) {
    // iOS autofill is handled automatically by the system
    // Just ensure the textContentType is set to oneTimeCode
  }
}

/// Utility extension for TextField to enable SMS autofill
extension SmsAutofillExtension on TextField {
  /// Enables SMS autofill for this TextField
  TextField enableSmsAutofill() {
    // For iOS, we use the oneTimeCode textContentType
    if (this.textInputAction == TextInputAction.next &&
        this.keyboardType == TextInputType.number) {
      return TextField(
        controller: this.controller,
        focusNode: this.focusNode,
        decoration: this.decoration,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        autofillHints: const ['oneTimeCode'],
        style: this.style,
        textAlign: this.textAlign,
        textAlignVertical: this.textAlignVertical,
        textDirection: this.textDirection,
        readOnly: this.readOnly,
        toolbarOptions: this.toolbarOptions,
        showCursor: this.showCursor,
        obscuringCharacter: this.obscuringCharacter,
        obscureText: this.obscureText,
        autocorrect: this.autocorrect,
        smartDashesType: this.smartDashesType,
        smartQuotesType: this.smartQuotesType,
        enableSuggestions: this.enableSuggestions,
        maxLines: this.maxLines,
        minLines: this.minLines,
        expands: this.expands,
        maxLength: this.maxLength,
        maxLengthEnforcement: this.maxLengthEnforcement,
        onChanged: this.onChanged,
        onEditingComplete: this.onEditingComplete,
        onSubmitted: this.onSubmitted,
        onAppPrivateCommand: this.onAppPrivateCommand,
        inputFormatters: this.inputFormatters,
        enabled: this.enabled,
        cursorWidth: this.cursorWidth,
        cursorHeight: this.cursorHeight,
        cursorRadius: this.cursorRadius,
        cursorColor: this.cursorColor,
        selectionHeightStyle: this.selectionHeightStyle,
        selectionWidthStyle: this.selectionWidthStyle,
        keyboardAppearance: this.keyboardAppearance,
        scrollPadding: this.scrollPadding,
        enableInteractiveSelection: this.enableInteractiveSelection,
        selectionControls: this.selectionControls,
        buildCounter: this.buildCounter,
        scrollController: this.scrollController,
        scrollPhysics: this.scrollPhysics,
        autofocus: this.autofocus,
        restorationId: this.restorationId,
        enableIMEPersonalizedLearning: this.enableIMEPersonalizedLearning,
      );
    }

    // If we don't need to modify anything, return the original TextField
    return this;
  }
}
