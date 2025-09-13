import 'package:flutter/material.dart';
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

class StylesDemo extends StatefulWidget {
  const StylesDemo({Key? key}) : super(key: key);

  @override
  State<StylesDemo> createState() => _StylesDemoState();
}

class _StylesDemoState extends State<StylesDemo> {
  OtpPredefinedStyle _selectedStyle = OtpPredefinedStyle.defaultStyle;
  Color _themeColor = Colors.blue;
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
        title: const Text('Predefined Styles'),
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

            // Style Selector
            _buildStyleSelector(),
            const SizedBox(height: 24),

            // Color Selector
            _buildColorSelector(),
            const SizedBox(height: 32),

            // Live Preview
            _buildLivePreview(),
            const SizedBox(height: 32),

            // Style Information
            _buildStyleInfo(),
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
                child: const Icon(Icons.palette, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Predefined Styles',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Beautiful styles for every design',
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
            'Choose from a variety of predefined styles that work perfectly '
            'with different design systems and platforms.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildStyleSelector() {
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
            'Select Style',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: OtpPredefinedStyle.values.map((style) {
              final isSelected = _selectedStyle == style;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedStyle = style;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? _themeColor.withOpacity(0.1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
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

  Widget _buildColorSelector() {
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
            'Select Theme Color',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _colorOptions.map((color) {
              final isSelected = _themeColor == color;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _themeColor = color;
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
            _themeColor.withOpacity(0.05),
            _themeColor.withOpacity(0.02),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _themeColor.withOpacity(0.2)),
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
            '${_selectedStyle.name} Style',
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
              decoration: _selectedStyle.getDecoration(themeColor: _themeColor),
              focusedDecoration: _selectedStyle.getFocusedDecoration(
                themeColor: _themeColor,
              ),
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _themeColor,
              ),
              cursorColor: _themeColor,
            ),
          ),
          if (_otpValue.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              'Current value: $_otpValue',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: _themeColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStyleInfo() {
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
            'Style Information',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          _buildStyleDescription(),
        ],
      ),
    );
  }

  Widget _buildStyleDescription() {
    String description = '';
    String useCase = '';

    switch (_selectedStyle) {
      case OtpPredefinedStyle.defaultStyle:
        description =
            'Clean, minimal design with subtle borders and rounded corners.';
        useCase = 'Perfect for most applications and clean UI designs.';
        break;
      case OtpPredefinedStyle.rounded:
        description = 'Fully rounded fields with smooth, modern appearance.';
        useCase = 'Great for playful, modern, or iOS-inspired designs.';
        break;
      case OtpPredefinedStyle.underlined:
        description = 'Simple underlined fields with clean typography focus.';
        useCase = 'Ideal for minimal designs and text-focused interfaces.';
        break;
      case OtpPredefinedStyle.boxed:
        description = 'Sharp, rectangular fields with defined borders.';
        useCase = 'Perfect for structured, grid-based layouts.';
        break;
      case OtpPredefinedStyle.filled:
        description = 'Fields with background fill and subtle borders.';
        useCase = 'Great for high-contrast designs and accessibility.';
        break;
      case OtpPredefinedStyle.outline:
        description = 'Outlined fields with theme color borders.';
        useCase = 'Perfect for branded designs with color theming.';
        break;
      case OtpPredefinedStyle.material:
        description = 'Material Design inspired with elevation and shadows.';
        useCase = 'Ideal for Material Design applications.';
        break;
      case OtpPredefinedStyle.ios:
        description =
            'iOS-inspired design with subtle shadows and rounded corners.';
        useCase = 'Perfect for iOS applications and Apple-inspired designs.';
        break;
      case OtpPredefinedStyle.custom:
        description = 'Fully customizable fields for unique designs.';
        useCase = 'Use when you need complete control over appearance.';
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _themeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.info_outline, color: _themeColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
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
        const SizedBox(height: 16),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _themeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.lightbulb_outline,
                color: _themeColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Best Use Case',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    useCase,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
