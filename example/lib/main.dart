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
      title: 'Flutter OTP Kit Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const OtpDemoScreen(),
    );
  }
}

class OtpDemoScreen extends StatefulWidget {
  const OtpDemoScreen({super.key});

  @override
  State<OtpDemoScreen> createState() => _OtpDemoScreenState();
}

class _OtpDemoScreenState extends State<OtpDemoScreen> {
  String _selectedExample = 'basic';
  bool _hasError = false;
  final GlobalKey<OtpVerificationWidgetState> _basicOtpKey = GlobalKey();
  final GlobalKey<OtpVerificationWidgetState> _widgetOtpKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter OTP Kit Demo'),
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
                      'Select Example:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    RadioListTile<String>(
                      title: const Text('Basic'),
                      value: 'basic',
                      groupValue: _selectedExample,
                      onChanged: (value) {
                        setState(() {
                          _selectedExample = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Widget-Based'),
                      value: 'custom',
                      groupValue: _selectedExample,
                      onChanged: (value) {
                        setState(() {
                          _selectedExample = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Examples
            if (_selectedExample == 'basic') ...[
              // Basic Example
              OtpVerificationWidget(
                key: _basicOtpKey,
                title: 'Verify Phone Number',
                subtitle: 'Enter the code sent to {contactInfo}',
                contactInfo: '+1 (555) 123-4567',
                maskingType: MaskingType.phone,
                buttonText: 'Verify',
                resendText: 'Resend Code',
                timerPrefix: 'Resend in',
                enableAutoValidation:
                    true, // Enable validation to prevent verify with missing fields
                validationMessage:
                    'Please enter all digits', // Custom validation message
                onVerify: (otp) {
                  setState(() {
                    _hasError = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Verifying OTP: $otp'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                onResend: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('OTP resent successfully!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                timerDuration: 60,
                showTimer: true,
                fieldSpacing: 12.0,
                // Completely generic colors - fully customizable
                primaryColor: Colors.blue.shade600,
                secondaryColor: Colors.grey.shade500,
                backgroundColor: Colors.white,
                focusedBorderColor: Colors.blue.shade600,
                completedFieldBorderColor: Colors.green.shade600,
                completedFieldBackgroundColor: Colors.green.shade50,
                completedFieldTextColor: Colors.green.shade800,
                filledFieldBackgroundColor: Colors.grey.shade50,
                defaultBorderColor: Colors.grey.shade300,
                buttonBackgroundColor: Colors.blue.shade600,
                buttonTextColor: Colors.white,
                // Custom error colors
                errorBorderColor: Colors.red.shade600,
                errorBackgroundColor: Colors.red.shade50,
                errorTextColor: Colors.red.shade800,
                hasError: _hasError,
              ),
            ] else ...[
              // Widget-Based Example - Using built-in widget parameters
              OtpVerificationWidget(
                key: _widgetOtpKey,
                title: '', // Empty since we're using titleWidget
                subtitle: '', // Empty since we're using subtitleWidget
                buttonText: 'Verify',
                resendText: 'Resend Code',
                timerPrefix: 'Resend in',
                enableAutoValidation:
                    true, // Enable validation to prevent verify with missing fields
                validationMessage:
                    'Please enter all digits', // Custom validation message
                onVerify: (otp) {
                  setState(() {
                    _hasError = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Verifying OTP: $otp'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                onResend: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('OTP resent successfully!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                timerDuration: 60,
                showTimer: true,
                fieldSpacing: 12.0,
                // Completely generic colors - fully customizable
                primaryColor: Colors.purple.shade600,
                secondaryColor: Colors.grey.shade500,
                backgroundColor: Colors.transparent,
                focusedBorderColor: Colors.blue.shade600,
                completedFieldBorderColor: Colors.green.shade600,
                completedFieldBackgroundColor: Colors.green.shade50,
                completedFieldTextColor: Colors.green.shade800,
                filledFieldBackgroundColor: Colors.grey.shade50,
                defaultBorderColor: Colors.grey.shade300,
                buttonBackgroundColor: Colors.purple.shade600,
                buttonTextColor: Colors.white,
                // Error colors - completely generic
                errorBorderColor: Colors.orange.shade600,
                errorBackgroundColor: Colors.orange.shade50,
                errorTextColor: Colors.orange.shade800,
                hasError: _hasError, // Re-enabled for proper error handling
                // Widget-based customization using built-in parameters
                titleWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.purple.shade600,
                            Colors.blue.shade600,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.shade300,
                            blurRadius: 8,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.security,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.phone_android,
                                color: Colors.purple.shade600,
                                size: 20,
                              ),
                              const SizedBox(width: 6),
                              const Flexible(
                                child: Text(
                                  'Verify Phone Number',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.verified_user,
                                color: Colors.green.shade600,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  'Secure Verification',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.green.shade600,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                subtitleWidget: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade100,
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.message,
                            color: Colors.blue.shade600,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'SMS Code Sent',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Flexible(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                            ),
                            children: [
                              const TextSpan(text: 'Enter the code sent to '),
                              TextSpan(
                                text: '+1 ********67',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple.shade600,
                                ),
                              ),
                            ],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.grey.shade500,
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              'Code expires in 10 minutes',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade500,
                                fontStyle: FontStyle.italic,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verifyButtonWidget: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple.shade600,
                        Colors.blue.shade600,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.shade300,
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Call the verify function from the OTP widget
                      _widgetOtpKey.currentState?.triggerVerify();
                    },
                    icon: const Icon(Icons.check_circle, color: Colors.white),
                    label: const Text(
                      'VERIFY NOW',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                // resendWidget removed to use default resend with timer functionality
                // timerWidget removed to use default timer with countdown
                errorWidget: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.orange.shade300,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Colors.orange.shade600,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          'Invalid OTP. Please try again.',
                          style: TextStyle(
                            color: Colors.orange.shade800,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
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
                            Icons.widgets,
                            color: Colors.purple.shade600,
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Widget-Based Customization',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple.shade800,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'This example demonstrates the complete widget-based customization capabilities:',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildFeatureItem(
                          '🎨 Custom title with gradient icon container'),
                      _buildFeatureItem(
                          '📱 Rich subtitle with message and clock icons'),
                      _buildFeatureItem(
                          '🔘 Custom verify button with gradient and icon'),
                      _buildFeatureItem(
                          '🔄 Styled resend widget with refresh icon'),
                      _buildFeatureItem(
                          '⏰ Custom timer widget with timer icon'),
                      _buildFeatureItem(
                          '❌ Professional error display with icons'),
                      _buildFeatureItem(
                          '🎯 Complete OTP functionality integration'),
                      _buildFeatureItem('⚡ Fully responsive and accessible'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],

            // Test Buttons
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Test Buttons',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _hasError = true;
                            });
                            // Set error state on the current OTP widget
                            if (_selectedExample == 'basic') {
                              _basicOtpKey.currentState?.setErrorState(true);
                            } else {
                              _widgetOtpKey.currentState?.setErrorState(true);
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Error state set!'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          },
                          child: const Text('Set Error'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _hasError = false;
                            });
                            // Clear error state on the current OTP widget
                            if (_selectedExample == 'basic') {
                              _basicOtpKey.currentState?.clearErrorState();
                            } else {
                              _widgetOtpKey.currentState?.clearErrorState();
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Error state cleared!'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          },
                          child: const Text('Clear Error'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _hasError = false;
                            });
                            // Clear all fields on the current OTP widget
                            if (_selectedExample == 'basic') {
                              _basicOtpKey.currentState?.clearOtp();
                            } else {
                              _widgetOtpKey.currentState?.clearOtp();
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('All fields cleared!'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          },
                          child: const Text('Clear All'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _hasError = false;
                            });
                            // Fill test OTP on the current OTP widget
                            if (_selectedExample == 'basic') {
                              _basicOtpKey.currentState?.setOtp('1234');
                            } else {
                              _widgetOtpKey.currentState?.setOtp('1234');
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Test OTP filled!'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          },
                          child: const Text('Fill Test'),
                        ),
                      ],
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

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
