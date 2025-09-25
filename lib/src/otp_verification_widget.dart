import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/otp_error_display.dart';
import 'widgets/otp_validation_display.dart';
import 'widgets/otp_fields_row.dart';
import 'widgets/otp_footer.dart';
import 'widgets/otp_header.dart';
import 'config/otp_error_config.dart';
import 'config/otp_field_config.dart';
import 'config/otp_animation_config.dart';
import 'otp_field_shape.dart';
import 'masking_type.dart';
import 'otp_input_type.dart';
import 'otp_layout_type.dart';
import 'state/otp_field_state.dart';
import 'state/otp_state_manager.dart';
import 'styling/otp_style_manager.dart';
import 'utils/otp_formatter.dart';
import 'utils/otp_validator.dart';

/// 🎯 EASY-TO-USE OTP VERIFICATION WIDGET
///
/// This widget handles EVERYTHING automatically:
/// ✅ Shows validation messages when OTP is incomplete
/// ✅ Turns borders RED when validation/error occurs
/// ✅ Clears validation when user types
/// ✅ Handles RTL/LTR automatically
/// ✅ Manages all states (loading, error, validation)
///
/// 🚀 SUPER SIMPLE USAGE:
/// ```dart
/// OtpVerificationWidget(
///   title: 'Verify Phone',
///   onVerify: (otp) => handleVerification(otp),
///   onResend: () => resendCode(),
/// )
/// ```
///
/// 🎨 CUSTOMIZATION OPTIONS:
/// - enableAutoValidation: true (shows validation automatically)
/// - validationMessage: Custom widget (beautiful Arabic/English messages)
/// - errorBorderColor: Colors.red (red borders for validation/errors)
/// - textDirection: TextDirection.rtl (for Arabic apps)
/// - fieldConfig: Complete field configuration for advanced styling
///
/// ## Features:
/// - **Customizable appearance**: Colors, dimensions, spacing all configurable
/// - **Flexible field count**: Support for any number of OTP fields
/// - **Multiple input types**: Numeric, alphabetic, alphanumeric, or custom
/// - **Automatic masking**: Phone and email masking for privacy
/// - **Resend functionality**: Built-in resend button with countdown timer
/// - **Validation support**: Custom validation or built-in patterns
/// - **Loading states**: Built-in loading indicator for verification
/// - **Error handling**: Display error messages and error styling
/// - **Animations**: Smooth animations for better UX
/// - **Accessibility ready**: Proper focus handling and keyboard navigation
///
/// ## Usage Examples:
///
/// ### Basic Usage:
/// ```dart
/// OtpVerificationWidget(
///   title: 'Verify Phone Number',
///   subtitle: 'Enter the code sent to {contactInfo}',
///   contactInfo: '01012345678',
///   maskingType: MaskingType.phone,
///   onVerify: (otp) => handleOtpVerification(otp),
///   onResend: () => resendOtpCode(),
/// )
/// ```
///
/// ### Advanced Custom Field Configuration:
/// ```dart
/// OtpVerificationWidget(
///   title: 'Custom Styled OTP',
///   subtitle: 'Enter the verification code',
///   fieldConfig: OtpFieldConfig(
///     // Field dimensions
///     fieldWidth: 60,
///     fieldHeight: 70,
///     borderRadius: 12,
///     borderWidth: 3,
///
///     // Field shape and styling
///     fieldShape: OtpFieldShape.custom,
///     fieldShapeConfig: OtpFieldShapeConfig(
///       borderStyle: OtpBorderStyle.dashed,
///       dashPattern: [8, 4],
///     ),
///
///     // Colors
///     primaryColor: Colors.purple,
///     backgroundColor: Colors.purple.shade50,
///
///     // Effects
///     enableShadow: true,
///     shadowColor: Colors.purple.withOpacity(0.3),
///     focusEffect: FocusEffect.glow,
///     completedEffect: CompletedEffect.fillAndBorder,
///
///     // Typography
///     fieldFontSize: 28,
///     fieldFontWeight: FontWeight.bold,
///   ),
///   onVerify: (otp) => handleOtpVerification(otp),
///   onResend: () => resendOtpCode(),
/// )
/// ```
///
/// ## Localization Requirements:
/// All text parameters are required to ensure proper localization.
/// Use your app's localization system to provide text.
/// This prevents hardcoded strings and ensures multi-language support.
class OtpVerificationWidget extends StatefulWidget {
  /// Creates a new OTP verification widget with customizable styling and behavior.
  ///
  /// Only [onVerify] and [onResend] parameters are required. All text parameters
  /// ([title], [subtitle], [buttonText], [resendText], [timerPrefix]) are optional
  /// with sensible defaults. You can use custom widgets instead for complete customization.
  ///
  /// All other parameters have sensible defaults and can be customized as needed.
  const OtpVerificationWidget({
    super.key,
    this.title,
    this.subtitle,
    this.buttonText,
    this.resendText,
    this.timerPrefix,
    required this.onVerify,
    required this.onResend,
    this.onTimerChanged,
    this.onErrorStateChangedCallback,
    this.onValidationStateChanged,
    this.onCompletionStateChanged,
    this.contactInfo,
    this.maskingType = MaskingType.none,
    this.fieldCount = 4,
    this.fieldSpacing = 10.0,
    this.spacing = 16.0,
    this.fieldWidth = 55.125,
    this.fieldHeight = 60.731,
    this.borderRadius = 17.752,
    this.borderWidth = 1.869,
    this.fieldShape = OtpFieldShape.roundedRectangle,
    this.fieldConfig,
    this.otpInputType = OtpInputType.numeric,
    this.layoutType = OtpLayoutType.fixed,
    this.cursorAlignment = TextAlign.center,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.enableInteractiveSelection = true,
    this.textCapitalization = TextCapitalization.none,
    this.autoFocus = true,
    this.enableAutoValidation =
        false, // 🎯 AUTO-VALIDATION: Shows validation message when OTP incomplete
    this.enablePaste = true,
    this.unfocusOnTapOutside =
        true, // 🎯 TAP OUTSIDE UNFOCUS: Unfocus fields when tapping outside (works globally)
    this.externalTapOutsideHandler, // 🎯 EXTERNAL HANDLER: Developer can handle tap outside from screen level
    this.showTimer = true,
    this.timerDuration = 60,
    this.primaryColor = const Color(0xFF018CC3),
    this.secondaryColor = const Color(0xFF8B8B8B),
    this.backgroundColor = Colors.white,
    this.defaultBorderColor,
    this.focusedBorderColor,
    this.completedFieldBorderColor,
    this.completedFieldBackgroundColor,
    this.completedFieldTextColor,
    this.filledFieldBackgroundColor,
    this.enableProgressiveHighlighting = false,
    this.titleStyle,
    this.subtitleStyle,
    this.errorStyle,
    this.buttonStyle,
    this.resendStyle,
    this.timerStyle,
    this.validator,
    this.onChanged,
    this.onCompleted,
    this.errorText,
    this.buttonBackgroundColor,
    this.buttonTextColor,
    this.buttonBorderRadius = 8.0,
    this.buttonHeight = 50.0,
    this.buttonWidth = double.infinity,
    this.buttonElevation = 0.0,
    this.loadingIndicatorColor,
    this.loadingIndicatorSize = 24.0,
    this.customKeyboardType,
    this.inputFormatters,
    this.validationRegex,
    this.customValidator,
    this.semanticLabel,
    this.semanticHint,
    this.semanticValue,
    this.enableScreenReaderSupport = true,
    this.customAccessibilityActions,
    this.enableAnimation = true,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.enableFieldStateAnimation = true,
    this.enableFieldToFieldAnimation = true,
    this.fieldTransitionDuration = const Duration(milliseconds: 150),
    this.fieldTransitionCurve = Curves.easeInOut,
    this.transitionHighlightColor,
    this.errorBorderColor,
    this.errorBackgroundColor,
    this.errorTextColor,
    this.hasError = false,
    this.errorStateDuration = const Duration(seconds: 3),
    this.autoClearErrorOnInput = false,
    this.autoClearErrorOnResend = true,
    this.autoClearErrorOnComplete = true,
    this.errorStatePriority = ErrorStatePriority.highest,
    this.errorStateBehavior = ErrorStateBehavior.autoClear,
    this.titleWidget,
    this.subtitleWidget,
    this.errorWidget,
    this.verifyButtonWidget,
    this.resendWidget,
    this.timerWidget,
    this.validationMessage, // 🎨 CUSTOM VALIDATION MESSAGE: Beautiful Arabic/English validation widget
    this.textDirection, // 🌍 TEXT DIRECTION: null=auto-detect, TextDirection.rtl=Arabic, TextDirection.ltr=English
  });

