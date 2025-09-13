import 'dart:async';
import 'package:flutter/material.dart';
import '../config/otp_builder.dart';
import '../widgets/flexible_otp_field.dart';
import '../styling/otp_predefined_style.dart';

/// A flexible OTP verification widget that handles the complete verification flow.
///
/// This widget provides:
/// - Customizable header with title and subtitle
/// - Fully customizable OTP fields
/// - Verification button with loading state
/// - Resend functionality with countdown timer
/// - Error handling and validation
/// - Callbacks for verification and resend events
class FlexibleOtpVerification extends StatefulWidget {
  /// Creates a new flexible OTP verification widget.
  const FlexibleOtpVerification({
    Key? key,
    this.title,
    this.subtitle,
    this.titleWidget,
    this.subtitleWidget,
    this.otpLength = 4,
    this.otpBuilder,
    this.verifyButtonBuilder,
    this.resendBuilder,
    this.headerBuilder,
    this.footerBuilder,
    this.errorBuilder,
    this.timerBuilder,
    this.spaceBetweenFields = 10,
    this.buttonText = 'Verify',
    this.resendText = 'Resend Code',
    this.timerText = 'Resend in {time}s',
    this.titleStyle,
    this.subtitleStyle,
    this.buttonStyle,
    this.resendStyle,
    this.timerStyle,
    this.enableAutoValidation = true,
    this.enableResend = true,
    this.resendTimerDuration = 60,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.hapticFeedbackType = HapticFeedbackType.light,
    this.otpStyle = OtpPredefinedStyle.defaultStyle,
    this.themeColor,
    this.buttonBackgroundColor,
    this.buttonTextColor,
    this.buttonBorderRadius = 8.0,
    this.buttonHeight = 50.0,
    this.buttonWidth = double.infinity,
    this.buttonElevation = 0.0,
    this.loadingIndicatorColor,
    this.loadingIndicatorSize = 24.0,
    required this.onVerify,
    required this.onResend,
    this.onOtpChanged,
    this.onOtpCompleted,
    this.onErrorStateChanged,
    this.onTimerChanged,
  }) : super(key: key);

  /// The title text for the verification screen.
  final String? title;

  /// The subtitle text for the verification screen.
  final String? subtitle;

  /// Custom title widget.
  final Widget? titleWidget;

  /// Custom subtitle widget.
  final Widget? subtitleWidget;

  /// The number of OTP fields to display.
  final int otpLength;

  /// Custom OTP builder for complete customization.
  final OtpBuilder? otpBuilder;

  /// Custom builder for the verify button.
  final Widget Function(
          BuildContext context, VoidCallback onVerify, bool isLoading)?
      verifyButtonBuilder;

  /// Custom builder for the resend section.
  final Widget Function(
          BuildContext context, VoidCallback onResend, int remainingTime)?
      resendBuilder;

  /// Custom builder for the header section.
  final Widget Function(BuildContext context, String? title, String? subtitle)?
      headerBuilder;

  /// Custom builder for the footer section.
  final Widget Function(BuildContext context)? footerBuilder;

  /// Custom builder for the error display.
  final Widget Function(BuildContext context, String? errorText)? errorBuilder;

  /// Custom builder for the timer display.
  final Widget Function(BuildContext context, int remainingTime)? timerBuilder;

  /// Spacing between OTP fields.
  final double spaceBetweenFields;

  /// Text for the verify button.
  final String buttonText;

  /// Text for the resend button.
  final String resendText;

  /// Text for the timer display with {time} placeholder.
  final String timerText;

  /// Style for the title text.
  final TextStyle? titleStyle;

  /// Style for the subtitle text.
  final TextStyle? subtitleStyle;

  /// Style for the verify button text.
  final TextStyle? buttonStyle;

  /// Style for the resend text.
  final TextStyle? resendStyle;

  /// Style for the timer text.
  final TextStyle? timerStyle;

  /// Whether to enable auto-validation.
  final bool enableAutoValidation;

  /// Whether to enable resend functionality.
  final bool enableResend;

  /// Duration for the resend timer in seconds.
  final int resendTimerDuration;

  /// Whether to obscure OTP input.
  final bool obscureText;

  /// Character to use for obscuring text.
  final String obscuringCharacter;

  /// Type of haptic feedback to provide.
  final HapticFeedbackType hapticFeedbackType;

