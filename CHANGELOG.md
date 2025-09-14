# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.2/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [3.0.0] - 2025-09-15

### 🚀 **MAJOR RELEASE: Advanced Cursor Styles & Animation System**

#### 🎨 **Revolutionary Cursor Styles System**
- **Multiple Cursor Styles**: Complete cursor customization with 4 distinct styles
  - `CursorStyle.vertical`: Traditional vertical line cursor (default Flutter TextField cursor)
  - `CursorStyle.bottom`: Enhanced underlined cursor that looks like "_" with better positioning and shadow effects
  - `CursorStyle.custom`: Complete control over cursor appearance with custom widget builder
  - `CursorStyle.none`: Clean look without visible cursor for minimal designs
- **Custom Cursor Builder**: Full control over cursor appearance with `customCursorBuilder` parameter
- **Interactive Cursor Examples**: Live preview with different cursor styles based on color selection
- **Enhanced Bottom Cursor**: Improved styling with better positioning (6px from bottom), larger size (16px × 3px), and subtle shadow effects
- **Color-based Cursor Examples**: Different cursor styles for each color selection (8 unique examples)

#### 🎬 **Advanced Animation System**
- **Shake Animation**: Customizable shake animation with smooth return to original position
  - `shakeAnimationDuration`: Configurable duration (default: 500ms)
  - `shakeAnimationIntensity`: Configurable intensity (default: 10.0)
  - Smooth return to original position without overlapping
  - Generic and reusable across all field states
- **Field Animations**: Multiple animation types for field interactions
  - `FieldAnimationType.scale`: Scale animation for field focus
  - `FieldAnimationType.fade`: Fade animation for smooth transitions
  - `FieldAnimationType.slide`: Slide animation for field changes
  - `FieldAnimationType.bounce`: Bounce animation for playful interactions
  - `FieldAnimationType.elastic`: Elastic animation for dynamic effects
- **Error Animations**: Smooth error state transitions with elastic curves
- **Success Animations**: Celebration animations for successful verification
- **Custom Animation Curves**: Support for all Flutter animation curves
- **Animation Presets**: Predefined animation configurations for common use cases
- **Performance Optimized**: Smooth animations without performance impact

#### 🔧 **Enhanced Widget Architecture**
- **FlexibleOtpField**: Individual OTP input field with complete customization
  - Complete cursor style integration
  - Advanced animation support
  - Custom decoration system
  - Error state management
- **FlexibleOtpVerification**: Complete verification widget with all features
  - Integrated cursor styles
  - Animation system integration
  - Backend integration ready
- **OtpBuilder**: Builder pattern for advanced configuration
  - Fluent API for cursor styles
  - Animation configuration
  - Custom cursor builder support
- **OtpPredefinedStyle**: Predefined styling options with cursor integration

#### 🎯 **Comprehensive Customization System**
- **Complete Field Styling**: Full control over field appearance
  - `decoration`: Decoration for empty fields
  - `focusedDecoration`: Decoration for focused fields
  - `errorDecoration`: Decoration for error fields
  - `completedDecoration`: Decoration for completed fields
- **Custom Cursor Examples**: 8 different cursor examples based on color selection
  - Blue: Circular cursor with shadow effect
  - Green: Square cursor with rounded corners
  - Orange: Edit icon cursor
  - Purple: Gradient circular cursor
  - Red: Small circular cursor with white border
  - Teal: Horizontal line cursor
  - Indigo: Square cursor with white border
  - Pink: Circular cursor with thick white border
- **Enhanced Visual Hierarchy**: Strict visual hierarchy: Error > Focused > Completed > Filled > Empty
- **Generic Color System**: All colors (including error colors) are completely customizable

#### 🎨 **Interactive Demo System**
- **Cursor Styles Demo**: Comprehensive demo showcasing all cursor styles
  - Live preview with real-time cursor style changes
  - Color-based cursor examples
  - Interactive customization options
  - Cursor dimensions control (width/height sliders)