  // Required parameters
  /// Title text for the verification screen (optional - can use titleWidget instead)
  final String? title;

  /// Subtitle text with optional {contactInfo} placeholder (optional - can use subtitleWidget instead)
  final String? subtitle;

  /// Text for the verify button (optional - defaults to "Verify")
  final String? buttonText;

  /// Text for the resend button (optional - defaults to "Resend Code")
  final String? resendText;

  /// Prefix for the timer text (optional - defaults to "Resend in")
  final String? timerPrefix;

  /// Callback when verify button is pressed with OTP value
  final Function(String) onVerify;

  /// Callback when resend button is pressed
  final VoidCallback onResend;

  /// Callback when timer state changes (for custom widgets)
  final ValueChanged<int>? onTimerChanged;

  /// Callback when error state changes (for custom widgets)
  final ValueChanged<bool>? onErrorStateChangedCallback;

  /// Callback when validation state changes (for custom widgets)
  final ValueChanged<bool>? onValidationStateChanged;

  /// Callback when OTP completion state changes (for custom widgets)
  final ValueChanged<bool>? onCompletionStateChanged;

  // Optional parameters
  /// Contact information to display in subtitle (masked based on maskingType)
  final String? contactInfo;

  /// Type of masking to apply to contact information
  final MaskingType maskingType;

