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
                          label: const Text('Basic'),
                          selected: _selectedExample == 'basic',
                          onSelected: (selected) {
                            if (selected)
                              setState(() => _selectedExample = 'basic');
                          },
                        ),
                        ChoiceChip(
                          label: const Text('Advanced'),
                          selected: _selectedExample == 'advanced',
                          onSelected: (selected) {
                            if (selected)
                              setState(() => _selectedExample = 'advanced');
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
                        ChoiceChip(
                          label: const Text('Responsive'),
                          selected: _selectedExample == 'responsive',
                          onSelected: (selected) {
                            if (selected)
                              setState(() => _selectedExample = 'responsive');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // OTP Widget Examples
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    if (_selectedExample == 'basic')
                      OtpVerificationWidget(
                        key: _otpKey,
                        title: 'Basic OTP Verification',
                        subtitle:
                            'Enter the 5-digit code sent to {contactInfo}',
                        contactInfo: '01012345678',
                        maskingType: MaskingType.phone,
                        fieldCount: 5,
                        timerDuration: 60,
                        buttonText: 'Verify',
                        resendText: 'Resend Code',
                        timerPrefix: 'after',
                        onVerify: _handleVerification,
                        onResend: _handleResend,
                      )
                    else if (_selectedExample == 'advanced')
                      OtpVerificationWidget(
                        key: _otpKey,
                        title: 'Advanced OTP with Animations',
                        subtitle:
                            'Enter the 6-digit code with smooth animations',
                        fieldCount: 6,
                        timerDuration: 120,
                        buttonText: 'Verify',
                        resendText: 'Resend',
                        timerPrefix: 'expires in',
                        // Advanced features
                        otpInputType: OtpInputType.alphanumeric,
                        textCapitalization: TextCapitalization.characters,
                        enableShadow: true,
                        enableGradient: true,
                        gradientConfig: const OtpGradientConfig(
                          colors: [Color(0xFF64B5F6), Color(0xFF1976D2)],
                          type: GradientType.linear,
                        ),
                        animationConfig: OtpAnimationConfig.smooth,
                        themeConfig: OtpThemeConfig.material3(context),
                        behaviorConfig: const OtpBehaviorConfig(
                          enableHapticFeedback: true,
                          enableVisualFeedback: true,
                          enableAutoSubmit: true,
                        ),
                        onVerify: _handleVerification,
                        onResend: _handleResend,
                      )
                    else if (_selectedExample == 'custom')
                      OtpVerificationWidget(
                        key: _otpKey,
                        title: 'Custom Styled OTP',
                        subtitle: 'Fully customized appearance and behavior',
                        fieldCount: 4,
                        timerDuration: 90,
                        buttonText: 'Submit',
                        resendText: 'Get New Code',
                        timerPrefix: 'valid for',
                        // Custom styling
                        fieldShape: OtpFieldShape.circle,
                        fieldWidth: 60,
                        fieldHeight: 60,
                        borderRadius: 30,
                        primaryColor: Colors.purple,
                        secondaryColor: Colors.grey,
                        backgroundColor: Colors.purple.shade50,
                        focusedBorderColor: Colors.purple,
                        filledFieldBackgroundColor: Colors.purple.shade100,
                        cursorColor: Colors.purple,
                        enableShadow: true,
                        shadowColor: Colors.purple,
                        shadowBlurRadius: 15,
                        shadowSpreadRadius: 2,
                        // Custom animations
                        animationConfig: OtpAnimationConfig.fast,
                        // Custom behavior
                        behaviorConfig: const OtpBehaviorConfig(
                          enableHapticFeedback: true,
                          enableSoundFeedback: true,
                          enableAutoSubmit: true,
                          enableAutoClearOnError: true,
                        ),
                        onVerify: _handleVerification,
                        onResend: _handleResend,
                      )
                    else
                      OtpVerificationWidget(
                        key: _otpKey,
                        title: 'Responsive OTP Layout',
                        subtitle: 'Adapts to different screen sizes',
                        fieldCount: 8,
                        timerDuration: 180,
                        buttonText: 'Verify',
                        resendText: 'Resend',
                        timerPrefix: 'after',
                        // Responsive features
                        layoutType: OtpLayoutType.wrap,
                        fieldAlignment: OtpFieldAlignment.center,
                        fieldSpacing: 8.0,
                        minFieldSpacing: 4.0,
                        maxFieldSpacing: 16.0,
                        fieldWidth: 45,
                        fieldHeight: 50,
                        // Responsive styling
                        enableShadow: true,
                        animationConfig: OtpAnimationConfig.defaultConfig,
                        themeConfig: OtpThemeConfig.light,
                        behaviorConfig: const OtpBehaviorConfig(
                          enableVisualFeedback: true,
                          enableAutoFocusNext: true,
                          enableKeyboardNavigation: true,
                        ),
                        onVerify: _handleVerification,
                        onResend: _handleResend,
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Test Controls
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

            // Package features
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Package Features:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                        '• Multiple input types (numeric, alphabetic, alphanumeric, custom)'),
                    const Text(
                        '• Comprehensive layout options (single row, wrap, grid, custom)'),
                    const Text(
                        '• Advanced field shapes (rectangle, rounded, circle, stadium, custom)'),
                    const Text(
                        '• Complete animation control with predefined configs'),
                    const Text(
                        '• Full theme customization with Material 3 support'),
                    const Text('• Responsive spacing with min/max constraints'),
                    const Text('• Advanced behavior configuration'),
                    const Text('• Comprehensive accessibility support'),
                    const Text('• Gradient backgrounds and custom decorations'),
                    const Text('• Haptic, sound, and visual feedback'),
                    const Text('• Real-time validation and error handling'),
                    const Text(
                        '• Cross-platform support (iOS, Android, Web, Desktop)'),
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
