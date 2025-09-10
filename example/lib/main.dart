import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      darkTheme: ThemeData(
        brightness: Brightness.dark,
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
  String _currentOtp = '';
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

  void _handleOtpChange(String value) {
    setState(() {
      _currentOtp = value;
    });
  }

  void _handleOtpComplete(String otp) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('OTP Complete: $otp'),
        backgroundColor: Colors.orange,
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
                    Wrap(
                      spacing: 8,
                      children: [
                        ChoiceChip(
                          label: const Text('Phone'),
                          selected: _selectedExample == 'phone',
                          onSelected: (selected) {
                            if (selected)
                              setState(() => _selectedExample = 'phone');
                          },
                        ),
                        ChoiceChip(
                          label: const Text('Email'),
                          selected: _selectedExample == 'email',
                          onSelected: (selected) {
                            if (selected)
                              setState(() => _selectedExample = 'email');
                          },
                        ),
                        ChoiceChip(
                          label: const Text('Alphanumeric'),
                          selected: _selectedExample == 'alphanumeric',
                          onSelected: (selected) {
                            if (selected)
                              setState(() => _selectedExample = 'alphanumeric');
                          },
                        ),
                        ChoiceChip(
                          label: const Text('Secure'),
                          selected: _selectedExample == 'secure',
                          onSelected: (selected) {
                            if (selected)
                              setState(() => _selectedExample = 'secure');
                          },
                        ),
                        ChoiceChip(
                          label: const Text('Custom'),
                          selected: _selectedExample == 'custom',
                          onSelected: (selected) {
                            if (selected)
                              setState(() => _selectedExample = 'custom');
                          },
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
                        onChanged: _handleOtpChange,
                        onCompleted: _handleOtpComplete,
                        enableShadow: true,
                        focusedBorderColor: Colors.blue,
                      )
                    else if (_selectedExample == 'email')
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
                        onChanged: _handleOtpChange,
                        onCompleted: _handleOtpComplete,
                        primaryColor: Colors.green,
                        secondaryColor: Colors.grey,
                      )
                    else if (_selectedExample == 'alphanumeric')
                      OtpVerificationWidget(
                        key: _otpKey,
                        title: 'Enter Access Code',
                        subtitle: 'Enter your 6-character access code',
                        buttonText: 'Verify Code',
                        resendText: 'Get New Code',
                        timerPrefix: 'expires in',
                        fieldCount: 6,
                        otpInputType: OtpInputType.alphanumeric,
                        onVerify: _handleVerification,
                        onResend: _handleResend,
                        onChanged: _handleOtpChange,
                        onCompleted: _handleOtpComplete,
                        fieldWidth: 45,
                        fieldHeight: 50,
                        primaryColor: Colors.purple,
                        textCapitalization: TextCapitalization.characters,
                      )
                    else if (_selectedExample == 'secure')
                      OtpVerificationWidget(
                        key: _otpKey,
                        title: 'Secure OTP',
                        subtitle: 'Enter your secure 4-digit PIN',
                        buttonText: 'Confirm',
                        resendText: 'Request New PIN',
                        timerPrefix: 'valid for',
                        fieldCount: 4,
                        otpInputType: OtpInputType.numeric,
                        obscureText: true,
                        onVerify: _handleVerification,
                        onResend: _handleResend,
                        onChanged: _handleOtpChange,
                        onCompleted: _handleOtpComplete,
                        primaryColor: Colors.red,
                        errorBorderColor: Colors.red,
                        focusedBorderColor: Colors.orange,
                      )
                    else
                      OtpVerificationWidget(
                        key: _otpKey,
                        title: 'Custom OTP Example',
                        subtitle: 'Highly customized OTP widget',
                        buttonText: 'Submit',
                        resendText: 'Resend',
                        timerPrefix: 'wait',
                        fieldCount: 5,
                        otpInputType: OtpInputType.custom,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[A-Z0-9]')),
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          if (!RegExp(r'^[A-Z0-9]$').hasMatch(value)) {
                            return 'Invalid';
                          }
                          return null;
                        },
                        onVerify: _handleVerification,
                        onResend: _handleResend,
                        onChanged: _handleOtpChange,
                        onCompleted: _handleOtpComplete,
                        primaryColor: const Color(0xFF6200EA),
                        secondaryColor: const Color(0xFF757575),
                        backgroundColor: const Color(0xFFF5F5F5),
                        focusedBorderColor: const Color(0xFF6200EA),
                        filledFieldBackgroundColor: const Color(0xFFE8F0FE),
                        cursorColor: const Color(0xFF6200EA),
                        enableShadow: true,
                        shadowColor: const Color(0xFF6200EA),
                        borderRadius: 12,
                        fieldWidth: 60,
                        fieldHeight: 65,
                        animationDuration: const Duration(milliseconds: 300),
                        animationCurve: Curves.easeOutBack,
                        showTimer: false,
                        textCapitalization: TextCapitalization.characters,
                        buttonWidget: Container(
                          width: double.infinity,
                          height: 56,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF6200EA), Color(0xFF3700B3)],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF6200EA).withValues(alpha: 0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              _otpKey.currentState?.setOtp('ABCD1');
                              _handleVerification('CUSTOM');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Submit Custom OTP',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
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
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Status:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    if (_currentOtp.isNotEmpty)
                      Row(
                        children: [
                          const Text('Current OTP: '),
                          Text(
                            _currentOtp,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'monospace',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    if (_lastVerifiedOtp.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.check_circle,
                              color: Colors.green, size: 20),
                          const SizedBox(width: 8),
                          const Text('Last Verified: '),
                          Text(
                            _lastVerifiedOtp,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'monospace',
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
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
                    const Text(
                        '• Multiple input types (numeric, alphabetic, alphanumeric)'),
                    const Text('• Paste support from clipboard'),
                    const Text('• Custom input formatters and validators'),
                    const Text('• Animation support with customizable curves'),
                    const Text(
                        '• Enhanced error handling with custom messages'),
                    const Text('• Accessibility features with semantic labels'),
                    const Text('• Secure OTP with obscure text option'),
                    const Text('• Shadow effects and advanced styling'),
                    const Text('• Multiple callbacks (onChanged, onCompleted)'),
                    const Text('• Theme support for light/dark mode'),
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
