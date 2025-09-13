/// A comprehensive Flutter package for OTP (One-Time Password) verification
/// with customizable styling, localization support, and robust functionality.
/// Enhanced with advanced features and comprehensive capabilities.
library flutter_otp_kit;

// Main unified API
export 'src/flutter_otp_kit.dart';

// Core widgets
export 'src/widgets/flexible_otp_field.dart'
    hide OtpFieldState, HapticFeedbackType;
export 'src/widgets/flexible_otp_verification.dart';
export 'src/widgets/composable_otp_field.dart' hide HapticFeedbackType;
export 'src/widgets/composable_otp_verification.dart';

// Configuration
export 'src/config/otp_builder.dart';
export 'src/config/otp_field_style.dart';

// Advanced Customization
export 'src/customization/advanced_field_customization.dart'
    hide HapticFeedbackType, HapticFeedbackTypeExtension;

// Validation
export 'src/validation/otp_validator.dart' hide OtpValidator;

// Platform Specific
export 'src/platform/platform_adaptive_otp.dart';

// Animations
export 'src/animations/advanced_animation_manager.dart';

// Legacy Compatibility Layer
export 'src/legacy/legacy_compatibility.dart';

// State Management
export 'src/state/reactive_otp_state.dart';

// Styling
export 'src/styling/otp_predefined_style.dart';

// Autofill
export 'src/autofill/platform_sms_autofill.dart';

// Legacy support for backward compatibility
export 'src/otp_verification_widget.dart';
export 'src/masking_type.dart';
export 'src/otp_input_type.dart';
export 'src/otp_layout_type.dart';
export 'src/otp_field_shape.dart';
export 'src/otp_behavior_config.dart';
export 'src/widgets/otp_field.dart';
export 'src/widgets/otp_fields_row.dart';
export 'src/widgets/otp_header.dart';
export 'src/widgets/otp_footer.dart';
export 'src/widgets/otp_error_display.dart';
export 'src/config/otp_error_config.dart';
export 'src/config/otp_field_config.dart' hide GradientType;
export 'src/config/otp_config.dart';
export 'src/state/otp_field_state.dart' hide OtpFieldState;
export 'src/styling/field_colors.dart';
export 'src/styling/otp_style_manager.dart';
export 'src/utils/otp_formatter.dart';
export 'src/utils/otp_masker.dart';
export 'src/utils/otp_validator.dart';
export 'src/theming/pin_theme.dart';
export 'src/validation/otp_form_validation.dart';
export 'src/feedback/haptic_feedback_manager.dart' hide HapticFeedbackType;
export 'src/autofill/sms_autofill_manager.dart';
export 'src/clipboard/enhanced_clipboard_manager.dart';
export 'src/animations/enhanced_animation_manager.dart';
export 'src/obscuring/obscuring_widget_manager.dart';
export 'src/cursor/enhanced_cursor_manager.dart';
export 'src/design/generic_field_system.dart' hide CursorStyle;
