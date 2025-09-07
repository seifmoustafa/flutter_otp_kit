# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.2/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.3] - 2024-07-19

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

## [1.0.2] - 2024-06-19

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
