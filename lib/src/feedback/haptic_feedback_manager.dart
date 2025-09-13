import 'package:flutter/services.dart';

/// Enhanced haptic feedback manager for OTP input
/// Provides comprehensive haptic feedback for better user experience
class HapticFeedbackManager {
  /// Creates a new haptic feedback manager
  const HapticFeedbackManager({
    this.enabled = true,
    this.feedbackType = HapticFeedbackType.light,
    this.customFeedbackPattern,
  });

  /// Whether haptic feedback is enabled
  final bool enabled;

  /// Type of haptic feedback to use
  final HapticFeedbackType feedbackType;

  /// Custom feedback pattern for advanced use cases
  final HapticFeedbackPattern? customFeedbackPattern;

  /// Triggers haptic feedback for input
  static Future<void> triggerInput({
    bool enabled = true,
    HapticFeedbackType type = HapticFeedbackType.light,
  }) async {
    if (!enabled) return;

    switch (type) {
      case HapticFeedbackType.light:
        await HapticFeedback.lightImpact();
        break;
      case HapticFeedbackType.medium:
        await HapticFeedback.mediumImpact();
        break;
      case HapticFeedbackType.heavy:
        await HapticFeedback.heavyImpact();
        break;
      case HapticFeedbackType.selection:
        await HapticFeedback.selectionClick();
        break;
      case HapticFeedbackType.vibrate:
        await HapticFeedback.vibrate();
        break;
      case HapticFeedbackType.none:
        break;
    }
  }

  /// Triggers haptic feedback for deletion
  static Future<void> triggerDeletion({
    bool enabled = true,
    HapticFeedbackType type = HapticFeedbackType.light,
  }) async {
    if (!enabled) return;

    switch (type) {
      case HapticFeedbackType.light:
        await HapticFeedback.lightImpact();
        break;
      case HapticFeedbackType.medium:
        await HapticFeedback.mediumImpact();
        break;
      case HapticFeedbackType.heavy:
        await HapticFeedback.heavyImpact();
        break;
      case HapticFeedbackType.selection:
        await HapticFeedback.selectionClick();
        break;
      case HapticFeedbackType.vibrate:
        await HapticFeedback.vibrate();
        break;
      case HapticFeedbackType.none:
        break;
    }
  }

  /// Triggers haptic feedback for completion
  static Future<void> triggerCompletion({
    bool enabled = true,
    HapticFeedbackType type = HapticFeedbackType.medium,
  }) async {
    if (!enabled) return;

    switch (type) {
      case HapticFeedbackType.light:
        await HapticFeedback.lightImpact();
        break;
      case HapticFeedbackType.medium:
        await HapticFeedback.mediumImpact();
        break;
      case HapticFeedbackType.heavy:
        await HapticFeedback.heavyImpact();
        break;
      case HapticFeedbackType.selection:
        await HapticFeedback.selectionClick();
        break;
      case HapticFeedbackType.vibrate:
        await HapticFeedback.vibrate();
        break;
      case HapticFeedbackType.none:
        break;
    }
  }

  /// Triggers haptic feedback for error
  static Future<void> triggerError({
    bool enabled = true,
    HapticFeedbackType type = HapticFeedbackType.heavy,
  }) async {
    if (!enabled) return;

    switch (type) {
      case HapticFeedbackType.light:
        await HapticFeedback.lightImpact();
        break;
      case HapticFeedbackType.medium:
        await HapticFeedback.mediumImpact();
        break;
      case HapticFeedbackType.heavy:
        await HapticFeedback.heavyImpact();
        break;
      case HapticFeedbackType.selection:
        await HapticFeedback.selectionClick();
        break;
      case HapticFeedbackType.vibrate:
        await HapticFeedback.vibrate();
        break;
      case HapticFeedbackType.none:
        break;
    }
  }

  /// Triggers haptic feedback for success
  static Future<void> triggerSuccess({
    bool enabled = true,
    HapticFeedbackType type = HapticFeedbackType.medium,
  }) async {
    if (!enabled) return;

    switch (type) {
      case HapticFeedbackType.light:
        await HapticFeedback.lightImpact();
        break;
      case HapticFeedbackType.medium:
        await HapticFeedback.mediumImpact();
        break;
      case HapticFeedbackType.heavy:
        await HapticFeedback.heavyImpact();
        break;
      case HapticFeedbackType.selection:
        await HapticFeedback.selectionClick();
        break;
      case HapticFeedbackType.vibrate:
        await HapticFeedback.vibrate();
        break;
      case HapticFeedbackType.none:
        break;
    }
  }

