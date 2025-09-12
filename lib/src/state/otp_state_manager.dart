import 'dart:async';
import 'package:flutter/material.dart';
import 'otp_field_state.dart';
import '../config/otp_error_config.dart';

/// Manages state for the OTP verification widget
class OtpStateManager {
  /// Creates a new OTP state manager
  OtpStateManager({
    required this.fieldCount,
    required this.errorConfig,
    required this.onErrorStateChanged,
    required this.onOtpChanged,
    required this.onOtpCompleted,
  }) {
    _initializeState();
  }

  /// Number of OTP fields
  final int fieldCount;

  /// Configuration for error state
  final OtpErrorConfig errorConfig;

  /// Callback when error state changes
  final VoidCallback? onErrorStateChanged;

  /// Callback when OTP changes
  final ValueChanged<String>? onOtpChanged;

  /// Callback when OTP is completed
  final ValueChanged<String>? onOtpCompleted;

  /// Text controllers for the fields
  late List<TextEditingController> controllers;

  /// Focus nodes for the fields
  late List<FocusNode> focusNodes;

  /// Error state for each field
  late List<bool> fieldHasError;

  /// State of each field
  late List<OtpFieldState> fieldStates;

  /// Whether the widget is in error state
  bool internalErrorState = false;

  /// Timer for auto-clearing error state
  Timer? errorStateTimer;

  /// Form key for validation
  final formKey = GlobalKey<FormState>();

  /// Auto-validate mode for the form
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  /// Error text to display
  String? errorText;

  /// Whether the widget is loading
  bool isLoading = false;

  /// Initializes the state
  void _initializeState() {
    controllers = List.generate(fieldCount, (index) => TextEditingController());
    focusNodes = List.generate(fieldCount, (index) => FocusNode());
    fieldHasError = List.generate(fieldCount, (_) => false);
    fieldStates = List.generate(fieldCount, (_) => OtpFieldState.empty);
  }

  /// Disposes of resources
  void dispose() {
    errorStateTimer?.cancel();
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
  }

  /// Updates the field count
  void updateFieldCount(int newFieldCount) {
    if (fieldCount != newFieldCount) {
      // Dispose of old controllers and focus nodes
      for (var controller in controllers) {
        controller.dispose();
      }
      for (var focusNode in focusNodes) {
        focusNode.dispose();
      }

      // Create new controllers and focus nodes
      controllers = List.generate(newFieldCount, (index) => TextEditingController());
      focusNodes = List.generate(newFieldCount, (index) => FocusNode());
      fieldHasError = List.generate(newFieldCount, (_) => false);
      fieldStates = List.generate(newFieldCount, (_) => OtpFieldState.empty);
    }
  }

  /// Sets the error state
  void setErrorState(bool hasError) {
    if (internalErrorState != hasError) {
      internalErrorState = hasError;

      if (hasError) {
        _startErrorStateTimer();
      } else {
        errorStateTimer?.cancel();
      }

      onErrorStateChanged?.call();
    }
  }

  /// Clears the error state
  void clearErrorState() {
    if (internalErrorState) {
      internalErrorState = false;
      errorStateTimer?.cancel();
      onErrorStateChanged?.call();
    }
  }

  /// Starts the error state timer
  void _startErrorStateTimer() {
    errorStateTimer?.cancel();

    // Only start timer if behavior is timed and duration is greater than 0
    if (errorConfig.errorStateBehavior == ErrorStateBehavior.timed &&
        errorConfig.errorStateDuration.inMilliseconds > 0) {
      errorStateTimer = Timer(errorConfig.errorStateDuration, () {
        internalErrorState = false;
        onErrorStateChanged?.call();
      });
    }
  }

  /// Handles error state clearing based on input behavior
  void handleErrorStateOnInput(String value) {
    if (!internalErrorState) return;

    switch (errorConfig.errorStateBehavior) {
      case ErrorStateBehavior.persistent:
        // Don't auto-clear error state
        break;
      case ErrorStateBehavior.autoClear:
        // Clear based on configuration
        if (errorConfig.autoClearErrorOnInput) {
          // For empty value, only clear if explicitly configured to do so
          // For non-empty value, always clear if autoClearErrorOnInput is true
          if (value.isNotEmpty || errorConfig.autoClearErrorOnInput) {
            clearErrorState();
          }
        }
        break;
      case ErrorStateBehavior.timed:
        // Clear after timer duration (handled by timer)
        break;
    }
  }