- **Comprehensive Demo**: Consolidated demo with multiple features
  - Cursor styles integration
  - Animation demonstrations
  - Customization examples
- **Shake Animation Demo**: Dedicated demo for shake animation
  - Customizable animation parameters
  - Smooth animation demonstrations
  - Error state integration

#### 🔧 **Enhanced Backend Integration**
- **State Management Methods**: Complete state management API
  - `handleVerificationResult()`: Automatic success/error handling
  - `clearOtp()`: Clear OTP fields with options
  - `setOtp()`: Set OTP programmatically
  - `getCurrentOtp()`: Get current OTP value
  - `setErrorState()`: Set error state programmatically
  - `clearErrorState()`: Clear error state programmatically
  - `isOtpValid()`: Check if OTP is valid
  - `resetFields()`: Reset fields with options
- **Cubit/Bloc Integration**: Perfect integration with state management patterns
- **Real-time State Callbacks**: Custom widgets get notified of all state changes
- **Automatic State Handling**: Package handles all error/validation states automatically

#### 📱 **Enhanced User Experience**
- **Smart Paste Detection**: Enhanced clipboard detection with intelligent full OTP vs single-digit handling
- **Consecutive Digit Support**: Fixed issue preventing consecutive identical digits (e.g., "2244" now works perfectly)
- **Real-time Validation**: Live validation with custom regex patterns and error messages
- **Instant Error Clearing**: Validation errors clear immediately when user starts typing for better UX
- **Keyboard Navigation**: Full keyboard navigation support with backspace handling
- **Focus Management**: Proper focus handling and auto-focus capabilities
- **Haptic Feedback**: Optional haptic feedback for better user experience

#### 🏗️ **Architecture Improvements**
- **Widget-Based Design**: Modular architecture for better maintainability
- **State Management**: Dedicated state management for OTP fields
- **Styling System**: Centralized styling for consistent appearance
- **Configuration System**: Comprehensive configuration options
- **Utility Functions**: Reusable utility functions for common tasks
- **Public API**: Clean and well-documented public API

#### 📚 **Comprehensive Documentation**
- **Complete README Rewrite**: Documentation completely rewritten from scratch
  - Comprehensive feature overview with all current capabilities
  - Complete cursor styles documentation with examples
  - Animation system documentation with presets
  - Full API reference with all parameters
  - Backend integration examples for Cubit/Bloc
  - Customization examples with complete code samples
  - Architecture overview explaining the design
  - Public methods documentation for state management
- **Interactive Examples**: Live preview examples for all features
- **Code Samples**: Copy-paste ready code examples for every feature
- **API Reference**: Complete parameter documentation with types and defaults

#### 🎯 **Breaking Changes**
- **Cursor Style Integration**: New `cursorStyle` parameter required for cursor customization
- **Animation System**: New animation parameters for field and shake animations
- **Custom Cursor Builder**: New `customCursorBuilder` parameter for custom cursor creation
- **Enhanced Decorations**: New decoration parameters for complete field styling control

#### 🐛 **Critical Bug Fixes**
- **Cursor Style Application**: Fixed cursor styles not being applied correctly
- **Backspace Handling**: Fixed backspace button not working and not moving between fields
- **Error Border Display**: Fixed error borders not showing correctly
- **Completion Fill Display**: Fixed completion fills not displaying correctly
- **Shake Animation**: Fixed shake animation not returning to original position and causing overlapping
- **Error Widget Override**: Fixed error widget not overriding error string, preventing duplicate error messages
- **Visual State Handling**: Fixed all visual states (normal, error, completion) not being handled generically and customizably

