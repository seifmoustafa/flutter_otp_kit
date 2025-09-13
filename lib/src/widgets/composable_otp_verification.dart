import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../state/reactive_otp_state.dart';
import 'composable_otp_field.dart';

/// A composable OTP verification widget that uses the reactive state system.
///
/// This widget is designed to be highly customizable and composable,
/// allowing developers to build complex OTP verification experiences.
class ComposableOtpVerification extends StatefulWidget {
  /// Creates a new composable OTP verification widget.
  const ComposableOtpVerification({
    Key? key,
    required this.controller,
    required this.onVerify,
    required this.onResend,
    this.title,
    this.subtitle,
    this.titleWidget,
    this.subtitleWidget,
    this.fieldBuilder,
    this.verifyButtonBuilder,
    this.resendBuilder,
    this.timerBuilder,
    this.errorBuilder,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.enableResend = true,
    this.resendTimerDuration = 60,
    this.buttonText = 'Verify',
    this.resendText = 'Resend Code',
    this.timerText = 'Resend in {time}s',
    this.buttonBackgroundColor,
    this.buttonTextColor,
    this.buttonBorderRadius = 8.0,
    this.buttonHeight = 50.0,
    this.buttonWidth = double.infinity,
    this.buttonElevation = 0.0,
    this.loadingIndicatorColor,
    this.loadingIndicatorSize = 24.0,
    this.showTimer = true,
    this.enableAutoValidation = true,
    this.fieldSpacing = 8.0,
    this.themeColor,
    this.hapticFeedbackType = HapticFeedbackType.light,
    this.showErrorText = true,
    this.onOtpChanged,
    this.onTimerChanged,
    this.keyboardType = TextInputType.number,
    this.inputFormatters,
  }) : super(key: key);

  /// The controller for this OTP verification.
  final OtpController controller;

  /// Callback when the verify button is pressed.
  final Function(String) onVerify;

  /// Callback when the resend button is pressed.
  final VoidCallback onResend;

  /// The title text for the verification widget.
  final String? title;

  /// The subtitle text for the verification widget.
  final String? subtitle;

  /// Custom title widget.
  final Widget? titleWidget;

  /// Custom subtitle widget.
  final Widget? subtitleWidget;

  /// Builder for creating custom OTP field items.
  final Widget Function(BuildContext, int, OtpFieldItemState)? fieldBuilder;

  /// Builder for creating a custom verify button.
  final Widget Function(BuildContext, VoidCallback, bool)? verifyButtonBuilder;

  /// Builder for creating a custom resend section.
  final Widget Function(BuildContext, VoidCallback, int)? resendBuilder;

  /// Builder for creating a custom timer display.
  final Widget Function(BuildContext, int)? timerBuilder;

  /// Builder for creating a custom error display.
  final Widget Function(BuildContext, String?)? errorBuilder;

  /// Whether to obscure the input.
  final bool obscureText;

  /// Character to use for obscuring text.
  final String obscuringCharacter;

  /// Whether to enable resend functionality.
  final bool enableResend;

  /// Duration for the resend timer in seconds.
  final int resendTimerDuration;

  /// Text for the verify button.
  final String buttonText;

  /// Text for the resend button.
  final String resendText;

  /// Text for the timer display with {time} placeholder.
  final String timerText;

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

  /// Whether to show the timer.
  final bool showTimer;

  /// Whether to enable auto-validation.
  final bool enableAutoValidation;

  /// Spacing between OTP fields.
  final double fieldSpacing;

  /// Theme color for the verification widget.
  final Color? themeColor;

  /// Type of haptic feedback to provide.
  final HapticFeedbackType hapticFeedbackType;

  /// Whether to show error text.
  final bool showErrorText;

  /// Callback when the OTP value changes.
  final ValueChanged<String>? onOtpChanged;

  /// Callback when the timer changes.
  final ValueChanged<int>? onTimerChanged;

  /// Keyboard type for the OTP input.
  final TextInputType keyboardType;

  /// Input formatters for the OTP input.
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<ComposableOtpVerification> createState() =>
      ComposableOtpVerificationState();
}

/// State for the ComposableOtpVerification widget.
class ComposableOtpVerificationState extends State<ComposableOtpVerification> {
  late OtpController _controller;
  int _remainingTime = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _remainingTime = widget.resendTimerDuration;

