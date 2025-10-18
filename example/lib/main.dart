import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

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
    _tabController = TabController(length: 8, vsync: this);
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
            Tab(text: 'Advanced'),
            Tab(text: 'Cursors'),
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
          AdvancedExample(),
          CursorsExample(),
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
                'Enhanced OTP Kit - All Features & Fixes',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                '✅ All Critical Bug Fixes Applied:\n'
                '• Error widget displays on verification failure\n'
                '• Custom buttons trigger verification\n'
                '• Fields clear after failed attempts\n'
                '• Async operations handled properly\n'
                '• Real-time field updates\n'
                '• State management integration ready\n'
                '• Enhanced button styling with border radius control',
                style: TextStyle(fontSize: 14, color: Colors.green),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              OtpKit(
                title: 'Verify Phone Number',
                subtitle: 'Enter the code sent to {contactInfo} (try 1234)',
                fieldCount: 4,
                contactInfo: '+1 (555) 123-4567',
                maskingType: MaskingType.phone,

                // Enhanced field configuration
                fieldConfig: OtpFieldConfig(
                  fieldWidth: 60,
                  fieldHeight: 60,
                  borderRadius: 12,
                  borderWidth: 2,
                  primaryColor: Colors.blue,
                  secondaryColor: Colors.grey.shade400,
                  backgroundColor: Colors.white,
                  fieldFontSize: 24,
                  fieldFontWeight: FontWeight.w600,
                  enableShadow: true,
                  shadowBlurRadius: 4,
                  shadowColor: Colors.blue.withOpacity(0.2),
                ),

                // Enhanced button styling with border radius control
                buttonBackgroundColor: Colors.blue,
                buttonTextColor: Colors.white,
                buttonBorderRadius: 25, // Fully rounded button
                buttonHeight: 50,
                buttonWidth: double.infinity,
                buttonElevation: 2,
                buttonPadding: const EdgeInsets.symmetric(vertical: 12),

                // Error configuration for field clearing
                errorConfig: const OtpErrorConfig(
                  clearFieldsOnError: true,
                  enableHapticFeedbackOnError: true,
                  errorHapticFeedbackType: ErrorHapticFeedbackType.medium,
                ),

                // Custom error widget
                errorWidget: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    border: Border.all(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.error_outline, color: Colors.red, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Invalid OTP! Fields will be cleared.',
                        style: TextStyle(
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                // Enhanced callbacks with real-time updates
                onVerify: (otp) async {
                  print('🚀 Verifying OTP: $otp');

                  // Simulate API call with delay
                  await Future.delayed(const Duration(milliseconds: 800));

                  if (otp == '1234') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('✅ Success! OTP $otp is correct'),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                    return true; // Success
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('❌ Error! OTP $otp is incorrect. Try 1234'),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                    return false; // Failure - will trigger error widget and field clearing
                  }
                },
                onResend: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Code resent!'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },

                // Real-time callbacks
                onChanged: (otp) {
                  print('📝 OTP changed: $otp');
                },
                onCompleted: (otp) {
                  print('✅ OTP completed: $otp');
                },
                onErrorStateChanged: (hasError) {
                  print('🚨 Error state changed: $hasError');
                },
                onValidationStateChanged: (isValid) {
                  print('✅ Validation state changed: $isValid');
                },
                onCompletionStateChanged: (isCompleted) {
                  print('🎯 Completion state changed: $isCompleted');
                },
              ),
              const SizedBox(height: 24),
              const Text(
                '🎯 Test Instructions:\n'
                '1. Enter any OTP (e.g., "5678") and click Verify\n'
                '2. Watch the error widget appear and fields clear\n'
                '3. Enter "1234" and click Verify for success\n'
                '4. Notice real-time field updates as you type\n'
                '5. Try the custom button styling and animations',
                style: TextStyle(fontSize: 14, color: Colors.blue),
                textAlign: TextAlign.center,
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
                // Rotate animation for modern example
                animationConfig: const OtpAnimationConfig(
                  enableAnimation: true,
                  enableFieldStateAnimation: true,
                  fieldFillAnimationType: FieldFillAnimationType.rotate,
                  fieldFillRotationRadians: 0.15,
                  errorFieldAnimationType: ErrorFieldAnimationType.bounce,
                  errorShakeAmplitude: 6.0,
                  enableCursorAnimation: true,
                  cursorBlinkDuration: Duration(milliseconds: 700),
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
                // Smart slide animation that detects text direction
                animationConfig: const OtpAnimationConfig(
                  enableAnimation: true,
                  enableFieldStateAnimation: true,
                  fieldFillAnimationType: FieldFillAnimationType.autoSlide,
                  // fieldFillSlideOffset: Offset(6, 0), // Optional: overrides default 6px
                  fieldTransitionDuration: Duration(milliseconds: 120),
                  fieldTransitionCurve: Curves.easeOut,
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
                fieldConfig: const OtpFieldConfig(
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
                  shadowColor: Colors.purple.withValues(alpha: 0.3),
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

class AdvancedExample extends StatelessWidget {
  const AdvancedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                'Advanced Features',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              OtpKit(
                title: 'Enterprise OTP',
                subtitle:
                    'All features enabled - Code sent to {contactInfo} (try 1234)',
                fieldCount: 4,
                fieldSpacing: 12,
                fieldConfig: OtpFieldConfig(
                  fieldWidth: 60,
                  fieldHeight: 60,
                  borderRadius: 15,
                  borderWidth: 2,
                  fieldShape: OtpFieldShape.roundedRectangle,
                  enableShadow: true,
                  shadowColor: Colors.indigo.withValues(alpha: 0.3),
                  shadowBlurRadius: 8,
                  primaryColor: Colors.indigo,
                  backgroundColor: Colors.indigo.shade50,
                  fieldFontSize: 24,
                  fieldFontWeight: FontWeight.w600,
                ),
                animationConfig: const OtpAnimationConfig(
                  enableAnimation: true,
                  animationDuration: Duration(milliseconds: 400),
                  animationCurve: Curves.easeOutCubic,
                  enableFieldStateAnimation: true,
                  fieldTransitionDuration: Duration(milliseconds: 200),
                  fieldFillAnimationType: FieldFillAnimationType.scale,
                  fieldFillSlideOffset: Offset(8, 0),
                  fieldFillRotationRadians: 0.12,
                  errorFieldAnimationType: ErrorFieldAnimationType.pulse,
                  errorShakeAmplitude: 6.0,
                  errorShakeFrequency: 12.0,
                  enableCursorAnimation: true,
                  cursorBlinkDuration: Duration(milliseconds: 800),
                  cursorColor: Colors.indigo,
                  cursorWidth: 2.5,
                  enableDecorationAnimation: true,
                  decorationAnimationDuration: Duration(milliseconds: 300),
                ),
                smsConfig: const OtpSmsConfig(
                  enableSmsAutofill: true,
                  enableSmartAuth: true,
                  enableSmsRetrieverAPI: true,
                  enableSmsUserConsentAPI: true,
                  enableSmsValidation: true,
                  smsValidationRegex: r'\b\d{6}\b',
                  enableSmsErrorHandling: true,
                ),
                performanceConfig: const OtpPerformanceConfig(
                  enableLazyLoading: true,
                  maxVisibleFields: 8,
                  enableMemoryOptimization: true,
                  animationCleanupDelay: Duration(seconds: 3),
                  enableAnimationPooling: true,
                  maxAnimationPoolSize: 12,
                  enableFieldRecycling: true,
                  enableBackgroundCleanup: true,
                  cleanupInterval: Duration(minutes: 2),
                  enablePerformanceMonitoring: true,
                  enableMemoryLeakDetection: true,
                  enableAnimationOptimization: true,
                  enableWidgetOptimization: true,
                ),
                securityConfig: const OtpSecurityConfig(
                  enableRateLimiting: true,
                  maxAttemptsPerMinute: 3,
                  maxAttemptsPerHour: 15,
                  lockoutDuration: Duration(minutes: 10),
                  enableBiometricIntegration: true,
                  biometricTimeout: Duration(seconds: 20),
                  enableAdvancedValidation: true,
                  validationChecksum: false,
                  validationPattern: r'^\d{6}$',
                  enableEncryption: false,
                  enableAuditLogging: true,
                  enableSecurityMonitoring: true,
                  enableAntiTampering: false,
                  enableSessionManagement: true,
                  sessionTimeout: Duration(minutes: 5),
                ),
                errorConfig: const OtpErrorConfig(
                  maxErrorRetries: 3,
                  enableFieldLockout: true,
                  fieldLockoutDuration: Duration(seconds: 30),
                  clearFieldsOnError: true,
                  errorShakeDuration: Duration(milliseconds: 500),
                  errorShakeCount: 3,
                  errorTextMaxLines: 2,
                  showErrorIcon: true,
                  errorIcon: Icons.error_outline,
                  autoClearErrorOnInput: true,
                ),
                primaryColor: Colors.indigo,
                successColor: Colors.green,
                backgroundColor: Colors.white,
                secondaryColor: Colors.grey,
                errorColor: Colors.red,
                contactInfo: 'admin@enterprise.com',
                maskingType: MaskingType.email,
                showTimer: true,
                timerDuration: 120,
                enablePaste: true,
                autoFocus: true,
                enableAutoValidation: true,
                obscureText: false,
                enableInteractiveSelection: true,
                unfocusOnTapOutside: true,
                enableScreenReaderSupport: true,
                onVerify: (otp) async {
                  if (otp == '1234') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('✅ Enterprise Success! OTP $otp verified'),
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 3),
                      ),
                    );
                    return true; // Success
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            '❌ Enterprise Error! OTP $otp invalid. Try 1234'),
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 3),
                      ),
                    );
                    return false; // Failure
                  }
                },
                onResend: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('🔄 Enterprise code resent!'),
                      backgroundColor: Colors.blue,
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                onChanged: (otp) {
                  log('OTP changed: $otp');
                },
                onCompleted: (otp) {
                  log('OTP completed: $otp');
                },
                onTimerChanged: (remaining) {
                  log('Timer: $remaining seconds remaining');
                },
                onErrorStateChanged: (hasError) {
                  log('Error state: $hasError');
                },
                onValidationStateChanged: (isValid) {
                  log('Validation state: $isValid');
                },
                onCompletionStateChanged: (isCompleted) {
                  log('Completion state: $isCompleted');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CursorsExample extends StatelessWidget {
  const CursorsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Cursor Styles',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text('System (default)'),
              const SizedBox(height: 8),
              OtpKit(
                title: 'System Cursor',
                subtitle: 'Default platform caret',
                fieldCount: 4,
                fieldConfig: const OtpFieldConfig(
                  cursorStyle: CursorStyle.system,
                ),
                contactInfo: '+1 555 101 2020',
                onVerify: (_) async => true,
                onResend: () {},
              ),
              const SizedBox(height: 24),
              const Text('Bar cursor'),
              const SizedBox(height: 8),
              OtpKit(
                title: 'Bar Cursor',
                subtitle: 'Custom vertical bar with animation',
                fieldCount: 4,
                fieldConfig: const OtpFieldConfig(
                  cursorStyle: CursorStyle.bar,
                  cursorWidth: 2,
                ),
                animationConfig: const OtpAnimationConfig(
                  enableCursorAnimation: true,
                  cursorBlinkDuration: Duration(milliseconds: 750),
                ),
                primaryColor: Colors.blue,
                onVerify: (_) async => true,
                onResend: () {},
              ),
              const SizedBox(height: 24),
              const Text('Block cursor'),
              const SizedBox(height: 8),
              OtpKit(
                title: 'Block Cursor',
                subtitle: 'Filled block with border',
                fieldCount: 4,
                fieldConfig: const OtpFieldConfig(
                  cursorStyle: CursorStyle.block,
                ),
                animationConfig: const OtpAnimationConfig(
                  enableCursorAnimation: true,
                ),
                primaryColor: Colors.deepPurple,
                onVerify: (_) async => true,
                onResend: () {},
              ),
              const SizedBox(height: 24),
              const Text('Underline cursor'),
              const SizedBox(height: 8),
              OtpKit(
                title: 'Underline Cursor',
                subtitle: 'Thin underline at baseline',
                fieldCount: 4,
                fieldConfig: const OtpFieldConfig(
                  cursorStyle: CursorStyle.underline,
                ),
                animationConfig: const OtpAnimationConfig(
                  enableCursorAnimation: true,
                ),
                primaryColor: Colors.teal,
                onVerify: (_) async => true,
                onResend: () {},
              ),
              const SizedBox(height: 24),
              const Text('Outline cursor'),
              const SizedBox(height: 8),
              OtpKit(
                title: 'Outline Cursor',
                subtitle: 'Rounded rectangle outline',
                fieldCount: 4,
                fieldConfig: const OtpFieldConfig(
                  cursorStyle: CursorStyle.outline,
                ),
                animationConfig: const OtpAnimationConfig(
                  enableCursorAnimation: true,
                ),
                primaryColor: Colors.orange,
                onVerify: (_) async => true,
                onResend: () {},
              ),
              const SizedBox(height: 24),
              const Text('Double bar cursor'),
              const SizedBox(height: 8),
              OtpKit(
                title: 'Double Bar Cursor',
                subtitle: 'Two bars side by side',
                fieldCount: 4,
                fieldConfig: const OtpFieldConfig(
                  cursorStyle: CursorStyle.doubleBar,
                  cursorWidth: 2,
                ),
                animationConfig: const OtpAnimationConfig(
                  enableCursorAnimation: true,
                  cursorBlinkDuration: Duration(milliseconds: 650),
                ),
                primaryColor: Colors.cyan,
                onVerify: (_) async => true,
                onResend: () {},
              ),
              const SizedBox(height: 24),
              const Text('Dashed underline cursor'),
              const SizedBox(height: 8),
              OtpKit(
                title: 'Dashed Underline Cursor',
                subtitle: 'Decorative dashed baseline',
                fieldCount: 4,
                fieldConfig: const OtpFieldConfig(
                  cursorStyle: CursorStyle.dashedUnderline,
                ),
                animationConfig: const OtpAnimationConfig(
                  enableCursorAnimation: true,
                ),
                primaryColor: Colors.brown,
                onVerify: (_) async => true,
                onResend: () {},
              ),
              const SizedBox(height: 24),
              const Text('No cursor (focus visible by border only)'),
              const SizedBox(height: 8),
              OtpKit(
                title: 'No Cursor',
                subtitle: 'Hides caret entirely',
                fieldCount: 4,
                fieldConfig: const OtpFieldConfig(
                  cursorStyle: CursorStyle.none,
                ),
                animationConfig: const OtpAnimationConfig(
                  enableCursorAnimation: false,
                ),
                primaryColor: Colors.grey,
                onVerify: (_) async => true,
                onResend: () {},
              ),
              const SizedBox(height: 24),
              const Text(
                  'Global override from OtpKit (overrides field config)'),
              const SizedBox(height: 8),
              OtpKit(
                title: 'Global Override',
                subtitle: 'OtpKit.cursorStyle wins over fieldConfig',
                fieldCount: 4,
                // Intentionally set a different style at field level
                // fieldConfig: const OtpFieldConfig(cursorStyle: CursorStyle.bar),
                cursorStyle: CursorStyle.outline,
                animationConfig: const OtpAnimationConfig(
                  enableCursorAnimation: true,
                ),
                primaryColor: Colors.black,
                onVerify: (_) async => true,
                onResend: () {},
              ),
              const SizedBox(height: 24),
              const Text('Beam Cap'),
              const SizedBox(height: 8),
              OtpKit(
                title: 'Beam Cap',
                subtitle: 'Vertical beam with top/bottom caps',
                fieldCount: 4,
                fieldConfig:
                    const OtpFieldConfig(cursorStyle: CursorStyle.beamCap),
                animationConfig:
                    const OtpAnimationConfig(enableCursorAnimation: true),
                primaryColor: Colors.deepOrange,
                onVerify: (_) async => true,
                onResend: () {},
              ),
              const SizedBox(height: 24),
              const Text('Beam Notch'),
              const SizedBox(height: 8),
              OtpKit(
                title: 'Beam Notch',
                subtitle: 'Vertical beam with a center notch',
                fieldCount: 4,
                fieldConfig:
                    const OtpFieldConfig(cursorStyle: CursorStyle.beamNotch),
                animationConfig:
                    const OtpAnimationConfig(enableCursorAnimation: true),
                primaryColor: Colors.green,
                onVerify: (_) async => true,
                onResend: () {},
              ),
              const SizedBox(height: 24),
              const Text('Wedge'),
              const SizedBox(height: 8),
              OtpKit(
                title: 'Wedge',
                subtitle: 'Small triangular insertion pointer',
                fieldCount: 4,
                fieldConfig:
                    const OtpFieldConfig(cursorStyle: CursorStyle.wedge),
                animationConfig:
                    const OtpAnimationConfig(enableCursorAnimation: true),
                primaryColor: Colors.redAccent,
                onVerify: (_) async => true,
                onResend: () {},
              ),
              const SizedBox(height: 24),
              const Text('Ring'),
              const SizedBox(height: 8),
              OtpKit(
                title: 'Ring',
                subtitle: 'Circular ring insertion point',
                fieldCount: 4,
                fieldConfig:
                    const OtpFieldConfig(cursorStyle: CursorStyle.ring),
                animationConfig:
                    const OtpAnimationConfig(enableCursorAnimation: true),
                primaryColor: Colors.indigo,
                onVerify: (_) async => true,
                onResend: () {},
              ),
              const SizedBox(height: 24),
              const Text('Strikethrough'),
              const SizedBox(height: 8),
              OtpKit(
                title: 'Strikethrough',
                subtitle: 'Line through the middle',
                fieldCount: 4,
                fieldConfig: const OtpFieldConfig(
                    cursorStyle: CursorStyle.strikethrough),
                animationConfig:
                    const OtpAnimationConfig(enableCursorAnimation: true),
                primaryColor: Colors.blueGrey,
                onVerify: (_) async => true,
                onResend: () {},
              ),
              const SizedBox(height: 24),
              const Text('Double Underline'),
              const SizedBox(height: 8),
              OtpKit(
                title: 'Double Underline',
                subtitle: 'Two lines under baseline',
                fieldCount: 4,
                fieldConfig: const OtpFieldConfig(
                    cursorStyle: CursorStyle.doubleUnderline),
                animationConfig:
                    const OtpAnimationConfig(enableCursorAnimation: true),
                primaryColor: Colors.teal,
                onVerify: (_) async => true,
                onResend: () {},
              ),
              const SizedBox(height: 24),
              const Text('Gradient Bar'),
              const SizedBox(height: 8),
              OtpKit(
                title: 'Gradient Bar',
                subtitle: 'Vertical gradient caret',
                fieldCount: 4,
                fieldConfig: const OtpFieldConfig(
                    cursorStyle: CursorStyle.gradientBar, cursorWidth: 3),
                animationConfig:
                    const OtpAnimationConfig(enableCursorAnimation: true),
                primaryColor: Colors.pink,
                onVerify: (_) async => true,
                onResend: () {},
              ),
              const SizedBox(height: 24),
              const Text('Glow Bar'),
              const SizedBox(height: 8),
              OtpKit(
                title: 'Glow Bar',
                subtitle: 'Beam with soft glow',
                fieldCount: 4,
                fieldConfig: const OtpFieldConfig(
                    cursorStyle: CursorStyle.glowBar, cursorWidth: 2),
                animationConfig:
                    const OtpAnimationConfig(enableCursorAnimation: true),
                primaryColor: Colors.amber,
                onVerify: (_) async => true,
                onResend: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