#### 🎨 **Visual Enhancements**
- **Enhanced Bottom Cursor**: Better size (16px × 3px), positioning (6px from bottom), and visual enhancement with shadow
- **Custom Cursor Examples**: 8 unique cursor examples based on color selection
- **Smooth Animations**: All animations use `Curves.easeInOut` for professional transitions
- **Visual Hierarchy**: Strict visual hierarchy implementation across all states
- **Responsive Design**: Fixed pixel overflow issues with proper text wrapping and flexible layouts

### 🎯 **Migration Guide from 2.0.0 to 3.0.0**

#### **New Required Parameters**
```dart
// Old way (2.0.0)
FlexibleOtpField(
  length: 4,
  onChanged: (value) => print('OTP: $value'),
  onCompleted: (value) => print('Completed: $value'),
)

// New way (3.0.0) - with cursor styles
FlexibleOtpField(
  length: 4,
  cursorStyle: CursorStyle.custom, // New required parameter
  cursorColor: Colors.blue, // New parameter
  customCursorBuilder: (context, color) => Container( // New parameter
    width: 10,
    height: 10,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
  ),
  onChanged: (value) => print('OTP: $value'),
  onCompleted: (value) => print('Completed: $value'),
)
```

#### **New Animation Parameters**
```dart
// New animation parameters
FlexibleOtpField(
  length: 4,
  shakeAnimationDuration: Duration(milliseconds: 500), // New
  shakeAnimationIntensity: 10.0, // New
  fieldAnimationType: FieldAnimationType.scale, // New
  animationDuration: Duration(milliseconds: 300), // New
  animationCurve: Curves.elasticOut, // New
  onChanged: (value) => print('OTP: $value'),
  onCompleted: (value) => print('Completed: $value'),
)
```

#### **New Decoration Parameters**
```dart
// New decoration parameters for complete control
FlexibleOtpField(
  length: 4,
  decoration: BoxDecoration( // New
    border: Border.all(color: Colors.grey.shade300),
    borderRadius: BorderRadius.circular(8),
  ),
  focusedDecoration: BoxDecoration( // New
    border: Border.all(color: Colors.blue, width: 2),
    borderRadius: BorderRadius.circular(8),
    color: Colors.blue.withOpacity(0.1),
  ),
  errorDecoration: BoxDecoration( // New
    border: Border.all(color: Colors.red, width: 2),
    borderRadius: BorderRadius.circular(8),
    color: Colors.red.withOpacity(0.1),
  ),
  completedDecoration: BoxDecoration( // New
    border: Border.all(color: Colors.green, width: 2),
    borderRadius: BorderRadius.circular(8),
    color: Colors.green.withOpacity(0.1),
  ),
  onChanged: (value) => print('OTP: $value'),
  onCompleted: (value) => print('Completed: $value'),
)
```

## [2.0.0] - 2025-01-13

### 🚀 Complete Backend Integration & Real-time State Management (Current Version)

#### 🔥 Backend Integration Ready
- **Cubit/Bloc Integration**: Perfect integration with Cubit/Bloc patterns
- **Automatic State Management**: Package handles all error/validation states automatically
- **handleVerificationResult()**: New method for automatic success/error handling
- **handleBackendState()**: Comprehensive backend state management method
- **Minimal User Responsibility**: Package handles maximum possible states internally

#### ⚡ Real-time State Callbacks
- **onTimerChanged**: Real-time timer state changes for custom widgets
- **onErrorStateChangedCallback**: Real-time error state changes for custom widgets
- **onValidationStateChanged**: Real-time validation state changes for custom widgets
- **onCompletionStateChanged**: Real-time completion state changes for custom widgets
- **Instant Custom Widget Updates**: Custom widgets update immediately when states change

#### 🎯 Enhanced Public API
- **triggerResend()**: Public method to trigger resend functionality programmatically
- **remainingResendTime**: Getter for current remaining resend time
- **canResend**: Getter to check if resend is currently available
- **Comprehensive Error Clearing**: All error states clear automatically on user input
- **Smart State Synchronization**: Custom widgets stay perfectly synchronized with package

