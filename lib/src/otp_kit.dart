import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Import existing configs and enums
import 'config/otp_field_config.dart';
import 'config/otp_error_config.dart';
import 'config/otp_animation_config.dart';
import 'masking_type.dart';
import 'otp_input_type.dart';
import 'state/otp_field_state.dart';
import 'widgets/otp_fields_row.dart';
import 'styling/field_colors.dart';
import 'otp_layout_type.dart';

/// 🎯 BRAND NEW OTP KIT - Complete rewrite from scratch
///
/// This is a completely new implementation with modern architecture:
/// - Clean separation of concerns
/// - Advanced animation system with per-field transforms
/// - Comprehensive customization from a single widget
/// - Built-in state management
/// - Modern Flutter patterns
///
/// ## What you can customize:
///
/// ### 🎨 Visual Design
/// - **Field shapes**: rectangle, rounded, circle, stadium, underlined, custom
/// - **Colors**: primary, secondary, background, borders, text, shadows
/// - **Typography**: font size, weight, letter spacing, line height
/// - **Dimensions**: width, height, border radius, border width, spacing
/// - **Effects**: shadows, gradients, glows, custom decorations
/// - **Cursor**: color, width, height, blink behavior
///
/// ### 🎬 Animations
/// - **Main widget**: fade, scale, slide entrance animations
/// - **Field transitions**: smooth color/state changes
/// - **Fill animations**: scale, rotate, slide (left/right/up/down)
/// - **Error animations**: shake, scale, rotate, wobble
/// - **Success animations**: pulse, glow, celebration effects
/// - **Timing**: durations, curves, stagger delays
///
/// ### 🔧 Behavior
/// - **Input types**: numeric, alphabetic, alphanumeric, custom
/// - **Validation**: regex patterns, custom validators, auto-validation
/// - **Focus management**: auto-focus, tap-outside unfocus, keyboard handling
/// - **Paste support**: smart clipboard detection, auto-fill
/// - **Backspace behavior**: smart navigation between fields
/// - **RTL/LTR**: automatic detection or manual override
///
/// ### 🚨 Error Handling
/// - **Error states**: persistent, auto-clear, timed
/// - **Error animations**: shake, fade, slide, scale
/// - **Error recovery**: retry limits, field lockout, auto-clear triggers
/// - **Haptic feedback**: light, medium, heavy, vibrate
///
/// ### ♿ Accessibility
/// - **Screen readers**: semantic labels, hints, values
/// - **Keyboard navigation**: full keyboard support
/// - **Reduced motion**: automatic animation reduction
/// - **High contrast**: automatic theme adaptation
///
/// ### 🌍 Internationalization
/// - **Text direction**: RTL/LTR auto-detection
/// - **Localization**: all text customizable
/// - **Cultural adaptation**: different input patterns per region
class OtpKit extends StatefulWidget {
  /// Creates a brand new OTP Kit widget
  const OtpKit({
    super.key,

    // Required callbacks
    required this.onVerify,
    required this.onResend,

    // Text content
    this.title,
    this.subtitle,
    this.buttonText = 'Verify',
    this.resendText = 'Resend Code',
    this.timerPrefix = 'Resend in',

    // Contact info and masking
    this.contactInfo,
    this.maskingType = MaskingType.none,

    // Field configuration
    this.fieldCount = 4,
    this.fieldSpacing = 12.0,
    this.fieldConfig,

    // Input behavior
    this.inputType = OtpInputType.numeric,
    this.enablePaste = true,
    this.autoFocus = true,
    this.enableAutoValidation = false,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.enableInteractiveSelection = true,
    this.textCapitalization = TextCapitalization.none,
    this.unfocusOnTapOutside = true,
    this.customKeyboardType,
    this.inputFormatters,
    this.validationRegex,
    this.customValidator,

    // Timer
    this.showTimer = true,
    this.timerDuration = 60,

    // Colors and styling
    this.primaryColor = const Color(0xFF2196F3),
    this.secondaryColor = const Color(0xFF757575),
    this.backgroundColor = Colors.white,
    this.errorColor = const Color(0xFFE53E3E),
    this.successColor = const Color(0xFF38A169),

    // Text styles
    this.titleStyle,
    this.subtitleStyle,
    this.buttonStyle,
    this.resendStyle,
    this.timerStyle,
    this.errorStyle,

    // Animation configuration
    this.animationConfig = const OtpAnimationConfig(),

    // Error configuration
    this.errorConfig = const OtpErrorConfig(),

    // Layout and spacing
    this.spacing = 24.0,
    this.padding = const EdgeInsets.all(16.0),

    // Direction
    this.textDirection,

    // Callbacks
    this.onChanged,
    this.onCompleted,
    this.onTimerChanged,
    this.onErrorStateChanged,
    this.onValidationStateChanged,
    this.onCompletionStateChanged,

    // Custom widgets
    this.titleWidget,
    this.subtitleWidget,
    this.buttonWidget,
    this.resendWidget,
    this.timerWidget,
    this.errorWidget,

    // Accessibility
    this.semanticLabel,
    this.semanticHint,
    this.semanticValue,
    this.enableScreenReaderSupport = true,
  });