    // Start timer if resend is enabled
    if (widget.enableResend) {
      _startTimer();
    }
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
    if (_controller.value.length != _controller.length &&
        widget.enableAutoValidation) {
      _controller.setError('Please enter all digits');
      return;
    }

    _controller.setLoading(true);
    widget.onVerify(_controller.value);
    _controller.setLoading(false);
  }

  void _onResendPressed() {
    if (_remainingTime == 0) {
      // Reset timer
      setState(() {
        _remainingTime = widget.resendTimerDuration;
      });

      _startTimer();

      // Clear OTP fields and error
      _controller.clear();

      // Call resend callback
      widget.onResend();
    }
  }

  void _onOtpChanged(String value) {
    // Clear error when user starts typing
    if (_controller.hasError) {
      _controller.clearError();
    }

    widget.onOtpChanged?.call(value);
  }

  /// Set an error message.
  void setError(String? errorText) {
    _controller.setError(errorText);
  }

  /// Clear the error state.
  void clearError() {
    _controller.clearError();
  }

  /// Set the loading state.
  void setLoading(bool isLoading) {
    _controller.setLoading(isLoading);
  }

  /// Reset the timer.
  void resetTimer() {
    setState(() {
      _remainingTime = widget.resendTimerDuration;
    });

    _startTimer();
  }

  /// Clear the OTP fields.
  void clearOtp() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          _buildHeader(),

          const SizedBox(height: 32),

          // OTP Fields
          Center(
            child: ComposableOtpField(
              controller: _controller,
              onChanged: _onOtpChanged,
              fieldBuilder: widget.fieldBuilder,
              obscureText: widget.obscureText,
              obscuringCharacter: widget.obscuringCharacter,
              hapticFeedbackType: widget.hapticFeedbackType,
              fieldSpacing: widget.fieldSpacing,
              keyboardType: widget.keyboardType,
              inputFormatters: widget.inputFormatters,
            ),
          ),

          const SizedBox(height: 16),

          // Error Display
          if (widget.showErrorText) _buildErrorDisplay(),

          const SizedBox(height: 24),

          // Verify Button
          _buildVerifyButton(),

          const SizedBox(height: 16),

          // Resend Section
          if (widget.enableResend) _buildResendSection(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.titleWidget != null)
          widget.titleWidget!
        else if (widget.title != null)
          Text(
            widget.title!,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
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
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
      ],
    );
  }

  Widget _buildErrorDisplay() {
    if (widget.errorBuilder != null) {
      return OtpStateBuilder<String?>(
        valueListenable: _controller.state.errorTextNotifier,
        builder: (context, errorText, _) {
          if (errorText == null) return const SizedBox.shrink();
          return widget.errorBuilder!(context, errorText);
        },
      );
    }

    return OtpStateBuilder<String?>(
      valueListenable: _controller.state.errorTextNotifier,
      builder: (context, errorText, _) {
        if (errorText == null) return const SizedBox.shrink();

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
                  errorText,
                  style: TextStyle(color: Colors.red.shade700, fontSize: 14),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildVerifyButton() {
    if (widget.verifyButtonBuilder != null) {
      return OtpStateBuilder<bool>(
        valueListenable: _controller.state.loadingStateNotifier,
        builder: (context, isLoading, _) {
          return widget.verifyButtonBuilder!(
              context, _onVerifyPressed, isLoading);
        },
      );
    }

    final primaryColor = widget.themeColor ?? Theme.of(context).primaryColor;

    return OtpStateBuilder<bool>(
      valueListenable: _controller.state.loadingStateNotifier,
      builder: (context, isLoading, _) {
        return SizedBox(
          width: widget.buttonWidth,
          height: widget.buttonHeight,
          child: ElevatedButton(
            onPressed: isLoading ? null : _onVerifyPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.buttonBackgroundColor ?? primaryColor,
              foregroundColor: widget.buttonTextColor ?? Colors.white,
              elevation: widget.buttonElevation,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.buttonBorderRadius),
              ),
            ),
            child: isLoading
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
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
          ),
        );
      },
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
              style: TextStyle(
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
      style: TextStyle(
        color: Colors.grey.shade600,
      ),
    );
  }
}