#### 🎨 Complete Widget Customization
- **Optional Text Parameters**: All text parameters now optional with sensible defaults
- **Widget-based Everything**: Complete widget-based customization for all UI elements
- **Custom Validation Messages**: Widget-based validation messages with animations
- **Immediate Custom Resend**: Custom resend widgets update instantly with package timer
- **Perfect State Sync**: Custom widgets automatically sync with package internal states

#### 🧠 Intelligent State Management
- **Mutual Exclusivity**: Error and validation states are mutually exclusive
- **Automatic Clearing**: All error states clear comprehensively on any user input
- **Smart Validation**: Default validation message widget when auto-validation enabled
- **Backend Ready**: Perfect for any backend architecture (REST, GraphQL, etc.)
- **State Callbacks**: Real-time notifications for all state changes

### 🎯 Latest Validation & Error Handling Enhancements

#### ✅ Smart Validation System
- **Incomplete Field Prevention**: Verify button now prevents submission with missing fields when `enableAutoValidation: true`
- **User-Friendly Messages**: Shows "Please enter all digits" (or custom message) when fields are incomplete
- **Validation Message Display**: Fixed validation messages not appearing when verify pressed with incomplete OTP
- **Custom Validation Messages**: Support for custom validation messages via `validationMessage` parameter

#### 🔄 Instant Error Clearing
- **Immediate Error Clearing**: Validation errors and red borders clear instantly when user starts typing
- **Smart Error State Management**: Error text clears automatically on any user input (typing or deleting)
- **Field State Updates**: All field states update properly when errors are cleared
- **Smooth UX**: No more persistent validation errors - they disappear as soon as user interacts

#### 🧪 Enhanced Test Button Functionality
- **Functional Test Buttons**: All test buttons now actually control the OTP widget state
- **GlobalKey Integration**: Added GlobalKeys to access OtpVerificationWidget state programmatically
- **Smart Button Detection**: Test buttons automatically work with currently selected example (basic or widget-based)
- **Complete Control**: Set errors, clear errors, clear all fields, and fill test OTP programmatically

#### ⏰ Resend Timer Improvements
- **Working Timer Countdown**: Fixed resend timer to show proper countdown "Resend in 00:59", "00:58", etc.
- **Default Timer Functionality**: Removed custom resend widget to enable default timer with countdown
- **Timer State Management**: Timer properly resets and shows countdown in widget-based example

#### 🐛 Critical Bug Fixes
- **Validation Logic**: Fixed verify button logic to check OTP completion before form validation
- **Error Text Clearing**: Added proper error text clearing in `onDigitChanged` method
- **Method Availability**: Verified all required methods exist (`setErrorState`, `clearErrorState`, `clearOtp`, `setOtp`)
- **State Synchronization**: Fixed field state updates when validation errors are cleared

#### 📚 Documentation Updates
- **README Enhancement**: Added comprehensive validation and error handling documentation
- **Usage Examples**: Updated examples to show validation features and best practices
- **API Documentation**: Enhanced documentation for validation parameters and methods

### 🎯 Complete Validation Flow
1. **Enter partial OTP** (e.g., "455_") → Press "Verify" → Shows "Please enter all digits" + red borders
2. **Start typing in any field** → Error message + red borders disappear immediately
3. **Complete the OTP** → Press "Verify" → Works normally
4. **Test buttons work perfectly** → Set Error, Clear Error, Clear All, Fill Test all functional
5. **Resend timer works** → Shows countdown and functions properly when timer expires

### 🎨 Complete Visual Hierarchy & State Management Overhaul