  /// Handles error state clearing when OTP is complete
  void handleErrorStateOnComplete() {
    if (!internalErrorState) return;

    if (errorConfig.autoClearErrorOnComplete) {
      clearErrorState();
    }
  }

  /// Handles error state clearing on resend
  void handleErrorStateOnResend() {
    if (!internalErrorState) return;

    if (errorConfig.autoClearErrorOnResend) {
      clearErrorState();
    }
  }

  /// Updates the state of a field
  void updateFieldState(int index, {bool? hasError, bool? isFocused, bool? isFilled, bool? isCompleted}) {
    if (index >= fieldStates.length) return;

    final fieldHasError = this.fieldHasError[index] || errorText != null || internalErrorState;
    final fieldIsFocused = focusNodes[index].hasFocus;
    final fieldIsFilled = controllers[index].text.isNotEmpty;
    final fieldIsCompleted = fieldIsFilled && isOtpComplete();

    // Determine the new state with proper priority
    OtpFieldState newState;

    // Error state has highest priority if configured that way
    if (fieldHasError && errorConfig.errorStatePriority == ErrorStatePriority.highest) {
      newState = OtpFieldState.error;
    }
    // Normal priority handling
    else {
      // Priority order based on configuration
      switch (errorConfig.errorStatePriority) {
        case ErrorStatePriority.highest:
          // Already handled above
          if (fieldIsFocused) {
            newState = OtpFieldState.focused;
          } else if (fieldIsCompleted) {
            newState = OtpFieldState.completed;
          } else if (fieldIsFilled) {
            newState = OtpFieldState.filled;
          } else {
            newState = OtpFieldState.empty;
          }
          break;

        case ErrorStatePriority.normal:
          // Error has same priority as focus
          if (fieldHasError && fieldIsFocused) {
            // When both error and focus, prefer error
            newState = OtpFieldState.error;
          } else if (fieldIsFocused) {
            newState = OtpFieldState.focused;
          } else if (fieldHasError) {
            newState = OtpFieldState.error;
          } else if (fieldIsCompleted) {
            newState = OtpFieldState.completed;
          } else if (fieldIsFilled) {
            newState = OtpFieldState.filled;
          } else {
            newState = OtpFieldState.empty;
          }
          break;

        case ErrorStatePriority.lowest:
          // Focus, completed, and filled all have priority over error
          if (fieldIsFocused) {
            newState = OtpFieldState.focused;
          } else if (fieldIsCompleted) {
            newState = OtpFieldState.completed;
          } else if (fieldIsFilled) {
            newState = OtpFieldState.filled;
          } else if (fieldHasError) {
            newState = OtpFieldState.error;
          } else {
            newState = OtpFieldState.empty;
          }
          break;
      }
    }

    // Update the field state if it has changed
    if (fieldStates[index] != newState) {
      fieldStates[index] = newState;
    }
  }

  /// Handles digit input changes
  void onDigitChanged(String value, int index) {
    // Handle error state clearing based on behavior
    handleErrorStateOnInput(value);

    // Call onChanged callback
    onOtpChanged?.call(getOtpValue());

    if (value.isNotEmpty) {
      // Update field state
      updateFieldState(index);

      // Move to next field if not the last one
      if (index < fieldCount - 1) {
        focusNodes[index + 1].requestFocus();
        // Update next field state
        updateFieldState(index + 1);
      } else {
        // Last field, remove focus
        focusNodes[index].unfocus();
      }

      // Check if OTP is complete
      if (isOtpComplete()) {
        // Handle error state clearing on completion
        handleErrorStateOnComplete();

        // Mark all fields as completed
        for (int i = 0; i < fieldCount; i++) {
          if (controllers[i].text.isNotEmpty && !fieldHasError[i]) {
            fieldStates[i] = OtpFieldState.completed;
          }
        }
        onOtpCompleted?.call(getOtpValue());
      }
    } else {
      // Handle deletion/backspace - field is now empty
      // Explicitly set field state to empty to ensure proper styling
      fieldStates[index] = OtpFieldState.empty;

      // Update field state
      updateFieldState(index);

      // Move to previous field if not the first one
      if (index > 0) {
        focusNodes[index - 1].requestFocus();
        // Update previous field state
        updateFieldState(index - 1);
      } else {
        // This is the first field and it's now empty
        // Ensure it gets proper focus styling
        if (focusNodes[0].hasFocus) {
          fieldStates[0] = OtpFieldState.focused;
        }
      }
    }
  }