  /// Predefined style for OTP fields.
  final OtpPredefinedStyle otpStyle;

  /// Theme color for the verification widget.
  final Color? themeColor;

  /// Background color for the verify button.
  final Color? buttonBackgroundColor;

  /// Text color for the verify button.
  final Color? buttonTextColor;

  /// Border radius for the verify button.
  final double buttonBorderRadius;

  /// Height for the verify button.
  final double buttonHeight;

  /// Width for the verify button.
  final double buttonWidth;

  /// Elevation for the verify button.
  final double buttonElevation;

  /// Color for the loading indicator.
  final Color? loadingIndicatorColor;

  /// Size for the loading indicator.
  final double loadingIndicatorSize;

  /// Callback when verify button is pressed with OTP value.
  final Function(String) onVerify;

  /// Callback when resend button is pressed.
  final VoidCallback onResend;

  /// Callback when OTP value changes.
  final ValueChanged<String>? onOtpChanged;

  /// Callback when OTP is completed.
  final ValueChanged<String>? onOtpCompleted;

  /// Callback when error state changes.
  final ValueChanged<bool>? onErrorStateChanged;

  /// Callback when timer changes.
  final ValueChanged<int>? onTimerChanged;

  @override
  State<FlexibleOtpVerification> createState() =>
      FlexibleOtpVerificationState();
}

/// State for the [FlexibleOtpVerification] widget.
class FlexibleOtpVerificationState extends State<FlexibleOtpVerification> {
  String _otpValue = '';
  bool _isLoading = false;
  bool _hasError = false;
  String? _errorText;
  int _remainingTime = 0;
  Timer? _timer;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FlexibleOtpFieldState> _otpFieldKey =
      GlobalKey<FlexibleOtpFieldState>();
  late OtpBuilder _effectiveOtpBuilder;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.resendTimerDuration;
    _setupOtpBuilder();