#### 🎯 Perfect Visual State Management
- **Comprehensive Visual Hierarchy**: Implemented strict visual hierarchy: Error > Focused > Completed > Filled > Empty
- **Generic Color System**: All colors (including error colors) are completely generic and customizable
- **Smooth State Transitions**: Enhanced smooth transitions between all field states with `Curves.easeInOut`
- **Focus State Precision**: Fixed focus state management to show focused border only on actually focused fields
- **Error State Clearing**: Aggressive error clearing on any user input (typing or deleting) for immediate feedback
- **Field Deletion Handling**: Proper handling of field deletion with correct state transitions and focus management

#### 🔧 Enhanced Input Handling & Validation
- **Consecutive Digit Support**: Fixed issue preventing consecutive identical digits (e.g., "2244" now works)
- **Clipboard Paste Enhancement**: Robust paste functionality with debounce mechanism and intelligent full OTP vs single-digit handling
- **Input Validation**: Enhanced validation using `OtpValidator.isValidOtp` for paste operations
- **Focus Management**: Improved focus handling with `WidgetsBinding.instance.addPostFrameCallback` for proper timing

#### ⏰ Timer & Resend Improvements
- **Automatic Timer Start**: Timer now starts automatically on widget initialization
- **Timer Reset on Resend**: Timer properly resets to full duration every time resend is triggered
- **Consistent Timer Behavior**: Fixed timer behavior to work consistently across all scenarios

#### 🎨 Widget-Based Customization Revolution
- **Complete Widget-Based Example**: Transformed example into fully widget-based OTP screen with:
  - Custom gradient containers with shadows and borders
  - Multiple icons throughout the interface (security, phone, verified user, message, clock, keyboard, info)
  - Rich text with styled phone number display
  - Custom header with gradient icon containers
  - Enhanced subtitle with icons and rich text
  - Custom OTP fields container with keyboard icon
  - Informative footer with help text
- **Responsive Design**: Fixed pixel overflow issues with `Flexible` widgets and proper text wrapping
- **Visual Polish**: Added gradients, shadows, rounded corners, and professional styling throughout

#### 🐛 Critical Bug Fixes
- **RenderBox Layout Error**: Fixed `RenderBox was not laid out` error by simplifying nested Column structure
- **Pixel Overflow Issues**: Resolved all "RIGHT OVERFLOWED" warnings with responsive layout design
- **State Synchronization**: Fixed timing issues with `WidgetsBinding.instance.addPostFrameCallback`
- **Focus State Accuracy**: Ensured focus borders only appear on actually focused fields
- **Error State Persistence**: Fixed error state not clearing properly on field deletion

#### 🧩 Architecture Improvements
- **State Manager Enhancements**: Added `debugPrint` statements (wrapped in `kDebugMode`) for better debugging
- **Style Manager Refactoring**: Enhanced `getFieldColors` with strict visual hierarchy implementation
- **Field State Logic**: Improved `updateFieldState` to correctly determine field error states
- **Animation Smoothing**: Changed all animation curves to `Curves.easeInOut` for smoother transitions

### 🏗️ Complete Architecture Refactoring

#### 🧩 Widget-Based Architecture
- **Modular Design**: Completely refactored into a widget-based architecture for better maintainability
- **Separation of Concerns**: Clear separation between UI widgets, state management, and styling
- **Reusable Widgets**: Created reusable widgets that can be used independently
- **Improved Testability**: Widgets designed for better testability
- **Reduced Complexity**: Main widget reduced from 1800+ lines to manageable, focused widgets

#### 🧠 Enhanced State Management
- **Dedicated State Manager**: Extracted state management into a dedicated `OtpStateManager` class
- **Centralized State Logic**: All state transitions and management handled in one place
- **Cleaner State Transitions**: More predictable and manageable state transitions
- **Improved Error Handling**: Better error state management with clear responsibilities

#### 🎨 Improved Styling System
- **Style Manager**: Dedicated `OtpStyleManager` for handling all styling logic
- **Consistent Theming**: More consistent application of themes and styles
- **Field Colors**: Extracted `FieldColors` class for better color management
- **Dynamic Styling**: Improved dynamic styling based on field states

