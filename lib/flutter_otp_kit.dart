/// A comprehensive Flutter package for OTP (One-Time Password) verification
/// with customizable styling, localization support, and robust functionality.
/// Enhanced with advanced features and comprehensive capabilities.
library flutter_otp_kit;

// Main widget
export 'src/otp_verification_widget.dart';

// Enums
export 'src/masking_type.dart';
export 'src/otp_input_type.dart';
export 'src/otp_layout_type.dart';
export 'src/otp_field_shape.dart';

// Legacy configs (for backward compatibility)
// These are kept for backward compatibility but are deprecated
export 'src/otp_behavior_config.dart';

// New architecture widgets
export 'src/widgets/otp_field.dart';
export 'src/widgets/otp_fields_row.dart';
export 'src/widgets/otp_header.dart';
export 'src/widgets/otp_footer.dart';
export 'src/widgets/otp_error_display.dart';

// Configuration
export 'src/config/otp_error_config.dart';
export 'src/config/otp_field_config.dart';
export 'src/config/otp_config.dart';

// State management
export 'src/state/otp_field_state.dart';

// Styling
export 'src/styling/field_colors.dart';
export 'src/styling/otp_style_manager.dart';

// Utilities
export 'src/utils/otp_formatter.dart';
export 'src/utils/otp_masker.dart';
export 'src/utils/otp_validator.dart';

// Enhanced Features (New)
// Enhanced theming system (PinTheme-like)
export 'src/theming/pin_theme.dart';

// Enhanced validation system
export 'src/validation/otp_form_validation.dart';

// Enhanced haptic feedback
export 'src/feedback/haptic_feedback_manager.dart';

// Enhanced SMS autofill
export 'src/autofill/sms_autofill_manager.dart';

// Enhanced clipboard handling
export 'src/clipboard/enhanced_clipboard_manager.dart';

// Enhanced animation system
export 'src/animations/enhanced_animation_manager.dart';

// Enhanced obscuring widget support
export 'src/obscuring/obscuring_widget_manager.dart';

// Enhanced cursor management
export 'src/cursor/enhanced_cursor_manager.dart';

// Generic field system (Complete customizable field design)
export 'src/design/generic_field_system.dart';
