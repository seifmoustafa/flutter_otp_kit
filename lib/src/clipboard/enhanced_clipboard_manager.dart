import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

/// Enhanced clipboard manager for OTP input
/// Provides comprehensive clipboard and paste handling
class EnhancedClipboardManager {
  /// Creates a new enhanced clipboard manager
  const EnhancedClipboardManager({
    this.enabled = true,
    this.debounceDelay = const Duration(milliseconds: 500),
    this.onPasteDetected,
    this.onPasteProcessed,
    this.onPasteError,
  });

  /// Whether clipboard functionality is enabled
  final bool enabled;

  /// Debounce delay to prevent multiple paste operations
  final Duration debounceDelay;

  /// Callback when paste is detected
  final ValueChanged<String>? onPasteDetected;

  /// Callback when paste is processed
  final ValueChanged<String>? onPasteProcessed;

  /// Callback when paste error occurs
  final ValueChanged<String>? onPasteError;

  /// Last paste timestamp for debouncing
  static DateTime _lastPasteTime =
      DateTime.now().subtract(const Duration(seconds: 1));

  /// Processes clipboard data for OTP input
  static Future<String?> processClipboardData({
    bool enabled = true,
    Duration debounceDelay = const Duration(milliseconds: 500),
    int? expectedLength,
    String? validationPattern,
    ValueChanged<String>? onPasteDetected,
    ValueChanged<String>? onPasteProcessed,
    ValueChanged<String>? onPasteError,
  }) async {
    if (!enabled) return null;

    try {
      // Check debounce
      final now = DateTime.now();
      if (now.difference(_lastPasteTime).inMilliseconds <
          debounceDelay.inMilliseconds) {
        return null;
      }
      _lastPasteTime = now;

      // Get clipboard data
      final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
      if (clipboardData?.text == null) {
        return null;
      }

      final text = clipboardData!.text!.trim();
      onPasteDetected?.call(text);

      // Process the text
      final processedText = _processPastedText(
        text,
        expectedLength: expectedLength,
        validationPattern: validationPattern,
      );

      if (processedText != null) {
        onPasteProcessed?.call(processedText);
        return processedText;
      } else {
        onPasteError?.call('Invalid paste data: $text');
        return null;
      }
    } catch (e) {
      onPasteError?.call('Clipboard processing failed: $e');
      return null;
    }
  }

  /// Processes pasted text for OTP input
  static String? _processPastedText(
    String text, {
    int? expectedLength,
    String? validationPattern,
  }) {
    try {
      // Clean the text
      final cleanedText = _cleanPastedText(text);

      // Validate length
      if (expectedLength != null && cleanedText.length != expectedLength) {
        return null;
      }

      // Validate pattern
      if (validationPattern != null) {
        final regex = RegExp(validationPattern);
        if (!regex.hasMatch(cleanedText)) {
          return null;
        }
      }

      return cleanedText;
    } catch (e) {
      return null;
    }
  }

  /// Cleans pasted text
  static String _cleanPastedText(String text) {
    // Remove common separators and whitespace
    return text
        .replaceAll(RegExp(r'[\s\-_.,;:]+'), '')
        .replaceAll(RegExp(r'[^\w\d]'), '')
        .trim();
  }

  /// Detects if text is a valid OTP
  static bool isValidOtpText(
    String text, {
    int? expectedLength,
    String? validationPattern,
  }) {
    try {
      final cleanedText = _cleanPastedText(text);

      // Check length
      if (expectedLength != null && cleanedText.length != expectedLength) {
        return false;
      }

      // Check pattern
      if (validationPattern != null) {
        final regex = RegExp(validationPattern);
        return regex.hasMatch(cleanedText);
      }

      // Default validation: alphanumeric
      return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(cleanedText);
    } catch (e) {
      return false;
    }
  }

  /// Extracts OTP from mixed text
  static String? extractOtpFromText(
    String text, {
    int? expectedLength,
    String? pattern,
  }) {
    try {
      final cleanedText = _cleanPastedText(text);

      if (expectedLength != null) {
        // Look for exact length match
        final regex = RegExp(r'\b\w{' + expectedLength.toString() + r'}\b');
        final match = regex.firstMatch(cleanedText);
        return match?.group(0);
      } else if (pattern != null) {
        // Use custom pattern
        final regex = RegExp(pattern);
        final match = regex.firstMatch(cleanedText);
        return match?.group(0);
      } else {
        // Look for common OTP patterns (4-8 characters)
        final regex = RegExp(r'\b\w{4,8}\b');
        final match = regex.firstMatch(cleanedText);
        return match?.group(0);
      }
    } catch (e) {
      return null;
    }
  }

