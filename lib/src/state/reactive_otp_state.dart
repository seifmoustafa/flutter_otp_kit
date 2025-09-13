import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A reactive state management system for OTP verification.
///
/// This class uses ValueNotifier for better reactivity and composability,
/// allowing widgets to listen to specific state changes efficiently.
class ReactiveOtpState {
  /// Creates a new reactive OTP state manager.
  ReactiveOtpState({
    required int length,
    String initialValue = '',
    bool hasError = false,
    String? errorText,
    bool isLoading = false,
  }) : _length = length {
    _otpValue = ValueNotifier(initialValue);
    _errorState = ValueNotifier(hasError);
    _errorText = ValueNotifier(errorText);
    _loadingState = ValueNotifier(isLoading);
    _isCompleted = ValueNotifier(_isOtpCompleted());
    _isValid = ValueNotifier(false);

    _initializeFields();

    // Listen for OTP value changes
    _otpValue.addListener(() {
      _isCompleted.value = _isOtpCompleted();
      _updateFieldValues();
    });
  }

  final int _length;
  late final ValueNotifier<String> _otpValue;
  late final ValueNotifier<bool> _errorState;
  late final ValueNotifier<String?> _errorText;
  late final ValueNotifier<bool> _loadingState;
  late final ValueNotifier<bool> _isCompleted;
  late final ValueNotifier<bool> _isValid;
  late final List<ValueNotifier<String>> _fieldValues;
  late final List<FocusNode> _focusNodes;

  /// Initialize the field values and focus nodes
  void _initializeFields() {
    _fieldValues = List.generate(_length, (_) => ValueNotifier(''));
    _focusNodes = List.generate(_length, (_) => FocusNode());
    _updateFieldValues();
  }

  /// Update individual field values based on the current OTP value
  void _updateFieldValues() {
    final value = _otpValue.value;
    for (int i = 0; i < _length; i++) {
      if (i < value.length) {
        _fieldValues[i].value = value[i];
      } else {
        _fieldValues[i].value = '';
      }
    }
  }

  /// Check if the OTP is completed (all digits filled)
  bool _isOtpCompleted() {
    return _otpValue.value.length == _length;
  }

  /// Set a new OTP value
  void setOtpValue(String value) {
    // Truncate if longer than length
    if (value.length > _length) {
      value = value.substring(0, _length);
    }

    _otpValue.value = value;
  }

  /// Set the value for a specific field
  void setFieldValue(int index, String value) {
    if (index < 0 || index >= _length) return;

    // Only accept a single character
    if (value.length > 1) {
      value = value[0];
    }

    // Create a new OTP value with this field updated
    final chars = _otpValue.value.split('');

    // Pad with empty spaces if needed
    while (chars.length <= index) {
      chars.add('');
    }

    chars[index] = value;

    // Create new otp value, filtering out empty chars
    final newOtpValue = chars.join('');
    _otpValue.value = newOtpValue;
  }

  /// Clear the OTP value
  void clear() {
    _otpValue.value = '';
    _errorState.value = false;
    _errorText.value = null;
  }

  /// Set the error state
  void setError(String? errorText) {
    _errorState.value = errorText != null;
    _errorText.value = errorText;
  }

  /// Clear the error state
  void clearError() {
    _errorState.value = false;
    _errorText.value = null;
  }

  /// Set the loading state
  void setLoading(bool isLoading) {
    _loadingState.value = isLoading;
  }

  /// Set whether the OTP is valid
  void setValid(bool isValid) {
    _isValid.value = isValid;
  }

  /// Request focus for a specific field
  void requestFocus(int index) {
    if (index >= 0 && index < _length) {
      _focusNodes[index].requestFocus();
    }
  }

  /// Request focus for the next empty field or the first field
  void requestFocusOnNextEmpty() {
    final value = _otpValue.value;
    if (value.length < _length) {
      requestFocus(value.length);
    } else {
      requestFocus(0);
    }
  }

  /// Focus on previous field
  void focusPreviousField(int currentIndex) {
    if (currentIndex > 0) {
      requestFocus(currentIndex - 1);
    }
  }

  /// Focus on next field
  void focusNextField(int currentIndex) {
    if (currentIndex < _length - 1) {
      requestFocus(currentIndex + 1);
    }
  }

  /// Get the OTP value
  String get otpValue => _otpValue.value;

  /// Get whether the OTP has an error
  bool get hasError => _errorState.value;

  /// Get the error text
  String? get errorText => _errorText.value;

  /// Get whether the OTP is loading
  bool get isLoading => _loadingState.value;

  /// Get whether the OTP is completed
  bool get isCompleted => _isCompleted.value;

  /// Get whether the OTP is valid
  bool get isValid => _isValid.value;

  /// Get the field values
  List<ValueNotifier<String>> get fieldValues => _fieldValues;

  /// Get the focus nodes
  List<FocusNode> get focusNodes => _focusNodes;

  /// Get the OTP length
  int get length => _length;

  /// Get the OTP value notifier for listening
  ValueNotifier<String> get otpValueNotifier => _otpValue;

