import 'package:flutter/material.dart';
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

class VisualStatesDemo extends StatefulWidget {
  const VisualStatesDemo({Key? key}) : super(key: key);

  @override
  State<VisualStatesDemo> createState() => _VisualStatesDemoState();
}

class _VisualStatesDemoState extends State<VisualStatesDemo> {
  final GlobalKey<FlexibleOtpVerificationState> _verificationKey = GlobalKey();
  String _currentState = 'Normal';
  int _attempts = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visual States Demo'),
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

            // State Controls
            _buildStateControls(),
            const SizedBox(height: 32),

            // OTP Verification
            _buildOtpVerification(),
            const SizedBox(height: 32),

            // State Information
            _buildStateInfo(),
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
                  Icons.visibility,
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
                      'Visual States Demo',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Error, completion, and normal states',
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
            'See how the OTP fields change visually based on their state. '
            'Test error states, completion states, and normal interactions.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildStateControls() {
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
            'State Controls',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildControlButton(
                'Simulate Error',
                Icons.error_outline,
                Colors.red,
                () => _simulateError(),
              ),
              _buildControlButton(
                'Clear Error',
                Icons.check_circle_outline,
                Colors.green,
                () => _clearError(),
              ),
              _buildControlButton(
                'Set Success',
                Icons.verified,
                Colors.blue,
                () => _setSuccess(),
              ),
              _buildControlButton(
                'Reset',
                Icons.refresh,
                Colors.orange,
                () => _reset(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton(
    String text,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withOpacity(0.1),
        foregroundColor: color,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: color.withOpacity(0.3)),
        ),
      ),
    );
  }

  Widget _buildOtpVerification() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey[50]!, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: FlexibleOtpVerification(
        key: _verificationKey,
        title: 'Verify Your Phone',
        subtitle: 'We sent a verification code to +1 (555) 123-****',
        otpLength: 4,
        enableResend: true,
        resendTimerDuration: 10,
        themeColor: Theme.of(context).primaryColor,
        onVerify: (otp) {
          _attempts++;
          if (otp == '1234') {
            _setSuccess();
          } else {
            _simulateError();
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
          setState(() {
            _currentState = 'Typing: $value';
          });
        },
        onErrorStateChanged: (hasError) {
          setState(() {
            _currentState = hasError ? 'Error State' : 'Normal State';
          });
        },
      ),
    );
  }

  Widget _buildStateInfo() {
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
            'Current State Information',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          _buildInfoRow('Current State', _currentState),
          _buildInfoRow('Attempts', _attempts.toString()),
          _buildInfoRow('Expected Code', '1234'),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      'Visual States Explained',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '• Normal: Default border and background\n'
                  '• Error: Red border with red background fill\n'
                  '• Completed: Green border with green background fill\n'
                  '• Focused: Primary color border with light background',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.blue[700],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  void _simulateError() {
    setState(() {
      _currentState = 'Error State';
    });
    _verificationKey.currentState?.setError(
      'Invalid code. Try 1234 (Attempt $_attempts)',
    );
  }

  void _clearError() {
    setState(() {
      _currentState = 'Normal State';
    });
    _verificationKey.currentState?.clearError();
  }

  void _setSuccess() {
    setState(() {
      _currentState = 'Success State';
    });
    _verificationKey.currentState?.clearError();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Verification successful!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _reset() {
    setState(() {
      _currentState = 'Normal State';
      _attempts = 0;
    });
    _verificationKey.currentState?.clearError();
    _verificationKey.currentState?.clearOtp();
  }
}