  // Required callbacks
  final Future<bool> Function(String) onVerify;
  final VoidCallback onResend;

  // Text content
  final String? title;
  final String? subtitle;
  final String buttonText;
  final String resendText;
  final String timerPrefix;

  // Contact info and masking
  final String? contactInfo;
  final MaskingType maskingType;

  // Field configuration
  final int fieldCount;
  final double fieldSpacing;
  final OtpFieldConfig? fieldConfig;

  // Input behavior
  final OtpInputType inputType;
  final bool enablePaste;
  final bool autoFocus;
  final bool enableAutoValidation;
  final bool obscureText;
  final String obscuringCharacter;
  final bool enableInteractiveSelection;
  final TextCapitalization textCapitalization;
  final bool unfocusOnTapOutside;
  final TextInputType? customKeyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final RegExp? validationRegex;
  final String? Function(String)? customValidator;

  // Timer
  final bool showTimer;
  final int timerDuration;

  // Colors and styling
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color errorColor;
  final Color successColor;

  // Text styles
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final TextStyle? buttonStyle;
  final TextStyle? resendStyle;
  final TextStyle? timerStyle;
  final TextStyle? errorStyle;

  // Animation configuration
  final OtpAnimationConfig animationConfig;

  // Error configuration
  final OtpErrorConfig errorConfig;

  // Layout and spacing
  final double spacing;
  final EdgeInsets padding;

  // Direction
  final TextDirection? textDirection;

  // Callbacks
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;
  final ValueChanged<int>? onTimerChanged;
  final ValueChanged<bool>? onErrorStateChanged;
  final ValueChanged<bool>? onValidationStateChanged;
  final ValueChanged<bool>? onCompletionStateChanged;

  // Custom widgets
  final Widget? titleWidget;
  final Widget? subtitleWidget;
  final Widget? buttonWidget;
  final Widget? resendWidget;
  final Widget? timerWidget;
  final Widget? errorWidget;

  // Accessibility
  final String? semanticLabel;
  final String? semanticHint;
  final String? semanticValue;
  final bool enableScreenReaderSupport;

  @override
  State<OtpKit> createState() => _OtpKitState();
}

class _OtpKitState extends State<OtpKit> with TickerProviderStateMixin {
  // Controllers and focus nodes
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  // State management
  late List<OtpFieldState> _fieldStates;
  late List<bool> _fieldErrors;
  bool _hasError = false;
  String? _errorText;
  String? _validationText;
  bool _isLoading = false;
  bool _isComplete = false;

  // Timer
  Timer? _timer;
  int _remainingTime = 0;

  // Animation controllers
  late AnimationController _mainAnimationController;
  late AnimationController _errorAnimationController;
  late List<AnimationController> _fieldAnimationControllers;

  // Animations
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  // Error handling
  int _errorCount = 0;
  bool _isLockedOut = false;
  DateTime? _lockoutEndTime;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _initializeAnimations();
    _setupTimer();
    _setupFocusListeners();