  /// Triggers haptic feedback for focus change
  static Future<void> triggerFocusChange({
    bool enabled = true,
    HapticFeedbackType type = HapticFeedbackType.selection,
  }) async {
    if (!enabled) return;

    switch (type) {
      case HapticFeedbackType.light:
        await HapticFeedback.lightImpact();
        break;
      case HapticFeedbackType.medium:
        await HapticFeedback.mediumImpact();
        break;
      case HapticFeedbackType.heavy:
        await HapticFeedback.heavyImpact();
        break;
      case HapticFeedbackType.selection:
        await HapticFeedback.selectionClick();
        break;
      case HapticFeedbackType.vibrate:
        await HapticFeedback.vibrate();
        break;
      case HapticFeedbackType.none:
        break;
    }
  }

  /// Triggers custom haptic feedback pattern
  static Future<void> triggerCustomPattern({
    required HapticFeedbackPattern pattern,
    bool enabled = true,
  }) async {
    if (!enabled) return;

    for (final feedback in pattern.feedbacks) {
      await Future.delayed(feedback.delay);
      await triggerInput(
        enabled: true,
        type: feedback.type,
      );
    }
  }

  /// Triggers haptic feedback based on action type
  static Future<void> triggerForAction({
    required HapticAction action,
    bool enabled = true,
    HapticFeedbackType? customType,
  }) async {
    if (!enabled) return;

    final type = customType ?? action.defaultFeedbackType;

    switch (action) {
      case HapticAction.input:
        await triggerInput(enabled: enabled, type: type);
        break;
      case HapticAction.deletion:
        await triggerDeletion(enabled: enabled, type: type);
        break;
      case HapticAction.completion:
        await triggerCompletion(enabled: enabled, type: type);
        break;
      case HapticAction.error:
        await triggerError(enabled: enabled, type: type);
        break;
      case HapticAction.success:
        await triggerSuccess(enabled: enabled, type: type);
        break;
      case HapticAction.focusChange:
        await triggerFocusChange(enabled: enabled, type: type);
        break;
    }
  }
}

/// Enum for haptic feedback types
enum HapticFeedbackType {
  none,
  light,
  medium,
  heavy,
  selection,
  vibrate,
}

/// Enum for haptic actions
enum HapticAction {
  input,
  deletion,
  completion,
  error,
  success,
  focusChange,
}

/// Extension on HapticAction to provide default feedback types
extension HapticActionExtension on HapticAction {
  /// Default feedback type for this action
  HapticFeedbackType get defaultFeedbackType {
    switch (this) {
      case HapticAction.input:
        return HapticFeedbackType.light;
      case HapticAction.deletion:
        return HapticFeedbackType.light;
      case HapticAction.completion:
        return HapticFeedbackType.medium;
      case HapticAction.error:
        return HapticFeedbackType.heavy;
      case HapticAction.success:
        return HapticFeedbackType.medium;
      case HapticAction.focusChange:
        return HapticFeedbackType.selection;
    }
  }
}

/// A custom haptic feedback pattern
class HapticFeedbackPattern {
  /// Creates a new haptic feedback pattern
  const HapticFeedbackPattern({
    required this.feedbacks,
  });

  /// List of feedback events in the pattern
  final List<HapticFeedbackEvent> feedbacks;
}

/// A single haptic feedback event
class HapticFeedbackEvent {
  /// Creates a new haptic feedback event
  const HapticFeedbackEvent({
    required this.type,
    this.delay = Duration.zero,
  });

  /// Type of haptic feedback
  final HapticFeedbackType type;

  /// Delay before this feedback
  final Duration delay;
}

/// Predefined haptic feedback patterns
class HapticPatterns {
  /// Success pattern: light-medium-light
  static const HapticFeedbackPattern success = HapticFeedbackPattern(
    feedbacks: [
      HapticFeedbackEvent(type: HapticFeedbackType.light),
      HapticFeedbackEvent(
          type: HapticFeedbackType.medium, delay: Duration(milliseconds: 100)),
      HapticFeedbackEvent(
          type: HapticFeedbackType.light, delay: Duration(milliseconds: 100)),
    ],
  );

  /// Error pattern: heavy-heavy
  static const HapticFeedbackPattern error = HapticFeedbackPattern(
    feedbacks: [
      HapticFeedbackEvent(type: HapticFeedbackType.heavy),
      HapticFeedbackEvent(
          type: HapticFeedbackType.heavy, delay: Duration(milliseconds: 150)),
    ],
  );

  /// Completion pattern: medium-light-medium
  static const HapticFeedbackPattern completion = HapticFeedbackPattern(
    feedbacks: [
      HapticFeedbackEvent(type: HapticFeedbackType.medium),
      HapticFeedbackEvent(
          type: HapticFeedbackType.light, delay: Duration(milliseconds: 80)),
      HapticFeedbackEvent(
          type: HapticFeedbackType.medium, delay: Duration(milliseconds: 80)),
    ],
  );

  /// Warning pattern: medium-medium
  static const HapticFeedbackPattern warning = HapticFeedbackPattern(
    feedbacks: [
      HapticFeedbackEvent(type: HapticFeedbackType.medium),
      HapticFeedbackEvent(
          type: HapticFeedbackType.medium, delay: Duration(milliseconds: 200)),
    ],
  );
}
