# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.2/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.1] - 2025-09-10

### Fixed - Critical Responsive Issues
- **🚨 Fixed Overflow Bug**: Resolved "RIGHT OVERFLOWED BY 12 PIXELS" error completely
- **📱 Enhanced Responsive Design**: Implemented comprehensive responsive field width calculation
- **🛡️ Overflow Protection**: Added 20% safety margin to prevent any pixel overflow
- **🔄 Force Resize Mechanism**: Automatic field width adjustment based on screen constraints
- **📐 Smart Spacing**: Dynamic spacing calculation with min/max constraints
- **🎯 Layout Optimization**: Improved wrap detection and grid layout handling
- **📱 Screen Adaptation**: Better handling of different screen sizes and orientations
- **🔧 Edge Case Handling**: Comprehensive handling of all edge cases for responsive design

### Enhanced
- **Performance**: Optimized responsive calculations for better performance
- **Reliability**: Added multiple layers of overflow protection
- **User Experience**: Seamless experience across all device sizes

## [1.2.0] - 2025-09-10

### Added - Complete Generic Package
- **Comprehensive Layout System**: Multiple layout types (singleRow, wrap, grid, custom)
- **Advanced Field Shapes**: Rectangle, rounded rectangle, circle, stadium, and custom shapes
- **Complete Animation Control**: Predefined animation configs (default, fast, smooth, disabled)
- **Full Theme System**: Material 3, light, dark themes with complete customization
- **Responsive Spacing**: Min/max field spacing with automatic calculation
- **Advanced Behavior Configuration**: Haptic feedback, sound feedback, auto-submit, auto-clear
- **Comprehensive Accessibility**: Screen reader support, semantic labels, custom actions
- **Gradient Support**: Linear, radial, and sweep gradients for backgrounds
- **Custom Decorations**: Complete BoxDecoration customization
- **Advanced Validation**: Real-time validation, custom regex, custom messages
- **Multiple Input Types**: Numeric, alphabetic, alphanumeric, and custom with formatters
- **Voice and Biometric Input**: Support for advanced input methods
- **Swipe Navigation**: Touch gesture support for field navigation
- **Custom Field Builders**: Complete control over field appearance and behavior
- **Custom Layout Builders**: Full control over field arrangement
- **Grid Layout Support**: Multi-column field arrangements
- **Field Direction Control**: Horizontal and vertical field arrangements
- **Field Alignment Options**: Center, start, end, space between, around, evenly
- **Border Style Control**: Solid, dashed, dotted, and custom border styles
- **Shadow Configuration**: Customizable shadows with color, blur, spread, offset
- **Text Style Control**: Complete typography customization for all text elements
- **Button Color System**: Comprehensive button color configuration
- **Error State Management**: Visual error states with custom styling
- **Success State Management**: Visual success states with custom styling
- **Focus State Management**: Custom focus styling and behavior
- **Timer Control**: Show/hide timer with custom styling
- **Keyboard Type Control**: Custom keyboard types for different input scenarios
- **Text Capitalization**: Control over text capitalization behavior
- **Interactive Selection**: Enable/disable text selection
- **Custom Validators**: Complete validation control with custom logic
- **Real-time Validation**: Live validation feedback
- **Custom Error Messages**: Personalized error messaging
- **Accessibility Actions**: Custom accessibility actions for screen readers
- **Semantic Support**: Complete semantic labeling for accessibility
- **Cross-platform Optimization**: Optimized for iOS, Android, Web, and Desktop

### Enhanced
- **Example App**: Comprehensive example showcasing all features with 4 different examples
- **Documentation**: Complete API documentation with examples for every feature
- **Performance**: Optimized animations and responsive calculations
- **Accessibility**: Enhanced screen reader support and semantic labeling
- **Responsiveness**: Automatic layout adaptation for different screen sizes

### Breaking Changes
- **Constructor Parameters**: Added many new optional parameters (backward compatible)
- **Configuration Objects**: New configuration classes for better organization
- **Default Values**: Some default values may have changed (all backward compatible)

## [1.1.0] - 2025-09-10

### Added
- **Multiple input types support**: numeric, alphabetic, alphanumeric, and custom
- **Paste support**: Automatically detect and fill OTP from clipboard
- **Custom input formatters**: Support for custom TextInputFormatter
- **Custom validators**: Add your own validation logic
- **Enhanced callbacks**: onChanged and onCompleted callbacks
- **Animation support**: Fade and scale animations with customizable duration and curves
- **Enhanced error handling**: Custom error messages and styling
- **Accessibility features**: Semantic labels for better screen reader support
- **Secure OTP mode**: Obscure text option for sensitive inputs
- **Advanced styling options**:
  - Focused border color
  - Error border color
  - Filled field background color
  - Cursor color customization
  - Shadow effects with customizable color, blur, and spread
- **Theme support**: Automatic adaptation to light/dark themes
- **Conditional timer display**: Show/hide timer based on needs
- **Custom keyboard types**: Support for different keyboard configurations
- **Text capitalization**: Control text capitalization behavior
- **Interactive selection**: Enable/disable text selection

### Enhanced
- Example app now showcases all new features with 5 different examples
- Better error state management with visual feedback
- Improved focus management and navigation
- More robust paste detection and validation

## [1.0.3] - 2025-09-07

### Fixed
- Updated flutter_platform_widgets dependency to latest version (^9.0.0)
- Added missing documentation for OtpVerificationWidget constructor
- Made OtpVerificationWidgetState class public for external access
- Fixed example app compilation and functionality issues

### Added
- Complete example app demonstrating package usage
- Interactive controls for testing clearOtp() and setOtp() methods
- Professional README with TL;DR and How it works sections
- Example README with detailed usage instructions
- Phone and email OTP verification examples
- Real-time verification feedback in example app

### Improved
- Enhanced documentation structure to match professional package standards
- Better example app with Material Design 3
- More comprehensive package information display
- Improved code quality and maintainability

## [1.0.2] - 2025-09-06

### Added
- Initial release of Flutter OTP Kit
- Comprehensive OTP verification widget with customizable styling
- Support for 4, 5, 6, or any number of OTP digits
- Timer functionality with countdown
- Contact masking for phone numbers and email addresses
- Cross-platform support (iOS, Android, Web, Desktop)
- Full localization support
- Accessibility features
- Custom styling options for colors, dimensions, and spacing
- Form validation support
- Smart focus management between input fields
- Custom button widget support
- Public methods for clearing and setting OTP values

### Features
- **Configurable field count**: Support for any number of digits
- **Fully localizable**: All text provided by caller (no hardcoded strings)
- **Smart focus management**: Auto-navigation between fields during input
- **Timer functionality**: Countdown timer with customizable duration
- **Validation support**: Optional form validation with error handling
- **Cross-platform**: Works seamlessly on iOS, Android, Web, and Desktop
- **Customizable styling**: Colors, dimensions, spacing all configurable
- **Accessibility ready**: Proper focus handling and keyboard navigation
- **Contact masking**: Automatic phone/email masking for privacy
