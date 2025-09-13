import 'package:flutter/material.dart';
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

class VerificationDemo extends StatefulWidget {
  const VerificationDemo({Key? key}) : super(key: key);

  @override
  State<VerificationDemo> createState() => _VerificationDemoState();
}

class _VerificationDemoState extends State<VerificationDemo> {
  final GlobalKey<FlexibleOtpVerificationState> _verificationKey =
      GlobalKey<FlexibleOtpVerificationState>();

  bool _isVerified = false;
  int _attempts = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Verification'),
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

            // Status Display
            _buildStatusDisplay(),
            const SizedBox(height: 24),

            // Verification Widget
            if (!_isVerified) _buildVerificationWidget(),

            // Success Screen
            if (_isVerified) _buildSuccessScreen(),

            const SizedBox(height: 32),

            // Features List
            _buildFeaturesList(),
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
            Theme.of(context).primaryColor.withOpacity(0.1),
            Theme.of(context).primaryColor.withOpacity(0.05),
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
                  Icons.verified_user,
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
                      'Complete Verification Flow',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Full verification with resend timer',
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
            'Complete OTP verification flow with automatic resend timer, '
            'loading states, error handling, and success feedback.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusDisplay() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _isVerified
            ? Colors.green.withOpacity(0.1)
            : Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _isVerified
              ? Colors.green.withOpacity(0.3)
              : Colors.blue.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            _isVerified ? Icons.check_circle : Icons.timer,
            color: _isVerified ? Colors.green : Colors.blue,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _isVerified
                      ? 'Verification Successful!'
                      : 'Verification Pending',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: _isVerified ? Colors.green : Colors.blue,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _isVerified
                      ? 'Your phone number has been verified successfully.'
                      : 'Enter the 4-digit code sent to your phone.',
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

  Widget _buildVerificationWidget() {
    return FlexibleOtpVerification(
      key: _verificationKey,
      title: 'Verify Your Phone',
      subtitle: 'We sent a verification code to +1 (555) 123-****',
      otpLength: 4,
      buttonText: 'Verify Code',
      resendText: 'Resend Code',
      timerText: 'Resend in {time}s',
      themeColor: Theme.of(context).primaryColor,
      enableAutoValidation: true,
      enableResend: true,
      resendTimerDuration: 30, // 30 seconds for demo
      onVerify: (value) async {
        _attempts++;

        // Simulate API call delay
        await Future.delayed(const Duration(seconds: 2));

        if (value == '1234') {
          // Success
          setState(() => _isVerified = true);
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
              content: Text('Invalid code. Try 1234 (Attempt $_attempts)'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      onResend: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('New verification code sent!'),
            backgroundColor: Colors.blue,
          ),
        );
      },
      onOtpChanged: (value) {
        // Clear any previous errors when user starts typing
        if (value.isNotEmpty) {
          _verificationKey.currentState?.clearError();
        }
      },
      onErrorStateChanged: (hasError) {
        // Handle error state changes if needed
      },
      onTimerChanged: (remainingTime) {
        // Handle timer changes if needed
      },
    );
  }

  Widget _buildSuccessScreen() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.green.withOpacity(0.1),
            Colors.green.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 48),
          ),
          const SizedBox(height: 24),
          Text(
            'Verification Complete!',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Your phone number has been successfully verified. '
            'You can now proceed with your account setup.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                _isVerified = false;
                _attempts = 0;
              });
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Try Again'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesList() {
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
            'Features Demonstrated',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          _buildFeatureItem(
            icon: Icons.timer,
            title: 'Automatic Resend Timer',
            description: '30-second countdown with automatic resend button',
          ),
          _buildFeatureItem(
            icon: Icons.error_outline,
            title: 'Error Handling',
            description: 'Real-time validation with error messages',
          ),
          _buildFeatureItem(
            icon: Icons.hourglass_empty,
            title: 'Loading States',
            description: 'Visual feedback during verification process',
          ),
          _buildFeatureItem(
            icon: Icons.check_circle,
            title: 'Success Feedback',
            description: 'Clear success indication and next steps',
          ),
          _buildFeatureItem(
            icon: Icons.refresh,
            title: 'Retry Functionality',
            description: 'Easy retry mechanism for failed attempts',
          ),
        ],
      ),
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
              color: Theme.of(context).primaryColor.withOpacity(0.1),
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