#### ⚙️ Configuration System
- **Modular Configuration**: Split configuration into logical modules
- **Field Configuration**: Dedicated `OtpFieldConfig` for field appearance
- **Error Configuration**: Dedicated `OtpErrorConfig` for error handling
- **Animation Configuration**: Dedicated `OtpAnimationConfig` for animations

#### 🛠️ Utility Functions
- **OTP Masking**: Extracted `OtpMasker` for contact information masking
- **OTP Validation**: Extracted `OtpValidator` for input validation
- **OTP Formatting**: Extracted `OtpFormatter` for input formatting

#### 📱 UI Widgets
- **OTP Field**: Extracted individual field widget
- **OTP Fields Row**: Container for OTP fields
- **OTP Header**: Title and subtitle widget
- **OTP Footer**: Verify button, resend, and timer widget
- **OTP Error Display**: Error message widget

#### 📚 Documentation & Examples
- **Updated README**: Comprehensive documentation of the new architecture
- **Architecture Section**: Added dedicated section explaining the widget architecture
- **Screenshots & Demo**: Added section for screenshots and video demonstration
- **Example App**: Updated with an "Architecture Demo" showing widget usage
- **Code Comments**: Improved code documentation

#### 🧪 Other Improvements
- **Reduced Code Duplication**: Eliminated redundant code through proper abstraction
- **Better Type Safety**: Improved type definitions and null safety
- **Performance Optimizations**: More efficient rendering and state updates
- **Accessibility Improvements**: Better semantic labeling and screen reader support

### 🔧 Enhanced Public API & Flexible Methods

#### 🎯 Enhanced Public Methods
- **clearOtp()**: Now supports configurable options for refocus, error clearing, and callbacks
- **setOtp()**: Now supports configurable options for focus clearing, error handling, and callbacks
- **resetFields()**: Now supports preserving focus and error state
- **isOtpValid()**: New method to check if OTP is valid (complete and passes validation)

#### 🔥 Improved Error State Management
- **Enhanced Error Priority System**: Comprehensive error state priority handling based on configuration
- **Flexible Error Clearing**: More control over when and how error states are cleared
- **Error Persistence Options**: Better configuration for error state persistence
- **Error State Transitions**: Smoother transitions between error states

#### 🌟 Focus Management Improvements
- **Preserved Focus Option**: Option to preserve focus when resetting fields
- **Focus Transitions**: Better focus handling during field clearing and deletion
- **Focus State Management**: More consistent focus state across all operations
- **Edge Case Handling**: Better handling of focus edge cases

#### 🎨 Field State Improvements
- **Priority-Based Field States**: Enhanced field state priority system
- **State Transitions**: Smoother transitions between field states
- **Empty Field Handling**: Better handling of empty fields
- **Deletion Behavior**: Improved behavior when deleting field values

#### 📱 User Experience Enhancements
- **Flexible API**: More flexibility in how methods are called
- **Configurable Behavior**: More control over widget behavior
- **Consistent States**: More consistent state management
- **Predictable Behavior**: More predictable behavior in all scenarios

#### 📚 Example Updates
- **Enhanced Edge Cases Demo**: Updated with new method options
- **Interactive Testing**: More comprehensive testing options
- **Method Options**: Demonstrations of all method options
- **State Management**: Better visualization of state management

### 🚨 Critical Bug Fixes & Professional Error State Management

#### 🐛 Field Styling Priority Fixes
- **Fixed Completed Fields Override**: Fixed issue where completed fields would override error styling
- **Proper Priority Order**: Implemented correct priority order: Error > Focused > Completed > Filled > Empty
- **Empty Field Styling**: Fixed inconsistent styling for empty fields with proper default border color
- **Border Color Transitions**: Smoother transitions between border colors during state changes

