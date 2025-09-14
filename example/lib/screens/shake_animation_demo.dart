import 'package:flutter/material.dart';
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

class ShakeAnimationDemo extends StatefulWidget {
  const ShakeAnimationDemo({Key? key}) : super(key: key);

  @override
  State<ShakeAnimationDemo> createState() => _ShakeAnimationDemoState();
}

class _ShakeAnimationDemoState extends State<ShakeAnimationDemo> {
  final GlobalKey<FlexibleOtpVerificationState> _verificationKey = GlobalKey();

  // Animation Configuration
  Duration _shakeDuration = const Duration(milliseconds: 600);
  double _shakeIntensity = 4.0;
  String _currentPreset = 'Default';

  final Map<String, Map<String, dynamic>> _presets = {
    'Default': {
      'duration': Duration(milliseconds: 600),
      'intensity': 4.0,
      'description': 'Smooth shake with moderate intensity',
    },
    'Gentle': {
      'duration': Duration(milliseconds: 400),
      'intensity': 2.0,
      'description': 'Quick, gentle shake',
    },
    'Intense': {
      'duration': Duration(milliseconds: 800),
      'intensity': 8.0,
      'description': 'Long, intense shake',
    },
    'Fast': {
      'duration': Duration(milliseconds: 300),
      'intensity': 3.0,
      'description': 'Quick shake animation',
    },
    'Slow': {
      'duration': Duration(milliseconds: 1000),
      'intensity': 5.0,
      'description': 'Slow, dramatic shake',
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shake Animation Demo'),
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

            // Animation Controls
            _buildAnimationControls(),
            const SizedBox(height: 32),

            // OTP Verification
            _buildOtpVerification(),
            const SizedBox(height: 32),

            // Animation Info
            _buildAnimationInfo(),
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
                  Icons.vibration,
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
                      'Shake Animation Demo',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Customizable shake animations',
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
            'Test different shake animation configurations. '
            'See how duration and intensity affect the shake behavior. '
            'Try entering wrong codes to trigger the animations.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimationControls() {
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
            'Animation Configuration',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),

          // Preset Selection
          Text(
            'Presets',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _presets.keys.map((preset) {
              final isSelected = _currentPreset == preset;
              final presetData = _presets[preset]!;
              return GestureDetector(
                onTap: () => _selectPreset(preset),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Theme.of(context).primaryColor.withValues(alpha: 0.1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.grey[300]!,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        preset,
                        style: TextStyle(
                          color: isSelected
                              ? Theme.of(context).primaryColor
                              : Colors.grey[700],
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        presetData['description'] as String,
                        style: TextStyle(color: Colors.grey[600], fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 20),

          // Duration Slider
          Text(
            'Duration: ${_shakeDuration.inMilliseconds}ms',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Slider(
            value: _shakeDuration.inMilliseconds.toDouble(),
            min: 200,
            max: 1200,
            divisions: 20,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (value) {
              setState(() {
                _shakeDuration = Duration(milliseconds: value.round());
                _currentPreset = 'Custom';
              });
            },
          ),

          const SizedBox(height: 20),

          // Intensity Slider
          Text(
            'Intensity: ${_shakeIntensity.toStringAsFixed(1)}px',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Slider(
            value: _shakeIntensity,
            min: 1.0,
            max: 10.0,
            divisions: 18,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (value) {
              setState(() {
                _shakeIntensity = value;
                _currentPreset = 'Custom';
              });
            },
          ),

          const SizedBox(height: 20),

          // Test Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _testShakeAnimation,
              icon: const Icon(Icons.play_arrow),
              label: const Text('Test Shake Animation'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
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
        otpBuilder: OtpBuilder()
            .length(4)
            .fieldSpacing(10)
            .shakeAnimationDuration(_shakeDuration)
            .shakeAnimationIntensity(_shakeIntensity)
            .showErrorText(
              false,
            ) // Let FlexibleOtpVerification handle error display
            .applyStyle(
              OtpPredefinedStyle.defaultStyle,
              primaryColor: Theme.of(context).primaryColor,
            ),
        onVerify: (otp) {
          if (otp == '1234') {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Verification successful!'),
                backgroundColor: Colors.green,
              ),
            );
            _verificationKey.currentState?.setLoading(false);
          } else {
            _verificationKey.currentState?.setError('Invalid code. Try 1234');
            _verificationKey.currentState?.setLoading(false);
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
      ),
    );
  }

  Widget _buildAnimationInfo() {
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
            'Animation Information',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          _buildInfoRow('Current Preset', _currentPreset),
          _buildInfoRow('Duration', '${_shakeDuration.inMilliseconds}ms'),
          _buildInfoRow('Intensity', '${_shakeIntensity.toStringAsFixed(1)}px'),
          _buildInfoRow('Expected Code', '1234'),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      'Shake Animation Features',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '• Smooth shake animation that returns to center\n'
                  '• No overlapping between fields\n'
                  '• Configurable duration and intensity\n'
                  '• Multiple preset configurations\n'
                  '• Smooth curves for natural movement',
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

  void _selectPreset(String preset) {
    setState(() {
      _currentPreset = preset;
      final presetData = _presets[preset]!;
      _shakeDuration = presetData['duration'] as Duration;
      _shakeIntensity = presetData['intensity'] as double;
    });
  }

  void _testShakeAnimation() {
    _verificationKey.currentState?.setError('Test shake animation');
  }
}