  /// Number of OTP input fields
  final int fieldCount;

  /// Spacing between OTP fields
  final double fieldSpacing;

  /// General spacing for the widget
  final double spacing;

  /// Width of each OTP field
  final double fieldWidth;

  /// Height of each OTP field
  final double fieldHeight;

  /// Border radius for OTP fields
  final double borderRadius;

  /// Border width for OTP fields
  final double borderWidth;

  /// Shape of OTP fields (rectangle, roundedRectangle, circle, stadium, underlined, outlined, custom)
  final OtpFieldShape fieldShape;

  /// Complete field configuration (overrides individual field parameters if provided)
  ///
  /// Use this parameter to have complete control over field styling:
  /// ```dart
  /// OtpVerificationWidget(
  ///   fieldConfig: OtpFieldConfig(
  ///     fieldWidth: 50,
  ///     fieldHeight: 60,
  ///     borderRadius: 8,
  ///     borderWidth: 2,
  ///     fieldShape: OtpFieldShape.custom,
  ///     fieldShapeConfig: OtpFieldShapeConfig(
  ///       borderStyle: OtpBorderStyle.dashed,
  ///       dashPattern: [5, 3],
  ///     ),
  ///     primaryColor: Colors.blue,
  ///     backgroundColor: Colors.grey.shade100,
  ///     enableShadow: true,
  ///     shadowColor: Colors.blue.withOpacity(0.3),
  ///     focusEffect: FocusEffect.glow,
  ///     completedEffect: CompletedEffect.fillAndBorder,
  ///   ),
  ///   onVerify: (otp) => handleVerification(otp),
  ///   onResend: () => resendCode(),
  /// )
  /// ```
  final OtpFieldConfig? fieldConfig;

  /// Type of OTP input (numeric, alphabetic, alphanumeric, custom)
  final OtpInputType otpInputType;

  /// Layout type for OTP fields (fixed, responsive)
  final OtpLayoutType layoutType;

  /// Alignment of cursor within OTP fields
  final TextAlign cursorAlignment;

  /// Whether to obscure OTP input (for secure codes)
  final bool obscureText;

  /// Character to use for obscuring text
  final String obscuringCharacter;

  /// Whether to enable text selection in OTP fields
  final bool enableInteractiveSelection;

  /// Text capitalization for OTP fields
  final TextCapitalization textCapitalization;

  /// Whether to auto-focus the first OTP field
  final bool autoFocus;

  /// 🎯 AUTO-VALIDATION: Shows validation message when OTP is incomplete
  ///
  /// When true:
  /// ✅ Shows "Please enter all digits" when user clicks Verify with incomplete OTP
  /// ✅ Turns field borders RED when validation is triggered
  /// ✅ Clears validation message when user starts typing
  /// ✅ Reappears when validation is triggered again
  final bool enableAutoValidation;

  /// Whether to enable paste functionality
  final bool enablePaste;

  /// 🎯 TAP OUTSIDE UNFOCUS: Unfocus fields and close keyboard when tapping outside OTP fields
  ///
  /// When true:
  /// ✅ Tapping outside OTP fields unfocuses all fields
  /// ✅ Tapping anywhere on the entire screen (app bar, empty space, other UI) unfocuses fields
  /// ✅ Keyboard automatically closes when tapping outside
  /// ✅ Works globally across the entire screen, not just within the OTP widget
  /// ✅ Automatically handled by the package - no manual implementation needed
  /// ✅ Improves UX by allowing users to dismiss keyboard easily
  /// ✅ Works with both touch and mouse interactions
  final bool unfocusOnTapOutside;

  /// 🎯 EXTERNAL TAP OUTSIDE HANDLER: Allow developer to handle tap outside unfocus from screen level
  ///
  /// When provided:
  /// ✅ Developer handles tap outside unfocus from their screen/widget level
  /// ✅ Takes PRIORITY over package's built-in unfocusOnTapOutside handling
  /// ✅ Package wraps with GestureDetector but calls your external handler
  /// ✅ Package provides unfocusAllFields() method for external use
  /// ✅ If both unfocusOnTapOutside=true AND externalHandler provided, externalHandler wins
  ///
  /// Note: For TRUE global screen-level handling, implement GestureDetector at screen level:
  /// ```dart
  /// GestureDetector(
  ///   onTap: () => otpKey.currentState?.unfocusAllFields(),
  ///   child: Scaffold(
  ///     body: OtpVerificationWidget(
  ///       externalTapOutsideHandler: () {
  ///         otpKey.currentState?.unfocusAllFields();
  ///       },
  ///     ),
  ///   ),
  /// )
  /// ```
  final VoidCallback? externalTapOutsideHandler;

  /// Whether to show the resend timer
  final bool showTimer;

  /// Duration for the resend timer in seconds
  final int timerDuration;

