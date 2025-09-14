import 'package:flutter/material.dart';
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

class ComprehensiveDemo extends StatefulWidget {
  const ComprehensiveDemo({Key? key}) : super(key: key);

  @override
  State<ComprehensiveDemo> createState() => _ComprehensiveDemoState();
}

class _ComprehensiveDemoState extends State<ComprehensiveDemo> {
  // Style Settings
  OtpPredefinedStyle _selectedStyle = OtpPredefinedStyle.defaultStyle;
  Color _themeColor = Colors.blue;

  // Animation Settings
  FieldAnimationType _animationType = FieldAnimationType.scale;
  bool _animateFields = true;

  // Cursor Settings
  CursorStyle _cursorStyle = CursorStyle.bottom;

  // Field Settings
  double _fieldWidth = 50;
  double _fieldHeight = 60;
  double _fieldSpacing = 10;
  bool _obscureText = false;

  String _resultMessage = '';

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
        title: const Text('Comprehensive Demo'),
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

            // Quick Settings
            _buildQuickSettings(),
            const SizedBox(height: 24),

            // Live Preview
            _buildLivePreview(),
            const SizedBox(height: 32),

            // Advanced Settings
            _buildAdvancedSettings(),
            const SizedBox(height: 32),

            // Code Generation
            _buildCodeGeneration(),
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
                child: const Icon(Icons.tune, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Comprehensive Demo',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'All features in one place',
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
            'Explore all the customization options available in Flutter OTP Kit. '
            'Adjust styles, animations, cursors, and field properties in real-time.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickSettings() {
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
            'Quick Settings',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),

          // Style Selection
          Text(
            'Predefined Style',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: OtpPredefinedStyle.values.take(5).map((style) {
              final isSelected = _selectedStyle == style;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedStyle = style;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? _themeColor.withValues(alpha: 0.1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? _themeColor : Colors.grey[300]!,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Text(
                    style.name,
                    style: TextStyle(
                      color: isSelected ? _themeColor : Colors.grey[700],
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
            children: _colorOptions.take(6).map((color) {
              final isSelected = _themeColor == color;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _themeColor = color;
                  });
                },
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? Colors.white : Colors.transparent,
                      width: 2,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: color.withValues(alpha: 0.5),
                              blurRadius: 6,
                              spreadRadius: 1,
                            ),
                          ]
                        : null,
                  ),
                  child: isSelected
                      ? const Icon(Icons.check, color: Colors.white, size: 16)
                      : null,
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 20),

          // Animation Toggle
          Row(
            children: [
              Switch(
                value: _animateFields,
                onChanged: (value) {
                  setState(() {
                    _animateFields = value;
                  });
                },
                activeColor: _themeColor,
              ),
              const SizedBox(width: 12),
              Text(
                'Enable Animations',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),

          // Obscure Text Toggle
          Row(
            children: [
              Switch(
                value: _obscureText,
                onChanged: (value) {
                  setState(() {
                    _obscureText = value;
                  });
                },
                activeColor: _themeColor,
              ),
              const SizedBox(width: 12),
              Text(
                'Obscure Text',
                style: Theme.of(context).textTheme.titleMedium,
              ),
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
            _themeColor.withValues(alpha: 0.05),
            _themeColor.withValues(alpha: 0.02),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _themeColor.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Text(
            'Live Preview',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: _themeColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${_selectedStyle.name} • ${_animateFields ? 'Animated' : 'Static'} • ${_cursorStyle.name}',
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
                  _resultMessage = 'Current value: $value';
                });
              },
              onCompleted: (value) {
                setState(() {
                  _resultMessage = 'Completed: $value';
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('OTP completed: $value')),
                );
              },
              fieldWidth: _fieldWidth,
              fieldHeight: _fieldHeight,
              fieldSpacing: _fieldSpacing,
              obscureText: _obscureText,
              animateFields: _animateFields,
              fieldAnimationType: _animationType,
              cursorStyle: _cursorStyle,
              cursorColor: _themeColor,
              decoration: _selectedStyle.getDecoration(themeColor: _themeColor),
              focusedDecoration: _selectedStyle.getFocusedDecoration(
                themeColor: _themeColor,
              ),
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _themeColor,
              ),
            ),
          ),
          if (_resultMessage.isNotEmpty) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _themeColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: _themeColor.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: _themeColor, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _resultMessage,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: _themeColor,
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

  Widget _buildAdvancedSettings() {
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
            'Advanced Settings',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
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
                      activeColor: _themeColor,
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
                      activeColor: _themeColor,
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
                activeColor: _themeColor,
                onChanged: (value) {
                  setState(() {
                    _fieldSpacing = value;
                  });
                },
              ),
            ],
          ),

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
            children: FieldAnimationType.values.map((type) {
              final isSelected = _animationType == type;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _animationType = type;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? _themeColor.withValues(alpha: 0.1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? _themeColor : Colors.grey[300]!,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Text(
                    _getAnimationTypeName(type),
                    style: TextStyle(
                      color: isSelected ? _themeColor : Colors.grey[700],
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

          const SizedBox(height: 20),

          // Cursor Style
          Text(
            'Cursor Style',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: CursorStyle.values.map((style) {
              final isSelected = _cursorStyle == style;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _cursorStyle = style;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? _themeColor.withValues(alpha: 0.1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? _themeColor : Colors.grey[300]!,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Text(
                    _getCursorStyleName(style),
                    style: TextStyle(
                      color: isSelected ? _themeColor : Colors.grey[700],
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
      ),
    );
  }

  Widget _buildCodeGeneration() {
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
FlexibleOtpField(
  length: 4,
  fieldWidth: $_fieldWidth,
  fieldHeight: $_fieldHeight,
  fieldSpacing: $_fieldSpacing,
  obscureText: $_obscureText,
  animateFields: $_animateFields,
  fieldAnimationType: FieldAnimationType.${_animationType.name},
  cursorStyle: CursorStyle.${_cursorStyle.name},
  cursorColor: ${_themeColor.toString()},
  decoration: OtpPredefinedStyle.${_selectedStyle.name}.getDecoration(
    themeColor: ${_themeColor.toString()},
  ),
  focusedDecoration: OtpPredefinedStyle.${_selectedStyle.name}.getFocusedDecoration(
    themeColor: ${_themeColor.toString()},
  ),
  textStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: ${_themeColor.toString()},
  ),
  onChanged: (value) {
    // Handle value changes
  },
  onCompleted: (value) {
    // Handle completion
  },
);
''';
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

  String _getCursorStyleName(CursorStyle style) {
    switch (style) {
      case CursorStyle.vertical:
        return 'Vertical';
      case CursorStyle.bottom:
        return 'Bottom';
      case CursorStyle.custom:
        return 'Custom';
      case CursorStyle.none:
        return 'None';
    }
  }
}
