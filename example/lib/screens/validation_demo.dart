import 'package:flutter/material.dart';
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

class ValidationDemo extends StatefulWidget {
  const ValidationDemo({Key? key}) : super(key: key);

  @override
  State<ValidationDemo> createState() => _ValidationDemoState();
}

class _ValidationDemoState extends State<ValidationDemo> {
  final GlobalKey<FlexibleOtpVerificationState> _verificationKey =
      GlobalKey<FlexibleOtpVerificationState>();

  String _validationMessage = '';
  bool _hasError = false;
  int _attempts = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validation & Error Handling'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _buildHeader(),
            const SizedBox(height: 32),

            // Validation Examples
            _buildValidationExamples(),
            const SizedBox(height: 32),

            // Complete Verification Flow
            _buildCompleteVerification(),
            const SizedBox(height: 32),

            // Error Handling Features
            _buildErrorHandlingFeatures(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor.withValues(alpha: 0.1),
            Theme.of(context).primaryColor.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Validation & Error Handling',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Robust validation with user feedback',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Comprehensive validation system with real-time feedback, '
            'error animations, and user-friendly error messages.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildValidationExamples() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Validation Examples',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),

          // Basic Validation
          _buildExampleSection(
            title: 'Basic Length Validation',
            description: 'Validates that all fields are filled',
            child: FlexibleOtpField(
              length: 4,
              onChanged: (value) {
                setState(() {
                  _validationMessage = value.length == 4
                      ? 'Valid OTP'
                      : 'Enter ${4 - value.length} more digits';
                  _hasError = value.isNotEmpty && value.length < 4;
                });
              },
              onCompleted: (value) {
                setState(() {
                  _validationMessage = 'OTP completed: $value';
                  _hasError = false;
                });
              },
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedDecoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
              ),
              errorDecoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(8),
                color: Colors.red.withValues(alpha: 0.1),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Custom Validation
          _buildExampleSection(
            title: 'Custom Pattern Validation',
            description: 'Validates specific patterns (e.g., starts with 1)',
            child: FlexibleOtpField(
              length: 4,
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty) {
                    if (value.startsWith('1')) {
                      _validationMessage = 'Valid pattern';
                      _hasError = false;
                    } else {
                      _validationMessage = 'Must start with 1';
                      _hasError = true;
                    }
                  } else {
                    _validationMessage = '';
                    _hasError = false;
                  }
                });
              },
              onCompleted: (value) {
                if (value.startsWith('1')) {
                  setState(() {
                    _validationMessage = 'Pattern valid: $value';
                    _hasError = false;
                  });
                } else {
                  setState(() {
                    _validationMessage = 'Invalid pattern';
                    _hasError = true;
                  });
                }
              },
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedDecoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
              ),
              errorDecoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(8),
                color: Colors.red.withValues(alpha: 0.1),
              ),
            ),
          ),

          // Validation Message Display
          if (_validationMessage.isNotEmpty) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _hasError
                    ? Colors.red.withValues(alpha: 0.1)
                    : Colors.green.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _hasError
                      ? Colors.red.withValues(alpha: 0.3)
                      : Colors.green.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    _hasError
                        ? Icons.error_outline
                        : Icons.check_circle_outline,
                    color: _hasError ? Colors.red : Colors.green,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _validationMessage,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: _hasError ? Colors.red : Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildCompleteVerification() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Complete Verification Flow',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            'Full verification with error handling and retry logic',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 20),

          FlexibleOtpVerification(
            key: _verificationKey,
            title: 'Verify Your Code',
            subtitle: 'Enter the 4-digit code sent to your phone',
            otpLength: 4,
            buttonText: 'Verify Code',
            resendText: 'Resend Code',
            timerText: 'Resend in {time}s',
            themeColor: Theme.of(context).primaryColor,
            enableAutoValidation: true,
            enableResend: true,
            resendTimerDuration: 30,
            onVerify: (value) async {
              _attempts++;

              // Simulate API call
              await Future.delayed(const Duration(seconds: 1));

              if (value == '1234') {
                // Success
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Verification successful!'),
                    backgroundColor: Colors.green,
                  ),
                );
                _verificationKey.currentState?.setLoading(false);
              } else {
                // Error
                _verificationKey.currentState?.setError(
                  'Invalid code. Try 1234 (Attempt $_attempts)',
                );
                _verificationKey.currentState?.setLoading(false);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Invalid code. Try 1234 (Attempt $_attempts)',
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            onResend: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('New code sent!'),
                  backgroundColor: Colors.blue,
                ),
              );
            },
            onOtpChanged: (value) {
              // Clear errors when user starts typing
              if (value.isNotEmpty) {
                _verificationKey.currentState?.clearError();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildErrorHandlingFeatures() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Error Handling Features',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),

          _buildFeatureItem(
            icon: Icons.speed,
            title: 'Real-time Validation',
            description: 'Instant feedback as user types',
          ),
          _buildFeatureItem(
            icon: Icons.animation,
            title: 'Error Animations',
            description: 'Smooth animations for error states',
          ),
          _buildFeatureItem(
            icon: Icons.clear_all,
            title: 'Auto Error Clear',
            description: 'Errors clear automatically when user types',
          ),
          _buildFeatureItem(
            icon: Icons.refresh,
            title: 'Retry Logic',
            description: 'Built-in retry mechanism with attempt tracking',
          ),
          _buildFeatureItem(
            icon: Icons.timer,
            title: 'Resend Timer',
            description: 'Automatic resend timer with countdown',
          ),
          _buildFeatureItem(
            icon: Icons.hourglass_empty,
            title: 'Loading States',
            description: 'Visual feedback during verification',
          ),
        ],
      ),
    );
  }

  Widget _buildExampleSection({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
        ),
        const SizedBox(height: 12),
        Center(child: child),
      ],
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Theme.of(context).primaryColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  description,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