  /// Primary color for the widget
  final Color primaryColor;

  /// Secondary color for the widget
  final Color secondaryColor;

  /// Background color for OTP fields
  final Color backgroundColor;

  /// Default border color for empty/unfocused fields
  final Color? defaultBorderColor;

  /// Border color for focused OTP fields
  final Color? focusedBorderColor;

  /// Border color for completed OTP fields
  final Color? completedFieldBorderColor;

  /// Background color for completed OTP fields
  final Color? completedFieldBackgroundColor;

  /// Text color for completed OTP fields
  final Color? completedFieldTextColor;

  /// Background color for filled OTP fields
  final Color? filledFieldBackgroundColor;

  /// Whether to enable progressive highlighting of completed fields
  final bool enableProgressiveHighlighting;

  /// Style for title text
  final TextStyle? titleStyle;

  /// Style for subtitle text
  final TextStyle? subtitleStyle;

  /// Style for error text
  final TextStyle? errorStyle;

  /// Style for button text
  final TextStyle? buttonStyle;

  /// Style for resend text
  final TextStyle? resendStyle;

  /// Style for timer text
  final TextStyle? timerStyle;

  /// Validator function for OTP input
  final FormFieldValidator<String>? validator;

  /// Callback when OTP value changes
  final ValueChanged<String>? onChanged;

  /// Callback when OTP input is completed
  final ValueChanged<String>? onCompleted;

  /// Error text to display
  final String? errorText;

  /// Background color for the verify button
  final Color? buttonBackgroundColor;

  /// Text color for the verify button
  final Color? buttonTextColor;

  /// Border radius for the verify button
  final double buttonBorderRadius;

  /// Height for the verify button
  final double buttonHeight;

  /// Width for the verify button
  final double buttonWidth;

  /// Elevation for the verify button
  final double buttonElevation;

  /// Color for the loading indicator
  final Color? loadingIndicatorColor;

  /// Size for the loading indicator
  final double loadingIndicatorSize;

  /// Custom keyboard type for OTP input
  final TextInputType? customKeyboardType;

  /// Custom input formatters for OTP input
  final List<TextInputFormatter>? inputFormatters;

  /// Validation regex pattern for OTP input
  final String? validationRegex;

  /// Custom validator function for OTP input
  final String? Function(String?)? customValidator;

  /// Semantic label for accessibility
  final String? semanticLabel;

  /// Semantic hint for accessibility
  final String? semanticHint;

  /// Semantic value for accessibility
  final String? semanticValue;

  /// Whether to enable screen reader support
  final bool enableScreenReaderSupport;

  /// Custom accessibility actions
  final List<Map<String, dynamic>>? customAccessibilityActions;

  /// Whether to enable animations
  final bool enableAnimation;

  /// Duration for the main animation
  final Duration animationDuration;

  /// Curve for the main animation
  final Curve animationCurve;

  /// Whether to enable field state animation
  final bool enableFieldStateAnimation;

  /// Whether to enable field-to-field animation
  final bool enableFieldToFieldAnimation;

  /// Duration for field transition animation
  final Duration fieldTransitionDuration;

  /// Curve for field transition animation
  final Curve fieldTransitionCurve;

  /// Color for transition highlight
  final Color? transitionHighlightColor;

  /// Border color for fields in error state
  final Color? errorBorderColor;

  /// Background color for fields in error state
  final Color? errorBackgroundColor;

  /// Text color for fields in error state
  final Color? errorTextColor;

  /// Whether the OTP is in error state
  final bool hasError;

  /// Duration to show error state before auto-clearing
  final Duration errorStateDuration;

  /// Whether to auto-clear error state on input
  final bool autoClearErrorOnInput;

  /// Whether to auto-clear error state on resend
  final bool autoClearErrorOnResend;

  /// Whether to auto-clear error state on completion
  final bool autoClearErrorOnComplete;

  /// Priority of error state over other field states
  final ErrorStatePriority errorStatePriority;

  /// Behavior of error state (persistent, auto-clear, timed)
  final ErrorStateBehavior errorStateBehavior;

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

  /// Custom validation message widget
  final Widget? validationMessage;

  /// 🌍 TEXT DIRECTION: Controls RTL/LTR layout
  ///
  /// Options:
  /// - null: Auto-detect from app locale (Arabic=RTL, English=LTR)
  /// - TextDirection.rtl: Force RTL (Arabic, Hebrew, Persian)
  /// - TextDirection.ltr: Force LTR (English, French, Spanish)
  ///
  /// Auto-detects these RTL languages: Arabic, Hebrew, Persian, Urdu, Kurdish
  final TextDirection? textDirection;

  @override
  State<OtpVerificationWidget> createState() => OtpVerificationWidgetState();
}

