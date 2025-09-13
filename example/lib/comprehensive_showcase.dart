import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

/// Comprehensive OTP Showcase - One page showing all cases and features
class ComprehensiveShowcase extends StatefulWidget {
  const ComprehensiveShowcase({super.key});

  @override
  State<ComprehensiveShowcase> createState() => _ComprehensiveShowcaseState();
}

class _ComprehensiveShowcaseState extends State<ComprehensiveShowcase>
    with TickerProviderStateMixin {
  late TabController _tabController;

  // Current customization
  String _selectedTemplate = 'default';
  CursorStyle _cursorStyle = CursorStyle.vertical;
  double _fieldWidth = 56;
  double _fieldHeight = 56;
  double _borderRadius = 8;
  double _borderWidth = 1;
  Color _borderColor = Colors.grey.shade300;
  Color _focusedBorderColor = Colors.blue;
  Color _completedBorderColor = Colors.green;
  Color _errorBorderColor = Colors.red;
  Color _backgroundColor = Colors.white;
  Color _focusedBackgroundColor = Colors.white;
  Color _completedBackgroundColor = Colors.green.shade50;
  Color _errorBackgroundColor = Colors.red.shade50;
  double _fontSize = 20;
  Color _textColor = Colors.black87;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter OTP Kit - Complete Showcase'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(icon: Icon(Icons.palette), text: 'Templates'),
            Tab(icon: Icon(Icons.tune), text: 'Customize'),
            Tab(icon: Icon(Icons.visibility), text: 'Preview'),
            Tab(icon: Icon(Icons.code), text: 'Code'),
            Tab(icon: Icon(Icons.info), text: 'Features'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTemplatesTab(),
          _buildCustomizeTab(),
          _buildPreviewTab(),
          _buildCodeTab(),
          _buildFeaturesTab(),
        ],
      ),
    );
  }

  Widget _buildTemplatesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Field Templates & Cursor Styles',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Choose any template and apply any cursor style - completely generic!',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 24),

          // Template Selection
          _buildTemplateSection(),
          const SizedBox(height: 24),

          // Cursor Style Selection
          _buildCursorStyleSection(),
          const SizedBox(height: 24),

          // Current Selection Info
          _buildCurrentSelectionInfo(),
        ],
      ),
    );
  }

  Widget _buildTemplateSection() {
    final templates = [
      {
        'id': 'default',
        'name': 'Default',
        'icon': Icons.border_all,
        'color': Colors.blue,
        'desc': 'Clean default design'
      },
      {
        'id': 'roundedFilled',
        'name': 'Rounded Filled',
        'icon': Icons.circle,
        'color': Colors.green,
        'desc': 'Rounded with solid fill'
      },
      {
        'id': 'gradient',
        'name': 'Gradient',
        'icon': Icons.gradient,
        'color': Colors.purple,
        'desc': 'Beautiful gradient backgrounds'
      },
      {
        'id': 'shadow',
        'name': 'Shadow',
        'icon': Icons.cloud,
        'color': Colors.orange,
        'desc': 'Elegant shadow effects'
      },
      {
        'id': 'glow',
        'name': 'Glow',
        'icon': Icons.wb_incandescent,
        'color': Colors.cyan,
        'desc': 'Neon glow effects'
      },
      {
        'id': 'bottomCursor',
        'name': 'Bottom Cursor',
        'icon': Icons.horizontal_rule,
        'color': Colors.teal,
        'desc': 'Bottom border cursor'
      },
      {
        'id': 'custom',
        'name': 'Custom',
        'icon': Icons.edit,
        'color': Colors.deepPurple,
        'desc': 'Completely customizable'
      },
    ];

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Field Templates',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade600,
              ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: templates.length,
              itemBuilder: (context, index) {
                final template = templates[index];
                final isSelected = _selectedTemplate == template['id'];

                return GestureDetector(
                  onTap: () {
                    setState(
                        () => _selectedTemplate = template['id'] as String);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? (template['color'] as Color).withValues(alpha: 0.1)
                          : Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? template['color'] as Color
                            : Colors.grey.shade300,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          template['icon'] as IconData,
                          size: 28,
                          color: template['color'] as Color,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          template['name'] as String,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? template['color'] as Color
                                : Colors.black87,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          template['desc'] as String,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCursorStyleSection() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cursor Style (Applies to Any Template)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade600,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildCursorStyleButton(CursorStyle.none, 'No Cursor',
                    Icons.visibility_off, 'No visible cursor'),
                _buildCursorStyleButton(CursorStyle.vertical, 'Vertical',
                    Icons.more_vert, 'Standard vertical cursor'),
                _buildCursorStyleButton(CursorStyle.bottom, 'Bottom',
                    Icons.horizontal_rule, 'Bottom border cursor'),
                _buildCursorStyleButton(CursorStyle.custom, 'Custom',
                    Icons.edit, 'User-defined cursor'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCursorStyleButton(
      CursorStyle style, String label, IconData icon, String description) {
    final isSelected = _cursorStyle == style;
    return GestureDetector(
      onTap: () {
        setState(() => _cursorStyle = style);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.shade600 : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.green.shade600 : Colors.grey.shade300,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 16,
                  color: isSelected ? Colors.white : Colors.black87,
                ),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(
                fontSize: 10,
                color: isSelected
                    ? Colors.white.withValues(alpha: 0.8)
                    : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentSelectionInfo() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Selection',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade600,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Template: ${_selectedTemplate.toUpperCase()}'),
                      Text('Cursor: ${_cursorStyle.name.toUpperCase()}'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedTemplate = 'default';
                      _cursorStyle = CursorStyle.vertical;
                      _resetToDefaults();
                    });
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomizeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Complete Customization',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Customize every aspect of your field design:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 24),

          // Field Size
          _buildCustomizationCard('Field Size', [
            _buildSlider('Width', _fieldWidth, 40, 100, (value) {
              setState(() => _fieldWidth = value);
            }),
            _buildSlider('Height', _fieldHeight, 40, 100, (value) {
              setState(() => _fieldHeight = value);
            }),
          ]),

          // Border Options
          _buildCustomizationCard('Border Options', [
            _buildSlider('Border Radius', _borderRadius, 0, 20, (value) {
              setState(() => _borderRadius = value);
            }),
            _buildSlider('Border Width', _borderWidth, 0, 5, (value) {
              setState(() => _borderWidth = value);
            }),
          ]),

          // Colors
          _buildCustomizationCard('Colors', [
            _buildColorPicker('Border Color', _borderColor, (color) {
              setState(() => _borderColor = color);
            }),
            _buildColorPicker('Focused Border', _focusedBorderColor, (color) {
              setState(() => _focusedBorderColor = color);
            }),
            _buildColorPicker('Completed Border', _completedBorderColor,
                (color) {
              setState(() => _completedBorderColor = color);
            }),
            _buildColorPicker('Error Border', _errorBorderColor, (color) {
              setState(() => _errorBorderColor = color);
            }),
          ]),

          // Background Colors
          _buildCustomizationCard('Background Colors', [
            _buildColorPicker('Background', _backgroundColor, (color) {
              setState(() => _backgroundColor = color);
            }),
            _buildColorPicker('Focused Background', _focusedBackgroundColor,
                (color) {
              setState(() => _focusedBackgroundColor = color);
            }),
          ]),

          // Text Options
          _buildCustomizationCard('Text Options', [
            _buildSlider('Font Size', _fontSize, 12, 32, (value) {
              setState(() => _fontSize = value);
            }),
            _buildColorPicker('Text Color', _textColor, (color) {
              setState(() => _textColor = color);
            }),
          ]),
        ],
      ),
    );
  }

  Widget _buildCustomizationCard(String title, List<Widget> children) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade600,
              ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildSlider(String label, double value, double min, double max,
      Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: ${value.round()}'),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: (max - min).round(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildColorPicker(
      String label, Color color, Function(Color) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(label),
          ),
          GestureDetector(
            onTap: () async {
              final newColor = await _showColorPicker(color);
              if (newColor != null) {
                onChanged(newColor);
              }
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreviewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Live Preview',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'See your custom field design in action:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 24),
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Use a key that changes when customization changes to force rebuild
                  OtpVerificationWidget(
                    key: ValueKey(
                        '${_selectedTemplate}_${_cursorStyle.name}_${_fieldWidth}_${_fieldHeight}_${_borderRadius}_${_borderWidth}_${_borderColor.value}_${_focusedBorderColor.value}_${_completedBorderColor.value}_${_errorBorderColor.value}_${_backgroundColor.value}_${_focusedBackgroundColor.value}_${_fontSize}_${_textColor.value}'),
                    title: 'Custom Field Preview',
                    subtitle: 'Enter the code sent to {contactInfo}',
                    contactInfo: '+1 (555) 123-4567',
                    maskingType: MaskingType.phone,
                    fieldCount: 4,
                    enableAutoValidation: true,
                    enablePaste: true,
                    showTimer: true,
                    timerDuration: 60,

                    // Use current customization
                    customTheme: _getCurrentTheme(),

                    onVerify: (otp) {
                      _handleVerification(otp);
                    },
                    onResend: () {
                      _handleResend();
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Try entering: 1234',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Generated Code',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Copy this code to use your custom design:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 24),
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Your Custom Configuration',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade600,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy),
                        onPressed: () {
                          Clipboard.setData(
                              ClipboardData(text: _generateCode()));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Code copied to clipboard!'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _generateCode(),
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Complete Feature Set',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Everything you need for OTP verification:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 24),
          _buildFeatureCard('🎨 Design System', [
            '7 Predefined Templates',
            '4 Cursor Styles',
            'Complete Customization',
            'Any Template + Any Cursor',
            'Live Preview Updates',
          ]),
          _buildFeatureCard('⚡ Core Features', [
            'Auto Validation',
            'SMS Autofill (iOS/Android/Web)',
            'Paste Support',
            'Timer Integration',
            'Error Handling',
          ]),
          _buildFeatureCard('🎯 User Experience', [
            'Haptic Feedback',
            'Smooth Animations',
            'Accessibility Support',
            'Keyboard Navigation',
            'Focus Management',
          ]),
          _buildFeatureCard('🔧 Developer Experience', [
            'Type Safe',
            'Null Safety',
            'Modern Flutter APIs',
            'Comprehensive Documentation',
            'Easy Integration',
          ]),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, List<String> features) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade600,
              ),
            ),
            const SizedBox(height: 12),
            ...features.map((feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      const Icon(Icons.check, size: 16, color: Colors.green),
                      const SizedBox(width: 8),
                      Expanded(child: Text(feature)),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  OtpFieldTheme _getCurrentTheme() {
    if (_selectedTemplate == 'custom') {
      return FieldTemplates.custom(
        width: _fieldWidth,
        height: _fieldHeight,
        borderColor: _borderColor,
        focusedBorderColor: _focusedBorderColor,
        completedBorderColor: _completedBorderColor,
        errorBorderColor: _errorBorderColor,
        borderWidth: _borderWidth,
        borderRadius: _borderRadius,
        backgroundColor: _backgroundColor,
        focusedBackgroundColor: _focusedBackgroundColor,
        completedBackgroundColor: _completedBackgroundColor,
        errorBackgroundColor: _errorBackgroundColor,
        textStyle: TextStyle(
          fontSize: _fontSize,
          fontWeight: FontWeight.w600,
          color: _textColor,
        ),
        cursorStyle: _cursorStyle,
      );
    } else {
      return _getTemplateTheme();
    }
  }

  OtpFieldTheme _getTemplateTheme() {
    switch (_selectedTemplate) {
      case 'default':
        return FieldTemplates.defaultTemplate(cursorStyle: _cursorStyle);
      case 'roundedFilled':
        return FieldTemplates.roundedFilled(cursorStyle: _cursorStyle);
      case 'gradient':
        return FieldTemplates.gradient(cursorStyle: _cursorStyle);
      case 'shadow':
        return FieldTemplates.shadow(cursorStyle: _cursorStyle);
      case 'glow':
        return FieldTemplates.glow(cursorStyle: _cursorStyle);
      case 'bottomCursor':
        return FieldTemplates.bottomCursor(cursorStyle: _cursorStyle);
      default:
        return FieldTemplates.defaultTemplate(cursorStyle: _cursorStyle);
    }
  }

  String _generateCode() {
    if (_selectedTemplate == 'custom') {
      return '''OtpVerificationWidget(
  customTheme: FieldTemplates.custom(
    width: ${_fieldWidth.round()},
    height: ${_fieldHeight.round()},
    borderColor: ${_colorToString(_borderColor)},
    focusedBorderColor: ${_colorToString(_focusedBorderColor)},
    completedBorderColor: ${_colorToString(_completedBorderColor)},
    errorBorderColor: ${_colorToString(_errorBorderColor)},
    borderWidth: ${_borderWidth.round()},
    borderRadius: ${_borderRadius.round()},
    backgroundColor: ${_colorToString(_backgroundColor)},
    focusedBackgroundColor: ${_colorToString(_focusedBackgroundColor)},
    completedBackgroundColor: ${_colorToString(_completedBackgroundColor)},
    errorBackgroundColor: ${_colorToString(_errorBackgroundColor)},
    textStyle: TextStyle(
      fontSize: ${_fontSize.round()},
      fontWeight: FontWeight.w600,
      color: ${_colorToString(_textColor)},
    ),
    cursorStyle: CursorStyle.${_cursorStyle.name},
  ),
  fieldCount: 4,
  enableAutoValidation: true,
  enablePaste: true,
  showTimer: true,
  timerDuration: 60,
  onVerify: (otp) {
    // Handle verification
    if (otp == '1234') {
      // Success
    } else {
      // Error
    }
  },
  onResend: () {
    // Handle resend
  },
)''';
    } else {
      return '''OtpVerificationWidget(
  customTheme: FieldTemplates.${_selectedTemplate}(cursorStyle: CursorStyle.${_cursorStyle.name}),
  fieldCount: 4,
  enableAutoValidation: true,
  enablePaste: true,
  showTimer: true,
  timerDuration: 60,
  onVerify: (otp) {
    // Handle verification
    if (otp == '1234') {
      // Success
    } else {
      // Error
    }
  },
  onResend: () {
    // Handle resend
  },
)''';
    }
  }

  String _colorToString(Color color) {
    return 'Color(0x${color.value.toRadixString(16).padLeft(8, '0')})';
  }

  void _resetToDefaults() {
    _fieldWidth = 56;
    _fieldHeight = 56;
    _borderRadius = 8;
    _borderWidth = 1;
    _borderColor = Colors.grey.shade300;
    _focusedBorderColor = Colors.blue;
    _completedBorderColor = Colors.green;
    _errorBorderColor = Colors.red;
    _backgroundColor = Colors.white;
    _focusedBackgroundColor = Colors.white;
    _completedBackgroundColor = Colors.green.shade50;
    _errorBackgroundColor = Colors.red.shade50;
    _fontSize = 20;
    _textColor = Colors.black87;
  }

  Future<Color?> _showColorPicker(Color currentColor) async {
    return showDialog<Color>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Color'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              _buildColorOption(Colors.red),
              _buildColorOption(Colors.blue),
              _buildColorOption(Colors.green),
              _buildColorOption(Colors.orange),
              _buildColorOption(Colors.purple),
              _buildColorOption(Colors.cyan),
              _buildColorOption(Colors.pink),
              _buildColorOption(Colors.teal),
              _buildColorOption(Colors.indigo),
              _buildColorOption(Colors.brown),
              _buildColorOption(Colors.grey),
              _buildColorOption(Colors.black),
              _buildColorOption(Colors.white),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Widget _buildColorOption(Color color) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
      ),
      title: Text(color.toString()),
      onTap: () => Navigator.pop(context, color),
    );
  }

  void _handleVerification(String otp) {
    if (otp == '1234') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Verification successful!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid OTP. Try 1234'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _handleResend() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('OTP resent successfully!'),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