  /// Handles paste operation for OTP fields
  static Future<bool> handlePasteOperation({
    required List<TextEditingController> controllers,
    required List<FocusNode> focusNodes,
    required int fieldCount,
    bool enabled = true,
    Duration debounceDelay = const Duration(milliseconds: 500),
    String? validationPattern,
    ValueChanged<String>? onPasteDetected,
    ValueChanged<String>? onPasteProcessed,
    ValueChanged<String>? onPasteError,
  }) async {
    if (!enabled) return false;

    try {
      final pastedText = await processClipboardData(
        enabled: enabled,
        debounceDelay: debounceDelay,
        expectedLength: fieldCount,
        validationPattern: validationPattern,
        onPasteDetected: onPasteDetected,
        onPasteProcessed: onPasteProcessed,
        onPasteError: onPasteError,
      );

      if (pastedText != null && pastedText.length == fieldCount) {
        // Fill all fields with pasted text
        for (int i = 0; i < fieldCount && i < pastedText.length; i++) {
          controllers[i].text = pastedText[i];
        }

        // Focus last field
        if (focusNodes.isNotEmpty) {
          focusNodes[fieldCount - 1].requestFocus();
        }

        return true;
      } else if (pastedText != null && pastedText.length == 1) {
        // Single character paste - fill current field
        final focusedIndex = _getFocusedFieldIndex(focusNodes);
        if (focusedIndex != null && focusedIndex < controllers.length) {
          controllers[focusedIndex].text = pastedText;
          return true;
        }
      }

      return false;
    } catch (e) {
      onPasteError?.call('Paste operation failed: $e');
      return false;
    }
  }

  /// Gets the index of the currently focused field
  static int? _getFocusedFieldIndex(List<FocusNode> focusNodes) {
    for (int i = 0; i < focusNodes.length; i++) {
      if (focusNodes[i].hasFocus) {
        return i;
      }
    }
    return null;
  }

  /// Sets up paste detection for a focus node
  static void setupPasteDetection({
    required FocusNode focusNode,
    required VoidCallback onPasteDetected,
    bool enabled = true,
    Duration debounceDelay = const Duration(milliseconds: 500),
  }) {
    if (!enabled) return;

    focusNode.addListener(() async {
      if (focusNode.hasFocus) {
        // Check debounce
        final now = DateTime.now();
        if (now.difference(_lastPasteTime).inMilliseconds <
            debounceDelay.inMilliseconds) {
          return;
        }

        // Check for paste operation
        final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
        if (clipboardData?.text != null) {
          _lastPasteTime = now;
          onPasteDetected();
        }
      }
    });
  }

  /// Clears clipboard data
  static Future<void> clearClipboard() async {
    try {
      await Clipboard.setData(const ClipboardData(text: ''));
    } catch (e) {
      // Handle error silently
    }
  }

  /// Copies text to clipboard
  static Future<void> copyToClipboard(String text) async {
    try {
      await Clipboard.setData(ClipboardData(text: text));
    } catch (e) {
      // Handle error silently
    }
  }

  /// Gets clipboard data
  static Future<String?> getClipboardData() async {
    try {
      final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
      return clipboardData?.text;
    } catch (e) {
      return null;
    }
  }
}

/// Clipboard configuration for OTP input
class ClipboardConfig {
  /// Creates a new clipboard configuration
  const ClipboardConfig({
    this.enabled = true,
    this.debounceDelay = const Duration(milliseconds: 500),
    this.validationPattern,
    this.onPasteDetected,
    this.onPasteProcessed,
    this.onPasteError,
  });

  /// Whether clipboard functionality is enabled
  final bool enabled;

  /// Debounce delay to prevent multiple paste operations
  final Duration debounceDelay;

  /// Validation pattern for pasted text
  final String? validationPattern;

  /// Callback when paste is detected
  final ValueChanged<String>? onPasteDetected;

  /// Callback when paste is processed
  final ValueChanged<String>? onPasteProcessed;

  /// Callback when paste error occurs
  final ValueChanged<String>? onPasteError;

  /// Creates a copy with the given fields replaced
  ClipboardConfig copyWith({
    bool? enabled,
    Duration? debounceDelay,
    String? validationPattern,
    ValueChanged<String>? onPasteDetected,
    ValueChanged<String>? onPasteProcessed,
    ValueChanged<String>? onPasteError,
  }) {
    return ClipboardConfig(
      enabled: enabled ?? this.enabled,
      debounceDelay: debounceDelay ?? this.debounceDelay,
      validationPattern: validationPattern ?? this.validationPattern,
      onPasteDetected: onPasteDetected ?? this.onPasteDetected,
      onPasteProcessed: onPasteProcessed ?? this.onPasteProcessed,
      onPasteError: onPasteError ?? this.onPasteError,
    );
  }
}
