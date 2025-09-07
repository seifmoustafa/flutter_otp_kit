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
      title: 'Flutter OTP Kit Example',
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
  String _selectedExample = 'phone';
  String _lastVerifiedOtp = '';
  final GlobalKey<OtpVerificationWidgetState> _otpKey = GlobalKey();

  void _handleVerification(String otp) {
    setState(() {
      _lastVerifiedOtp = otp;
    });

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('OTP $otp verified successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    });
  }

  void _handleResend() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('OTP resent successfully!'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter OTP Kit Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Example selector
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Example:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Phone OTP'),
                            value: 'phone',
                            groupValue: _selectedExample,
                            onChanged: (value) {
                              setState(() {
                                _selectedExample = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Email OTP'),
                            value: 'email',
                            groupValue: _selectedExample,
                            onChanged: (value) {
                              setState(() {
                                _selectedExample = value!;
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

            // OTP Widget
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    if (_selectedExample == 'phone')
                      OtpVerificationWidget(
                        key: _otpKey,
                        title: 'Verify Phone Number',
                        subtitle:
                            'Enter the 5-digit code sent to {contactInfo}',
                        contactInfo: '01012345678',
                        maskingType: MaskingType.phone,
                        fieldCount: 5,
                        timerDuration: 60,
                        buttonText: 'Verify Phone',
                        resendText: 'Resend Code',
                        timerPrefix: 'after',
                        onVerify: _handleVerification,
                        onResend: _handleResend,
                      )
                    else
                      OtpVerificationWidget(
                        key: _otpKey,
                        title: 'Verify Email Address',
                        subtitle:
                            'Enter the 6-digit code sent to {contactInfo}',
                        contactInfo: 'user@example.com',
                        maskingType: MaskingType.email,
                        fieldCount: 6,
                        timerDuration: 120,
                        buttonText: 'Verify Email',
                        resendText: 'Resend Code',
                        timerPrefix: 'after',
                        onVerify: _handleVerification,
                        onResend: _handleResend,
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Control buttons
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Test Controls:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              _otpKey.currentState?.clearOtp();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('OTP cleared successfully!'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                            icon: const Icon(Icons.clear),
                            label: const Text('Clear OTP'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              _otpKey.currentState?.setOtp('12345');
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Test OTP set to 12345'),
                                  backgroundColor: Colors.blue,
                                ),
                              );
                            },
                            icon: const Icon(Icons.edit),
                            label: const Text('Set Test OTP'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Status display
            if (_lastVerifiedOtp.isNotEmpty)
              Card(
                color: Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Last Verified OTP:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _lastVerifiedOtp,
                        style: const TextStyle(
                            fontSize: 24, fontFamily: 'monospace'),
                      ),
                    ],
                  ),
                ),
              ),

            const SizedBox(height: 20),

            // Package info
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Package Information:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                        '• Cross-platform support (iOS, Android, Web, Desktop)'),
                    const Text('• Fully customizable styling'),
                    const Text('• Smart focus management'),
                    const Text('• Built-in timer functionality'),
                    const Text('• Contact masking for privacy'),
                    const Text('• Full localization support'),
                    const SizedBox(height: 12),
                    const Text(
                      'Visit pub.dev for more information:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text('https://pub.dev/packages/flutter_otp_kit'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
