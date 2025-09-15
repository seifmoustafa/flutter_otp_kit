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
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
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
  int _widgetTimer = 0; // Track timer state for custom resend widget
  final GlobalKey<OtpVerificationWidgetState> _basicOtpKey = GlobalKey();
  final GlobalKey<OtpVerificationWidgetState> _widgetOtpKey = GlobalKey();
  final GlobalKey<OtpVerificationWidgetState> _minimalOtpKey = GlobalKey();
  final GlobalKey<OtpVerificationWidgetState> _notitleOtpKey = GlobalKey();
  final GlobalKey<OtpVerificationWidgetState> _rtlOtpKey = GlobalKey();

  GlobalKey<OtpVerificationWidgetState> _getCurrentKey() {
    switch (_selectedExample) {
      case 'basic':
        return _basicOtpKey;
      case 'widget':
        return _widgetOtpKey;
      case 'minimal':
        return _minimalOtpKey;
      case 'notitle':
        return _notitleOtpKey;
      case 'rtl':
        return _rtlOtpKey;
      case 'tapoutside':
        return _basicOtpKey; // Reuse basic key for tap outside test
      case 'external':
        return _basicOtpKey; // Reuse basic key for external handler test
      default:
        return _basicOtpKey;
    }
  }

  Widget _buildCustomResendWidget() {
    // Use local timer state that gets updated via callback
    final bool isEnabled = _widgetTimer == 0;

    return GestureDetector(
      onTap: isEnabled
          ? () {
              // Trigger the package's resend functionality
              _widgetOtpKey.currentState?.triggerResend();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('OTP resent successfully!'),
                  backgroundColor: Colors.blue,
                ),
              );
            }
          : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: isEnabled ? Colors.green.shade400 : Colors.grey.shade400,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isEnabled ? Colors.transparent : Colors.grey.shade100,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.refresh,
              color: isEnabled ? Colors.green.shade600 : Colors.grey.shade600,
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              isEnabled ? 'Custom Resend' : 'Resend in ${_widgetTimer}s',
              style: TextStyle(
                color: isEnabled ? Colors.green.shade700 : Colors.grey.shade600,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

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
                      title: const Text('Basic Design'),
                      subtitle: const Text('Standard OTP with default styling'),
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
                      subtitle: const Text('Custom widgets for all elements'),
                      value: 'widget',
                      groupValue: _selectedExample,
                      onChanged: (value) {
                        setState(() {
                          _selectedExample = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Minimal'),
                      subtitle: const Text('Minimal design with default text'),
                      value: 'minimal',
                      groupValue: _selectedExample,
                      onChanged: (value) {
                        setState(() {
                          _selectedExample = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('No Title/Subtitle'),
                      subtitle: const Text('Clean design without headers'),
                      value: 'notitle',
                      groupValue: _selectedExample,
                      onChanged: (value) {
                        setState(() {
                          _selectedExample = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('RTL (Arabic)'),
                      subtitle: const Text('Right-to-left layout for Arabic'),
                      value: 'rtl',
                      groupValue: _selectedExample,
                      onChanged: (value) {
                        setState(() {
                          _selectedExample = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Auto Direction'),
                      subtitle: const Text(
                          'Automatically detects app locale direction'),
                      value: 'auto',
                      groupValue: _selectedExample,
                      onChanged: (value) {
                        setState(() {
                          _selectedExample = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Tap Outside Test'),
                      subtitle:
                          const Text('Test tap outside to unfocus fields'),
                      value: 'tapoutside',
                      groupValue: _selectedExample,
                      onChanged: (value) {
                        setState(() {
                          _selectedExample = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('External Handler Test'),
                      subtitle: const Text(
                          'Developer handles tap outside from screen level'),
                      value: 'external',
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

            // OTP Widget Examples
            _buildOtpExample(),

            const SizedBox(height: 32),

            // Test Buttons
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Test All Fixes:',
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
                            _getCurrentKey().currentState?.triggerVerify();
                          },
                          child: const Text('Test Verify'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final currentKey = _getCurrentKey();
                            if (currentKey.currentState?.hasErrorState ==
                                true) {
                              currentKey.currentState?.clearAllErrorStates();
                            } else {
                              currentKey.currentState?.handleVerificationResult(
                                false,
                                errorMessage: 'Test error message',
                              );
                            }
                          },
                          child: Text(
                            _getCurrentKey().currentState?.hasErrorState == true
                                ? 'Clear Error'
                                : 'Show Error',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _getCurrentKey().currentState?.clearOtp();
                          },
                          child: const Text('Clear OTP'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // 🎯 TEST VALIDATION: Show validation message and red borders
                            _getCurrentKey().currentState?.handleBackendState(
                                  isValidating: true,
                                  validationMessage:
                                      'Please complete all fields',
                                );
                          },
                          child: const Text('🎯 Show Validation'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // 🎯 TEST VALIDATION BORDERS: Trigger validation multiple times
                            final currentKey = _getCurrentKey();
                            // First trigger
                            currentKey.currentState?.handleBackendState(
                              isValidating: true,
                              validationMessage: 'Please complete all fields',
                            );
                            // Wait a bit then trigger again to test if borders reappear
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              currentKey.currentState?.handleBackendState(
                                isValidating: true,
                                validationMessage: 'Please complete all fields',
                              );
                            });
                          },
                          child: const Text('🎯 Test Validation Borders'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // 🎯 TEST UNFOCUS: Manually test unfocus functionality
                            print('🎯 Manual unfocus test triggered');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Manual unfocus test - check console for logs'),
                                backgroundColor: Colors.orange,
                              ),
                            );
                          },
                          child: const Text('🎯 Test Unfocus'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Test validation isolation from error
                            final currentKey = _getCurrentKey();
                            // First show error
                            final errorMsg = _selectedExample == 'rtl'
                                ? 'رمز غير صحيح. يرجى المحاولة مرة أخرى.'
                                : 'Invalid OTP. Please try again.';
                            currentKey.currentState?.handleBackendState(
                              hasError: true,
                              errorMessage: errorMsg,
                            );
                            // Then show validation
                            Future.delayed(const Duration(milliseconds: 1000),
                                () {
                              // Use Arabic message for RTL example, English for others
                              final validationMsg = _selectedExample == 'rtl'
                                  ? 'يرجى إدخال جميع الأرقام'
                                  : 'Please complete all fields';
                              currentKey.currentState?.handleBackendState(
                                isValidating: true,
                                validationMessage: validationMsg,
                              );
                            });
                          },
                          child: const Text('Test Error vs Validation'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Test validation borders specifically
                            final currentKey = _getCurrentKey();
                            // Clear any existing states first
                            currentKey.currentState?.clearOtp();
                            // Wait a bit then trigger validation
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              // Use Arabic message for RTL example, English for others
                              final validationMsg = _selectedExample == 'rtl'
                                  ? 'يرجى إدخال جميع الأرقام'
                                  : 'Please complete all fields';
                              currentKey.currentState?.handleBackendState(
                                isValidating: true,
                                validationMessage: validationMsg,
                              );
                            });
                          },
                          child: const Text('Test Validation Borders'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Test RTL field order
                            if (_selectedExample == 'rtl') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('RTL: Fields fill right-to-left!'),
                                  backgroundColor: Colors.blue,
                                ),
                              );
                            }
                          },
                          child: const Text('Test RTL'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Colors.blue.shade600,
                                size: 16,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Fixed Issues',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue.shade700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '✅ RTL/LTR directionality support\n'
                            '✅ Validation borders reappear after clearing\n'
                            '✅ Validation messages disappear when typing\n'
                            '✅ Complete separation of validation vs error states\n'
                            '✅ Proper field spacing in RTL layout',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Features Info
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Features',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildFeatureItem('✅ Automatic error/validation handling'),
                    _buildFeatureItem(
                      '✅ Error widget shows only for actual errors',
                    ),
                    _buildFeatureItem(
                      '✅ Validation message shows only for incomplete input',
                    ),
                    _buildFeatureItem('✅ Completely customizable widgets'),
                    _buildFeatureItem(
                      '✅ Optional text parameters with defaults',
                    ),
                    _buildFeatureItem('✅ Smart paste detection'),
                    _buildFeatureItem('✅ Auto-focus and navigation'),
                    _buildFeatureItem('✅ Custom resend widget with timer'),
                    _buildFeatureItem(
                      '✅ Automatic verification result handling',
                    ),
                    _buildFeatureItem('✅ Built-in resend timer management'),
                    _buildFeatureItem('✅ Real-time state change callbacks'),
                    _buildFeatureItem(
                      '✅ Backend integration ready (Cubit/Bloc)',
                    ),
                    _buildFeatureItem('✅ Custom widget state synchronization'),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.green.shade200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle_outline,
                                color: Colors.green.shade600,
                                size: 16,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Automatic Handling',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green.shade700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'The package automatically handles all error/validation states, verification results, and resend timers. It provides real-time callbacks for custom widgets and is ready for backend integration with Cubit/Bloc patterns. Just call handleVerificationResult() or handleBackendState() - everything else is handled automatically!',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.green.shade600,
                            ),
                          ),
                        ],
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

  Widget _buildOtpExample() {
    switch (_selectedExample) {
      case 'basic':
        return _buildBasicExample();
      case 'widget':
        return _buildWidgetExample();
      case 'minimal':
        return _buildMinimalExample();
      case 'notitle':
        return _buildNoTitleExample();
      case 'rtl':
        return _buildRtlExample();
      case 'auto':
        return _buildAutoDirectionExample();
      case 'tapoutside':
        return _buildTapOutsideExample();
      case 'external':
        return _buildExternalHandlerExample();
      default:
        return _buildBasicExample();
    }
  }

  Widget _buildBasicExample() {
    return OtpVerificationWidget(
      key: _basicOtpKey,
      title: 'Verify Phone Number',
      subtitle: 'Enter the code sent to {contactInfo}',
      contactInfo: '+1 (555) 123-4567',
      maskingType: MaskingType.phone,
      enableAutoValidation:
          true, // 🎯 AUTO-VALIDATION: Shows validation when OTP incomplete
      unfocusOnTapOutside:
          true, // 🎯 TAP OUTSIDE UNFOCUS: Tap anywhere on screen to unfocus (works globally)
      onVerify: (otp) {
        // 🎯 SUPER SIMPLE VERIFICATION LOGIC
        if (otp == '1234') {
          // ✅ SUCCESS: Package automatically clears all states
          _basicOtpKey.currentState?.handleVerificationResult(true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('OTP verified successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          // ❌ ERROR: Package automatically shows error message and red borders
          _basicOtpKey.currentState?.handleVerificationResult(
            false,
            errorMessage: 'Invalid OTP. Please try again.',
          );
        }
      },
      onResend: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('OTP resent successfully!'),
            backgroundColor: Colors.blue,
          ),
        );
      },
    );
  }

  Widget _buildWidgetExample() {
    return OtpVerificationWidget(
      key: _widgetOtpKey,
      titleWidget: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade400, Colors.pink.shade400],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          'Custom Title Widget',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      subtitleWidget: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue.shade200),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.phone, color: Colors.blue.shade600, size: 16),
            const SizedBox(width: 8),
            Text(
              'Code sent to +1 (555) 123-4567',
              style: TextStyle(
                color: Colors.blue.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      verifyButtonWidget: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade400, Colors.red.shade400],
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.shade200,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () => _widgetOtpKey.currentState?.triggerVerify(),
            child: const Center(
              child: Text(
                'Custom Verify Button',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
      resendWidget: _buildCustomResendWidget(),
      enableAutoValidation: true,
      onVerify: (otp) {
        if (otp == '1234') {
          // Success - package handles clearing error states automatically
          _widgetOtpKey.currentState?.handleVerificationResult(true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('OTP verified successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          // Error - package handles setting error states automatically
          _widgetOtpKey.currentState?.handleVerificationResult(
            false,
            errorMessage: 'Invalid OTP. Please try again.',
          );
        }
      },
      onResend: () {
        // Custom resend widget handles its own timer and feedback
        // This callback is still called but we handle the UI in the custom widget
      },
      onTimerChanged: (remainingTime) {
        // Update local timer state to trigger custom widget rebuild
        setState(() {
          _widgetTimer = remainingTime;
        });
      },
      onErrorStateChangedCallback: (hasError) {
        // Handle error state changes for custom widgets
        print('Error state changed: $hasError');
      },
      onValidationStateChanged: (isValidating) {
        // Handle validation state changes for custom widgets
        print('Validation state changed: $isValidating');
      },
      onCompletionStateChanged: (isComplete) {
        // Handle completion state changes for custom widgets
        print('Completion state changed: $isComplete');
      },
    );
  }

  Widget _buildMinimalExample() {
    return OtpVerificationWidget(
      key: _minimalOtpKey,
      // No title/subtitle - clean minimal design
      // All text parameters use defaults
      enableAutoValidation: true,
      onVerify: (otp) {
        if (otp == '1234') {
          // Success - package handles clearing error states automatically
          _minimalOtpKey.currentState?.handleVerificationResult(true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('OTP verified successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          // Error - package handles setting error states automatically
          _minimalOtpKey.currentState?.handleVerificationResult(
            false,
            errorMessage: 'Invalid OTP. Please try again.',
          );
        }
      },
      onResend: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('OTP resent successfully!'),
            backgroundColor: Colors.blue,
          ),
        );
      },
    );
  }

  Widget _buildNoTitleExample() {
    return OtpVerificationWidget(
      key: _notitleOtpKey,
      // No title/subtitle - completely clean design
      enableAutoValidation: true,
      onVerify: (otp) {
        if (otp == '1234') {
          // Success - package handles clearing error states automatically
          _notitleOtpKey.currentState?.handleVerificationResult(true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('OTP verified successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          // Error - package handles setting error states automatically
          _notitleOtpKey.currentState?.handleVerificationResult(
            false,
            errorMessage: 'Invalid OTP. Please try again.',
          );
        }
      },
      onResend: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('OTP resent successfully!'),
            backgroundColor: Colors.blue,
          ),
        );
      },
    );
  }

  Widget _buildRtlExample() {
    return OtpVerificationWidget(
      key: _rtlOtpKey,
      title: 'تحقق من رقم الهاتف', // Arabic title
      subtitle: 'أدخل الرمز المرسل إلى {contactInfo}', // Arabic subtitle
      contactInfo: '+966501234567',
      maskingType: MaskingType.phone,
      buttonText: 'تحقق', // Arabic button text
      resendText: 'إعادة إرسال الرمز', // Arabic resend text
      timerPrefix: 'بعد', // Arabic timer prefix
      validationMessage: Container(
        // 🎨 BEAUTIFUL ARABIC VALIDATION MESSAGE
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.orange.shade50,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.orange.shade300, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.shade100,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Icon(
                Icons.warning_amber_rounded,
                color: Colors.orange.shade700,
                size: 18.0,
              ),
            ),
            const SizedBox(width: 12.0),
            Flexible(
              child: Text(
                'يرجى إدخال جميع الأرقام',
                style: TextStyle(
                  color: Colors.orange.shade800,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      fieldCount: 4,
      fieldSpacing: 8.0,
      enableAutoValidation:
          true, // 🎯 AUTO-VALIDATION: Shows Arabic validation message
      textDirection:
          TextDirection.rtl, // 🌍 FORCE RTL: Arabic layout (right-to-left)
      errorBorderColor: Colors.red.shade600,
      errorBackgroundColor: Colors.red.shade50,
      errorTextColor: Colors.red.shade800,
      onVerify: (otp) {
        if (otp == '1234') {
          // Success - package handles clearing error states automatically
          _rtlOtpKey.currentState?.handleVerificationResult(true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم التحقق بنجاح!'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          // Error - package handles setting error states automatically
          _rtlOtpKey.currentState?.handleVerificationResult(
            false,
            errorMessage: 'رمز غير صحيح. يرجى المحاولة مرة أخرى.',
          );
        }
      },
      onResend: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم إعادة إرسال الرمز بنجاح!'),
            backgroundColor: Colors.blue,
          ),
        );
      },
    );
  }

  Widget _buildAutoDirectionExample() {
    return OtpVerificationWidget(
      key: _rtlOtpKey,
      title: 'Auto Direction Detection',
      subtitle: 'Automatically detects app locale direction',
      contactInfo: '+966501234567',
      maskingType: MaskingType.phone,
      buttonText: 'Verify',
      resendText: 'Resend Code',
      timerPrefix: 'after',
      fieldCount: 4,
      fieldSpacing: 8.0,
      enableAutoValidation: true,
      // No textDirection specified - will auto-detect from app locale
      errorBorderColor: Colors.red.shade600,
      errorBackgroundColor: Colors.red.shade50,
      errorTextColor: Colors.red.shade800,
      onVerify: (otp) {
        if (otp == '1234') {
          _rtlOtpKey.currentState?.handleVerificationResult(true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('OTP verified successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          _rtlOtpKey.currentState?.handleVerificationResult(
            false,
            errorMessage: 'Invalid OTP. Please try again.',
          );
        }
      },
      onResend: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('OTP resent successfully!'),
            backgroundColor: Colors.blue,
          ),
        );
      },
    );
  }

  Widget _buildTapOutsideExample() {
    return Column(
      children: [
        // Instructions card
        Card(
          color: Colors.blue.shade50,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.touch_app, color: Colors.blue.shade700),
                    const SizedBox(width: 8),
                    Text(
                      'Tap Outside Test',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  '🎯 Test the tap outside unfocus feature:',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                _buildFeatureItem('✅ Tap on any OTP field to focus it'),
                _buildFeatureItem(
                    '✅ Tap ANYWHERE on the screen to unfocus and close keyboard'),
                _buildFeatureItem(
                    '✅ Works on app bar, empty space, other UI elements'),
                _buildFeatureItem(
                    '✅ Notice how the blue border disappears when unfocused'),
                _buildFeatureItem(
                    '✅ Try tapping the app bar, empty areas, or other buttons'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        // OTP Widget with tap outside enabled
        OtpVerificationWidget(
          key: _basicOtpKey,
          title: 'Tap Outside Test',
          subtitle: 'Focus a field, then tap outside to unfocus',
          contactInfo: '+1 (555) 123-4567',
          maskingType: MaskingType.phone,
          enableAutoValidation: true,
          unfocusOnTapOutside:
              true, // 🎯 TAP OUTSIDE UNFOCUS: Tap anywhere on screen to unfocus (works globally)
          onVerify: (otp) {
            if (otp == '1234') {
              _basicOtpKey.currentState?.handleVerificationResult(true);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('OTP verified successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
            } else {
              _basicOtpKey.currentState?.handleVerificationResult(
                false,
                errorMessage: 'Invalid OTP. Please try again.',
              );
            }
          },
          onResend: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('OTP resent successfully!'),
                backgroundColor: Colors.blue,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildExternalHandlerExample() {
    return GestureDetector(
      onTap: () {
        // TRUE global screen-level handling
        _basicOtpKey.currentState?.unfocusAllFields();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('🎯 Screen-level handler triggered - fields unfocused!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 1),
          ),
        );
      },
      behavior: HitTestBehavior.translucent,
      child: Column(
        children: [
          // Instructions card
          Card(
            color: Colors.green.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.code, color: Colors.green.shade700),
                      const SizedBox(width: 8),
                      Text(
                        'External Handler Test',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '🎯 Test TRUE global screen-level handling:',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  _buildFeatureItem('✅ GestureDetector wraps entire screen'),
                  _buildFeatureItem(
                      '✅ Tap ANYWHERE on screen (app bar, empty space, etc.)'),
                  _buildFeatureItem(
                      '✅ External handler takes PRIORITY over package handling'),
                  _buildFeatureItem(
                      '✅ Package provides unfocusAllFields() method for external use'),
                  _buildFeatureItem(
                      '✅ Perfect for custom screen-level implementations'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // OTP Widget with external handler
          OtpVerificationWidget(
            key: _basicOtpKey,
            title: 'External Handler Test',
            subtitle: 'Developer handles tap outside from screen level',
            contactInfo: '+1 (555) 123-4567',
            maskingType: MaskingType.phone,
            enableAutoValidation: true,
            unfocusOnTapOutside:
                true, // Package would handle it, but external handler takes priority
            externalTapOutsideHandler: () {
              // This will be called by the package's GestureDetector
              _basicOtpKey.currentState?.unfocusAllFields();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content:
                      Text('🎯 Package handler triggered - fields unfocused!'),
                  backgroundColor: Colors.blue,
                  duration: Duration(seconds: 1),
                ),
              );
            },
            onVerify: (otp) {
              if (otp == '1234') {
                _basicOtpKey.currentState?.handleVerificationResult(true);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('OTP verified successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
              } else {
                _basicOtpKey.currentState?.handleVerificationResult(
                  false,
                  errorMessage: 'Invalid OTP. Please try again.',
                );
              }
            },
            onResend: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('OTP resent successfully!'),
                  backgroundColor: Colors.blue,
                ),
              );
            },
          ),
        ],
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
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