  /// Get the error state notifier for listening
  ValueNotifier<bool> get errorStateNotifier => _errorState;

  /// Get the error text notifier for listening
  ValueNotifier<String?> get errorTextNotifier => _errorText;

  /// Get the loading state notifier for listening
  ValueNotifier<bool> get loadingStateNotifier => _loadingState;

  /// Get the completed state notifier for listening
  ValueNotifier<bool> get completedStateNotifier => _isCompleted;

  /// Get the valid state notifier for listening
  ValueNotifier<bool> get validStateNotifier => _isValid;

  /// Dispose all resources
  void dispose() {
    _otpValue.dispose();
    _errorState.dispose();
    _errorText.dispose();
    _loadingState.dispose();
    _isCompleted.dispose();
    _isValid.dispose();

    for (final field in _fieldValues) {
      field.dispose();
    }

    for (final focus in _focusNodes) {
      focus.dispose();
    }
  }
}

/// A widget that rebuilds when an OTP state value changes.
///
/// This is similar to ValueListenableBuilder but specifically for OTP states.
class OtpStateBuilder<T> extends StatelessWidget {
  /// Creates a new OTP state builder.
  const OtpStateBuilder({
    Key? key,
    required this.valueListenable,
    required this.builder,
    this.child,
  }) : super(key: key);

  /// The value listenable to listen to.
  final ValueListenable<T> valueListenable;

  /// The builder function to create the widget.
  final Widget Function(BuildContext context, T value, Widget? child) builder;

  /// An optional child that doesn't depend on the value.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T>(
      valueListenable: valueListenable,
      builder: builder,
      child: child,
    );
  }
}

/// A widget that listens to multiple OTP state values.
///
/// This is useful for building widgets that depend on multiple state values.
class MultiOtpStateBuilder extends StatelessWidget {
  /// Creates a new multi-state OTP builder.
  const MultiOtpStateBuilder({
    Key? key,
    required this.builder,
    this.otpValue,
    this.errorState,
    this.errorText,
    this.loadingState,
    this.completedState,
    this.validState,
    this.child,
  }) : super(key: key);

  /// Builder function that receives all the current state values.
  final Widget Function(
    BuildContext context,
    String? otpValue,
    bool? hasError,
    String? errorText,
    bool? isLoading,
    bool? isCompleted,
    bool? isValid,
    Widget? child,
  ) builder;

  /// Value notifier for the OTP value.
  final ValueNotifier<String>? otpValue;

  /// Value notifier for the error state.
  final ValueNotifier<bool>? errorState;

  /// Value notifier for the error text.
  final ValueNotifier<String?>? errorText;

  /// Value notifier for the loading state.
  final ValueNotifier<bool>? loadingState;

  /// Value notifier for the completed state.
  final ValueNotifier<bool>? completedState;

  /// Value notifier for the valid state.
  final ValueNotifier<bool>? validState;

  /// An optional child that doesn't depend on the values.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return _buildNestedListeners(
      0,
      context,
      null,
      null,
      null,
      null,
      null,
      null,
    );
  }

  Widget _buildNestedListeners(
    int depth,
    BuildContext context,
    String? currentOtpValue,
    bool? currentErrorState,
    String? currentErrorText,
    bool? currentLoadingState,
    bool? currentCompletedState,
    bool? currentValidState,
  ) {
    switch (depth) {
      case 0:
        if (otpValue != null) {
          return ValueListenableBuilder<String>(
            valueListenable: otpValue!,
            builder: (context, value, _) {
              return _buildNestedListeners(
                depth + 1,
                context,
                value,
                currentErrorState,
                currentErrorText,
                currentLoadingState,
                currentCompletedState,
                currentValidState,
              );
            },
          );
        }
        return _buildNestedListeners(
          depth + 1,
          context,
          currentOtpValue,
          currentErrorState,
          currentErrorText,
          currentLoadingState,
          currentCompletedState,
          currentValidState,
        );

      case 1:
        if (errorState != null) {
          return ValueListenableBuilder<bool>(
            valueListenable: errorState!,
            builder: (context, value, _) {
              return _buildNestedListeners(
                depth + 1,
                context,
                currentOtpValue,
                value,
                currentErrorText,
                currentLoadingState,
                currentCompletedState,
                currentValidState,
              );
            },
          );
        }
        return _buildNestedListeners(
          depth + 1,
          context,
          currentOtpValue,
          currentErrorState,
          currentErrorText,
          currentLoadingState,
          currentCompletedState,
          currentValidState,
        );

      case 2:
        if (errorText != null) {
          return ValueListenableBuilder<String?>(
            valueListenable: errorText!,
            builder: (context, value, _) {
              return _buildNestedListeners(
                depth + 1,
                context,
                currentOtpValue,
                currentErrorState,
                value,
                currentLoadingState,
                currentCompletedState,
                currentValidState,
              );
            },
          );
        }
        return _buildNestedListeners(
          depth + 1,
          context,
          currentOtpValue,
          currentErrorState,
          currentErrorText,
          currentLoadingState,
          currentCompletedState,
          currentValidState,
        );

      case 3:
        if (loadingState != null) {
          return ValueListenableBuilder<bool>(
            valueListenable: loadingState!,
            builder: (context, value, _) {
              return _buildNestedListeners(
                depth + 1,
                context,
                currentOtpValue,
                currentErrorState,
                currentErrorText,
                value,
                currentCompletedState,
                currentValidState,
              );
            },
          );
        }
        return _buildNestedListeners(
          depth + 1,
          context,
          currentOtpValue,
          currentErrorState,
          currentErrorText,
          currentLoadingState,
          currentCompletedState,
          currentValidState,
        );

      case 4:
        if (completedState != null) {
          return ValueListenableBuilder<bool>(
            valueListenable: completedState!,
            builder: (context, value, _) {
              return _buildNestedListeners(
                depth + 1,
                context,
                currentOtpValue,
                currentErrorState,
                currentErrorText,
                currentLoadingState,
                value,
                currentValidState,
              );
            },
          );
        }
        return _buildNestedListeners(
          depth + 1,
          context,
          currentOtpValue,
          currentErrorState,
          currentErrorText,
          currentLoadingState,
          currentCompletedState,
          currentValidState,
        );

      case 5:
        if (validState != null) {
          return ValueListenableBuilder<bool>(
            valueListenable: validState!,
            builder: (context, value, _) {
              return builder(
                context,
                currentOtpValue,
                currentErrorState,
                currentErrorText,
                currentLoadingState,
                currentCompletedState,
                value,
                child,
              );
            },
          );
        }
        return builder(
          context,
          currentOtpValue,
          currentErrorState,
          currentErrorText,
          currentLoadingState,
          currentCompletedState,
          currentValidState,
          child,
        );

      default:
        return builder(
          context,
          currentOtpValue,
          currentErrorState,
          currentErrorText,
          currentLoadingState,
          currentCompletedState,
          currentValidState,
          child,
        );
    }
  }
}

