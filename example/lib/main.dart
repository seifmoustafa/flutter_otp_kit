import 'package:flutter/material.dart';
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter OTP Kit - Comprehensive Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const OtpExamplePage(),
    );
  }
}

class OtpExamplePage extends StatefulWidget {
  const OtpExamplePage({super.key});

  @override
  State<OtpExamplePage> createState() => _OtpExamplePageState();
}

class _OtpExamplePageState extends State<OtpExamplePage> {
  String _selectedExample = 'basic';
  // Store the last verified OTP for potential use in UI
  String _lastVerifiedOtp = '';
  bool _hasError = false;
  final GlobalKey<OtpVerificationWidgetState> _otpKey = GlobalKey();

  void _handleVerification(String otp) {
    setState(() {
      _lastVerifiedOtp = otp;
      _hasError = false; // Clear any previous error
    });

    // Simulate API call with random success/failure
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        // Simulate random verification failure for demo
        final isSuccess = otp != '0000';

        if (isSuccess) {
          setState(() {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('OTP verified successfully: $otp'),
                backgroundColor: Colors.green,
              ),
            );
          });
        } else {
          setState(() {
            _hasError = true;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Invalid OTP. Please try again.'),
                backgroundColor: Colors.red,
              ),
            );
          });
        }
      }
    });
  }

  void _handleResend() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('OTP resent successfully'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter OTP Kit Demo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Select Example:',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        if (_lastVerifiedOtp.isNotEmpty)
                          Text(
                            'Last Verified: $_lastVerifiedOtp',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
              const SizedBox(height: 8),
              _buildExampleSelector(),
              const SizedBox(height: 24),
              _buildSelectedExample(),
              const SizedBox(height: 24),
              _buildTestControls(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExampleSelector() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        _buildChoiceChip('basic', 'Basic'),
        _buildChoiceChip('custom_styling', 'Custom Styling'),
        _buildChoiceChip('widget_customization', 'Custom Widgets'),
        _buildChoiceChip('error_management', 'Error Management'),
        _buildChoiceChip('error_behaviors', 'Error Behaviors'),
        _buildChoiceChip('responsive', 'Responsive'),
        _buildChoiceChip('edge_cases', 'Edge Cases'),
        _buildChoiceChip('architecture', 'Architecture Demo'),
      ],
    );
  }

  Widget _buildChoiceChip(String value, String label) {
    return ChoiceChip(
      label: Text(label),
      selected: _selectedExample == value,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _selectedExample = value;
            _hasError = false;
          });
        }
      },
    );
  }

  Widget _buildSelectedExample() {
    switch (_selectedExample) {
      case 'basic':
        return _buildBasicExample();
      case 'custom_styling':
        return _buildCustomStylingExample();
      case 'widget_customization':
        return _buildWidgetCustomizationExample();
      case 'error_management':
        return _buildErrorManagementExample();
      case 'error_behaviors':
        return _buildErrorBehaviorsExample();
      case 'responsive':
        return _buildResponsiveExample();
      case 'edge_cases':
        return _buildEdgeCasesExample();
      case 'architecture':
        return _buildArchitectureExample();
      default:
        return _buildBasicExample();
    }
  }

  Widget _buildBasicExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Basic Example',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'A simple OTP verification widget with default styling.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        OtpVerificationWidget(
          key: _otpKey,
          title: 'Verify Phone Number',
          subtitle: 'Enter the code sent to {contactInfo}',
          contactInfo: '+1 (555) 123-4567',
          maskingType: MaskingType.phone,
          buttonText: 'Verify',
          resendText: 'Resend Code',
          timerPrefix: 'in',
          onVerify: _handleVerification,
          onResend: _handleResend,
        ),
      ],
    );
  }

  Widget _buildCustomStylingExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Custom Styling Example',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Customized colors, dimensions, and styling.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        OtpVerificationWidget(
          title: 'Verification Code',
          subtitle: 'Enter the code sent to {contactInfo}',
          contactInfo: 'user@example.com',
          maskingType: MaskingType.email,
          buttonText: 'Submit',
          resendText: 'Send Again',
          timerPrefix: 'after',
          fieldCount: 6,
          fieldSpacing: 12.0,
          otpInputType: OtpInputType.numeric,
          primaryColor: Colors.purple,
          secondaryColor: Colors.grey,
          backgroundColor: Colors.grey.shade100,
          defaultBorderColor: Colors.grey.shade300,
          focusedBorderColor: Colors.purple,
          completedFieldBorderColor: Colors.green,
          buttonBackgroundColor: Colors.purple,
          buttonTextColor: Colors.white,
          buttonBorderRadius: 30.0,
          onVerify: _handleVerification,
          onResend: _handleResend,
        ),
      ],
    );
  }

  Widget _buildWidgetCustomizationExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Widget Customization Example',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Custom widgets for title, subtitle, button, etc.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        OtpVerificationWidget(
          titleWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.security, color: Colors.blue),
              SizedBox(width: 8),
              Text('Security Verification',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
            ],
          ),
          subtitleWidget: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(color: Colors.black87, fontSize: 14),
              children: [
                TextSpan(text: 'Enter the code sent to '),
                TextSpan(
                  text: '+1 (555) ***-**67',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          verifyButtonWidget: ElevatedButton.icon(
            onPressed: () {}, // This will be overridden by the widget
            icon: Icon(Icons.check_circle),
            label: Text('VERIFY NOW'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          title: 'Verify', // Fallback
          subtitle: 'Enter code', // Fallback
          buttonText: 'Verify', // Fallback
          resendText: 'Resend',
          timerPrefix: 'in',
          onVerify: _handleVerification,
          onResend: _handleResend,
        ),
      ],
    );
  }

  Widget _buildErrorManagementExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Error State Management Example',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Demonstrates error state handling and styling.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        OtpVerificationWidget(
          title: 'Verify Account',
          subtitle: 'Enter verification code',
          buttonText: 'Verify',
          resendText: 'Resend Code',
          timerPrefix: 'in',
          hasError: _hasError,
          errorText: 'Invalid OTP. Please try again.',
          errorBorderColor: Colors.red,
          errorStateBehavior: ErrorStateBehavior.persistent,
          errorStatePriority: ErrorStatePriority.highest,
          autoClearErrorOnInput: false,
          defaultBorderColor: Colors.grey.shade300,
          onVerify: _handleVerification,
          onResend: _handleResend,
          onErrorStateChanged: () {
            print('Error state changed');
          },
        ),
      ],
    );
  }

  Widget _buildErrorBehaviorsExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Error Behaviors Example',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Different error state behaviors: persistent, auto-clear, timed.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        OtpVerificationWidget(
          title: 'Error Behavior Demo',
          subtitle: 'Enter "0000" to trigger error',
          buttonText: 'Verify',
          resendText: 'Resend Code',
          timerPrefix: 'in',
          hasError: _hasError,
          errorText:
              'Invalid OTP. Error will clear automatically after 3 seconds.',
          errorBorderColor: Colors.red,
          errorStateBehavior: ErrorStateBehavior.timed,
          errorStateDuration: const Duration(seconds: 3),
          errorStatePriority: ErrorStatePriority.highest,
          defaultBorderColor: Colors.grey.shade300,
          onVerify: _handleVerification,
          onResend: _handleResend,
        ),
      ],
    );
  }

  Widget _buildResponsiveExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Responsive Example',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'OTP fields adjust to available width.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        OtpVerificationWidget(
          title: 'Responsive Layout',
          subtitle: 'Fields adjust to screen width',
          buttonText: 'Verify',
          resendText: 'Resend Code',
          timerPrefix: 'in',
          fieldCount: 6,
          layoutType: OtpLayoutType.responsive,
          onVerify: _handleVerification,
          onResend: _handleResend,
        ),
      ],
    );
  }

  Widget _buildEdgeCasesExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Edge Cases Example',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Tests various edge cases like deletion, error states, etc.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        OtpVerificationWidget(
          key: _otpKey,
          title: 'Edge Cases Testing',
          subtitle: 'Try different scenarios',
          buttonText: 'Verify',
          resendText: 'Resend Code',
          timerPrefix: 'in',
          fieldCount: 4,
          defaultBorderColor: Colors.grey.shade300,
          errorBorderColor: Colors.red,
          onVerify: _handleVerification,
          onResend: _handleResend,
        ),
      ],
    );
  }

  Widget _buildArchitectureExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Architecture Demo',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Demonstrates the new component-based architecture.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            // Custom header component
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.architecture, color: Colors.blue),
                      SizedBox(width: 8),
                      Text(
                        'Component Architecture',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Enter the verification code sent to your device',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // OTP fields
            Form(
              child: OtpFieldsRow(
                controllers: List.generate(4, (_) => TextEditingController()),
                focusNodes: List.generate(4, (_) => FocusNode()),
                fieldStates: List.generate(4, (_) => OtpFieldState.empty),
                fieldHasError: List.generate(4, (_) => false),
                onDigitChanged: (value, index) {
                  // Handle digit change
                },
                config: OtpFieldConfig(
                  fieldWidth: 60,
                  fieldHeight: 60,
                  borderRadius: 16,
                  borderWidth: 2,
                  primaryColor: Colors.blue,
                  secondaryColor: Colors.grey,
                  backgroundColor: Colors.white,
                  enableShadow: true,
                  shadowColor: Colors.blue.withAlpha(50),
                  shadowBlurRadius: 8,
                  shadowSpreadRadius: 0,
                ),
                getFieldColors: (index, state, hasError) {
                  // Simple field colors logic
                  if (hasError) {
                    return FieldColors(
                      borderColor: Colors.red,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    );
                  } else if (state == OtpFieldState.focused) {
                    return FieldColors(
                      borderColor: Colors.blue,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    );
                  } else {
                    return FieldColors(
                      borderColor: Colors.grey.shade300,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    );
                  }
                },
                inputFormatters: [],
                keyboardType: TextInputType.number,
                validator: null,
                layoutType: OtpLayoutType.fixed,
                fieldCount: 4,
                fieldSpacing: 12,
                cursorAlignment: TextAlign.center,
              ),
            ),
            SizedBox(height: 24),

            // Error display
            OtpErrorDisplay(
              errorText: 'This is a sample error message',
              errorColor: Colors.red,
              topSpacing: 8,
            ),
            SizedBox(height: 24),

            // Footer with verify button and resend
            OtpFooter(
              onVerifyPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Verify pressed')),
                );
              },
              onResendPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Resend pressed')),
                );
              },
              isLoading: false,
              remainingTime: 30,
              primaryColor: Colors.blue,
              secondaryColor: Colors.grey,
              spacing: 16,
              buttonText: 'Verify Code',
              resendText: 'Resend Code',
              timerPrefix: 'in',
              buttonBackgroundColor: Colors.blue,
              buttonTextColor: Colors.white,
              buttonBorderRadius: 30,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTestControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Test Controls:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            ElevatedButton(
              onPressed: () {
                String currentOtp = _otpKey.currentState?.getCurrentOtp() ?? '';
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Current OTP: $currentOtp'),
                    backgroundColor: Colors.blue,
                  ),
                );
              },
              child: const Text('Get OTP'),
            ),
            ElevatedButton(
              onPressed: () {
                _otpKey.currentState?.clearOtp(
                  refocus: true,
                  clearError: true,
                  callOnChanged: true,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('OTP cleared with refocus'),
                    backgroundColor: Colors.blue,
                  ),
                );
              },
              child: const Text('Clear OTP'),
            ),
            ElevatedButton(
              onPressed: () {
                _otpKey.currentState?.clearOtp(
                  refocus: false,
                  clearError: false,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('OTP cleared without refocus'),
                    backgroundColor: Colors.indigo,
                  ),
                );
              },
              child: const Text('Clear Only'),
            ),
            ElevatedButton(
              onPressed: () {
                _otpKey.currentState?.setOtp('1234');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Set OTP to 1234'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text('Set OTP'),
            ),
            ElevatedButton(
              onPressed: () {
                final isValid = _otpKey.currentState?.isOtpValid() ?? false;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('OTP is ${isValid ? 'valid' : 'invalid'}'),
                    backgroundColor: isValid ? Colors.green : Colors.orange,
                  ),
                );
              },
              child: const Text('Check Valid'),
            ),
            ElevatedButton(
              onPressed: () {
                _otpKey.currentState?.resetFields();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Fields reset'),
                    backgroundColor: Colors.purple,
                  ),
                );
              },
              child: const Text('Reset Fields'),
            ),
            ElevatedButton(
              onPressed: () {
                _otpKey.currentState
                    ?.resetFields(preserveFocus: true, preserveError: true);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Preserved focus & error'),
                    backgroundColor: Colors.teal,
                  ),
                );
              },
              child: const Text('Preserve State'),
            ),
            ElevatedButton(
              onPressed: () {
                _otpKey.currentState?.setErrorState(true);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Error state set'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              child: const Text('Set Error'),
            ),
            ElevatedButton(
              onPressed: () {
                _otpKey.currentState?.clearErrorState();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Error state cleared'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text('Clear Error'),
            ),
          ],
        ),
      ],
    );
  }
}
