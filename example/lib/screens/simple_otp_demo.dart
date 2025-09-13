import 'package:flutter/material.dart';
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

class SimpleOtpDemo extends StatefulWidget {
  const SimpleOtpDemo({Key? key}) : super(key: key);

  @override
  State<SimpleOtpDemo> createState() => _SimpleOtpDemoState();
}

class _SimpleOtpDemoState extends State<SimpleOtpDemo> {
  String _resultMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple OTP Field'),
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

            // Basic OTP Field
            _buildSection(
              title: 'Basic OTP Field',
              description: 'Default 4-digit OTP field with basic styling',
              child: FlexibleOtpField(
                length: 4,
                onChanged: (value) {
                  setState(() {
                    _resultMessage = 'Current value: $value';
                  });
                },
                onCompleted: (value) {
                  setState(() {
                    _resultMessage = 'Completed with: $value';
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('OTP completed: $value')),
                  );
                },
              ),
            ),

            const SizedBox(height: 32),

            // 6-digit OTP Field
            _buildSection(
              title: '6-Digit OTP Field',
              description: 'Common for banking and financial apps',
              child: FlexibleOtpField(
                length: 6,
                fieldWidth: 45,
                fieldHeight: 55,
                fieldSpacing: 8,
                onChanged: (value) {
                  setState(() {
                    _resultMessage = 'Current value: $value';
                  });
                },
                onCompleted: (value) {
                  setState(() {
                    _resultMessage = 'Completed with: $value';
                  });
                },
              ),
            ),

            const SizedBox(height: 32),

            // Obscured OTP Field
            _buildSection(
              title: 'Obscured OTP Field',
              description: 'Password-like input with hidden characters',
              child: FlexibleOtpField(
                length: 4,
                obscureText: true,
                obscuringCharacter: '●',
                onChanged: (value) {
                  setState(() {
                    _resultMessage = 'Current value: $value';
                  });
                },
                onCompleted: (value) {
                  setState(() {
                    _resultMessage = 'Completed with: $value';
                  });
                },
              ),
            ),

            const SizedBox(height: 32),

            // Result Display
            if (_resultMessage.isNotEmpty) _buildResultDisplay(),
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
                child: const Icon(Icons.numbers, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Simple OTP Fields',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Basic OTP input fields',
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
            'Start with these simple OTP field implementations. Perfect for '
            'basic authentication flows and quick prototyping.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String description,
    required Widget child,
  }) {
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
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 20),
          Center(child: child),
        ],
      ),
    );
  }

  Widget _buildResultDisplay() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: Theme.of(context).primaryColor,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              _resultMessage,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
