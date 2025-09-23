import 'package:flutter/material.dart';
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

class TemplatesDemo extends StatefulWidget {
  const TemplatesDemo({Key? key}) : super(key: key);

  @override
  State<TemplatesDemo> createState() => _TemplatesDemoState();
}

class _TemplatesDemoState extends State<TemplatesDemo> {
  OtpTemplate _selectedTemplate = OtpTemplate.modern;
  String _resultMessage = '';

  final List<OtpTemplate> _templates = [
    OtpTemplate.modern,
    OtpTemplate.minimal,
    OtpTemplate.corporate,
    OtpTemplate.playful,
    OtpTemplate.elegant,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Templates'),
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

            // Template Selector
            _buildTemplateSelector(),
            const SizedBox(height: 24),

            // Template Preview
            _buildTemplatePreview(),
            const SizedBox(height: 32),

            // Template Information
            _buildTemplateInfo(),
            const SizedBox(height: 32),

            // Usage Examples
            _buildUsageExamples(),
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
          colors: [Colors.blue.shade600, Colors.purple.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade200,
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.style,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ready-to-Use Templates',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Pick a template and customize with your content',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: 14,
                      ),
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

  Widget _buildTemplateSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Template',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: _templates.map((template) {
            final isSelected = _selectedTemplate == template;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTemplate = template;
                  _resultMessage = '';
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue.shade600 : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? Colors.blue.shade600 : Colors.grey.shade300,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _getTemplateIcon(template),
                      color: isSelected ? Colors.white : Colors.grey.shade600,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      template.name,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTemplatePreview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Live Preview',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: OtpTemplateWidget(
            template: _selectedTemplate,
            title: 'Verify Your Account',
            subtitle: 'Enter the verification code sent to {contactInfo}',
            contactInfo: '+1 (555) 123-4567',
            onVerify: (otp) {
              setState(() {
                _resultMessage = 'Verification successful! OTP: $otp';
              });
            },
            onResend: () {
              setState(() {
                _resultMessage = 'Code resent successfully!';
              });
            },
            onChanged: (value) {
              setState(() {
                _resultMessage = '';
              });
            },
          ),
        ),
        if (_resultMessage.isNotEmpty) ...[
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green.shade600, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _resultMessage,
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTemplateInfo() {
    final config = _selectedTemplate.getDefaultConfig();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Template Information',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    _getTemplateIcon(_selectedTemplate),
                    color: Colors.blue.shade600,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _selectedTemplate.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                _selectedTemplate.description,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              _buildInfoRow('Primary Color', _colorToHex(config.primaryColor)),
              _buildInfoRow('Secondary Color', _colorToHex(config.secondaryColor)),
              _buildInfoRow('OTP Length', config.otpLength.toString()),
              _buildInfoRow('Field Spacing', '${config.fieldSpacing}px'),
              _buildInfoRow('Cursor Style', config.cursorStyle.name),
              _buildInfoRow('Animation Type', config.animationType.name),
              _buildInfoRow('Predefined Style', config.predefinedStyle.name),
              _buildInfoRow('Auto Validation', config.enableAutoValidation ? 'Yes' : 'No'),
              _buildInfoRow('Haptic Feedback', config.enableHapticFeedback ? 'Yes' : 'No'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUsageExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Usage Examples',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        
        // Simple Usage
        _buildCodeExample(
          'Simple Usage',
          '''OtpTemplateWidget(
  template: OtpTemplate.${_selectedTemplate.name.toLowerCase()},
  title: 'Verify Your Account',
  subtitle: 'Enter the code sent to {contactInfo}',
  contactInfo: '+1 (555) 123-4567',
  onVerify: (otp) => handleVerification(otp),
  onResend: () => resendCode(),
)''',
        ),
        
        const SizedBox(height: 16),
        
        // Builder Pattern
        _buildCodeExample(
          'Builder Pattern',
          '''OtpTemplateBuilder(OtpTemplate.${_selectedTemplate.name.toLowerCase()})
  .title('Custom Title')
  .subtitle('Custom subtitle with {contactInfo}')
  .contactInfo('+1 (555) 123-4567')
  .primaryColor(Colors.purple)
  .otpLength(6)
  .enableAnimations(true)
  .build(
    onVerify: (otp) => handleVerification(otp),
    onResend: () => resendCode(),
  )''',
        ),
        
        const SizedBox(height: 16),
        
        // Customized Template
        _buildCodeExample(
          'Customized Template',
          '''OtpTemplateWidget(
  template: OtpTemplate.${_selectedTemplate.name.toLowerCase()},
  title: 'Security Verification',
  subtitle: 'Enter the security code',
  buttonText: 'Verify & Continue',
  resendText: 'Request New Code',
  primaryColor: Colors.red,
  otpLength: 6,
  fieldSpacing: 16.0,
  enableHapticFeedback: true,
  onVerify: (otp) => handleVerification(otp),
  onResend: () => resendCode(),
)''',
        ),
      ],
    );
  }

  Widget _buildCodeExample(String title, String code) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade700),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          SelectableText(
            code,
            style: const TextStyle(
              color: Colors.greenAccent,
              fontSize: 12,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }

  IconData _getTemplateIcon(OtpTemplate template) {
    switch (template) {
      case OtpTemplate.modern:
        return Icons.auto_awesome;
      case OtpTemplate.minimal:
        return Icons.minimize;
      case OtpTemplate.corporate:
        return Icons.business;
      case OtpTemplate.playful:
        return Icons.celebration;
      case OtpTemplate.elegant:
        return Icons.diamond;
    }
  }

  String _colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }
}
