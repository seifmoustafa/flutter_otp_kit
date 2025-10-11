# Contributing to Flutter OTP Kit

Thank you for your interest in contributing to Flutter OTP Kit! We welcome contributions from the community and are excited to see what you can bring to this project.

## 🎯 How to Contribute

There are many ways you can contribute to Flutter OTP Kit:

- 🐛 **Report bugs** - Help us identify and fix issues
- 💡 **Suggest features** - Share ideas for new functionality
- 📝 **Improve documentation** - Help make our docs even better
- 🔧 **Submit code** - Fix bugs or implement new features
- 🧪 **Write tests** - Help us maintain code quality
- 🎨 **Design improvements** - Enhance UI/UX elements

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.10.0)
- Dart SDK (>=3.0.0)
- Git
- A code editor (VS Code, Android Studio, etc.)

### Development Setup

1. **Fork the repository**
   ```bash
   # Click the "Fork" button on GitHub, then clone your fork
   git clone https://github.com/seifmoustafa/flutter_otp_kit.git
   cd flutter_otp_kit
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the example app**
   ```bash
   cd example
   flutter run
   ```

4. **Run tests**
   ```bash
   flutter test
   ```

5. **Check code formatting**
   ```bash
   dart format .
   flutter analyze
   ```

## 📋 Development Guidelines

### Code Style

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `dart format` to format your code
- Ensure `flutter analyze` passes without warnings
- Write meaningful commit messages

### Project Structure

```
lib/
├── src/
│   ├── config/          # Configuration classes
│   ├── services/        # Platform services
│   ├── widgets/         # UI widgets
│   ├── utils/           # Utility functions
│   ├── styling/         # Styling and theming
│   └── state/           # State management
├── flutter_otp_kit.dart # Main export file
example/                 # Example application
test/                    # Unit and widget tests
```

### Naming Conventions

- **Classes**: `PascalCase` (e.g., `OtpFieldConfig`)
- **Files**: `snake_case` (e.g., `otp_field_config.dart`)
- **Variables/Functions**: `camelCase` (e.g., `fieldWidth`)
- **Constants**: `lowerCamelCase` (e.g., `defaultFieldWidth`)

## 🐛 Reporting Bugs

Before reporting a bug, please:

1. **Check existing issues** - Someone might have already reported it
2. **Use the latest version** - The bug might already be fixed
3. **Test with the example app** - Verify the issue is reproducible

### Bug Report Template

```markdown
**Describe the bug**
A clear description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Go to '...'
2. Click on '....'
3. See error

**Expected behavior**
What you expected to happen.

**Screenshots**
If applicable, add screenshots.

**Environment:**
- Flutter version: [e.g. 3.16.0]
- Dart version: [e.g. 3.2.0]
- Platform: [e.g. iOS 17, Android 14]
- Package version: [e.g. 3.0.3]

**Additional context**
Any other context about the problem.
```

## 💡 Suggesting Features

We love new ideas! When suggesting a feature:

1. **Check existing issues** - The feature might already be planned
2. **Describe the use case** - Help us understand why it's needed
3. **Provide examples** - Show how it would be used
4. **Consider alternatives** - Are there other ways to achieve the same goal?

### Feature Request Template

```markdown
**Feature Description**
A clear description of the feature you'd like to see.

**Use Case**
Describe the problem this feature would solve.

**Proposed Solution**
How you envision this feature working.

**Code Example**
```dart
// Show how the feature would be used
OtpKit(
  newFeature: true,
  // ...
)
```

**Alternatives Considered**
Other ways to achieve the same result.

**Additional Context**
Any other context or screenshots.
```

## 🔧 Code Contributions

### Pull Request Process

1. **Create a feature branch**
   ```bash
   git checkout -b feature/amazing-new-feature
   ```

2. **Make your changes**
   - Write clean, well-documented code
   - Add tests for new functionality
   - Update documentation if needed

3. **Test your changes**
   ```bash
   flutter test
   dart format .
   flutter analyze
   ```

4. **Commit your changes**
   ```bash
   git add .
   git commit -m "feat: add amazing new feature"
   ```

5. **Push to your fork**
   ```bash
   git push origin feature/amazing-new-feature
   ```

6. **Create a Pull Request**
   - Use a clear, descriptive title
   - Reference any related issues
   - Describe what your PR does
   - Include screenshots/GIFs for UI changes

### Commit Message Convention

We use [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` - New features
- `fix:` - Bug fixes
- `docs:` - Documentation changes
- `style:` - Code style changes (formatting, etc.)
- `refactor:` - Code refactoring
- `test:` - Adding or updating tests
- `chore:` - Maintenance tasks

Examples:
```
feat: add biometric authentication support
fix: resolve SMS autofill issue on Android 14
docs: update README with new examples
test: add unit tests for OtpFieldConfig
```

## 🧪 Testing

### Writing Tests

- **Unit tests** for utility functions and logic
- **Widget tests** for UI components
- **Integration tests** for complete workflows

### Test Structure

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_otp_kit/flutter_otp_kit.dart';