    // Start timer if resend is enabled
    if (widget.enableResend) {
      _startTimer();
    }
  }

  void _setupOtpBuilder() {
    // Use provided builder or create a new one with default settings
    _effectiveOtpBuilder = widget.otpBuilder ??
        OtpBuilder()
            .length(widget.otpLength)
            .fieldSpacing(widget.spaceBetweenFields)
            .obscureText(widget.obscureText)
            .obscuringCharacter(widget.obscuringCharacter)
            .autovalidateMode(widget.enableAutoValidation
                ? AutovalidateMode.always
                : AutovalidateMode.disabled)
            .hapticFeedbackType(widget.hapticFeedbackType)
            .showErrorText(
                false) // Disable error text in OTP field since we handle it in verification widget
            .applyStyle(widget.otpStyle,
                primaryColor:
                    widget.themeColor ?? Theme.of(context).primaryColor);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
          widget.onTimerChanged?.call(_remainingTime);
        } else {
          _timer?.cancel();
          widget.onTimerChanged?.call(0);
        }
      });
    });
  }

  void _onVerifyPressed() {
    if (_otpValue.length != widget.otpLength) {
      setError('Please enter all digits');
      return;
    }

    setState(() => _isLoading = true);

    // Call the verification callback
    // Note: The parent widget should handle the verification result
    // and call setLoading(false) when done
    widget.onVerify(_otpValue);
  }

  void _onResendPressed() {
    if (_remainingTime == 0) {
      // Reset timer
      setState(() {
        _remainingTime = widget.resendTimerDuration;
        _hasError = false;
        _errorText = null;
        _otpValue = '';
      });

      _startTimer();

      // Call resend callback
      widget.onResend();
      widget.onOtpChanged?.call('');
    }
  }

  void _onOtpChanged(String value) {
    setState(() {
      _otpValue = value;
      if (_hasError) {
        _hasError = false;
        _errorText = null;
        widget.onErrorStateChanged?.call(false);
      }
    });

    widget.onOtpChanged?.call(value);
  }

  void _onOtpCompleted(String value) {
    widget.onOtpCompleted?.call(value);
  }

  /// Sets an error message and updates the error state.
  void setError(String? errorText) {
    setState(() {
      _hasError = errorText != null;
      _errorText = errorText;
    });

    // Also set error on the OTP field if it exists
    if (_otpFieldKey.currentState != null) {
      _otpFieldKey.currentState!.setError(errorText);
    }

    widget.onErrorStateChanged?.call(_hasError);
  }

  /// Clears the error state.
  void clearError() {
    setState(() {
      _hasError = false;
      _errorText = null;
    });

    // Also clear error on the OTP field if it exists
    if (_otpFieldKey.currentState != null) {
      _otpFieldKey.currentState!.clearError();
    }

    widget.onErrorStateChanged?.call(false);
  }

  /// Sets the loading state.
  void setLoading(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

  /// Resets the timer.
  void resetTimer() {
    setState(() {
      _remainingTime = widget.resendTimerDuration;
    });

    _startTimer();
  }

  /// Clears the OTP fields.
  void clearOtp() {
    setState(() {
      _otpValue = '';
    });
    widget.onOtpChanged?.call('');
  }

  /// Gets the current OTP value.
  String getOtpValue() {
    return _otpValue;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _buildHeader(),

            const SizedBox(height: 32),

            // OTP Fields
            _buildOtpFields(),

            const SizedBox(height: 16),

            // Error Display
            if (_hasError && _errorText != null) _buildErrorDisplay(),

            const SizedBox(height: 24),

            // Verify Button
            _buildVerifyButton(),

            const SizedBox(height: 16),

            // Resend Section
            if (widget.enableResend) _buildResendSection(),

            // Custom Footer
            if (widget.footerBuilder != null) widget.footerBuilder!(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    if (widget.headerBuilder != null) {
      return widget.headerBuilder!(context, widget.title, widget.subtitle);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.titleWidget != null)
          widget.titleWidget!
        else if (widget.title != null)
          Text(
            widget.title!,
            style: widget.titleStyle ??
                const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
          ),
        if ((widget.titleWidget != null || widget.title != null) &&
            (widget.subtitleWidget != null || widget.subtitle != null))
          const SizedBox(height: 8),
        if (widget.subtitleWidget != null)
          widget.subtitleWidget!
        else if (widget.subtitle != null)
          Text(
            widget.subtitle!,
            style: widget.subtitleStyle ??
                TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
          ),
      ],
    );
  }

  Widget _buildOtpFields() {
    return Center(
      child: _effectiveOtpBuilder.build(
        key: _otpFieldKey,
        onChanged: _onOtpChanged,
        onCompleted: _onOtpCompleted,
      ),
    );
  }

  Widget _buildErrorDisplay() {
    if (widget.errorBuilder != null) {
      return widget.errorBuilder!(context, _errorText);
    }

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red.shade700, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              _errorText!,
              style: TextStyle(color: Colors.red.shade700, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerifyButton() {
    if (widget.verifyButtonBuilder != null) {
      return widget.verifyButtonBuilder!(context, _onVerifyPressed, _isLoading);
    }

    final primaryColor = widget.themeColor ?? Theme.of(context).primaryColor;

    return SizedBox(
      width: widget.buttonWidth,
      height: widget.buttonHeight,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _onVerifyPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.buttonBackgroundColor ?? primaryColor,
          foregroundColor: widget.buttonTextColor ?? Colors.white,
          elevation: widget.buttonElevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.buttonBorderRadius),
          ),
        ),
        child: _isLoading
            ? SizedBox(
                width: widget.loadingIndicatorSize,
                height: widget.loadingIndicatorSize,
                child: CircularProgressIndicator(
                  color: widget.loadingIndicatorColor ??
                      widget.buttonTextColor ??
                      Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                widget.buttonText,
                style: widget.buttonStyle ??
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
      ),
    );
  }

  Widget _buildResendSection() {
    if (widget.resendBuilder != null) {
      return widget.resendBuilder!(context, _onResendPressed, _remainingTime);
    }

    final primaryColor = widget.themeColor ?? Theme.of(context).primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_remainingTime > 0)
          _buildTimerDisplay()
        else
          TextButton(
            onPressed: _onResendPressed,
            child: Text(
              widget.resendText,
              style: widget.resendStyle ??
                  TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
      ],
    );
  }

  Widget _buildTimerDisplay() {
    if (widget.timerBuilder != null) {
      return widget.timerBuilder!(context, _remainingTime);
    }

    final timerText =
        widget.timerText.replaceAll('{time}', _remainingTime.toString());

    return Text(
      timerText,
      style: widget.timerStyle ??
          TextStyle(
            color: Colors.grey.shade600,
          ),
    );
  }
}
