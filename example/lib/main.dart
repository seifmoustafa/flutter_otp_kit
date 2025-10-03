import 'package:flutter/material.dart';
import 'package:flutter_otp_kit/flutter_otp_kit.dart';
import 'package:flutter_otp_kit/src/config/otp_field_config.dart';
import 'package:flutter_otp_kit/src/config/otp_animation_config.dart';
import 'package:flutter_otp_kit/src/config/otp_error_config.dart';

void main() {
  runApp(const OtpKitExampleApp());
}

class OtpKitExampleApp extends StatelessWidget {
  const OtpKitExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OtpKit Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const OtpKitExamplesPage(),
    );
  }
}

class OtpKitExamplesPage extends StatefulWidget {
  const OtpKitExamplesPage({super.key});

  @override
  State<OtpKitExamplesPage> createState() => _OtpKitExamplesPageState();
}

class _OtpKitExamplesPageState extends State<OtpKitExamplesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OtpKit Examples'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Basic'),
            Tab(text: 'Modern'),
            Tab(text: 'Rounded'),
            Tab(text: 'Underlined'),
            Tab(text: 'Animated'),
            Tab(text: 'Custom'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          BasicExample(),
          ModernExample(),
          RoundedExample(),
          UnderlinedExample(),
          AnimatedExample(),
          CustomExample(),
        ],
      ),
    );
  }
}

