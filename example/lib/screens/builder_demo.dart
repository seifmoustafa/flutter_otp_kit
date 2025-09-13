import 'package:flutter/material.dart';
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

class BuilderDemo extends StatefulWidget {
  const BuilderDemo({Key? key}) : super(key: key);

  @override
  State<BuilderDemo> createState() => _BuilderDemoState();
}

class _BuilderDemoState extends State<BuilderDemo> {
  String _otpValue = '';
  Color _selectedColor = Colors.blue;
  double _fieldWidth = 50;
  double _fieldHeight = 60;
  double _fieldSpacing = 10;
  double _borderRadius = 8;
  double _borderWidth = 1;
  bool _obscureText = false;
  bool _animateFields = false;
  FieldAnimationType _animationType = FieldAnimationType.scale;

  final List<Color> _colorOptions = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.teal,
    Colors.indigo,
    Colors.pink,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Builder Pattern'),
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

            // Builder Controls
            _buildBuilderControls(),
            const SizedBox(height: 24),

            // Live Preview
            _buildLivePreview(),
            const SizedBox(height: 32),

            // Code Example
            _buildCodeExample(),
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
                child: const Icon(Icons.build, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Builder Pattern',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Fluent API for complex configurations',
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
            'Use the OtpBuilder to create highly customized OTP fields with '
            'a fluent, chainable API. Perfect for complex styling requirements.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildBuilderControls() {
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
            'Builder Controls',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),

          // Color Selection
          Text(
            'Theme Color',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _colorOptions.map((color) {
              final isSelected = _selectedColor == color;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedColor = color;
                  });
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? Colors.white : Colors.transparent,
                      width: 3,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: color.withOpacity(0.5),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ]
                        : null,
                  ),
                  child: isSelected
                      ? const Icon(Icons.check, color: Colors.white, size: 20)
                      : null,
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 20),

          // Field Dimensions
          Text(
            'Field Dimensions',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),

          // Width
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Width: ${_fieldWidth.round()}px'),
                    Slider(
                      value: _fieldWidth,
                      min: 30,
                      max: 80,
                      divisions: 50,
                      activeColor: _selectedColor,
                      onChanged: (value) {
                        setState(() {
                          _fieldWidth = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Height: ${_fieldHeight.round()}px'),
                    Slider(
                      value: _fieldHeight,
                      min: 40,
                      max: 100,
                      divisions: 60,
                      activeColor: _selectedColor,
                      onChanged: (value) {
                        setState(() {
                          _fieldHeight = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Spacing
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Spacing: ${_fieldSpacing.round()}px'),
              Slider(
                value: _fieldSpacing,
                min: 0,
                max: 30,
                divisions: 30,
                activeColor: _selectedColor,
                onChanged: (value) {
                  setState(() {
                    _fieldSpacing = value;
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Border Settings
          Text(
            'Border Settings',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Radius: ${_borderRadius.round()}px'),
                    Slider(
                      value: _borderRadius,
                      min: 0,
                      max: 20,
                      divisions: 20,
                      activeColor: _selectedColor,
                      onChanged: (value) {
                        setState(() {
                          _borderRadius = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Width: ${_borderWidth.round()}px'),
                    Slider(
                      value: _borderWidth,
                      min: 0.5,
                      max: 4,
                      divisions: 35,
                      activeColor: _selectedColor,
                      onChanged: (value) {
                        setState(() {
                          _borderWidth = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Options
          Text(
            'Options',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Switch(
                value: _obscureText,
                onChanged: (value) {
                  setState(() {
                    _obscureText = value;
                  });
                },
                activeColor: _selectedColor,
              ),
              const SizedBox(width: 12),
              const Text('Obscure Text'),
            ],
          ),

          Row(
            children: [
              Switch(
                value: _animateFields,
                onChanged: (value) {
                  setState(() {
                    _animateFields = value;
                  });
                },
                activeColor: _selectedColor,
              ),
              const SizedBox(width: 12),
              const Text('Enable Animations'),
            ],
          ),
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
            _selectedColor.withOpacity(0.05),
            _selectedColor.withOpacity(0.02),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _selectedColor.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Text(
            'Live Preview',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: _selectedColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Custom built with OtpBuilder',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 24),
          Center(
            child: OtpBuilder()
                .length(4)
                .fieldWidth(_fieldWidth)
                .fieldHeight(_fieldHeight)
                .fieldSpacing(_fieldSpacing)
                .borderRadius(_borderRadius)
                .borderWidth(_borderWidth)
                .borderColor(_selectedColor)
                .focusedBorderColor(_selectedColor)
                .obscureText(_obscureText)
                .animateFields(_animateFields)
                .fieldAnimationType(_animationType)
                .animationDuration(const Duration(milliseconds: 300))
                .build(
                  onChanged: (value) {
                    setState(() {
                      _otpValue = value;
                    });
                  },
                  onCompleted: (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Completed: $value')),
                    );
                  },
                ),
          ),
          if (_otpValue.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              'Current value: $_otpValue',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: _selectedColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildCodeExample() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[700]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.code, color: Colors.green[400], size: 20),
              const SizedBox(width: 8),
              Text(
                'Generated Code',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
            ),
            child: SelectableText(
              _generateCodeExample(),
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
                color: Colors.white,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _generateCodeExample() {
    return '''
OtpBuilder()
    .length(4)
    .fieldWidth($_fieldWidth)
    .fieldHeight($_fieldHeight)
    .fieldSpacing($_fieldSpacing)
    .borderRadius($_borderRadius)
    .borderWidth($_borderWidth)
    .borderColor(${_selectedColor.toString()})
    .focusedBorderColor(${_selectedColor.toString()})
    .obscureText($_obscureText)
    .animateFields($_animateFields)
    .fieldAnimationType(FieldAnimationType.${_animationType.name})
    .animationDuration(const Duration(milliseconds: 300))
    .build(
      onChanged: (value) {
        // Handle value changes
      },
      onCompleted: (value) {
        // Handle completion
      },
    );
''';
  }
}
