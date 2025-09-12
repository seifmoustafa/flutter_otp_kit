/// A comprehensive Flutter package for OTP (One-Time Password) verification
/// with customizable styling, localization support, and robust functionality.
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

// New architecture components
export 'src/components/otp_field.dart';
export 'src/components/otp_fields_row.dart';
export 'src/components/otp_header.dart';
export 'src/components/otp_footer.dart';
export 'src/components/otp_error_display.dart';

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