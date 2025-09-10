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
      title: 'Flutter OTP Kit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const OtpPage(),
    );
  }
}

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: OtpVerificationWidget(
            title: 'Verify Phone Number',
            subtitle: 'Enter the 5-digit code sent to {contactInfo}',
            contactInfo: '01012345678',
            maskingType: MaskingType.phone,
            fieldCount: 5,
            timerDuration: 60,
            buttonText: 'Verify',
            resendText: 'Resend Code',
            timerPrefix: 'after',
            // Comprehensive customization
            layoutType: OtpLayoutType.singleRow,
            fieldAlignment: OtpFieldAlignment.center,
            fieldShape: OtpFieldShape.roundedRectangle,
            animationConfig: OtpAnimationConfig.smooth,
            themeConfig: OtpThemeConfig.material3(context),
            behaviorConfig: const OtpBehaviorConfig(
              enableHapticFeedback: true,
              enableVisualFeedback: true,
              enableAutoSubmit: true,
            ),
            // Responsive spacing controls
            fieldSpacing: 12.0,
            minFieldSpacing: 8.0,
            maxFieldSpacing: 20.0,
            // Enhanced styling
            enableShadow: true,
            enableGradient: true,
            gradientConfig: const OtpGradientConfig(
              colors: [Color(0xFF64B5F6), Color(0xFF1976D2)],
              type: GradientType.linear,
            ),
            onVerify: _handleVerification,
            onResend: _handleResend,
          ),
        ),
      ),
    );
  }

  static void _handleVerification(String otp) {
    print('OTP Verified: $otp');
  }

  static void _handleResend() {
    print('OTP Resent');
  }
}