void main() {
  group('OtpFieldConfig', () {
    test('should create with default values', () {
      final config = OtpFieldConfig();
      expect(config.fieldWidth, 55.125);
      expect(config.fieldHeight, 60.731);
    });

    test('should create with custom values', () {
      final config = OtpFieldConfig(
        fieldWidth: 60.0,
        fieldHeight: 60.0,
      );
      expect(config.fieldWidth, 60.0);
      expect(config.fieldHeight, 60.0);
    });
  });
}
```

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/config/otp_field_config_test.dart

# Run tests with coverage
flutter test --coverage
```

## 📝 Documentation

### Code Documentation

- Use dartdoc comments (`///`) for public APIs
- Include examples in documentation
- Document parameters and return values

```dart
/// Configuration for OTP field appearance and behavior.
///
/// This class provides comprehensive customization options for OTP fields,
/// including dimensions, colors, typography, and effects.
///
/// Example:
/// ```dart
/// final config = OtpFieldConfig(
///   fieldWidth: 60.0,
///   fieldHeight: 60.0,
///   borderRadius: 12.0,
/// );
/// ```
class OtpFieldConfig {
  /// Creates a new OTP field configuration.
  ///
  /// All parameters are optional and have sensible defaults.
  const OtpFieldConfig({
    this.fieldWidth = 55.125,
    this.fieldHeight = 60.731,
    // ...
  });

  /// Width of each OTP field in logical pixels.
  ///
  /// This determines how wide each individual field will be.
  /// The default value of 55.125 provides a good balance for most use cases.
  final double fieldWidth;
}
```

### README Updates

When adding new features:
- Update the main README.md
- Add code examples
- Update the API reference tables
- Include any breaking changes in the changelog

## 🎨 Design Guidelines

### UI/UX Principles

- **Accessibility first** - Support screen readers, keyboard navigation
- **Platform consistency** - Follow platform design guidelines
- **Performance** - Smooth animations, efficient rendering
- **Customization** - Allow developers to match their app's design

### Animation Guidelines

- **Subtle and purposeful** - Animations should enhance UX, not distract
- **Configurable** - Allow developers to disable or customize
- **Performance optimized** - Use efficient animation techniques
- **Accessible** - Respect system accessibility settings

## 🔍 Code Review Process

All contributions go through code review:

1. **Automated checks** - Tests, linting, formatting
2. **Manual review** - Code quality, design, documentation
3. **Testing** - Verify functionality works as expected
4. **Approval** - At least one maintainer approval required

### Review Criteria

- **Functionality** - Does it work as intended?
- **Code quality** - Is it clean, readable, maintainable?
- **Tests** - Are there adequate tests?
- **Documentation** - Is it properly documented?
- **Performance** - Does it impact performance?
- **Breaking changes** - Are they necessary and well-documented?

## 🏷️ Release Process

### Versioning

We follow [Semantic Versioning](https://semver.org/):

- **Major** (x.0.0) - Breaking changes
- **Minor** (0.x.0) - New features (backward compatible)
- **Patch** (0.0.x) - Bug fixes (backward compatible)

### Release Checklist

- [ ] Update version in `pubspec.yaml`
- [ ] Update `CHANGELOG.md`
- [ ] Run all tests
- [ ] Update documentation
- [ ] Create GitHub release
- [ ] Publish to pub.dev

## 🤝 Community Guidelines

### Code of Conduct

- **Be respectful** - Treat everyone with respect and kindness
- **Be inclusive** - Welcome people of all backgrounds and experience levels
- **Be constructive** - Provide helpful feedback and suggestions
- **Be patient** - Remember that everyone is learning

### Communication

- **GitHub Issues** - For bug reports and feature requests
- **GitHub Discussions** - For questions and general discussion
- **Pull Requests** - For code contributions
- **Email** - For security issues or private matters

## 🙏 Recognition

Contributors are recognized in several ways:

- **Contributors list** - Added to README.md
- **Release notes** - Mentioned in changelog
- **GitHub** - Contributor badge on your profile
- **Special thanks** - For significant contributions

## 📞 Getting Help

Need help contributing? Here are your options:

- 📖 **Read the docs** - Check README and code documentation
- 🔍 **Search issues** - Someone might have asked the same question
- 💬 **Start a discussion** - Ask questions in GitHub Discussions
- 📧 **Contact maintainers** - For private or security-related matters

## 📚 Resources

### Flutter Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)
- [Flutter Widget Catalog](https://docs.flutter.dev/development/ui/widgets)

### Package Development

- [Developing Packages](https://docs.flutter.dev/development/packages-and-plugins/developing-packages)
- [Package Layout Conventions](https://dart.dev/tools/pub/package-layout)
- [Publishing Packages](https://dart.dev/tools/pub/publishing)

### Testing

- [Flutter Testing](https://docs.flutter.dev/testing)
- [Widget Testing](https://docs.flutter.dev/cookbook/testing/widget/introduction)
- [Integration Testing](https://docs.flutter.dev/testing/integration-tests)

---

## 🎉 Thank You!

Thank you for taking the time to contribute to Flutter OTP Kit! Your contributions help make this package better for the entire Flutter community.

Every contribution, no matter how small, is valuable and appreciated. Whether you're fixing a typo, reporting a bug, or implementing a major feature, you're helping to build something amazing.

**Happy coding!** 🚀

---

<div align="center">
  <p><strong>Made with ❤️ by the Flutter community</strong></p>
  <p>Flutter OTP Kit - The most comprehensive OTP verification solution</p>
</div>
