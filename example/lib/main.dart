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
      home: const OtpDemoPage(),
    );
  }
}

class OtpDemoPage extends StatefulWidget {
  const OtpDemoPage({super.key});

  @override
  State<OtpDemoPage> createState() => _OtpDemoPageState();
}

class _OtpDemoPageState extends State<OtpDemoPage> {
  final GlobalKey<OtpVerificationWidgetState> _otpKey = GlobalKey();
  String _lastVerifiedOtp = '';
  int _verificationCount = 0;
  int _resendCount = 0;

  void _handleVerification(String otp) {
    setState(() {
      _lastVerifiedOtp = otp;
      _verificationCount++;
    });
    
    // Simulate verification process
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('OTP "$otp" verified successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    });
  }

  void _handleResend() {
    setState(() {
      _resendCount++;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('OTP resent! (Count: $_resendCount)'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _clearOtp() {
    _otpKey.currentState?.clearOtp();
  }

  void _setTestOtp() {
    _otpKey.currentState?.setOtp('12345');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter OTP Kit Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Demo Information Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Flutter OTP Kit Demo',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'This demo showcases the flutter_otp_kit package with various configurations. '
                      'Try different features and see how easy it is to implement OTP verification!',
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _clearOtp,
                            icon: const Icon(Icons.clear),
                            label: const Text('Clear OTP'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _setTestOtp,
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
            
            const SizedBox(height: 24),

            // Phone OTP Example
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone OTP Example',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    OtpVerificationWidget(
                      key: _otpKey,
                      title: 'Verify Phone Number',
                      subtitle: 'Enter the 5-digit code sent to {contactInfo}',
                      contactInfo: '01012345678',
                      maskingType: MaskingType.phone,
                      fieldCount: 5,
                      timerDuration: 60,
                      buttonText: 'Verify Phone',
                      resendText: 'Resend Code',
                      timerPrefix: 'after',
                      onVerify: _handleVerification,
                      onResend: _handleResend,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Email OTP Example
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email OTP Example',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    OtpVerificationWidget(
                      title: 'Verify Email Address',
                      subtitle: 'Enter the 6-digit code sent to {contactInfo}',
                      contactInfo: 'user@example.com',
                      maskingType: MaskingType.email,
                      fieldCount: 6,
                      timerDuration: 120,
                      buttonText: 'Verify Email',
                      resendText: 'Resend Code',
                      timerPrefix: 'after',
                      primaryColor: Colors.purple,
                      onVerify: _handleVerification,
                      onResend: _handleResend,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Custom Styled Example
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Custom Styled Example',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    OtpVerificationWidget(
                      title: 'Custom OTP Verification',
                      subtitle: 'Enter the verification code',
                      buttonText: 'Verify',
                      resendText: 'Resend',
                      timerPrefix: 'after',
                      fieldCount: 4,
                      fieldWidth: 70,
                      fieldHeight: 80,
                      borderRadius: 20,
                      spacing: 20,
                      primaryColor: Colors.orange,
                      secondaryColor: Colors.grey[600]!,
                      backgroundColor: Colors.grey[50]!,
                      titleStyle: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                      onVerify: _handleVerification,
                      onResend: _handleResend,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Statistics Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Demo Statistics',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    _buildStatRow('Last Verified OTP:', _lastVerifiedOtp.isEmpty ? 'None' : _lastVerifiedOtp),
                    _buildStatRow('Verification Count:', _verificationCount.toString()),
                    _buildStatRow('Resend Count:', _resendCount.toString()),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Package Information
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Package Information',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'This demo showcases the flutter_otp_kit package features:',
                    ),
                    const SizedBox(height: 8),
                    const Text('• Configurable field count (4, 5, 6, or any number)'),
                    const Text('• Smart auto-navigation between fields'),
                    const Text('• Automatic contact masking (phone/email)'),
                    const Text('• Built-in timer with countdown'),
                    const Text('• Full customization of colors and styling'),
                    const Text('• Cross-platform support (mobile, web, desktop)'),
                    const Text('• Complete localization support'),
                    const SizedBox(height: 16),
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

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
