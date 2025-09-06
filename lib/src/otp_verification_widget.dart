import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'masking_type.dart';

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
    this.fieldCount = 5,
    this.timerDuration = 60,
    this.fieldWidth = 55.125,
    this.fieldHeight = 60.731,
    this.borderRadius = 17.752,
    this.borderWidth = 1.869,
    this.spacing = 16.0,
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
  });

  /// Title text displayed at the top (must be localized)
  final String title;

  /// Subtitle text displayed below the title (must be localized)
  final String subtitle;

  /// Text for the verify button (must be localized)
  final String buttonText;

  /// Text for the resend link (must be localized)
  final String resendText;

  /// Text prefix for timer (must be localized, e.g., "after" or "بعد")
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

  @override
  State<OtpVerificationWidget> createState() => _OtpVerificationWidgetState();
}

class _OtpVerificationWidgetState extends State<OtpVerificationWidget> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  late int _remainingTime;
  Timer? _timer;
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    _controllers =
        List.generate(widget.fieldCount, (index) => TextEditingController());
    _focusNodes = List.generate(widget.fieldCount, (index) => FocusNode());
    _remainingTime = widget.timerDuration;
    _startTimer();

    if (widget.autoFocus && _focusNodes.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNodes[0].requestFocus();
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  void didUpdateWidget(OtpVerificationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Handle field count changes
    if (oldWidget.fieldCount != widget.fieldCount) {
      _updateControllersAndFocusNodes();
    }

    // Handle timer duration changes
    if (oldWidget.timerDuration != widget.timerDuration) {
      _remainingTime = widget.timerDuration;
      _startTimer();
    }
  }

  /// Updates controllers and focus nodes when field count changes
  void _updateControllersAndFocusNodes() {
    // Dispose old controllers and focus nodes
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }

    // Create new ones
    _controllers =
        List.generate(widget.fieldCount, (index) => TextEditingController());
    _focusNodes = List.generate(widget.fieldCount, (index) => FocusNode());

    // Auto focus if enabled
    if (widget.autoFocus && _focusNodes.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _focusNodes[0].requestFocus();
        }
      });
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

  /// Handles digit input changes and manages focus navigation
  void _onDigitChanged(String value, int index) {
    if (value.isNotEmpty) {
      // Move to next field if not the last one
      if (index < widget.fieldCount - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        // Last field, remove focus
        _focusNodes[index].unfocus();
      }
    } else {
      // Move to previous field if not the first one
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
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
    if (widget.autoFocus && _focusNodes.isNotEmpty) {
      _focusNodes[0].requestFocus();
    }
  }

  /// Pre-fills the OTP input fields with the provided value
  void setOtp(String otp) {
    for (int i = 0; i < widget.fieldCount && i < otp.length; i++) {
      _controllers[i].text = otp[i];
    }
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.spacing),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title and subtitle
          Column(
            children: [
              PlatformText(
                widget.title,
                style: widget.titleStyle ??
                    TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: widget.primaryColor,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: widget.spacing * 1.25),
              PlatformText(
                widget.contactInfo != null
                    ? widget.subtitle.replaceAll(
                        '{contactInfo}',
                        _maskContactInfo(
                            widget.contactInfo!, widget.maskingType))
                    : widget.subtitle,
                style: widget.subtitleStyle ??
                    TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: widget.secondaryColor,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),

          SizedBox(height: widget.spacing * 3),

          // OTP Input Fields
          Form(
            key: _formKey,
            autovalidateMode: _autoValidate,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(widget.fieldCount, (index) {
                return Container(
                  width: widget.fieldWidth,
                  height: widget.fieldHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    border: Border.all(
                      color: widget.secondaryColor.withValues(alpha: 0.8),
                      width: widget.borderWidth,
                    ),
                    color: widget.backgroundColor,
                  ),
                  child: TextFormField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    style: widget.fieldStyle ??
                        TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                    decoration: const InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    validator: widget.enableAutoValidation
                        ? (v) => (v == null || v.isEmpty) ? '' : null
                        : null,
                    onChanged: (value) => _onDigitChanged(value, index),
                  ),
                );
              }),
            ),
          ),

          SizedBox(height: widget.spacing * 2),

          // Timer and resend section
          Row(
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
                            : widget.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
              PlatformText(
                ' ${widget.timerPrefix} ${_formatTime(_remainingTime)}',
                style: widget.timerStyle ??
                    TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: widget.secondaryColor,
                    ),
              ),
            ],
          ),
          SizedBox(height: widget.spacing * 2),

          // Verify button
          widget.buttonWidget ?? _buildDefaultButton(),
        ],
      ),
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
