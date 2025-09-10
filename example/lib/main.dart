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
                            if (selected) {
                              setState(() => _selectedExample = 'basic');
                            }
                          },
                        ),
                        ChoiceChip(
                          label: const Text('Advanced'),
                          selected: _selectedExample == 'advanced',
                          onSelected: (selected) {
                            if (selected) {
                              setState(() => _selectedExample = 'advanced');
                            }
                          },
                        ),
                        ChoiceChip(
                          label: const Text('Custom'),
                          selected: _selectedExample == 'custom',
                          onSelected: (selected) {
                            if (selected) {
                              setState(() => _selectedExample = 'custom');
                            }
                          },
                        ),
                        ChoiceChip(
                          label: const Text('Responsive'),
                          selected: _selectedExample == 'responsive',
                          onSelected: (selected) {
                            if (selected) {
                              setState(() => _selectedExample = 'responsive');
                            }
                          },
                        ),
                        ChoiceChip(
                          label: const Text('Cursor Control'),
                          selected: _selectedExample == 'cursor',
                          onSelected: (selected) {
                            if (selected) {
                              setState(() => _selectedExample = 'cursor');
                            }
                          },
                        ),
                        ChoiceChip(
                          label: const Text('Field Transitions'),
                          selected: _selectedExample == 'transitions',
                          onSelected: (selected) {
                            if (selected) {
                              setState(() => _selectedExample = 'transitions');
                            }
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
                            'Enter the 4-digit code sent to {contactInfo}',
                        contactInfo: '01012345678',
                        maskingType: MaskingType.phone,
                        fieldCount: 4,
                        fieldHeight: 56,
                        timerDuration: 60,
                        buttonText: 'Verify',
                        resendText: 'Resend Code',
                        timerPrefix: 'after',
                        // New cursor control features - using smart defaults
                        cursorHeight:
                            44, // Auto-calculated as fieldHeight - 12 (56 - 12 = 44)
                        cursorWidth:
                            2.0, // Thicker cursor for better visibility
                        cursorAlignment:
                            CursorAlignment.center, // Perfect center alignment
                        cursorColor: Colors.blue, // Blue cursor to match theme
                        onVerify: _handleVerification,
                        onResend: _handleResend,
                      )
                    else if (_selectedExample == 'advanced')
                      OtpVerificationWidget(
                        key: _otpKey,
                        title: 'Advanced OTP with Animations',
                        subtitle:
                            'Enter the 6-digit code with smooth animations',
                        fieldCount: 4,
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
                        // Custom cursor control
                        // cursorHeight:
                        //     55, // Almost full height for circle fields
                        cursorWidth: 3.0, // Thick cursor for circle fields
                        cursorAlignment:
                            CursorAlignment.center, // Center for circles
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
                    else if (_selectedExample == 'responsive')
                      OtpVerificationWidget(
                        key: _otpKey,
                        title: 'Responsive OTP Layout',
                        subtitle: 'Adapts to different screen sizes',
                        fieldCount: 4,
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
                      )
                    else if (_selectedExample == 'cursor')
                      OtpVerificationWidget(
                        key: _otpKey,
                        title: 'Cursor Control Demo',
                        subtitle:
                            'Showcasing different cursor styles and alignments',
                        fieldCount: 6,
                        fieldHeight: 60,
                        timerDuration: 120,
                        buttonText: 'Verify',
                        resendText: 'Resend',
                        timerPrefix: 'after',
                        // Cursor control showcase - perfect centering
                        cursorHeight:
                            54, // 6px padding (60 - 6) for perfect centering
                        cursorWidth: 2.5, // Medium thickness
                        cursorAlignment:
                            CursorAlignment.center, // Perfect center alignment
                        cursorColor: Colors.orange, // Orange cursor
                        // Styling to make cursor more visible
                        primaryColor: Colors.orange,
                        focusedBorderColor: Colors.orange,
                        fieldWidth: 50,
                        borderRadius: 8,
                        enableShadow: true,
                        shadowColor: Colors.orange.withValues(alpha: 0.3),
                        onVerify: _handleVerification,
                        onResend: _handleResend,
                      )
                    else if (_selectedExample == 'transitions')
                      OtpVerificationWidget(
                        key: _otpKey,
                        title: 'Enhanced Field Transitions',
                        subtitle:
                            'Smooth transitions and progressive highlighting',
                        fieldCount: 6,
                        fieldHeight: 60,
                        timerDuration: 120,
                        buttonText: 'Verify',
                        resendText: 'Resend',
                        timerPrefix: 'after',
                        // Enhanced field transition features
                        fieldTransitionDuration:
                            const Duration(milliseconds: 200),
                        fieldTransitionCurve: Curves.easeInOut,
                        enableFieldStateAnimation: true,
                        completedFieldBorderColor: Colors.green,
                        completedFieldBackgroundColor:
                            Colors.green.withValues(alpha: 0.1),
                        completedFieldTextColor: Colors.green,
                        enableProgressiveHighlighting: true,
                        enableFieldToFieldAnimation: true,
                        fieldToFieldTransitionDuration:
                            const Duration(milliseconds: 150),
                        fieldToFieldTransitionCurve: Curves.easeInOut,
                        transitionHighlightColor:
                            Colors.blue.withValues(alpha: 0.3),
                        // Styling
                        primaryColor: Colors.blue,
                        focusedBorderColor: Colors.blue,
                        filledFieldBackgroundColor:
                            Colors.blue.withValues(alpha: 0.1),
                        fieldWidth: 50,
                        borderRadius: 12,
                        enableShadow: true,
                        shadowColor: Colors.blue.withValues(alpha: 0.2),
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
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Package Features:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                        '• Multiple input types (numeric, alphabetic, alphanumeric, custom)'),
                    Text(
                        '• Comprehensive layout options (single row, wrap, grid, custom)'),
                    Text(
                        '• Advanced field shapes (rectangle, rounded, circle, stadium, custom)'),
                    Text(
                        '• Complete animation control with predefined configs'),
                    Text('• Full theme customization with Material 3 support'),
                    Text('• Responsive spacing with min/max constraints'),
                    Text('• Advanced behavior configuration'),
                    Text('• Comprehensive accessibility support'),
                    Text('• Gradient backgrounds and custom decorations'),
                    Text('• Haptic, sound, and visual feedback'),
                    Text('• Real-time validation and error handling'),
                    Text(
                        '• Advanced cursor control (height, width, alignment)'),
                    Text('• Enhanced field-to-field visual transitions'),
                    Text('• Progressive field highlighting for better UX'),
                    Text('• Smooth field state animations'),
                    Text('• Configurable transition effects and timing'),
                    Text(
                        '• Cross-platform support (iOS, Android, Web, Desktop)'),
                    SizedBox(height: 12),
                    Text(
                      'Visit pub.dev for more information:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('https://pub.dev/packages/flutter_otp_kit'),
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
