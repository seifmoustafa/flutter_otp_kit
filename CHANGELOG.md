# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.2/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.1.1] - 2025-09-15

### 🐛 Bug Fixes

#### 🔧 Documentation & README Updates
- **Enhanced Package Logo**: Increased logo size from 200px to 300px in README for better visibility
- **Improved README Header**: Added subtitle "Flutter OTP Kit - Professional OTP Verification Package" below logo
- **Better Visual Presentation**: Enhanced package branding and visual appeal in documentation

#### 📚 Minor Documentation Improvements
- **README Enhancement**: Improved logo presentation and package description
- **Visual Consistency**: Better alignment and spacing in README header section
- **Professional Appearance**: Enhanced overall package presentation on pub.dev

## [2.1.0] - 2025-09-15

### 🌍 RTL/LTR Support & Directionality

#### 🔄 Complete Directionality Support
- **Automatic Direction Detection**: Package automatically detects text direction based on app locale
- **Manual Direction Override**: Option to manually specify `textDirection` (RTL/LTR)
- **RTL Language Support**: Full support for Arabic, Hebrew, Persian, Urdu, and other RTL languages
- **Seamless Integration**: RTL functionality works identically to LTR with proper text flow
- **Locale-Based Detection**: Supports 10+ RTL languages with automatic detection

#### 🎨 RTL Visual Design
- **Proper Text Flow**: Text flows correctly from right-to-left in RTL mode
- **Field Arrangement**: OTP fields arrange properly in RTL layout
- **Button Positioning**: Verify and resend buttons position correctly for RTL
- **Icon Alignment**: All icons and visual elements align properly in RTL
- **Arabic Validation Messages**: Beautiful Arabic validation messages with proper styling

### 👆 Tap Outside Unfocus & Focus Management

#### 🌐 Global Tap Outside Functionality
- **Built-in Tap Outside**: Package handles tap outside unfocus automatically
- **Global Coverage**: Tap anywhere on screen to unfocus fields (not just within widget)
- **External Handler Priority**: External handlers take priority over built-in functionality
- **Configurable Behavior**: `unfocusOnTapOutside` parameter to enable/disable
- **External Handler Support**: `externalTapOutsideHandler` for custom tap outside logic

#### ⚡ Real-time Focus Synchronization
- **Zero Delay Transitions**: Focus state updates with zero delay
- **Cursor-Border Sync**: Cursor position always matches focused field border
- **Immediate Visual Feedback**: Focus borders appear instantly when fields are focused
- **Smooth Transitions**: Smooth focus transitions between fields
- **Accurate Focus State**: Focus state accurately reflects actual cursor position

### ✅ Validation State Isolation & Improvements

#### 🔒 Complete State Isolation
- **Validation vs Error Separation**: Complete isolation between validation and error states
- **Independent State Management**: Validation and error states managed independently
- **Persistent Validation Borders**: Validation borders reappear correctly on subsequent triggers
- **Smart State Clearing**: Validation states clear appropriately on user input
- **Mutual Exclusivity**: Validation and error states are mutually exclusive

#### 🔧 Enhanced Validation Logic
- **Real-time Border Updates**: Validation borders update in real-time
- **Proper State Hierarchy**: Correct visual hierarchy: Error > Focused > Completed > Filled > Empty
- **Instant Error Clearing**: Validation errors clear immediately when user types
- **State Refresh**: Proper state refresh when validation is triggered
- **Focus Listener Setup**: Enhanced focus listeners for immediate state updates

### 🐛 Critical Bug Fixes

#### 🎯 Focus State Management
- **Fixed Focus Mismatch**: Cursor position now always matches focused field border
- **Eliminated Delays**: Removed delays in focus transitions
- **Immediate Updates**: Focus state updates immediately when fields change
- **Proper Listener Setup**: Enhanced focus listener setup for real-time updates

#### 🔒 Validation State Fixes
- **Fixed Border Persistence**: Validation borders now persist and reappear correctly
- **State Isolation**: Complete isolation between validation and error states
- **Proper Clearing**: Validation states clear appropriately on user interaction
- **Real-time Updates**: All state updates happen in real-time

#### 🌐 Tap Outside Fixes
- **Global Coverage**: Tap outside now works globally across the entire screen
- **External Handler Priority**: External handlers properly take priority over built-in functionality
- **Layout Exception Fix**: Fixed RenderBox layout exceptions in tap outside implementation
- **Gesture Detection**: Proper gesture detection with `HitTestBehavior.translucent`

### 🧹 Code Quality & Maintenance

#### 🧽 Cleanup & Optimization
- **Removed Debug Statements**: Removed all `print()` and `log()` statements from package
- **Code Cleanup**: Cleaned up unused variables and methods
- **Performance Optimization**: Optimized focus listener setup and state updates
- **Memory Management**: Improved memory management in state updates

#### 📚 Documentation Updates
- **Enhanced README**: Updated README with comprehensive examples and API reference
- **RTL Examples**: Added examples for RTL/LTR usage
- **Focus Management**: Documented tap outside and focus management features
- **Validation Examples**: Added examples for external validation control

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