#### 🔄 Enhanced Error State Management
- **Error State Persistence**: Fixed issues with error state not persisting when needed
- **Error State Clearing**: Improved error state clearing logic to be less aggressive
- **Error State Priority**: Fixed issues with error state priority not being respected
- **Error State Feedback**: Better visual feedback for error states

#### 🔧 Field Clearing & Deletion Fixes
- **Proper Field Clearing**: Fixed issues with field clearing not properly resetting field states
- **Deletion Focus Handling**: Improved focus handling during character deletion
- **Empty Field Styling**: Fixed styling inconsistencies for empty fields after deletion
- **Border Color Transitions**: Smoother transitions between border colors during deletion

#### 🧪 Edge Case Handling
- **Empty Input**: Better handling of empty input
- **Partial Input**: Improved handling of partial input
- **Deletion Edge Cases**: Fixed edge cases with deletion at field boundaries
- **Focus Edge Cases**: Better handling of focus edge cases

### 🎨 Widget-Based Customization

#### 🖼️ Custom Widgets
- **Custom Title**: Added `titleWidget` parameter for custom title widget
- **Custom Subtitle**: Added `subtitleWidget` parameter for custom subtitle widget
- **Custom Error**: Added `errorWidget` parameter for custom error message widget
- **Custom Button**: Added `verifyButtonWidget` parameter for custom verify button
- **Custom Resend**: Added `resendWidget` parameter for custom resend widget
- **Custom Timer**: Added `timerWidget` parameter for custom timer widget

#### 🔄 Backward Compatibility
- **String Fallbacks**: All widget parameters have string fallbacks for backward compatibility
- **Graceful Degradation**: Widget falls back to string-based rendering when custom widgets are not provided
- **Consistent Styling**: Consistent styling between string-based and widget-based customization
- **Seamless Integration**: Custom widgets integrate seamlessly with the rest of the widget

## [1.4.0] - 2025-09-11

### 🚀 Automatic Error State Management & Widget-Based Customization

#### 🔥 Automatic Error State Management
- **External Error Control**: Added `hasError` parameter to control error state externally
- **Error State Callback**: Added `onErrorStateChanged` callback for error state changes
- **Auto-Clear Options**: Added `autoClearErrorOnInput` and `autoClearErrorOnResend` parameters
- **Timed Error States**: Added `errorStateDuration` for auto-clearing error states after a delay
- **Dynamic Styling**: Fields now dynamically update styling based on error state
- **Error Persistence**: Error state can persist until explicitly cleared or auto-cleared

#### 🎨 Widget-Based Customization
- **Custom Title**: Added `titleWidget` parameter for custom title widget
- **Custom Subtitle**: Added `subtitleWidget` parameter for custom subtitle widget
- **Custom Error**: Added `errorWidget` parameter for custom error message widget
- **Custom Button**: Added `verifyButtonWidget` parameter for custom verify button
- **Custom Resend**: Added `resendWidget` parameter for custom resend widget
- **Custom Timer**: Added `timerWidget` parameter for custom timer widget
- **Backward Compatibility**: All widget parameters have string fallbacks for backward compatibility

#### 🔧 Enhanced API
- **getCurrentOtp()**: Added method to get the current OTP value
- **Error State Access**: Added `hasErrorState` getter for checking current error state
- **Error State Control**: Added `setErrorState()` and `clearErrorState()` methods
- **Improved Validation**: Enhanced validation system with more options

#### 📱 User Experience Improvements
- **Better Error Feedback**: Improved visual feedback for error states
- **Smoother Transitions**: Enhanced transitions between states
- **More Customization**: Greater flexibility for UI customization
- **Accessibility Improvements**: Better screen reader support

#### 📚 Documentation & Examples
- **Updated README**: Comprehensive documentation of new features
- **Error State Examples**: Added examples for error state management
- **Widget Customization Examples**: Added examples for widget-based customization
- **API Reference**: Updated API reference with new methods and parameters

## [1.3.1] - 2025-09-10

