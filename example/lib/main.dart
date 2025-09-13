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
  int _widgetTimer = 0; // Track timer state for custom resend widget
  final GlobalKey<OtpVerificationWidgetState> _basicOtpKey = GlobalKey();
  final GlobalKey<OtpVerificationWidgetState> _widgetOtpKey = GlobalKey();
  final GlobalKey<OtpVerificationWidgetState> _minimalOtpKey = GlobalKey();
  final GlobalKey<OtpVerificationWidgetState> _notitleOtpKey = GlobalKey();

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
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // OTP Widget Examples
            _buildOtpExample(),

            const SizedBox(height: 32),

            // Test Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    if (currentKey.currentState?.hasErrorState == true) {
                      currentKey.currentState?.clearAllErrorStates();
                    } else {
                      currentKey.currentState?.handleVerificationResult(false,
                          errorMessage: 'Test error message');
                    }
                  },
                  child: Text(
                      _getCurrentKey().currentState?.hasErrorState == true
                          ? 'Clear Error'
                          : 'Show Error'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _getCurrentKey().currentState?.clearOtp();
                  },
                  child: const Text('Clear OTP'),
                ),
              ],
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
                        '✅ Error widget shows only for actual errors'),
                    _buildFeatureItem(
                        '✅ Validation message shows only for incomplete input'),
                    _buildFeatureItem('✅ Completely customizable widgets'),
                    _buildFeatureItem(
                        '✅ Optional text parameters with defaults'),
                    _buildFeatureItem('✅ Smart paste detection'),
                    _buildFeatureItem('✅ Auto-focus and navigation'),
                    _buildFeatureItem('✅ Custom resend widget with timer'),
                    _buildFeatureItem(
                        '✅ Automatic verification result handling'),
                    _buildFeatureItem('✅ Built-in resend timer management'),
                    _buildFeatureItem('✅ Real-time state change callbacks'),
                    _buildFeatureItem(
                        '✅ Backend integration ready (Cubit/Bloc)'),
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
      enableAutoValidation: true,
      onVerify: (otp) {
        // Simulate error for demonstration
        if (otp == '1234') {
          // Success - package handles clearing error states automatically
          _basicOtpKey.currentState?.handleVerificationResult(true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('OTP verified successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          // Error - package handles setting error states automatically
          _basicOtpKey.currentState?.handleVerificationResult(false,
              errorMessage: 'Invalid OTP. Please try again.');
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
          _widgetOtpKey.currentState?.handleVerificationResult(false,
              errorMessage: 'Invalid OTP. Please try again.');
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
          _minimalOtpKey.currentState?.handleVerificationResult(false,
              errorMessage: 'Invalid OTP. Please try again.');
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
          _notitleOtpKey.currentState?.handleVerificationResult(false,
              errorMessage: 'Invalid OTP. Please try again.');
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
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