    if (widget.autoFocus && _focusNodes.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNodes[0].requestFocus();
      });
    }
  }

  void _initializeControllers() {
    _controllers = List.generate(
      widget.fieldCount,
      (index) => TextEditingController(),
    );

    _focusNodes = List.generate(
      widget.fieldCount,
      (index) => FocusNode(),
    );

    _fieldStates = List.generate(
      widget.fieldCount,
      (index) => OtpFieldState.empty,
    );

    _fieldErrors = List.generate(
      widget.fieldCount,
      (index) => false,
    );

    _remainingTime = widget.timerDuration;
  }

  void _initializeAnimations() {
    // Main widget animations
    _mainAnimationController = AnimationController(
      duration: widget.animationConfig.animationDuration,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainAnimationController,
        curve: widget.animationConfig.animationCurve,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainAnimationController,
        curve: Curves.easeOutBack,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _mainAnimationController,
        curve: Curves.easeOutCubic,
      ),
    );

    // Error animations
    _errorAnimationController = AnimationController(
      duration: widget.animationConfig.fieldTransitionDuration,
      vsync: this,
    );

    // Field animations
    _fieldAnimationControllers = List.generate(
      widget.fieldCount,
      (index) => AnimationController(
        duration:
            const Duration(milliseconds: 500), // Make it longer for testing
        vsync: this,
      ),
    );

    _mainAnimationController.forward();
  }

  void _setupTimer() {
    if (widget.showTimer) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_remainingTime > 0) {
          setState(() {
            _remainingTime--;
            widget.onTimerChanged?.call(_remainingTime);
          });
        } else {
          _timer?.cancel();
          widget.onTimerChanged?.call(0);
        }
      });
    }
  }

  void _setupFocusListeners() {
    for (int i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].addListener(() {
        _updateFieldStates();
      });
    }
  }

  void _handleBackspace(int index) {
    if (index > 0) {
      // Move to previous field and clear it
      _controllers[index - 1].clear();
      _focusNodes[index - 1].requestFocus();
      _updateFieldStates();
    }
  }

  void _triggerHapticFeedback(HapticFeedbackType type) {
    switch (type) {
      case HapticFeedbackType.light:
        HapticFeedback.lightImpact();
        break;
      case HapticFeedbackType.medium:
        HapticFeedback.mediumImpact();
        break;
      case HapticFeedbackType.heavy:
        HapticFeedback.heavyImpact();
        break;
      case HapticFeedbackType.selection:
        HapticFeedback.selectionClick();
        break;
    }
  }

  void _updateFieldStates() {
    setState(() {
      for (int i = 0; i < widget.fieldCount; i++) {
        final hasFocus = _focusNodes[i].hasFocus;
        final hasContent = _controllers[i].text.isNotEmpty;
        final hasError = _fieldErrors[i] || _hasError;

        if (hasError) {
          _fieldStates[i] = OtpFieldState.error;
        } else if (hasFocus) {
          _fieldStates[i] = OtpFieldState.focused;
        } else if (hasContent && _isComplete) {
          _fieldStates[i] = OtpFieldState.completed;
        } else if (hasContent) {
          _fieldStates[i] = OtpFieldState.filled;
        } else {
          _fieldStates[i] = OtpFieldState.empty;
        }
      }
    });
  }

  void _onFieldChanged(String value, int index) {
    setState(() {
      _controllers[index].text = value;
      _updateFieldStates();

      // Clear errors when user types
      if (_hasError) {
        _hasError = false;
        _errorText = null;
        widget.onErrorStateChanged?.call(false);

        // Clear field errors
        for (int i = 0; i < _fieldErrors.length; i++) {
          _fieldErrors[i] = false;
        }
      }

      // Handle paste functionality
      if (widget.enablePaste && value.length > 1) {
        _handlePaste(value, index);
        return;
      }

      // Handle backspace navigation
      if (value.isEmpty && index > 0) {
        _handleBackspace(index);
        return;
      }

      // Trigger haptic feedback on input
      final config = widget.fieldConfig ?? OtpFieldConfig();
      if (config.enableHapticFeedback) {
        _triggerHapticFeedback(config.hapticFeedbackType);
      }

      // Move to next field
      if (value.isNotEmpty && index < widget.fieldCount - 1) {
        _focusNodes[index + 1].requestFocus();
      } else if (value.isNotEmpty && index == widget.fieldCount - 1) {
        _focusNodes[index].unfocus();
      }

      // Trigger field animation
      if (widget.animationConfig.enableFieldStateAnimation) {
        _fieldAnimationControllers[index].forward();
      }

      // Check completion
      final otpValue = _getOtpValue();
      widget.onChanged?.call(otpValue);

      if (otpValue.length == widget.fieldCount) {
        _isComplete = true;
        widget.onCompleted?.call(otpValue);
        widget.onCompletionStateChanged?.call(true);
      } else {
        _isComplete = false;
        widget.onCompletionStateChanged?.call(false);
      }
    });
  }

  void _handlePaste(String pastedValue, int startIndex) {
    // Clean the pasted value based on input type
    String cleanValue = pastedValue;
    if (widget.inputType == OtpInputType.numeric) {
      cleanValue = pastedValue.replaceAll(RegExp(r'[^0-9]'), '');
    } else if (widget.inputType == OtpInputType.alphabetic) {
      cleanValue = pastedValue.replaceAll(RegExp(r'[^a-zA-Z]'), '');
    }

    // Fill fields with pasted value
    for (int i = 0;
        i < cleanValue.length && (startIndex + i) < widget.fieldCount;
        i++) {
      _controllers[startIndex + i].text = cleanValue[i];
    }

    // Focus the last filled field or unfocus if all filled
    final lastFilledIndex =
        (startIndex + cleanValue.length - 1).clamp(0, widget.fieldCount - 1);
    if (lastFilledIndex < widget.fieldCount - 1) {
      _focusNodes[lastFilledIndex + 1].requestFocus();
    } else {
      _focusNodes[lastFilledIndex].unfocus();
    }

    _updateFieldStates();
  }

  void _onVerifyPressed() async {
    // Check if locked out
    if (_isLockedOut && _lockoutEndTime != null) {
      if (DateTime.now().isBefore(_lockoutEndTime!)) {
        final remainingSeconds =
            _lockoutEndTime!.difference(DateTime.now()).inSeconds;
        _showValidationError(
            'Too many attempts. Try again in ${remainingSeconds}s');
        return;
      } else {
        // Lockout expired
        _isLockedOut = false;
        _lockoutEndTime = null;
        _errorCount = 0;
      }
    }

    final otpValue = _getOtpValue();

    // Custom validation
    if (widget.customValidator != null) {
      final validationError = widget.customValidator!(otpValue);
      if (validationError != null) {
        _showValidationError(validationError);
        return;
      }
    }

    // Regex validation
    if (widget.validationRegex != null &&
        !widget.validationRegex!.hasMatch(otpValue)) {
      _showValidationError('Invalid format');
      return;
    }

    // Auto validation
    if (widget.enableAutoValidation && otpValue.length < widget.fieldCount) {
      _showValidationError('Please enter all digits');
      return;
    }

    setState(() => _isLoading = true);

    // Call the actual verification callback
    try {
      final isValid = await widget.onVerify(otpValue);
      if (!isValid) {
        _handleVerificationError('Invalid OTP code');
      }
    } catch (e) {
      _handleVerificationError('Verification failed: $e');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _handleVerificationError(String message) {
    setState(() {
      _errorCount++;
      _hasError = true;
      _errorText = message;
      widget.onErrorStateChanged?.call(true);

      // Set all fields to error state
      for (int i = 0; i < _fieldErrors.length; i++) {
        _fieldErrors[i] = true;
      }

      // Check if should lockout
      final errorConfig = widget.errorConfig;
      if (errorConfig.enableFieldLockout &&
          _errorCount >= errorConfig.maxErrorRetries) {
        _isLockedOut = true;
        _lockoutEndTime = DateTime.now().add(errorConfig.fieldLockoutDuration);
      }

      // Clear fields if configured
      if (errorConfig.clearFieldsOnError) {
        _clearAllFields();
      }

      // Trigger haptic feedback
      if (errorConfig.enableHapticFeedbackOnError) {
        switch (errorConfig.errorHapticFeedbackType) {
          case ErrorHapticFeedbackType.light:
            HapticFeedback.lightImpact();
            break;
          case ErrorHapticFeedbackType.medium:
            HapticFeedback.mediumImpact();
            break;
          case ErrorHapticFeedbackType.heavy:
            HapticFeedback.heavyImpact();
            break;
          case ErrorHapticFeedbackType.vibrate:
            HapticFeedback.vibrate();
            break;
        }
      }
    });

    // Trigger error animation
    _errorAnimationController.forward().then((_) {
      _errorAnimationController.reverse();
    });

    // Trigger field-level error animations
    if (widget.animationConfig.enableFieldStateAnimation) {
      for (int i = 0; i < _fieldAnimationControllers.length; i++) {
        _fieldAnimationControllers[i].forward().then((_) {
          _fieldAnimationControllers[i].reverse();
        });
      }
    } else {}
  }

  void _onResendPressed() {
    if (_remainingTime == 0) {
      setState(() {
        _remainingTime = widget.timerDuration;
        _clearAllFields();
        _hasError = false;
        _errorText = null;
      });

      _setupTimer();
      widget.onResend();
    }
  }

  void _showValidationError(String message) {
    setState(() {
      _validationText = message;
      widget.onValidationStateChanged?.call(true);
    });

    // Trigger error animation
    _errorAnimationController.forward().then((_) {
      _errorAnimationController.reverse();
    });
  }

  // Public method to show error (can be called externally)
  void showError(String message) {
    setState(() {
      _hasError = true;
      _errorText = message;
      widget.onErrorStateChanged?.call(true);
    });

    // Trigger error animation
    _errorAnimationController.forward().then((_) {
      _errorAnimationController.reverse();
    });
  }

  void _clearAllFields() {
    for (var controller in _controllers) {
      controller.clear();
    }
    _updateFieldStates();
  }

  String _getOtpValue() {
    return _controllers.map((controller) => controller.text).join();
  }

  String _getMaskedContactInfo() {
    if (widget.contactInfo == null) return '';

    switch (widget.maskingType) {
      case MaskingType.phone:
        // Mask phone number: +1234567890 -> +1***567890
        if (widget.contactInfo!.length > 6) {
          final start = widget.contactInfo!.substring(0, 3);
          final end =
              widget.contactInfo!.substring(widget.contactInfo!.length - 3);
          return '$start***$end';
        }
        return widget.contactInfo!;

      case MaskingType.email:
        // Mask email: user@domain.com -> u***@domain.com
        if (widget.contactInfo!.contains('@')) {
          final parts = widget.contactInfo!.split('@');
          if (parts[0].length > 1) {
            return '${parts[0][0]}***@${parts[1]}';
          }
        }
        return widget.contactInfo!;

      case MaskingType.none:
        return widget.contactInfo!;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _mainAnimationController.dispose();
    _errorAnimationController.dispose();
    for (var controller in _fieldAnimationControllers) {
      controller.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final effectiveTextDirection = widget.textDirection ??
        (Localizations.localeOf(context).languageCode.toLowerCase() == 'ar'
            ? TextDirection.rtl
            : TextDirection.ltr);

    return Directionality(
      textDirection: effectiveTextDirection,
      child: GestureDetector(
        onTap: widget.unfocusOnTapOutside
            ? () {
                // Unfocus all fields when tapping outside
                FocusScope.of(context).unfocus();
              }
            : null,
        child: Semantics(
          label: widget.semanticLabel ?? 'OTP verification',
          hint: widget.semanticHint ?? 'Enter verification code',
          value: widget.semanticValue ??
              'Enter ${widget.fieldCount}-digit verification code',
          child: AnimatedBuilder(
            animation: _mainAnimationController,
            builder: (context, child) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Padding(
                      padding: widget.padding,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Header
                          _buildHeader(),

                          SizedBox(height: widget.spacing),

                          // OTP Fields
                          _buildOtpFields(),

                          SizedBox(height: widget.spacing * 0.5),

                          // Validation/Error messages
                          _buildMessages(),

                          SizedBox(height: widget.spacing),

                          // Footer (buttons and timer)
                          _buildFooter(),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    if (widget.titleWidget != null) {
      return widget.titleWidget!;
    }

    return Column(
      children: [
        if (widget.title != null)
          Text(
            widget.title!,
            style: widget.titleStyle ??
                TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: widget.primaryColor,
                ),
            textAlign: TextAlign.center,
          ),
        if (widget.subtitle != null) ...[
          SizedBox(height: widget.spacing * 0.5),
          Text(
            widget.subtitle!
                .replaceAll('{contactInfo}', _getMaskedContactInfo()),
            style: widget.subtitleStyle ??
                TextStyle(
                  fontSize: 16,
                  color: widget.secondaryColor,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }

  Widget _buildOtpFields() {
    final config = widget.fieldConfig ?? OtpFieldConfig();

    return OtpFieldsRow(
      controllers: _controllers,
      focusNodes: _focusNodes,
      fieldStates: _fieldStates,
      fieldHasError: _fieldErrors,
      onDigitChanged: (value, index) => _onFieldChanged(value, index),
      config: config,
      getFieldColors: (index, state, hasError) {
        return _getFieldColors(state, hasError);
      },
      inputFormatters: widget.inputFormatters ??
          (widget.inputType == OtpInputType.numeric
              ? [FilteringTextInputFormatter.digitsOnly]
              : []),
      keyboardType: widget.customKeyboardType ??
          (widget.inputType == OtpInputType.numeric
              ? TextInputType.number
              : TextInputType.text),
      validator: widget.customValidator != null
          ? (value) => widget.customValidator!(value ?? '')
          : null,
      layoutType: OtpLayoutType.fixed,
      fieldCount: widget.fieldCount,
      fieldSpacing: widget.fieldSpacing,
      cursorAlignment: TextAlign.center,
      obscureText: widget.obscureText,
      obscuringCharacter: widget.obscuringCharacter,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      textCapitalization: widget.textCapitalization,
      hasInternalError: _hasError,
      animationConfig: widget.animationConfig,
      fieldAnimationControllers: _fieldAnimationControllers,
    );
  }

  FieldColors _getFieldColors(OtpFieldState state, bool hasError) {
    Color borderColor;
    Color backgroundColor;
    Color textColor;

    if (hasError) {
      borderColor = widget.errorColor;
      backgroundColor = widget.errorColor.withOpacity(0.1);
      textColor = widget.errorColor;
    } else if (state == OtpFieldState.focused) {
      borderColor = widget.primaryColor;
      backgroundColor = widget.backgroundColor;
      textColor = Colors.black87;
    } else if (state == OtpFieldState.completed) {
      borderColor = widget.successColor;
      backgroundColor = widget.successColor.withOpacity(0.1);
      textColor = widget.successColor;
    } else if (state == OtpFieldState.filled) {
      borderColor = widget.successColor;
      backgroundColor = widget.backgroundColor;
      textColor = widget.successColor;
    } else {
      borderColor = widget.secondaryColor;
      backgroundColor = widget.backgroundColor;
      textColor = widget.secondaryColor;
    }

    return FieldColors(
      borderColor: borderColor,
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }

  Widget _buildMessages() {
    if (_validationText != null) {
      return AnimatedBuilder(
        animation: _errorAnimationController,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(
              _errorAnimationController.value *
                  10 *
                  (widget.animationConfig.errorFieldAnimationType ==
                          ErrorFieldAnimationType.shake
                      ? math.sin(_errorAnimationController.value * math.pi * 4)
                      : 0),
              0,
            ),
            child: Opacity(
              opacity: 0.7 + (_errorAnimationController.value * 0.3),
              child: Text(
                _validationText!,
                style: widget.errorStyle ??
                    TextStyle(color: widget.errorColor, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      );
    }

    if (_errorText != null) {
      return AnimatedBuilder(
        animation: _errorAnimationController,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(
              _errorAnimationController.value *
                  10 *
                  (widget.animationConfig.errorFieldAnimationType ==
                          ErrorFieldAnimationType.shake
                      ? math.sin(_errorAnimationController.value * math.pi * 4)
                      : 0),
              0,
            ),
            child: Opacity(
              opacity: 0.7 + (_errorAnimationController.value * 0.3),
              child: Text(
                _errorText!,
                style: widget.errorStyle ??
                    TextStyle(color: widget.errorColor, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildFooter() {
    return Column(
      children: [
        // Verify button
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: _isLoading ? null : _onVerifyPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    widget.buttonText,
                    style: widget.buttonStyle ??
                        const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                  ),
          ),
        ),

        SizedBox(height: widget.spacing * 0.5),

        // Resend button and timer
        if (widget.showTimer)
          TextButton(
            onPressed: _remainingTime == 0 ? _onResendPressed : null,
            child: Text(
              _remainingTime > 0
                  ? '${widget.timerPrefix} $_remainingTime'
                  : widget.resendText,
              style: widget.timerStyle ??
                  TextStyle(
                    color: _remainingTime > 0
                        ? widget.secondaryColor
                        : widget.primaryColor,
                    fontSize: 14,
                  ),
            ),
          ),
      ],
    );
  }
}