### 🐛 Bug Fixes & Minor Improvements

#### 🔧 Bug Fixes
- **Focus Handling**: Fixed issue with focus not properly moving to next field on input
- **Empty Field Styling**: Fixed inconsistent styling for empty fields
- **Validation Timing**: Fixed validation timing issues with auto-validation
- **Timer Reset**: Fixed timer not properly resetting on resend

#### ✨ Improvements
- **Performance Optimization**: Reduced unnecessary rebuilds
- **Memory Usage**: Improved memory management
- **Accessibility**: Enhanced screen reader support
- **Documentation**: Improved code documentation and examples

## [1.3.0] - 2025-09-09

### 🚀 Enhanced Styling & Animations

#### 🎨 Styling Enhancements
- **Progressive Highlighting**: Added option to highlight fields as they are completed
- **Custom Field Shapes**: Added support for different field shapes
- **Gradient Support**: Added support for gradient backgrounds
- **Shadow Effects**: Enhanced shadow customization options

#### 🎬 Animation Improvements
- **Field-to-Field Animations**: Added animations when moving between fields
- **State Transition Animations**: Smoother transitions between field states
- **Customizable Animation Curves**: Added support for custom animation curves
- **Animation Speed Control**: Added parameters to control animation speed

#### 🔧 Other Improvements
- **Better Focus Management**: Improved focus handling across fields
- **Enhanced Validation**: More validation options and better error handling
- **Accessibility Enhancements**: Better screen reader support and keyboard navigation
- **Documentation**: Updated documentation with new features and examples

## [1.2.0] - 2025-09-08

### 🚀 Responsive Layout & Advanced Customization

#### 📱 Responsive Layout
- **Adaptive Field Sizing**: Fields now adapt to available width
- **Layout Types**: Added different layout types (fixed, responsive, wrap)
- **Overflow Protection**: Better handling of overflow scenarios
- **Cross-Platform Optimization**: Improved layout on different platforms

#### 🎨 Advanced Customization
- **Custom Field Styling**: More options for field appearance
- **Button Customization**: Enhanced button styling options
- **Typography Control**: Better control over text styles
- **Theme Integration**: Improved integration with app themes

#### 🔧 Other Improvements
- **Performance Optimization**: Reduced rebuild frequency
- **Memory Management**: Better resource cleanup
- **Accessibility**: Enhanced accessibility features
- **Documentation**: Comprehensive documentation update

## [1.1.0] - 2025-09-07

### 🚀 Enhanced Functionality & Customization

#### 🔧 New Features
- **Multiple Input Types**: Added support for numeric, alphabetic, and alphanumeric input
- **Custom Validation**: Added support for custom validation rules
- **Auto-Submit**: Option to automatically submit when OTP is complete
- **Paste Support**: Added clipboard paste detection

#### 🎨 Customization Options
- **Color Customization**: More options for customizing colors
- **Dimension Control**: Better control over field dimensions
- **Spacing Options**: Customizable spacing between elements
- **Typography**: Enhanced text styling options

#### 📱 User Experience
- **Focus Management**: Improved focus handling
- **Error Handling**: Better error state management
- **Feedback**: Enhanced visual feedback
- **Accessibility**: Improved screen reader support

## [1.0.0] - 2025-09-06

### 🚀 Initial Release

#### 🔧 Core Features
- **OTP Input**: Basic OTP input functionality
- **Verification**: OTP verification with callback
- **Resend**: Resend functionality with timer
- **Validation**: Basic input validation

#### 🎨 Customization
- **Colors**: Basic color customization
- **Dimensions**: Field size and spacing customization
- **Text**: Customizable text elements
- **Styling**: Basic styling options

#### 📱 User Experience
- **Focus Management**: Automatic focus movement
- **Error States**: Basic error state handling
- **Animation**: Simple animations
- **Accessibility**: Basic accessibility support