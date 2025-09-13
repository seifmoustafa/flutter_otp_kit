import 'package:flutter/material.dart';
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

class AnimationsDemo extends StatefulWidget {
  const AnimationsDemo({Key? key}) : super(key: key);

  @override
  State<AnimationsDemo> createState() => _AnimationsDemoState();
}

class _AnimationsDemoState extends State<AnimationsDemo> {
  FieldAnimationType _selectedAnimation = FieldAnimationType.scale;
  Duration _animationDuration = const Duration(milliseconds: 300);
  Curve _animationCurve = Curves.easeInOut;
  bool _animateFields = true;
  String _otpValue = '';

  final List<FieldAnimationType> _animationTypes = [
    FieldAnimationType.none,
    FieldAnimationType.scale,
    FieldAnimationType.rotate,
    FieldAnimationType.slide,
    FieldAnimationType.fade,
  ];

  final List<Curve> _curveOptions = [
    Curves.linear,
    Curves.easeInOut,
    Curves.bounceOut,
    Curves.elasticOut,
    Curves.easeOutBack,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
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
            const SizedBox(height: 24),

            // Live Preview
            _buildLivePreview(),
            const SizedBox(height: 32),

            // Animation Examples
            _buildAnimationExamples(),
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
                  Icons.animation,
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
                      'Field Animations',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Bring your OTP fields to life',
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
            'Add smooth animations to your OTP fields for better user experience. '
            'Choose from scale, rotate, slide, and fade animations with customizable timing.',
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
            'Animation Controls',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),

          // Enable/Disable Animation
          Row(
            children: [
              Switch(
                value: _animateFields,
                onChanged: (value) {
                  setState(() {
                    _animateFields = value;
                  });
                },
                activeColor: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 12),
              Text(
                'Enable Animations',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),

          if (_animateFields) ...[
            const SizedBox(height: 20),

            // Animation Type
            Text(
              'Animation Type',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _animationTypes.map((type) {
                final isSelected = _selectedAnimation == type;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedAnimation = type;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).primaryColor.withOpacity(0.1)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected
                            ? Theme.of(context).primaryColor
                            : Colors.grey[300]!,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Text(
                      _getAnimationTypeName(type),
                      style: TextStyle(
                        color: isSelected
                            ? Theme.of(context).primaryColor
                            : Colors.grey[700],
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // Duration
            Text(
              'Duration: ${_animationDuration.inMilliseconds}ms',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Slider(
              value: _animationDuration.inMilliseconds.toDouble(),
              min: 100,
              max: 1000,
              divisions: 9,
              activeColor: Theme.of(context).primaryColor,
              onChanged: (value) {
                setState(() {
                  _animationDuration = Duration(milliseconds: value.round());
                });
              },
            ),

            const SizedBox(height: 20),

            // Curve
            Text(
              'Animation Curve',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _curveOptions.map((curve) {
                final isSelected = _animationCurve == curve;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _animationCurve = curve;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).primaryColor.withOpacity(0.1)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected
                            ? Theme.of(context).primaryColor
                            : Colors.grey[300]!,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Text(
                      _getCurveName(curve),
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
                  ),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildLivePreview() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.05),
            Theme.of(context).primaryColor.withOpacity(0.02),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          Text(
            'Live Preview',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _animateFields
                ? '${_getAnimationTypeName(_selectedAnimation)} Animation'
                : 'No Animation',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 24),
          Center(
            child: FlexibleOtpField(
              length: 4,
              onChanged: (value) {
                setState(() {
                  _otpValue = value;
                });
              },
              onCompleted: (value) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Completed: $value')));
              },
              animateFields: _animateFields,
              fieldAnimationType: _selectedAnimation,
              animationDuration: _animationDuration,
              animationCurve: _animationCurve,
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
                color: Theme.of(context).primaryColor.withOpacity(0.1),
              ),
            ),
          ),
          if (_otpValue.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              'Current value: $_otpValue',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAnimationExamples() {
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
            'Animation Examples',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),

          // Scale Animation
          _buildExampleItem(
            title: 'Scale Animation',
            description: 'Fields grow slightly when filled',
            animationType: FieldAnimationType.scale,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          ),

          // Rotate Animation
          _buildExampleItem(
            title: 'Rotate Animation',
            description: 'Subtle rotation effect on input',
            animationType: FieldAnimationType.rotate,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          ),

          // Slide Animation
          _buildExampleItem(
            title: 'Slide Animation',
            description: 'Fields slide up when filled',
            animationType: FieldAnimationType.slide,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
          ),

          // Fade Animation
          _buildExampleItem(
            title: 'Fade Animation',
            description: 'Opacity changes for smooth transitions',
            animationType: FieldAnimationType.fade,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          ),
        ],
      ),
    );
  }

  Widget _buildExampleItem({
    required String title,
    required String description,
    required FieldAnimationType animationType,
    required Duration duration,
    required Curve curve,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
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
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 120,
            child: FlexibleOtpField(
              length: 2,
              animateFields: true,
              fieldAnimationType: animationType,
              animationDuration: duration,
              animationCurve: curve,
              fieldWidth: 30,
              fieldHeight: 40,
              fieldSpacing: 8,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(6),
              ),
              focusedDecoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(6),
                color: Theme.of(context).primaryColor.withOpacity(0.1),
              ),
              onChanged: (value) {},
              onCompleted: (value) {},
            ),
          ),
        ],
      ),
    );
  }

  String _getAnimationTypeName(FieldAnimationType type) {
    switch (type) {
      case FieldAnimationType.none:
        return 'None';
      case FieldAnimationType.scale:
        return 'Scale';
      case FieldAnimationType.rotate:
        return 'Rotate';
      case FieldAnimationType.slide:
        return 'Slide';
      case FieldAnimationType.fade:
        return 'Fade';
    }
  }

  String _getCurveName(Curve curve) {
    if (curve == Curves.linear) return 'Linear';
    if (curve == Curves.easeInOut) return 'Ease In/Out';
    if (curve == Curves.bounceOut) return 'Bounce';
    if (curve == Curves.elasticOut) return 'Elastic';
    if (curve == Curves.easeOutBack) return 'Back';
    return 'Custom';
  }
}
