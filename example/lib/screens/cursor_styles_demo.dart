import 'package:flutter/material.dart';
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

class CursorStylesDemo extends StatefulWidget {
  const CursorStylesDemo({super.key});

  @override
  State<CursorStylesDemo> createState() => _CursorStylesDemoState();
}

class _CursorStylesDemoState extends State<CursorStylesDemo> {
  CursorStyle _selectedCursorStyle = CursorStyle.bottom;
  Color _cursorColor = Colors.blue;
  double _cursorWidth = 2.0;
  double _cursorHeight = 20.0;
  String _otpValue = '';

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
        title: const Text('Cursor Styles'),
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

            // Cursor Style Selector
            _buildCursorStyleSelector(),
            const SizedBox(height: 24),

            // Cursor Customization
            _buildCursorCustomization(),
            const SizedBox(height: 32),

            // Live Preview
            _buildLivePreview(),
            const SizedBox(height: 32),

            // Cursor Examples
            _buildCursorExamples(),
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
                child: const Icon(Icons.edit, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cursor Styles',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Customize cursor appearance',
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
            'Choose from different cursor styles and customize their appearance '
            'to match your app\'s design. Perfect for branding and user experience.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildCursorStyleSelector() {
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
            'Select Cursor Style',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: CursorStyle.values.map((style) {
              final isSelected = _selectedCursorStyle == style;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCursorStyle = style;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? _cursorColor.withOpacity(0.1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? _cursorColor : Colors.grey[300]!,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Text(
                    _getCursorStyleName(style),
                    style: TextStyle(
                      color: isSelected ? _cursorColor : Colors.grey[700],
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
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

  Widget _buildCursorCustomization() {
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
            'Cursor Customization',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),

          // Color Selection
          Text(
            'Cursor Color',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _colorOptions.map((color) {
              final isSelected = _cursorColor == color;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _cursorColor = color;
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

          // Cursor Dimensions
          Text(
            'Cursor Dimensions',
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
                    Text('Width: ${_cursorWidth.toStringAsFixed(1)}px'),
                    Slider(
                      value: _cursorWidth,
                      min: 1.0,
                      max: 5.0,
                      divisions: 40,
                      activeColor: _cursorColor,
                      onChanged: (value) {
                        setState(() {
                          _cursorWidth = value;
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
                    Text('Height: ${_cursorHeight.round()}px'),
                    Slider(
                      value: _cursorHeight,
                      min: 10,
                      max: 40,
                      divisions: 30,
                      activeColor: _cursorColor,
                      onChanged: (value) {
                        setState(() {
                          _cursorHeight = value;
                        });
                      },
                    ),
                  ],
                ),
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
            _cursorColor.withOpacity(0.05),
            _cursorColor.withOpacity(0.02),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _cursorColor.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Text(
            'Live Preview',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: _cursorColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${_getCursorStyleName(_selectedCursorStyle)} Cursor',
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
              cursorStyle: _selectedCursorStyle,
              cursorColor: _cursorColor,
              customCursorBuilder: _getCustomCursorBuilder(),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedDecoration: BoxDecoration(
                border: Border.all(color: _cursorColor, width: 2),
                borderRadius: BorderRadius.circular(8),
                color: _cursorColor.withOpacity(0.1),
              ),
            ),
          ),
          if (_otpValue.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              'Current value: $_otpValue',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: _cursorColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildCursorExamples() {
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
            'Cursor Style Examples',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),

          // Vertical Cursor
          _buildExampleItem(
            title: 'Vertical Cursor',
            description: 'Traditional vertical line cursor',
            cursorStyle: CursorStyle.vertical,
            cursorColor: Colors.blue,
          ),

          // Bottom Cursor
          _buildExampleItem(
            title: 'Bottom Cursor',
            description: 'Underlined cursor that looks like "_"',
            cursorStyle: CursorStyle.bottom,
            cursorColor: Colors.green,
          ),

          // Custom Cursor
          _buildExampleItem(
            title: 'Custom Cursor',
            description: 'Developer can build their own cursor',
            cursorStyle: CursorStyle.custom,
            cursorColor: Colors.orange,
            customCursorBuilder: (context, color) => Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          ),

          // None Cursor
          _buildExampleItem(
            title: 'No Cursor',
            description: 'Clean look without visible cursor',
            cursorStyle: CursorStyle.none,
            cursorColor: Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildExampleItem({
    required String title,
    required String description,
    required CursorStyle cursorStyle,
    required Color cursorColor,
    Widget Function(BuildContext context, Color cursorColor)?
    customCursorBuilder,
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
              cursorStyle: cursorStyle,
              cursorColor: cursorColor,
              customCursorBuilder: customCursorBuilder,
              fieldWidth: 30,
              fieldHeight: 40,
              fieldSpacing: 8,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(6),
              ),
              focusedDecoration: BoxDecoration(
                border: Border.all(color: cursorColor, width: 2),
                borderRadius: BorderRadius.circular(6),
                color: cursorColor.withOpacity(0.1),
              ),
              onChanged: (value) {},
              onCompleted: (value) {},
            ),
          ),
        ],
      ),
    );
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

  Widget Function(BuildContext context, Color cursorColor)?
  _getCustomCursorBuilder() {
    if (_selectedCursorStyle != CursorStyle.custom) return null;

    // Return different custom cursor examples based on cursor color
    switch (_cursorColor) {
      case Colors.blue:
        return (context, color) => Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
        );
      case Colors.green:
        return (context, color) => Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        );
      case Colors.orange:
        return (context, color) => Icon(Icons.edit, color: color, size: 14);
      case Colors.purple:
        return (context, color) => Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [color, color.withOpacity(0.5)]),
            shape: BoxShape.circle,
          ),
        );
      case Colors.red:
        return (context, color) => Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1),
          ),
        );
      case Colors.teal:
        return (context, color) => Container(
          width: 14,
          height: 2,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(1),
          ),
        );
      case Colors.indigo:
        return (context, color) => Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.white, width: 1),
          ),
        );
      case Colors.pink:
        return (context, color) => Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
        );
      default:
        return (context, color) => Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        );
    }
  }
}
