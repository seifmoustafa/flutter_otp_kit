import 'package:flutter/material.dart';
import '../widgets/feature_card.dart';
import '../widgets/demo_section.dart';
import 'simple_otp_demo.dart';
import 'verification_demo.dart';
import 'comprehensive_demo.dart';
import 'cursor_styles_demo.dart';
import 'visual_states_demo.dart';
import 'shake_animation_demo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter OTP Kit'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).textTheme.titleLarge?.color,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            _buildHeader(),
            const SizedBox(height: 32),

            // Quick Start Section
            DemoSection(
              title: 'Quick Start',
              description: 'Get started with OTP fields in minutes',
              children: [
                FeatureCard(
                  title: 'Simple OTP Field',
                  description: 'Basic OTP field with default styling',
                  icon: Icons.numbers,
                  onTap: () => _navigateToScreen('simple'),
                ),
                FeatureCard(
                  title: 'Complete Verification',
                  description: 'Full verification flow with resend timer',
                  icon: Icons.verified_user,
                  onTap: () => _navigateToScreen('verification'),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Comprehensive Demo Section
            DemoSection(
              title: 'All-in-One Demo',
              description: 'Explore all features in one comprehensive demo',
              children: [
                FeatureCard(
                  title: 'Comprehensive Demo',
                  description: 'Styles, animations, cursors, and customization',
                  icon: Icons.tune,
                  onTap: () => _navigateToScreen('comprehensive'),
                ),
                FeatureCard(
                  title: 'Cursor Styles',
                  description: 'Bottom, vertical, none, and custom cursors',
                  icon: Icons.edit,
                  onTap: () => _navigateToScreen('cursor'),
                ),
                FeatureCard(
                  title: 'Visual States',
                  description: 'Error, completion, and normal state feedback',
                  icon: Icons.visibility,
                  onTap: () => _navigateToScreen('visual'),
                ),
                FeatureCard(
                  title: 'Shake Animation',
                  description: 'Customizable shake animations with presets',
                  icon: Icons.vibration,
                  onTap: () => _navigateToScreen('shake'),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Footer
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
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
                  Icons.security,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Flutter OTP Kit',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Complete OTP solution for Flutter',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'A comprehensive Flutter package for OTP verification with complete customization, '
            'reactive state management, and composable components. Perfect for authentication flows, '
            'phone verification, and secure access.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.amber[600], size: 20),
              const SizedBox(width: 8),
              Text(
                'Made with ❤️ for Flutter developers',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Version 3.0.0 • MIT License',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  void _navigateToScreen(String screenName) {
    Widget? screen;

    switch (screenName) {
      case 'simple':
        screen = const SimpleOtpDemo();
        break;
      case 'verification':
        screen = const VerificationDemo();
        break;
      case 'comprehensive':
        screen = const ComprehensiveDemo();
        break;
      case 'cursor':
        screen = const CursorStylesDemo();
        break;
      case 'visual':
        screen = const VisualStatesDemo();
        break;
      case 'shake':
        screen = const ShakeAnimationDemo();
        break;
    }

    if (screen != null) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => screen!));
    }
  }
}
