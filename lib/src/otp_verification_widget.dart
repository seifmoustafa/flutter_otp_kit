import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'masking_type.dart';
import 'otp_input_type.dart';
import 'otp_layout_type.dart';
import 'otp_field_shape.dart';
import 'otp_animation_config.dart';
import 'otp_theme_config.dart';
import 'otp_behavior_config.dart';
import 'otp_field_state.dart';

/// Enum for cursor alignment within OTP fields
enum CursorAlignment {
  left,
  center,
  right,
}

/// A fully generic and reusable OTP verification widget
///
/// This widget provides a complete OTP (One-Time Password) verification interface
/// with customizable styling, localization support, and robust functionality.
///
/// ## Features:
/// - **Configurable field count**: Support for 4, 5, 6, or any number of digits
/// - **Fully localizable**: All text must be provided by caller (no hardcoded strings)
/// - **Smart focus management**: Auto-navigation between fields during input
/// - **Timer functionality**: Countdown timer with customizable duration
/// - **Validation support**: Optional form validation with error handling
/// - **Callback system**: Clean separation of UI and business logic
/// - **Accessibility ready**: Proper focus handling and keyboard navigation
/// - **Customizable styling**: Colors, dimensions, spacing all configurable
///
/// ## Usage Example:
/// ```dart
/// // Phone OTP with automatic masking
/// OtpVerificationWidget(
///   title: 'Verify Phone Number',
///   subtitle: 'Enter the code sent to {contactInfo}',
///   contactInfo: '01012345678',
///   maskingType: MaskingType.phone,
///   buttonText: 'Verify',
///   resendText: 'Resend Code',
///   timerPrefix: 'after',
///   onVerify: (otp) => handleOtpVerification(otp),
///   onResend: () => resendOtpCode(),
/// )
///
/// // Email OTP with automatic masking
/// OtpVerificationWidget(
///   title: 'Verify Email',
///   subtitle: 'Enter the code sent to {contactInfo}',
///   contactInfo: 'user@example.com',
///   maskingType: MaskingType.email,
///   buttonText: 'Verify',
///   resendText: 'Resend Code',
///   timerPrefix: 'after',
///   onVerify: (otp) => handleOtpVerification(otp),
///   onResend: () => resendOtpCode(),
/// )
/// ```
///
/// ## Localization Requirements:
/// All text parameters are required to ensure proper localization.
/// Use your app's localization system to provide text.
/// This prevents hardcoded strings and ensures multi-language support.
///
/// ## Public Methods:
/// - `clearOtp()`: Clears all input fields and refocuses first field
/// - `setOtp(String)`: Pre-fills fields with provided OTP (useful for testing/auto-fill)
class OtpVerificationWidget extends StatefulWidget {
  /// Creates a new OTP verification widget with customizable styling and behavior.
  ///
  /// The [title], [subtitle], [buttonText], [resendText], [timerPrefix],
  /// [onVerify], and [onResend] parameters are required.
  ///
  /// All other parameters have sensible defaults and can be customized as needed.
  const OtpVerificationWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.resendText,
    required this.timerPrefix,
    required this.onVerify,
    required this.onResend,
    this.contactInfo,
    this.maskingType = MaskingType.phone,
    this.fieldCount = 4,
    this.timerDuration = 60,
    this.fieldWidth = 55.125,
    this.fieldHeight = 60.731,
    this.borderRadius = 17.752,
    this.borderWidth = 1.869,
    this.spacing = 16.0,
    this.fieldSpacing = 12.0,
    this.minFieldSpacing = 8.0,
    this.maxFieldSpacing = 20.0,
    this.primaryColor = const Color(0xFF018CC3),
    this.secondaryColor = const Color(0xFF8B8B8B),
    this.backgroundColor = Colors.white,
    this.autoFocus = true,
    this.enableAutoValidation = true,
    this.titleStyle,
    this.subtitleStyle,
    this.buttonStyle,
    this.resendStyle,
    this.timerStyle,
    this.fieldStyle,
    this.buttonWidget,
    this.otpInputType = OtpInputType.numeric,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.onCompleted,
    this.enablePaste = true,
    this.errorText,
    this.errorStyle,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.filledFieldBackgroundColor,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth = 1.0,
    this.cursorAlignment = CursorAlignment.center,
    this.animationDuration = const Duration(milliseconds: 150),
    this.animationCurve = Curves.easeInOut,
    this.enableShadow = false,
    this.shadowColor,
    this.shadowBlurRadius = 10.0,
    this.shadowSpreadRadius = 0.0,
    // New field transition parameters
    this.fieldTransitionDuration = const Duration(milliseconds: 200),
    this.fieldTransitionCurve = Curves.easeInOut,
    this.enableFieldStateAnimation = true,
    this.completedFieldBorderColor,
    this.completedFieldBackgroundColor,
    this.completedFieldTextColor,
    this.enableProgressiveHighlighting = true,
    this.enableFieldToFieldAnimation = true,
    this.fieldToFieldTransitionDuration = const Duration(milliseconds: 150),
    this.fieldToFieldTransitionCurve = Curves.easeInOut,
    this.transitionHighlightColor,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.semanticLabel,
    this.showTimer = true,
    this.customKeyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.enableInteractiveSelection = true,
    // Comprehensive configuration objects
    this.layoutType = OtpLayoutType.singleRow,
    this.fieldAlignment = OtpFieldAlignment.center,
    this.fieldDirection = OtpFieldDirection.horizontal,
    this.fieldShape = OtpFieldShape.roundedRectangle,
    this.fieldShapeConfig,
    this.animationConfig = OtpAnimationConfig.defaultConfig,
    this.themeConfig,
    this.behaviorConfig = const OtpBehaviorConfig(),
    // Advanced layout parameters
    this.gridColumns = 3,
    this.customFieldBuilder,
    this.customLayoutBuilder,
    // Advanced styling parameters
    this.enableGradient = false,
    this.gradientConfig,
    this.enableCustomDecoration = false,
    this.customDecoration,
    // Advanced behavior parameters
    this.enableHapticFeedback = false,
    this.enableSoundFeedback = false,
    this.enableVoiceInput = false,
    this.enableBiometricInput = false,
    this.enableSwipeNavigation = false,
    this.enableKeyboardNavigation = true,
    this.enableAutoSubmit = false,
    this.enableAutoClearOnError = false,
    // Advanced validation parameters
    this.customValidator,
    this.validationRegex,
    this.validationMessage,
    this.enableRealTimeValidation = false,
    // Advanced accessibility parameters
    this.semanticHint,
    this.semanticValue,
    this.enableScreenReaderSupport = true,
    this.customAccessibilityActions,
    // Error state management parameters
    this.hasError = false,
    this.onErrorStateChanged,
    this.errorStateDuration = const Duration(seconds: 3),
    this.autoClearErrorOnInput = true,
    this.autoClearErrorOnResend = true,
    // Widget-based customization parameters
    this.titleWidget,
    this.subtitleWidget,
    this.errorWidget,
    this.verifyButtonWidget,
    this.resendWidget,
    this.timerWidget,
  });

  /// Title text displayed at the top (must be localized)
  /// If [titleWidget] is provided, this will be ignored
  final String title;

  /// Subtitle text displayed below the title (must be localized)
  /// If [subtitleWidget] is provided, this will be ignored
  final String subtitle;

  /// Text for the verify button (must be localized)
  /// If [verifyButtonWidget] is provided, this will be ignored
  final String buttonText;

  /// Text for the resend link (must be localized)
  /// If [resendWidget] is provided, this will be ignored
  final String resendText;

  /// Text prefix for timer (must be localized, e.g., "after" or "بعد")
  /// If [timerWidget] is provided, this will be ignored
  final String timerPrefix;

  /// Contact information to be masked in subtitle (phone/email)
  /// If null, subtitle will be used as-is without masking
  final String? contactInfo;

  /// Type of masking to apply to contact information
  final MaskingType maskingType;

  /// Callback function when verify button is pressed
  /// Returns the complete OTP string
  final Function(String otp) onVerify;

  /// Callback function when resend is pressed
  final VoidCallback onResend;

  /// Number of OTP input fields (default: 5)
  final int fieldCount;

  /// Timer duration in seconds (default: 60)
  final int timerDuration;

  /// Width of each OTP input field
  final double fieldWidth;

  /// Height of each OTP input field
  final double fieldHeight;

  /// Border radius of input fields
  final double borderRadius;

  /// Border width of input fields
  final double borderWidth;

  /// Spacing between elements
  final double spacing;

  /// Spacing between OTP input fields
  final double fieldSpacing;

  /// Minimum spacing between fields (responsive)
  final double minFieldSpacing;

  /// Maximum spacing between fields (responsive)
  final double maxFieldSpacing;

  /// Primary color (title, button, active resend)
  final Color primaryColor;

  /// Secondary color (subtitle, timer, inactive resend)
  final Color secondaryColor;

  /// Background color of input fields
  final Color backgroundColor;

  /// Auto focus first field when widget loads
  final bool autoFocus;

  /// Enable automatic validation
  final bool enableAutoValidation;

  /// Custom title text style
  final TextStyle? titleStyle;

  /// Custom subtitle text style
  final TextStyle? subtitleStyle;

  /// Custom button text style
  final TextStyle? buttonStyle;

  /// Custom resend text style
  final TextStyle? resendStyle;

  /// Custom timer text style
  final TextStyle? timerStyle;

  /// Custom field text style
  final TextStyle? fieldStyle;

  /// Custom button widget (replaces default button)
  final Widget? buttonWidget;

  /// Type of input allowed in OTP fields
  final OtpInputType otpInputType;

  /// Custom input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// Custom validator function
  final String? Function(String?)? validator;

  /// Callback when any field value changes
  final Function(String value)? onChanged;

  /// Callback when all fields are filled
  final Function(String otp)? onCompleted;

  /// Enable paste functionality
  final bool enablePaste;

  /// Error text to display
  final String? errorText;

  /// Custom error text style
  final TextStyle? errorStyle;

  /// Border color when field is focused
  final Color? focusedBorderColor;

  /// Border color when field has error
  final Color? errorBorderColor;

  /// Background color for filled fields
  final Color? filledFieldBackgroundColor;

  /// Cursor color
  final Color? cursorColor;

  /// Cursor height (defaults to fieldHeight - 12 for perfect vertical centering)
  final double? cursorHeight;

  /// Cursor width
  final double cursorWidth;

  /// Cursor alignment within the field
  final CursorAlignment cursorAlignment;

  /// Animation duration for transitions
  final Duration animationDuration;

  /// Animation curve for transitions
  final Curve animationCurve;

  /// Enable shadow for fields
  final bool enableShadow;

  /// Shadow color
  final Color? shadowColor;

  /// Shadow blur radius
  final double shadowBlurRadius;

  /// Shadow spread radius
  final double shadowSpreadRadius;

  /// Field transition duration for state changes
  final Duration fieldTransitionDuration;

  /// Field transition curve for state changes
  final Curve fieldTransitionCurve;

  /// Enable field state animations
  final bool enableFieldStateAnimation;

  /// Border color for completed fields
  final Color? completedFieldBorderColor;

  /// Background color for completed fields
  final Color? completedFieldBackgroundColor;

  /// Text color for completed fields
  final Color? completedFieldTextColor;

  /// Enable progressive highlighting
  final bool enableProgressiveHighlighting;

  /// Enable field-to-field animations
  final bool enableFieldToFieldAnimation;

  /// Field-to-field transition duration
  final Duration fieldToFieldTransitionDuration;

  /// Field-to-field transition curve
  final Curve fieldToFieldTransitionCurve;

  /// Transition highlight color
  final Color? transitionHighlightColor;

  /// Obscure text (for secure OTP)
  final bool obscureText;

  /// Character used for obscuring
  final String obscuringCharacter;

  /// Semantic label for accessibility
  final String? semanticLabel;

  /// Show/hide timer
  final bool showTimer;

  /// Custom keyboard type
  final TextInputType? customKeyboardType;

  /// Text capitalization
  final TextCapitalization textCapitalization;

  /// Enable interactive selection
  final bool enableInteractiveSelection;

  // Comprehensive configuration objects
  /// Layout type for field arrangement
  final OtpLayoutType layoutType;

  /// Field alignment within layout
  final OtpFieldAlignment fieldAlignment;

  /// Field arrangement direction
  final OtpFieldDirection fieldDirection;

  /// Field shape type
  final OtpFieldShape fieldShape;

  /// Custom field shape configuration
  final OtpFieldShapeConfig? fieldShapeConfig;

  /// Animation configuration
  final OtpAnimationConfig animationConfig;

  /// Theme configuration
  final OtpThemeConfig? themeConfig;

  /// Behavior configuration
  final OtpBehaviorConfig behaviorConfig;

  // Advanced layout parameters
  /// Number of columns for grid layout
  final int gridColumns;

  /// Custom field builder function
  final Widget Function(
      BuildContext context,
      int index,
      TextEditingController controller,
      FocusNode focusNode)? customFieldBuilder;

  /// Custom layout builder function
  final Widget Function(BuildContext context, List<Widget> fields)?
      customLayoutBuilder;

  // Advanced styling parameters
  /// Enable gradient background
  final bool enableGradient;

  /// Gradient configuration
  final OtpGradientConfig? gradientConfig;

  /// Enable custom decoration
  final bool enableCustomDecoration;

  /// Custom decoration for fields
  final BoxDecoration? customDecoration;

  // Advanced behavior parameters
  /// Enable haptic feedback
  final bool enableHapticFeedback;

  /// Enable sound feedback
  final bool enableSoundFeedback;

  /// Enable voice input
  final bool enableVoiceInput;

  /// Enable biometric input
  final bool enableBiometricInput;

  /// Enable swipe navigation
  final bool enableSwipeNavigation;

  /// Enable keyboard navigation
  final bool enableKeyboardNavigation;

  /// Enable auto submit when complete
  final bool enableAutoSubmit;

  /// Enable auto clear on error
  final bool enableAutoClearOnError;

  // Advanced validation parameters
  /// Custom validator function
  final String? Function(String?)? customValidator;

  /// Validation regex pattern
  final String? validationRegex;

  /// Custom validation message
  final String? validationMessage;

  /// Enable real-time validation
  final bool enableRealTimeValidation;

  // Advanced accessibility parameters
  /// Semantic hint for accessibility
  final String? semanticHint;

  /// Semantic value for accessibility
  final String? semanticValue;

  /// Enable screen reader support
  final bool enableScreenReaderSupport;

  /// Custom accessibility actions
  final List<Map<String, dynamic>>? customAccessibilityActions;

  // Error state management parameters
  /// External error state - when true, all fields will show error styling
  final bool hasError;

  /// Callback when error state should change (for external state management)
  final VoidCallback? onErrorStateChanged;

  /// Duration to show error state before auto-clearing (if auto-clear is enabled)
  final Duration errorStateDuration;

  /// Automatically clear error state when user starts typing
  final bool autoClearErrorOnInput;

  /// Automatically clear error state when resend is triggered
  final bool autoClearErrorOnResend;

  // Widget-based customization parameters
  /// Custom title widget (replaces [title] text)
  final Widget? titleWidget;

  /// Custom subtitle widget (replaces [subtitle] text)
  final Widget? subtitleWidget;

  /// Custom error message widget (replaces [errorText])
  final Widget? errorWidget;

  /// Custom verify button widget (replaces default button)
  final Widget? verifyButtonWidget;

  /// Custom resend widget (replaces default resend text)
  final Widget? resendWidget;

  /// Custom timer widget (replaces default timer text)
  final Widget? timerWidget;

  @override
  State<OtpVerificationWidget> createState() => OtpVerificationWidgetState();
}

