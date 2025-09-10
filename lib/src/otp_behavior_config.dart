/// Behavior configuration for OTP widget
class OtpBehaviorConfig {
  final bool autoFocus;
  final bool enableAutoValidation;
  final bool enablePaste;
  final bool enableInteractiveSelection;
  final bool enableHapticFeedback;
  final bool enableSoundFeedback;
  final bool enableVisualFeedback;
  final bool enableAutoSubmit;
  final bool enableAutoClearOnError;
  final bool enableAutoFocusNext;
  final bool enableAutoFocusPrevious;
  final bool enableKeyboardNavigation;
  final bool enableSwipeNavigation;
  final bool enableVoiceInput;
  final bool enableBiometricInput;

  const OtpBehaviorConfig({
    this.autoFocus = true,
    this.enableAutoValidation = true,
    this.enablePaste = true,
    this.enableInteractiveSelection = true,
    this.enableHapticFeedback = false,
    this.enableSoundFeedback = false,
    this.enableVisualFeedback = true,
    this.enableAutoSubmit = false,
    this.enableAutoClearOnError = false,
    this.enableAutoFocusNext = true,
    this.enableAutoFocusPrevious = true,
    this.enableKeyboardNavigation = true,
    this.enableSwipeNavigation = false,
    this.enableVoiceInput = false,
    this.enableBiometricInput = false,
  });
}
