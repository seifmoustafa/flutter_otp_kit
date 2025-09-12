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
      title: 'Flutter OTP Kit - Visual States Demo',
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
  String _lastVerifiedOtp = '';
  bool _hasError = false;
  final GlobalKey<OtpVerificationWidgetState> _otpKey = GlobalKey();

  void _handleVerification(String otp) {
    setState(() {
      _lastVerifiedOtp = otp;
      _hasError = false;
    });

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        // Simulate verification failure for demo
        final isSuccess = otp != '0000';

        if (isSuccess) {
          _showSuccessDialog(otp);
        } else {
          setState(() {
            _hasError = true;
          });
          _otpKey.currentState?.setErrorState(true);
        }
      }
    });
  }

  void _showSuccessDialog(String otp) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success!'),
        content: Text('OTP $otp verified successfully!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _otpKey.currentState?.clearOtp();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _handleResend() {
    setState(() {
      _hasError = false;
    });
    _otpKey.currentState?.clearOtp();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('New OTP sent!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('OTP Kit - Visual States Demo'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Example Selection
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Choose Example:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Basic'),
                            value: 'basic',
                            groupValue: _selectedExample,
                            onChanged: (value) {
                              setState(() {
                                _selectedExample = value!;
                                _hasError = false;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Widget'),
                            value: 'custom',
                            groupValue: _selectedExample,
                            onChanged: (value) {
                              setState(() {
                                _selectedExample = value!;
                                _hasError = false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Visual States Guide
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Visual States Guide (Fully Customizable):',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildStateGuide('🔵 Focused',
                        'Customizable border color - cursor is on this field'),
                    _buildStateGuide('🟢 Filled',
                        'Customizable border color - field has a value'),
                    _buildStateGuide('🟢 Completed',
                        'Customizable border + fill color - all fields are complete'),
                    _buildStateGuide('⚫ Empty',
                        'Customizable border color - field is empty and unfocused'),
                    _buildStateGuide('🔴 Error',
                        'Customizable border + fill color - verification failed'),
                    const SizedBox(height: 8),
                    const Text(
                      'All colors are configurable via OtpVerificationWidget parameters!',
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // OTP Widget
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Text(
                      'Verify Phone Number',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Enter the code sent to +1 ********67',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // OTP Widget based on selection
                    if (_selectedExample == 'basic') ...[
                      // String-Based Example - Simple text strings
                      OtpVerificationWidget(
                        key: _otpKey,
                        title: 'Verify Phone Number',
                        subtitle: 'Enter the code sent to +1 ********67',
                        buttonText: 'Verify',
                        resendText: 'Resend Code',
                        timerPrefix: 'Resend in',
                        onVerify: _handleVerification,
                        onResend: _handleResend,
                        fieldCount: 4,
                        onChanged: (value) {
                          setState(() {
                            _hasError = false;
                          });
                        },
                        timerDuration: 60,
                        showTimer: true,
                        // Completely generic colors - fully customizable
                        primaryColor: Colors.blue.shade600,
                        secondaryColor: Colors.grey.shade400,
                        backgroundColor: Colors.white,
                        focusedBorderColor: Colors.blue.shade600,
                        completedFieldBorderColor: Colors.green.shade600,
                        completedFieldBackgroundColor: Colors.green.shade50,
                        completedFieldTextColor: Colors.green.shade700,
                        defaultBorderColor: Colors.grey.shade400,
                        filledFieldBackgroundColor: Colors.transparent,
                        buttonBackgroundColor: Colors.blue.shade600,
                        buttonTextColor: Colors.white,
                        // Custom error colors
                        errorBorderColor: Colors.red.shade600,
                        errorBackgroundColor: Colors.red.shade50,
                        errorTextColor: Colors.red.shade800,
                      ),
                    ] else ...[
                      // Widget-Based Example - Custom widgets with icons and rich content
                      Container(
                        padding: const EdgeInsets.all(24.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.purple.shade50,
                              Colors.blue.shade50,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.purple.shade200,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            // Custom Header with Icon
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.purple.shade600,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.security,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                const Text(
                                  'Verify Phone Number',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            // Custom Subtitle with Rich Text
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade700,
                                  ),
                                  children: [
                                    const TextSpan(
                                        text: 'Enter the code sent to '),
                                    TextSpan(
                                      text: '+1 ********67',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 24),

                            // The OTP Widget
                            OtpVerificationWidget(
                              key: _otpKey,
                              title: '', // Empty since we have custom header
                              subtitle:
                                  '', // Empty since we have custom subtitle
                              buttonText: 'Verify',
                              resendText: 'Resend Code',
                              timerPrefix: 'Resend in',
                              onVerify: _handleVerification,
                              onResend: _handleResend,
                              fieldCount: 4,
                              onChanged: (value) {
                                setState(() {
                                  _hasError = false;
                                });
                              },
                              timerDuration: 60,
                              showTimer: true,
                              fieldSpacing: 16.0,
                              // Completely generic colors - fully customizable
                              primaryColor: Colors.purple.shade600,
                              secondaryColor: Colors.grey.shade500,
                              backgroundColor: Colors.transparent,
                              focusedBorderColor: Colors.blue.shade600,
                              completedFieldBorderColor: Colors.green.shade600,
                              completedFieldBackgroundColor:
                                  Colors.green.shade50,
                              completedFieldTextColor: Colors.green.shade700,
                              defaultBorderColor: Colors.grey.shade400,
                              filledFieldBackgroundColor: Colors.transparent,
                              enableProgressiveHighlighting: true,
                              buttonBackgroundColor: Colors.purple.shade600,
                              buttonTextColor: Colors.white,
                              // Custom error colors (different from basic example)
                              errorBorderColor: Colors.orange.shade600,
                              errorBackgroundColor: Colors.orange.shade50,
                              errorTextColor: Colors.orange.shade800,
                              buttonBorderRadius: 12.0,
                              buttonHeight: 56.0,
                              // Custom styles for widgets
                              titleStyle: const TextStyle(
                                fontSize: 0, // Hide default title
                              ),
                              subtitleStyle: const TextStyle(
                                fontSize: 0, // Hide default subtitle
                              ),
                              buttonStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    const SizedBox(height: 32),

                    // Widget-Based Customization Info
                    if (_selectedExample == 'custom') ...[
                      Card(
                        color: Colors.purple.shade50,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: Colors.purple.shade600,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Widget-Based Customization',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'This example shows how to create custom layouts with:',
                                style: TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 8),
                              _buildFeatureItem('🔒 Custom header with icon'),
                              _buildFeatureItem('🎨 Gradient background'),
                              _buildFeatureItem(
                                  '📱 Rich text with styled phone number'),
                              _buildFeatureItem(
                                  '🎯 Custom container with borders'),
                              _buildFeatureItem(
                                  '⚡ Fully integrated OTP functionality'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],

                    // Test Buttons
                    const Text(
                      'Test Buttons:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _otpKey.currentState?.setErrorState(true);
                            setState(() {
                              _hasError = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade600,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Set Error'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _otpKey.currentState?.clearErrorState();
                            setState(() {
                              _hasError = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade600,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Clear Error'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _otpKey.currentState?.clearOtp();
                            setState(() {
                              _hasError = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange.shade600,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Clear All'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _otpKey.currentState?.setOtp('1234');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple.shade600,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Fill Test'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Status Display
            if (_lastVerifiedOtp.isNotEmpty || _hasError)
              Card(
                color: _hasError ? Colors.red.shade50 : Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(
                        _hasError ? Icons.error : Icons.check_circle,
                        color: _hasError
                            ? Colors.red.shade600
                            : Colors.green.shade600,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _hasError
                              ? 'Verification failed! Try again.'
                              : 'Last verified: $_lastVerifiedOtp',
                          style: TextStyle(
                            color: _hasError
                                ? Colors.red.shade800
                                : Colors.green.shade800,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStateGuide(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              description,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String feature) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              feature,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