class OtpVerificationWidgetState extends State<OtpVerificationWidget>
    with TickerProviderStateMixin {
  late OtpStateManager _stateManager;
  late OtpStyleManager _styleManager;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  Timer? _timer;
  int _remainingTime = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    // Create the OTP configuration
    final errorConfig = OtpErrorConfig(
      hasError: widget.hasError,
      errorStateDuration: widget.errorStateDuration,
      autoClearErrorOnInput: widget.autoClearErrorOnInput,
      autoClearErrorOnResend: widget.autoClearErrorOnResend,
      autoClearErrorOnComplete: widget.autoClearErrorOnComplete,
      errorStatePriority: widget.errorStatePriority,
      errorStateBehavior: widget.errorStateBehavior,
      errorBorderColor: widget.errorBorderColor,
      errorBackgroundColor: widget.errorBackgroundColor,
      errorTextColor: widget.errorTextColor,
      errorText: widget.errorText,
      errorStyle: widget.errorStyle,
    );

    // Create field configuration - use custom fieldConfig if provided, otherwise create from individual parameters
    final fieldConfig = widget.fieldConfig ??
        OtpFieldConfig(
          fieldWidth: widget.fieldWidth,
          fieldHeight: widget.fieldHeight,
          borderRadius: widget.borderRadius,
          borderWidth: widget.borderWidth,
          fieldShape: widget.fieldShape == OtpFieldShape.underlined
              ? OtpFieldShape.custom
              : widget.fieldShape,
          fieldShapeConfig: widget.fieldShape == OtpFieldShape.underlined
              ? const OtpFieldShapeConfig(
                  borderStyle: OtpBorderStyle.bottomOnly)
              : null,
          primaryColor: widget.primaryColor,
          secondaryColor: widget.secondaryColor,
          backgroundColor: widget.backgroundColor,
          cursorColor: widget.primaryColor,
        );

    // Initialize the state manager
    _stateManager = OtpStateManager(
      fieldCount: widget.fieldCount,
      errorConfig: errorConfig,
      onErrorStateChanged: () {
        widget.onErrorStateChangedCallback
            ?.call(_stateManager.internalErrorState);
        setState(() {});
      },
      onErrorTextChanged: () {
        setState(() {});
      },
      onOtpChanged: (value) {
        widget.onChanged?.call(value);
        // Notify completion state change
        widget.onCompletionStateChanged?.call(_stateManager.isOtpComplete());
      },
      onOtpCompleted: (value) {
        widget.onCompleted?.call(value);
        // Notify completion state change
        widget.onCompletionStateChanged?.call(true);
      },
    );

    // Initialize error text from widget
    if (widget.errorText != null) {
      _stateManager.setErrorText(widget.errorText);
    }

    // Initialize the style manager
    _styleManager = OtpStyleManager(
      fieldConfig: fieldConfig,
      errorConfig: errorConfig,
      primaryColor: widget.primaryColor,
      secondaryColor: widget.secondaryColor,
      backgroundColor: widget.backgroundColor,
      defaultBorderColor: widget.defaultBorderColor,
      focusedBorderColor: widget.focusedBorderColor,
      completedFieldBorderColor: widget.completedFieldBorderColor,
      completedFieldBackgroundColor: widget.completedFieldBackgroundColor,
      completedFieldTextColor: widget.completedFieldTextColor,
      filledFieldBackgroundColor: widget.filledFieldBackgroundColor,
      enableProgressiveHighlighting: widget.enableProgressiveHighlighting,
    );

    // Initialize timer
    _remainingTime = widget.timerDuration;

    // Start timer if showTimer is enabled
    if (widget.showTimer) {
      _startTimer();
    }

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
      // Use a timestamp to track last paste operation to avoid multiple dialogs
      DateTime lastPasteTime =
          DateTime.now().subtract(const Duration(seconds: 1));

      for (int i = 0; i < _stateManager.focusNodes.length; i++) {
        final focusNode = _stateManager.focusNodes[i];
        final index = i; // Capture the index for use in the callback

        focusNode.addListener(() async {
          if (focusNode.hasFocus) {
            // Add debounce to prevent multiple paste operations
            final now = DateTime.now();
            if (now.difference(lastPasteTime).inMilliseconds < 500) {
              return; // Skip if last paste was less than 500ms ago
            }
            lastPasteTime = now;

            final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
            if (clipboardData != null && clipboardData.text != null) {
              final text = clipboardData.text!.trim();

              // If it's exactly the right length and valid, fill all fields
              if (text.length == widget.fieldCount &&
                  OtpValidator.isValidOtp(
                      text, widget.otpInputType, widget.fieldCount)) {
                setOtp(text);
              }
              // If it's a single digit, just put it in the current field and move to next
              else if (text.length == 1 &&
                  OtpValidator.isValidOtp(text, widget.otpInputType, 1)) {
                _stateManager.controllers[index].text = text;
                _stateManager.onDigitChanged(text, index);
              }
            }
          }
        });
      }
    }

    // Auto-focus the first field
    if (widget.autoFocus && _stateManager.focusNodes.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _stateManager.focusNodes[0].requestFocus();
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    _stateManager.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(OtpVerificationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Handle field count changes
    if (oldWidget.fieldCount != widget.fieldCount) {
      _stateManager.updateFieldCount(widget.fieldCount);
    }

    // Handle timer duration changes
    if (oldWidget.timerDuration != widget.timerDuration) {
      _remainingTime = widget.timerDuration;
      _startTimer();
    }

    // Handle error state changes
    if (oldWidget.hasError != widget.hasError) {
      _stateManager.setErrorState(widget.hasError);
    }

    // Handle error text changes
    if (oldWidget.errorText != widget.errorText) {
      _stateManager.setErrorText(widget.errorText);
    }
  }

  /// Starts the resend timer
  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
          // Notify custom widgets of timer change
          widget.onTimerChanged?.call(_remainingTime);
        } else {
          _timer?.cancel();
          // Refresh field states when timer ends to ensure proper styling
          _stateManager.refreshAllFieldStates();
          // Notify custom widgets that timer ended
          widget.onTimerChanged?.call(0);
        }
      });
    });
  }

  /// Handles the verify button press
  void _onVerifyPressed() {
    if (widget.enableAutoValidation) {
      // Check if OTP is complete first
      if (!_stateManager.isOtpComplete()) {
        // Clear any existing error state when showing validation
        _stateManager.clearErrorState();
        _stateManager.errorText = null;

        // Show validation message for incomplete OTP
        _stateManager.setValidationText(_getDefaultValidationMessage());
        setState(() {
          _stateManager.autoValidateMode = AutovalidateMode.always;
        });
        // Notify validation state change
        widget.onValidationStateChanged?.call(true);
        return;
      }

      // If OTP is complete, clear validation text and validate the form
      _stateManager.setValidationText(null);
      // Notify validation state cleared
      widget.onValidationStateChanged?.call(false);

      if (_stateManager.formKey.currentState!.validate()) {
        _stateManager.formKey.currentState!.save();
        setState(() => _isLoading = true);
        widget.onVerify(_stateManager.getOtpValue());
        setState(() => _isLoading = false);
      } else {
        setState(() {
          _stateManager.autoValidateMode = AutovalidateMode.always;
        });
      }
    } else {
      setState(() => _isLoading = true);
      widget.onVerify(_stateManager.getOtpValue());
      setState(() => _isLoading = false);
    }
  }

  /// Handles the resend OTP button press
  void _onResendPressed() {
    if (_remainingTime == 0) {
      // Handle error state clearing on resend
      _stateManager.handleErrorStateOnResend();

      // Clear OTP fields to ensure clean state (this now updates all field states)
      _stateManager.clearOtp(
          refocus: false, clearError: true, callOnChanged: false);

      // Start timer immediately with instant state update
      setState(() {
        _remainingTime = widget.timerDuration;
      });

      // Notify custom widgets that timer started
      widget.onTimerChanged?.call(_remainingTime);

      _startTimer();
      widget.onResend();
    }
  }

  /// Public method to trigger resend button press
  void triggerResend() {
    _onResendPressed();
  }

  /// Gets the current remaining time for resend
  int get remainingResendTime => _remainingTime;

  /// Checks if resend is currently available
  bool get canResend => _remainingTime == 0;

  /// Handles verification result automatically (success or error)
  /// 🎯 HANDLE VERIFICATION RESULT: Show success or error after verification
  ///
  /// ✅ Show success (clears all errors/validation):
  /// ```dart
  /// otpKey.currentState?.handleVerificationResult(true);
  /// ```
  ///
  /// ✅ Show error:
  /// ```dart
  /// otpKey.currentState?.handleVerificationResult(
  ///   false,
  ///   errorMessage: 'Invalid OTP. Please try again.',
  /// );
  /// ```
  void handleVerificationResult(bool isSuccess, {String? errorMessage}) {
    if (isSuccess) {
      // Clear all error states on success
      _stateManager.clearAllErrorStates();
      // Notify state changes
      widget.onErrorStateChangedCallback?.call(false);
      widget.onValidationStateChanged?.call(false);
    } else {
      // Set error state and message on failure
      _stateManager.setErrorState(true);
      if (errorMessage != null) {
        _stateManager.setErrorText(errorMessage);
      }
      // Notify error state change
      widget.onErrorStateChangedCallback?.call(true);
    }
    setState(() {});
  }

  /// Handles backend integration states (for Cubit/Bloc integration)
  /// 🎯 HANDLE BACKEND STATE: Control validation, errors, and loading states
  ///
  /// This is the MAIN method to control the OTP widget from your backend:
  ///
  /// ✅ Show validation message:
  /// ```dart
  /// otpKey.currentState?.handleBackendState(
  ///   isValidating: true,
  ///   validationMessage: 'Please enter all digits',
  /// );
  /// ```
  ///
  /// ✅ Show error message:
  /// ```dart
  /// otpKey.currentState?.handleBackendState(
  ///   hasError: true,
  ///   errorMessage: 'Invalid OTP. Please try again.',
  /// );
  /// ```
  ///
  /// ✅ Show loading state:
  /// ```dart
  /// otpKey.currentState?.handleBackendState(isLoading: true);
  /// ```
  void handleBackendState({
    bool? isLoading,
    bool? hasError,
    String? errorMessage,
    bool? isValidating,
    String? validationMessage,
  }) {
    setState(() {
      if (isLoading != null) {
        _isLoading = isLoading;
      }
    });

    if (hasError != null) {
      if (hasError) {
        _stateManager.setErrorState(true);
        if (errorMessage != null) {
          _stateManager.setErrorText(errorMessage);
        }
        widget.onErrorStateChangedCallback?.call(true);
      } else {
        _stateManager.clearAllErrorStates();
        widget.onErrorStateChangedCallback?.call(false);
      }
    }

    if (isValidating != null) {
      if (isValidating) {
        _stateManager.setValidationText(
            validationMessage ?? _getDefaultValidationMessage());
        widget.onValidationStateChanged?.call(true);
      } else {
        _stateManager.setValidationText(null);
        widget.onValidationStateChanged?.call(false);
      }
    }

    setState(() {});
  }

  /// Clears all OTP input fields
  void clearOtp({
    bool refocus = true,
    bool clearError = true,
    bool callOnChanged = true,
  }) {
    _stateManager.clearOtp(
      refocus: refocus,
      clearError: clearError,
      callOnChanged: callOnChanged,
    );
    setState(() {});
  }

  /// Pre-fills the OTP input fields with the provided value
  void setOtp(
    String otp, {
    bool clearFocus = true,
    bool clearError = true,
    bool callCallbacks = true,
  }) {
    _stateManager.setOtp(
      otp,
      clearFocus: clearFocus,
      clearError: clearError,
      callCallbacks: callCallbacks,
    );
    setState(() {});
  }

  /// Returns the current OTP value
  String getCurrentOtp() {
    return _stateManager.getOtpValue();
  }

  /// Refreshes all field states to ensure they reflect current state
  void refreshAllFieldStates() {
    _stateManager.refreshAllFieldStates();
    setState(() {});
  }

  /// Public method to trigger verify button press
  void triggerVerify() {
    _onVerifyPressed();
  }

  /// Checks if the current OTP is valid
  bool isOtpValid() {
    return _stateManager.isOtpValid();
  }

  /// Sets the error state programmatically
  void setErrorState(bool hasError) {
    _stateManager.setErrorState(hasError);
    setState(() {});
  }

  /// Sets error text programmatically (clears validation text automatically)
  void setErrorText(String? errorText) {
    _stateManager.setErrorText(errorText);
    setState(() {});
  }

  /// Clears all error-related states (comprehensive error clearing)
  void clearAllErrorStates() {
    _stateManager.clearAllErrorStates();
    setState(() {});
  }

  /// Gets the current error state
  bool get hasErrorState => _stateManager.internalErrorState;

  /// Clears the error state programmatically
  void clearErrorState() {
    _stateManager.clearErrorState();
    setState(() {});
  }

  /// Resets all fields to empty state with proper styling
  void resetFields({bool preserveFocus = false, bool preserveError = false}) {
    _stateManager.resetFields(
      preserveFocus: preserveFocus,
      preserveError: preserveError,
    );
    setState(() {});
  }

  /// Gets the default validation message
  String _getDefaultValidationMessage() {
    // Default validation message - can be customized by users via validationMessage widget
    return 'Please enter all digits';
  }

  /// Detects text direction from app's locale
  TextDirection _detectTextDirection(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final languageCode = locale.languageCode.toLowerCase();

    // RTL languages
    final rtlLanguages = [
      'ar',
      'he',
      'fa',
      'ur',
      'ku',
      'dv',
      'ps',
      'sd',
      'ug',
      'yi'
    ];

    return rtlLanguages.contains(languageCode)
        ? TextDirection.rtl
        : TextDirection.ltr;
  }

  /// Unfocuses all OTP fields and closes the keyboard
  void _unfocusAllFields() {
    // Unfocus all focus nodes to close keyboard
    bool anyFieldWasFocused = false;
    for (final focusNode in _stateManager.focusNodes) {
      if (focusNode.hasFocus) {
        focusNode.unfocus();
        anyFieldWasFocused = true;
      }
    }

    if (anyFieldWasFocused) {
      // Update field states to reflect unfocused state
      _stateManager.refreshAllFieldStates();
    }
  }

  /// Public method to unfocus all OTP fields (for external access)
  void unfocusAllFields() {
    _unfocusAllFields();
  }

  @override
  Widget build(BuildContext context) {
    // Determine text direction
    final effectiveTextDirection =
        widget.textDirection ?? _detectTextDirection(context);

    // Create animation config from widget parameters
    final animationConfig = const OtpAnimationConfig();

    // Build the main OTP widget content
    Widget otpContent = Directionality(
      textDirection: effectiveTextDirection,
      child: AnimatedBuilder(
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
                    OtpHeader(
                      title: widget.title,
                      subtitle: widget.subtitle,
                      primaryColor: widget.primaryColor,
                      secondaryColor: widget.secondaryColor,
                      spacing: widget.spacing,
                      titleWidget: widget.titleWidget,
                      subtitleWidget: widget.subtitleWidget,
                      titleStyle: widget.titleStyle,
                      subtitleStyle: widget.subtitleStyle,
                      contactInfo: widget.contactInfo,
                      maskingType: widget.maskingType,
                      semanticLabel: widget.semanticLabel,
                    ),

                    SizedBox(height: widget.spacing * 3),

                    // OTP Input Fields
                    Form(
                      key: _stateManager.formKey,
                      autovalidateMode: _stateManager.autoValidateMode,
                      child: OtpFieldsRow(
                        controllers: _stateManager.controllers,
                        focusNodes: _stateManager.focusNodes,
                        fieldStates: _stateManager.fieldStates,
                        fieldHasError: _stateManager.fieldHasError,
                        onDigitChanged: (text, index) =>
                            _stateManager.onDigitChanged(text, index),
                        config: _styleManager.fieldConfig,
                        getFieldColors: _styleManager.getFieldColors,
                        inputFormatters: OtpFormatter.getInputFormatters(
                          widget.otpInputType,
                          customFormatters: widget.inputFormatters,
                        ),
                        keyboardType: OtpFormatter.getKeyboardType(
                          widget.otpInputType,
                          customKeyboardType: widget.customKeyboardType,
                        ),
                        validator: OtpValidator.createValidator(
                          inputType: widget.otpInputType,
                          fieldCount: widget.fieldCount,
                          validationRegex: widget.validationRegex,
                          customValidator: widget.customValidator,
                        ),
                        layoutType: widget.layoutType,
                        fieldCount: widget.fieldCount,
                        fieldSpacing: widget.fieldSpacing,
                        cursorAlignment: widget.cursorAlignment,
                        obscureText: widget.obscureText,
                        obscuringCharacter: widget.obscuringCharacter,
                        enableInteractiveSelection:
                            widget.enableInteractiveSelection,
                        textCapitalization: widget.textCapitalization,
                        hasInternalError: _stateManager.internalErrorState,
                        animationConfig: animationConfig,
                      ),
                    ),

                    SizedBox(height: widget.spacing),

                    // Validation message (shown when auto-validation is enabled and OTP is incomplete)
                    OtpValidationDisplay(
                      validationText: _stateManager.validationText,
                      validationMessageWidget:
                          _stateManager.validationText != null
                              ? widget.validationMessage
                              : null,
                    ),

                    // Error message (shown when there's an actual error)
                    OtpErrorDisplay(
                      errorText: _stateManager.errorText,
                      errorWidget: widget.errorWidget,
                      errorStyle: widget.errorStyle,
                      errorColor: widget.errorBorderColor ?? Colors.red,
                      topSpacing: widget.spacing * 0.5,
                    ),

                    SizedBox(height: widget.spacing * 2),

                    // Verify button
                    OtpFooter(
                      onVerifyPressed: _onVerifyPressed,
                      onResendPressed: _onResendPressed,
                      isLoading: _isLoading,
                      remainingTime: _remainingTime,
                      primaryColor: widget.primaryColor,
                      secondaryColor: widget.secondaryColor,
                      spacing: widget.spacing,
                      buttonText: widget.buttonText,
                      resendText: widget.resendText,
                      timerPrefix: widget.timerPrefix,
                      verifyButtonWidget: widget.verifyButtonWidget,
                      resendWidget: widget.resendWidget,
                      timerWidget: widget.timerWidget,
                      buttonStyle: widget.buttonStyle,
                      resendStyle: widget.resendStyle,
                      timerStyle: widget.timerStyle,
                      showTimer: widget.showTimer,
                      buttonBackgroundColor: widget.buttonBackgroundColor,
                      buttonTextColor: widget.buttonTextColor,
                      buttonBorderRadius: widget.buttonBorderRadius,
                      buttonHeight: widget.buttonHeight,
                      buttonWidth: widget.buttonWidth,
                      buttonElevation: widget.buttonElevation,
                      loadingIndicatorColor: widget.loadingIndicatorColor,
                      loadingIndicatorSize: widget.loadingIndicatorSize,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );

    // Handle tap outside unfocus with priority system
    if (widget.externalTapOutsideHandler != null) {
      // External handler takes priority - package wraps with GestureDetector but calls external handler
      return GestureDetector(
        onTap: () {
          widget.externalTapOutsideHandler!();
        },
        behavior: HitTestBehavior.translucent,
        child: otpContent,
      );
    } else if (widget.unfocusOnTapOutside) {
      // Package handles tap outside unfocus automatically
      return GestureDetector(
        onTap: () {
          _unfocusAllFields();
        },
        behavior: HitTestBehavior.translucent,
        child: otpContent,
      );
    }

    return otpContent;
  }
}