/// A controller for managing OTP state.
///
/// This class provides a more familiar controller API for managing OTP state.
class OtpController extends ChangeNotifier {
  /// Creates a new OTP controller.
  OtpController({
    required int length,
    String initialValue = '',
    bool hasError = false,
    String? errorText,
    bool isLoading = false,
  }) : _state = ReactiveOtpState(
          length: length,
          initialValue: initialValue,
          hasError: hasError,
          errorText: errorText,
          isLoading: isLoading,
        ) {
    // Listen for state changes and notify listeners
    _state.otpValueNotifier.addListener(notifyListeners);
    _state.errorStateNotifier.addListener(notifyListeners);
    _state.errorTextNotifier.addListener(notifyListeners);
    _state.loadingStateNotifier.addListener(notifyListeners);
    _state.completedStateNotifier.addListener(notifyListeners);
    _state.validStateNotifier.addListener(notifyListeners);
  }

  final ReactiveOtpState _state;

  /// Get the underlying reactive state
  ReactiveOtpState get state => _state;

  /// The current OTP value
  String get value => _state.otpValue;

  /// Set a new OTP value
  set value(String newValue) {
    _state.setOtpValue(newValue);
  }

  /// Whether the OTP has an error
  bool get hasError => _state.hasError;

  /// The error text, if any
  String? get errorText => _state.errorText;

  /// Whether the OTP is loading
  bool get isLoading => _state.isLoading;

  /// Whether the OTP is completed (all digits filled)
  bool get isCompleted => _state.isCompleted;

  /// Whether the OTP is valid
  bool get isValid => _state.isValid;

  /// The OTP length
  int get length => _state.length;

  /// The field values
  List<ValueNotifier<String>> get fieldValues => _state.fieldValues;

  /// The focus nodes
  List<FocusNode> get focusNodes => _state.focusNodes;

  /// Set the value for a specific field
  void setFieldValue(int index, String value) {
    _state.setFieldValue(index, value);
  }

  /// Clear the OTP value
  void clear() {
    _state.clear();
  }

  /// Set the error state
  void setError(String? errorText) {
    _state.setError(errorText);
  }

  /// Clear the error state
  void clearError() {
    _state.clearError();
  }

  /// Set the loading state
  void setLoading(bool isLoading) {
    _state.setLoading(isLoading);
  }

  /// Set whether the OTP is valid
  void setValid(bool isValid) {
    _state.setValid(isValid);
  }

  /// Request focus for a specific field
  void requestFocus(int index) {
    _state.requestFocus(index);
  }

  /// Request focus for the next empty field or the first field
  void requestFocusOnNextEmpty() {
    _state.requestFocusOnNextEmpty();
  }

  @override
  void dispose() {
    _state.otpValueNotifier.removeListener(notifyListeners);
    _state.errorStateNotifier.removeListener(notifyListeners);
    _state.errorTextNotifier.removeListener(notifyListeners);
    _state.loadingStateNotifier.removeListener(notifyListeners);
    _state.completedStateNotifier.removeListener(notifyListeners);
    _state.validStateNotifier.removeListener(notifyListeners);

    _state.dispose();
    super.dispose();
  }
}