class BasicExample extends StatelessWidget {
  const BasicExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                'Basic OTP Kit',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              OtpKit(
                title: 'Verify Phone Number',
                subtitle: 'Enter the code sent to {contactInfo} (try 1234)',
                fieldCount: 4,
                contactInfo: '+1 (555) 123-4567',
                maskingType: MaskingType.phone,
                onVerify: (otp) async {
                  if (otp == '1234') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('✅ Success! OTP $otp is correct'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    return true; // Success
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('❌ Error! OTP $otp is incorrect. Try 1234'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return false; // Failure
                  }
                },
                onResend: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Code resent!')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModernExample extends StatelessWidget {
  const ModernExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                'Modern Design',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              OtpKit(
                title: 'Verify Email',
                subtitle:
                    'Enter the verification code sent to {contactInfo} (try 1234)',
                fieldCount: 4,
                fieldConfig: OtpFieldConfig.preset(OtpFieldPreset.modern),
                primaryColor: Colors.purple,
                successColor: Colors.green,
                contactInfo: 'john.doe@company.com',
                maskingType: MaskingType.email,
                onVerify: (otp) async {
                  if (otp == '1234') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('✅ Success! OTP $otp is correct'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    return true; // Success
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('❌ Error! OTP $otp is incorrect. Try 1234'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return false; // Failure
                  }
                },
                onResend: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Code resent!')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedExample extends StatelessWidget {
  const RoundedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                'Rounded Fields',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              OtpKit(
                title: 'Circular Design',
                subtitle:
                    'Enter the 4-digit code sent to {contactInfo} (try 1234)',
                fieldCount: 4,
                fieldConfig: OtpFieldConfig.preset(OtpFieldPreset.rounded),
                primaryColor: Colors.orange,
                successColor: Colors.teal,
                backgroundColor: Colors.white,
                secondaryColor: Colors.grey,
                contactInfo: '+44 20 7946 0958',
                maskingType: MaskingType.phone,
                onVerify: (otp) async {
                  if (otp == '1234') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('✅ Success! OTP $otp is correct'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    return true; // Success
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('❌ Error! OTP $otp is incorrect. Try 1234'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return false; // Failure
                  }
                },
                onResend: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Code resent!')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UnderlinedExample extends StatelessWidget {
  const UnderlinedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                'Underlined Style',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              OtpKit(
                title: 'Underlined Style',
                subtitle:
                    'Minimal Design - Code sent to {contactInfo} (try 1234)',
                fieldCount: 4,
                fieldConfig: OtpFieldConfig.preset(OtpFieldPreset.underlined),
                primaryColor: Colors.black,
                backgroundColor: Colors.transparent,
                contactInfo: 'admin@techstartup.io',
                maskingType: MaskingType.email,
                onVerify: (otp) async {
                  if (otp == '1234') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('✅ Success! OTP $otp is correct'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    return true; // Success
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('❌ Error! OTP $otp is incorrect. Try 1234'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return false; // Failure
                  }
                },
                onResend: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Code resent!')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedExample extends StatelessWidget {
  const AnimatedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                'Advanced Animations',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              OtpKit(
                title: 'Animated Fields',
                subtitle:
                    'Watch the magic happen - Code sent to {contactInfo} (try 1234)',
                fieldCount: 4,
                fieldConfig: OtpFieldConfig(
                  fieldWidth: 60,
                  fieldHeight: 60,
                  borderRadius: 15,
                  borderWidth: 2,
                  enableShadow: true,
                  shadowBlurRadius: 8,
                  primaryColor: Colors.indigo,
                ),
                animationConfig: const OtpAnimationConfig(
                  animationDuration: Duration(milliseconds: 500),
                  animationCurve: Curves.easeInOutCubic,
                  fieldFillAnimationType: FieldFillAnimationType.scale,
                  errorFieldAnimationType: ErrorFieldAnimationType.bounce,
                  errorShakeAmplitude: 6.0,
                  errorShakeFrequency: 15.0,
                ),
                errorConfig: const OtpErrorConfig(
                  errorShakeEffect: true,
                  enableHapticFeedbackOnError: true,
                ),
                primaryColor: Colors.indigo,
                successColor: Colors.pink,
                contactInfo: '+33 1 42 86 83 26',
                maskingType: MaskingType.phone,
                onVerify: (otp) async {
                  if (otp == '1234') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('✅ Success! OTP $otp is correct'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    return true; // Success
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('❌ Error! OTP $otp is incorrect. Try 1234'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return false; // Failure
                  }
                },
                onResend: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Code resent!')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomExample extends StatelessWidget {
  const CustomExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                'Fully Customized',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              OtpKit(
                title: 'Custom Everything',
                subtitle:
                    'Maximum customization - Code sent to {contactInfo} (try 1234)',
                fieldCount: 4,
                fieldSpacing: 16,
                fieldConfig: OtpFieldConfig(
                  fieldWidth: 70,
                  fieldHeight: 70,
                  borderRadius: 20,
                  borderWidth: 3,
                  fieldShape: OtpFieldShape.custom,
                  enableShadow: true,
                  shadowColor: Colors.purple.withOpacity(0.3),
                  shadowBlurRadius: 12,
                  shadowSpreadRadius: 2,
                  primaryColor: Colors.purple,
                  backgroundColor: Colors.purple.shade50,
                  fieldFontSize: 28,
                  fieldFontWeight: FontWeight.bold,
                  cursorColor: Colors.purple,
                  cursorWidth: 3,
                ),
                animationConfig: const OtpAnimationConfig(
                  animationDuration: Duration(milliseconds: 600),
                  animationCurve: Curves.easeOutBack,
                  fieldFillAnimationType: FieldFillAnimationType.rotate,
                  fieldFillRotationRadians: 0.15,
                  errorFieldAnimationType: ErrorFieldAnimationType.wiggle,
                  errorShakeAmplitude: 8.0,
                  errorShakeFrequency: 15.0,
                ),
                errorConfig: const OtpErrorConfig(
                  errorShakeEffect: true,
                  errorShakeDuration: Duration(milliseconds: 800),
                  errorShakeCount: 4,
                  enableHapticFeedbackOnError: true,
                  errorHapticFeedbackType: ErrorHapticFeedbackType.heavy,
                ),
                primaryColor: Colors.purple,
                secondaryColor: Colors.grey.shade600,
                backgroundColor: Colors.white,
                errorColor: Colors.red.shade600,
                contactInfo: 'support@flutter.dev',
                maskingType: MaskingType.email,
                successColor: Colors.green.shade600,
                titleStyle: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
                subtitleStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
                buttonStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                onVerify: (otp) async {
                  if (otp == '1234') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('✅ Success! OTP $otp is correct'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    return true; // Success
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('❌ Error! OTP $otp is incorrect. Try 1234'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return false; // Failure
                  }
                },
                onResend: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Code resent!'),
                      backgroundColor: Colors.purple,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