class OtpVerificationWidgetState extends State<OtpVerificationWidget>
    with TickerProviderStateMixin {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  late int _remainingTime;
  Timer? _timer;
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  String? _errorText;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  final List<bool> _fieldHasError = [];
  final List<OtpFieldState> _fieldStates = [];
  final List<AnimationController> _fieldAnimationControllers = [];
  final List<Animation<double>> _fieldScaleAnimations = [];
  final List<Animation<Color?>> _fieldColorAnimations = [];

  // Error state management
  bool _internalErrorState = false;
  Timer? _errorStateTimer;

  /// Initialize all lists with proper field count
  void _initializeLists() {
    _controllers =
        List.generate(widget.fieldCount, (index) => TextEditingController());
    _focusNodes = List.generate(widget.fieldCount, (index) => FocusNode());
    _fieldHasError.clear();
    _fieldHasError.addAll(List.generate(widget.fieldCount, (_) => false));

    // Initialize field states
    _fieldStates.clear();
    _fieldStates
        .addAll(List.generate(widget.fieldCount, (_) => OtpFieldState.empty));

    // Dispose existing animation controllers
    for (var controller in _fieldAnimationControllers) {
      controller.dispose();
    }

    // Initialize field animation controllers
    _fieldAnimationControllers.clear();
    _fieldScaleAnimations.clear();
    _fieldColorAnimations.clear();

    for (int i = 0; i < widget.fieldCount; i++) {
      final controller = AnimationController(
        duration: widget.fieldTransitionDuration,
        vsync: this,
      );
      _fieldAnimationControllers.add(controller);

      _fieldScaleAnimations.add(
        Tween<double>(begin: 1.0, end: 1.05).animate(
          CurvedAnimation(
              parent: controller, curve: widget.fieldTransitionCurve),
        ),
      );

      _fieldColorAnimations.add(
        ColorTween(
          begin: widget.backgroundColor,
          end: widget.transitionHighlightColor ??
              widget.primaryColor.withValues(alpha: 0.3),
        ).animate(
          CurvedAnimation(
              parent: controller, curve: widget.fieldTransitionCurve),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeLists();
    _remainingTime = widget.timerDuration;
    _internalErrorState = widget.hasError;

    // Initialize animations
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _animationController, curve: widget.animationCurve),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
          parent: _animationController, curve: widget.animationCurve),
    );
    _animationController.forward();

    if (widget.showTimer) {
      _startTimer();
    }

    // Add listeners for paste support
    if (widget.enablePaste) {
      for (var focusNode in _focusNodes) {
        focusNode.addListener(() async {
          if (focusNode.hasFocus) {
            final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
            if (clipboardData != null && clipboardData.text != null) {
              final text = clipboardData.text!;
              if (_isValidOtp(text)) {
                setOtp(text);
              }
            }
          }
        });
      }
    }

    if (widget.autoFocus && _focusNodes.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNodes[0].requestFocus();
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _errorStateTimer?.cancel();
    _animationController.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    for (var controller in _fieldAnimationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  void didUpdateWidget(OtpVerificationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Handle field count changes
    if (oldWidget.fieldCount != widget.fieldCount) {
      _initializeLists();
    }

    // Handle timer duration changes
    if (oldWidget.timerDuration != widget.timerDuration) {
      _remainingTime = widget.timerDuration;
      _startTimer();
    }

    // Handle error state changes
    if (oldWidget.hasError != widget.hasError) {
      setState(() {
        _internalErrorState = widget.hasError;
      });

      // Start error state timer if error is true
      if (widget.hasError) {
        _startErrorStateTimer();
      } else {
        _errorStateTimer?.cancel();
      }
    }
  }

  /// Starts the countdown timer for OTP resend functionality
  void _startTimer() {
    _timer?.cancel();
    _remainingTime = widget.timerDuration;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_remainingTime > 0) {
            _remainingTime--;
          } else {
            _timer?.cancel();
          }
        });
      }
    });
  }

  /// Starts the error state timer for auto-clearing error state
  void _startErrorStateTimer() {
    _errorStateTimer?.cancel();
    _errorStateTimer = Timer(widget.errorStateDuration, () {
      if (mounted && _internalErrorState) {
        setState(() {
          _internalErrorState = false;
        });
        widget.onErrorStateChanged?.call();
      }
    });
  }

  /// Clears the internal error state
  void _clearErrorState() {
    if (_internalErrorState) {
      setState(() {
        _internalErrorState = false;
      });
      _errorStateTimer?.cancel();
      widget.onErrorStateChanged?.call();
    }
  }

  /// Updates field state and triggers animations
  void _updateFieldState(int index) {
    if (index >= _fieldStates.length) return;

    final hasError =
        _fieldHasError[index] || _errorText != null || _internalErrorState;
    final isFocused = _focusNodes[index].hasFocus;
    final isFilled = _controllers[index].text.isNotEmpty;
    final isCompleted = isFilled && !hasError && _isOtpComplete();

    OtpFieldState newState;
    if (hasError) {
      newState = OtpFieldState.error;
    } else if (isCompleted) {
      newState = OtpFieldState.completed;
    } else if (isFocused) {
      newState = OtpFieldState.focused;
    } else if (isFilled) {
      newState = OtpFieldState.filled;
    } else {
      newState = OtpFieldState.empty;
    }

    if (_fieldStates[index] != newState) {
      _fieldStates[index] = newState;

      // Trigger field-to-field animation if enabled
      if (widget.enableFieldToFieldAnimation && isFocused) {
        _fieldAnimationControllers[index].forward().then((_) {
          _fieldAnimationControllers[index].reverse();
        });
      }

      // Trigger field state animation if enabled
      if (widget.enableFieldStateAnimation) {
        setState(() {});
      }
    }
  }

  /// Handles digit input changes and manages focus navigation
  void _onDigitChanged(String value, int index) {
    // Auto-clear error when user starts typing
    if (_internalErrorState &&
        widget.autoClearErrorOnInput &&
        value.isNotEmpty) {
      _clearErrorState();
    }

    // Call onChanged callback
    widget.onChanged?.call(_getOtpValue());

    if (value.isNotEmpty) {
      // Update field state
      _updateFieldState(index);

      // Move to next field if not the last one
      if (index < widget.fieldCount - 1) {
        _focusNodes[index + 1].requestFocus();
        // Update next field state
        _updateFieldState(index + 1);
      } else {
        // Last field, remove focus
        _focusNodes[index].unfocus();
      }

      // Check if OTP is complete
      if (_isOtpComplete()) {
        // Mark all fields as completed
        for (int i = 0; i < widget.fieldCount; i++) {
          if (_controllers[i].text.isNotEmpty && !_fieldHasError[i]) {
            _fieldStates[i] = OtpFieldState.completed;
          }
        }
        widget.onCompleted?.call(_getOtpValue());
      }
    } else {
      // Update field state
      _updateFieldState(index);

      // Move to previous field if not the first one
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
        // Update previous field state
        _updateFieldState(index - 1);
      }
    }
  }

  /// Returns the complete OTP value by joining all input field values
  String _getOtpValue() {
    return _controllers.map((controller) => controller.text).join();
  }

  /// Checks if the OTP is complete (all fields filled)
  bool _isOtpComplete() {
    return _getOtpValue().length == widget.fieldCount;
  }

  /// Handles the verify button press
  void _onVerifyPressed() {
    if (widget.enableAutoValidation && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_isOtpComplete()) {
        setState(() => _isLoading = true);
        widget.onVerify(_getOtpValue());
        setState(() => _isLoading = false);
      }
    } else if (!widget.enableAutoValidation) {
      setState(() => _isLoading = true);
      widget.onVerify(_getOtpValue());
      setState(() => _isLoading = false);
    } else {
      setState(() => _autoValidate = AutovalidateMode.always);
    }
  }

  /// Handles the resend OTP button press
  void _onResendPressed() {
    if (_remainingTime == 0) {
      // Auto-clear error on resend
      if (_internalErrorState && widget.autoClearErrorOnResend) {
        _clearErrorState();
      }

      _startTimer();
      widget.onResend();
    }
  }

  /// Formats seconds into MM:SS format for timer display
  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  /// Clears all OTP input fields and optionally refocuses the first field
  void clearOtp() {
    for (var controller in _controllers) {
      controller.clear();
    }

    // Reset all field states
    for (int i = 0; i < _fieldStates.length; i++) {
      _fieldStates[i] = OtpFieldState.empty;
    }

    if (widget.autoFocus && _focusNodes.isNotEmpty) {
      _focusNodes[0].requestFocus();
      _updateFieldState(0);
    }
  }

  /// Pre-fills the OTP input fields with the provided value
  void setOtp(String otp) {
    for (int i = 0; i < widget.fieldCount && i < otp.length; i++) {
      _controllers[i].text = otp[i];
      _updateFieldState(i);
    }
  }

  /// Returns the current OTP value
  String getCurrentOtp() {
    return _getOtpValue();
  }

  /// Masks contact information based on the specified masking type
  String _maskContactInfo(String contactInfo, MaskingType type) {
    switch (type) {
      case MaskingType.phone:
        if (contactInfo.length < 4) return contactInfo;
        final start = contactInfo.substring(0, 3);
        final end = contactInfo.substring(contactInfo.length - 2);
        final masked = '*' * (contactInfo.length - 5);
        return '$start$masked$end';

      case MaskingType.email:
        if (!contactInfo.contains('@')) return contactInfo;
        final parts = contactInfo.split('@');
        if (parts[0].length < 2) return contactInfo;
        final username = parts[0];
        final domain = parts[1];
        final maskedUsername =
            username.substring(0, 2) + '*' * (username.length - 2);
        return '$maskedUsername@$domain';

      case MaskingType.none:
        return contactInfo;
    }
  }

  /// Validates if the given text is a valid OTP
  bool _isValidOtp(String text) {
    if (text.length != widget.fieldCount) return false;

    switch (widget.otpInputType) {
      case OtpInputType.numeric:
        return RegExp(r'^[0-9]+$').hasMatch(text);
      case OtpInputType.alphabetic:
        return RegExp(r'^[a-zA-Z]+$').hasMatch(text);
      case OtpInputType.alphanumeric:
        return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(text);
      case OtpInputType.custom:
        return true; // Custom validation handled by validator
    }
  }

  /// Gets input formatters based on OTP input type
  List<TextInputFormatter> _getInputFormatters() {
    final formatters = <TextInputFormatter>[
      LengthLimitingTextInputFormatter(1),
    ];

    if (widget.inputFormatters != null) {
      formatters.addAll(widget.inputFormatters!);
    } else {
      switch (widget.otpInputType) {
        case OtpInputType.numeric:
          formatters.add(FilteringTextInputFormatter.digitsOnly);
          break;
        case OtpInputType.alphabetic:
          formatters
              .add(FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')));
          break;
        case OtpInputType.alphanumeric:
          formatters
              .add(FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')));
          break;
        case OtpInputType.custom:
          // Use custom formatters if provided
          break;
      }
    }

    return formatters;
  }

  /// Gets keyboard type based on OTP input type
  TextInputType _getKeyboardType() {
    if (widget.customKeyboardType != null) {
      return widget.customKeyboardType!;
    }

    switch (widget.otpInputType) {
      case OtpInputType.numeric:
        return TextInputType.number;
      case OtpInputType.alphabetic:
        return TextInputType.text;
      case OtpInputType.alphanumeric:
        return TextInputType.text;
      case OtpInputType.custom:
        return TextInputType.text;
    }
  }

  /// Gets the appropriate text alignment based on cursor alignment
  TextAlign _getTextAlignForCursorAlignment() {
    switch (widget.cursorAlignment) {
      case CursorAlignment.left:
        return TextAlign.left;
      case CursorAlignment.center:
        return TextAlign.center; // Perfect center alignment for OTP
      case CursorAlignment.right:
        return TextAlign.right;
    }
  }

  /// Calculates responsive field spacing based on screen width and field count with overflow protection
  double _calculateResponsiveSpacing(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = widget.spacing * 2; // Left and right padding
    final totalFieldWidth = widget.fieldWidth * widget.fieldCount;
    final availableWidth = screenWidth - padding - totalFieldWidth;

    // Calculate spacing with very conservative safety margin
    final calculatedSpacing = availableWidth / (widget.fieldCount - 1);

    // Apply very conservative safety margin to prevent overflow (50% buffer)
    final safeSpacing = calculatedSpacing * 0.5;

    // Clamp the spacing between min and max values
    return safeSpacing.clamp(widget.minFieldSpacing, widget.maxFieldSpacing);
  }

  /// Calculates responsive field width to prevent overflow
  double _calculateResponsiveFieldWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = widget.spacing * 2;
    final minSpacing = widget.minFieldSpacing;
    final availableWidth =
        screenWidth - padding - (minSpacing * (widget.fieldCount - 1));
    final maxFieldWidth = availableWidth / widget.fieldCount;

    // Apply very conservative safety margin (40% buffer)
    final safeFieldWidth = maxFieldWidth * 0.6;

    // Use the smaller of configured width or calculated safe width
    return math.min(widget.fieldWidth, safeFieldWidth);
  }

  /// Checks if fields should wrap to next line for better responsiveness
  /// DISABLED: Fields should always stay in a single row for standard OTP appearance
  bool _shouldWrapFields(BuildContext context) {
    // Always return false to keep fields in single row
    return false;
  }

  /// Builds a single OTP field with responsive styling and enhanced animations
  Widget _buildOtpField(int index, double spacing, {double? fieldWidth}) {
    // Add bounds checking to prevent RangeError
    if (index >= _fieldHasError.length ||
        index >= _focusNodes.length ||
        index >= _controllers.length ||
        index >= _fieldStates.length) {
      return Container(
        width: fieldWidth ?? widget.fieldWidth,
        height: widget.fieldHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(color: Colors.grey, width: widget.borderWidth),
        ),
        child: Center(
          child: Text(
            '?',
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ),
      );
    }

    final fieldState = _fieldStates[index];
    final hasError =
        _fieldHasError[index] || _errorText != null || _internalErrorState;
    final responsiveWidth = fieldWidth ?? widget.fieldWidth;

    // Determine colors based on field state
    Color borderColor;
    Color backgroundColor;
    Color textColor = Colors.black87;

    if (fieldState == OtpFieldState.error || hasError) {
      borderColor = widget.errorBorderColor ?? Colors.red;
      backgroundColor = widget.backgroundColor;
    } else if (fieldState == OtpFieldState.completed &&
        widget.enableProgressiveHighlighting) {
      borderColor = widget.completedFieldBorderColor ?? Colors.green;
      backgroundColor =
          widget.completedFieldBackgroundColor ?? widget.backgroundColor;
      textColor = widget.completedFieldTextColor ?? Colors.green;
    } else if (fieldState == OtpFieldState.focused) {
      borderColor = widget.focusedBorderColor ?? widget.primaryColor;
      backgroundColor = widget.backgroundColor;
    } else if (fieldState == OtpFieldState.filled) {
      borderColor = widget.secondaryColor.withValues(alpha: 0.8);
      backgroundColor =
          widget.filledFieldBackgroundColor ?? widget.backgroundColor;
    } else {
      borderColor = widget.secondaryColor.withValues(alpha: 0.8);
      backgroundColor = widget.backgroundColor;
    }

    Widget fieldWidget = AnimatedContainer(
      duration: widget.enableFieldStateAnimation
          ? widget.fieldTransitionDuration
          : Duration.zero,
      curve: widget.fieldTransitionCurve,
      width: responsiveWidth,
      height: widget.fieldHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(
          color: borderColor,
          width: widget.borderWidth,
        ),
        color: backgroundColor,
        boxShadow: widget.enableShadow
            ? [
                BoxShadow(
                  color: widget.shadowColor ??
                      widget.primaryColor.withValues(alpha: 0.2),
                  blurRadius: widget.shadowBlurRadius,
                  spreadRadius: widget.shadowSpreadRadius,
                ),
              ]
            : null,
      ),
      child: Semantics(
        label: 'OTP field ${index + 1} of ${widget.fieldCount}',
        textField: true,
        child: TextFormField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          textAlign: _getTextAlignForCursorAlignment(),
          keyboardType: _getKeyboardType(),
          textCapitalization: widget.textCapitalization,
          inputFormatters: _getInputFormatters(),
          obscureText: widget.obscureText,
          obscuringCharacter: widget.obscuringCharacter,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          cursorColor: widget.cursorColor ?? widget.primaryColor,
          cursorHeight: widget.cursorHeight ?? (widget.fieldHeight - 12),
          cursorWidth: widget.cursorWidth,
          style: widget.fieldStyle ??
              TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
                height: 1.0, // Ensure consistent line height
              ),
          decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              vertical:
                  (widget.fieldHeight - 22) / 2, // Perfect vertical centering
              horizontal: 0,
            ),
            isDense: true, // Reduce internal padding
          ),
          validator: widget.validator ??
              (widget.enableAutoValidation
                  ? (v) => (v == null || v.isEmpty) ? '' : null
                  : null),
          onChanged: (value) => _onDigitChanged(value, index),
        ),
      ),
    );

    // Add field-to-field animation wrapper if enabled
    if (widget.enableFieldToFieldAnimation &&
        index < _fieldAnimationControllers.length) {
      return AnimatedBuilder(
        animation: _fieldAnimationControllers[index],
        builder: (context, child) {
          return Transform.scale(
            scale: _fieldScaleAnimations[index].value,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                color:
                    _fieldColorAnimations[index].value?.withValues(alpha: 0.1),
              ),
              child: fieldWidget,
            ),
          );
        },
      );
    }

    return fieldWidget;
  }

  /// Builds the title widget (custom or default)
  Widget _buildTitle() {
    if (widget.titleWidget != null) {
      return widget.titleWidget!;
    }

    return Semantics(
      label: widget.semanticLabel ?? widget.title,
      header: true,
      child: PlatformText(
        widget.title,
        style: widget.titleStyle ??
            TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: widget.primaryColor,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }

  /// Builds the subtitle widget (custom or default)
  Widget _buildSubtitle() {
    if (widget.subtitleWidget != null) {
      return widget.subtitleWidget!;
    }

    return PlatformText(
      widget.contactInfo != null
          ? widget.subtitle.replaceAll('{contactInfo}',
              _maskContactInfo(widget.contactInfo!, widget.maskingType))
          : widget.subtitle,
      style: widget.subtitleStyle ??
          TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: widget.secondaryColor,
          ),
      textAlign: TextAlign.center,
    );
  }

  /// Builds the error widget (custom or default)
  Widget _buildError() {
    if (widget.errorWidget != null) {
      return widget.errorWidget!;
    }

    if (_errorText != null || widget.errorText != null) {
      return Padding(
        padding: EdgeInsets.only(top: widget.spacing * 0.5),
        child: Text(
          _errorText ?? widget.errorText!,
          style: widget.errorStyle ??
              TextStyle(
                color: widget.errorBorderColor ?? Colors.red,
                fontSize: 12,
              ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  /// Builds the verify button widget (custom or default)
  Widget _buildVerifyButton() {
    if (widget.verifyButtonWidget != null) {
      return widget.verifyButtonWidget!;
    }

    return _buildDefaultButton();
  }

  /// Builds the resend widget (custom or default)
  Widget _buildResend() {
    if (widget.resendWidget != null) {
      return widget.resendWidget!;
    }

    if (!widget.showTimer) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _remainingTime == 0 ? _onResendPressed : null,
          child: PlatformText(
            widget.resendText,
            style: widget.resendStyle ??
                TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _remainingTime == 0
                      ? widget.primaryColor
                      : widget.secondaryColor,
                  decoration: TextDecoration.underline,
                ),
          ),
        ),
        if (_remainingTime > 0) _buildTimer(),
      ],
    );
  }

  /// Builds the timer widget (custom or default)
  Widget _buildTimer() {
    if (widget.timerWidget != null) {
      return widget.timerWidget!;
    }

    if (_remainingTime > 0) {
      return PlatformText(
        ' ${widget.timerPrefix} ${_formatTime(_remainingTime)}',
        style: widget.timerStyle ??
            TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: widget.secondaryColor,
            ),
      );
    }

    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Padding(
              padding: EdgeInsets.all(widget.spacing),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title and subtitle
                  Column(
                    children: [
                      _buildTitle(),
                      SizedBox(height: widget.spacing * 1.25),
                      _buildSubtitle(),
                    ],
                  ),

                  SizedBox(height: widget.spacing * 3),

                  // OTP Input Fields
                  Form(
                    key: _formKey,
                    autovalidateMode: _autoValidate,
                    child: Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.9,
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final responsiveSpacing =
                                  _calculateResponsiveSpacing(context);
                              final responsiveFieldWidth =
                                  _calculateResponsiveFieldWidth(context);
                              final shouldWrap = _shouldWrapFields(context);

                              if (shouldWrap && widget.fieldCount > 4) {
                                // Wrap fields for better responsiveness
                                return Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: responsiveSpacing,
                                  runSpacing: responsiveSpacing * 0.5,
                                  children:
                                      List.generate(widget.fieldCount, (index) {
                                    return SizedBox(
                                      width: responsiveFieldWidth,
                                      child: _buildOtpField(
                                          index, responsiveSpacing,
                                          fieldWidth: responsiveFieldWidth),
                                    );
                                  }),
                                );
                              } else {
                                // Single row layout with overflow protection
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children:
                                      List.generate(widget.fieldCount, (index) {
                                    return Container(
                                      width: responsiveFieldWidth,
                                      margin: EdgeInsets.only(
                                        right: index < widget.fieldCount - 1
                                            ? responsiveSpacing
                                            : 0,
                                      ),
                                      child: _buildOtpField(
                                          index, responsiveSpacing,
                                          fieldWidth: responsiveFieldWidth),
                                    );
                                  }),
                                );
                              }
                            },
                          ),
                        ),
                        _buildError(),
                      ],
                    ),
                  ),

                  SizedBox(height: widget.spacing * 2),

                  // Timer and resend section
                  _buildResend(),
                  SizedBox(height: widget.spacing * 2),

                  // Verify button
                  _buildVerifyButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDefaultButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _onVerifyPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.primaryColor,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: widget.spacing),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
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
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
              ),
      ),
    );
  }
}