  /// Returns the complete OTP value
  String getOtpValue() {
    return controllers.map((controller) => controller.text).join();
  }

  /// Checks if the OTP is complete
  bool isOtpComplete() {
    return getOtpValue().length == fieldCount;
  }

  /// Checks if the OTP is valid
  bool isOtpValid() {
    // Check if OTP is complete
    if (!isOtpComplete()) {
      return false;
    }

    // Check for field errors
    for (int i = 0; i < fieldHasError.length; i++) {
      if (fieldHasError[i]) {
        return false;
      }
    }

    // Check for error text
    if (errorText != null) {
      return false;
    }

    // Check if form validation passes
    if (formKey.currentState != null) {
      return formKey.currentState!.validate();
    }

    return true;
  }

  /// Clears all OTP input fields
  void clearOtp({
    bool refocus = true,
    bool clearError = true,
    bool callOnChanged = true,
  }) {
    // Clear all controllers
    for (var controller in controllers) {
      controller.clear();
    }

    // Remove focus from all fields
    for (var focusNode in focusNodes) {
      if (focusNode.hasFocus) {
        focusNode.unfocus();
      }
    }

    // Reset all field states to empty with proper styling
    for (int i = 0; i < fieldStates.length; i++) {
      fieldStates[i] = OtpFieldState.empty;
      fieldHasError[i] = false;
    }
    
    // Clear error state if requested
    if (clearError && internalErrorState) {
      clearErrorState();
    }

    // Call onChanged callback if requested
    if (callOnChanged) {
      onOtpChanged?.call('');
    }

    // Optionally refocus first field
    if (refocus && focusNodes.isNotEmpty) {
      focusNodes[0].requestFocus();
      updateFieldState(0);
    }
  }

  /// Pre-fills the OTP input fields with the provided value
  void setOtp(String otp, {
    bool clearFocus = true,
    bool clearError = true,
    bool callCallbacks = true,
  }) {
    // Clear any existing values first
    for (var controller in controllers) {
      controller.clear();
    }
    
    // Set new values
    for (int i = 0; i < fieldCount && i < otp.length; i++) {
      controllers[i].text = otp[i];
    }
    
    // Clear focus from all fields if requested
    if (clearFocus) {
      for (var focusNode in focusNodes) {
        if (focusNode.hasFocus) {
          focusNode.unfocus();
        }
      }
    }
    
    // Clear error state if configured to do so and requested
    if (clearError && internalErrorState &&
        errorConfig.autoClearErrorOnComplete &&
        isOtpComplete()) {
      clearErrorState();
    }
    
    // Update all field states
    for (int i = 0; i < fieldCount; i++) {
      updateFieldState(i);
    }
    
    if (callCallbacks) {
      // Call onChanged callback
      onOtpChanged?.call(getOtpValue());
      
      // Call onCompleted callback if OTP is complete
      if (isOtpComplete()) {
        onOtpCompleted?.call(getOtpValue());
      }
    }
  }

  /// Resets all fields to empty state with proper styling
  void resetFields({bool preserveFocus = false, bool preserveError = false}) {
    // Remember which field had focus before clearing
    int? focusedIndex;
    if (preserveFocus) {
      for (int i = 0; i < focusNodes.length; i++) {
        if (focusNodes[i].hasFocus) {
          focusedIndex = i;
          break;
        }
      }
    }
    
    // Clear all field values
    for (var controller in controllers) {
      controller.clear();
    }
    
    // Reset all field states to empty
    for (int i = 0; i < fieldStates.length; i++) {
      fieldStates[i] = OtpFieldState.empty;
    }
    
    // Reset all error flags if not preserving error
    if (!preserveError) {
      for (int i = 0; i < fieldHasError.length; i++) {
        fieldHasError[i] = false;
      }
      
      // Clear any error text
      errorText = null;
      
      // Clear internal error state if configured to do so
      if (errorConfig.autoClearErrorOnInput) {
        clearErrorState();
      }
    }
    
    // Restore focus if needed
    if (preserveFocus && focusedIndex != null) {
      focusNodes[focusedIndex].requestFocus();
    } else if (focusNodes.isNotEmpty) {
      focusNodes[0].requestFocus();
    }
  }
}
