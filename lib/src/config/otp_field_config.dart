import 'package:flutter/material.dart';
import '../otp_field_shape.dart';

/// Configuration for OTP field appearance and behavior
class OtpFieldConfig {
  /// Creates a new OTP field configuration
  const OtpFieldConfig({
    // Field dimensions
    this.fieldWidth = 55.125,
    this.fieldHeight = 60.731,
    this.borderRadius = 17.752,
    this.borderWidth = 1.869,
    this.minResponsiveWidth = 40.0,
    this.maxFieldHeight = 80.0,
    this.aspectRatio,

    // Colors
    this.primaryColor = const Color(0xFF018CC3),
    this.secondaryColor = const Color(0xFF8B8B8B),
    this.backgroundColor = Colors.white,
    this.placeholderColor,

    // Typography
    this.fieldStyle,
    this.fieldFontSize = 24.0,
    this.fieldFontWeight = FontWeight.bold,
    this.letterSpacing = 0.5,
    this.lineHeight = 1.0,

    // Cursor
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth = 1.0,
    this.enableBlink = true,
    this.blinkDuration = const Duration(milliseconds: 500),

    // Shadow effects
    this.enableShadow = false,
    this.shadowColor,
    this.shadowBlurRadius = 10.0,
    this.shadowSpreadRadius = 0.0,
    this.shadowOffset = const Offset(0, 2),
    this.enableInnerShadow = false,
    this.innerShadowColor,
    this.innerShadowBlurRadius = 2.0,
    this.innerShadowSpreadRadius = 0.0,
    this.innerShadowOffset = const Offset(0, 0),

    // Field shape
    this.fieldShape = OtpFieldShape.roundedRectangle,
    this.fieldShapeConfig,

    // Advanced styling
    this.enableGradient = false,
    this.gradientConfig,
    this.enableCustomDecoration = false,
    this.customDecoration,

    // Focus effect
    this.focusEffect = FocusEffect.color,
    this.focusScaleFactor = 1.05,
    this.focusHighlightColor,
    this.focusGlowRadius = 2.0,
    this.focusGlowIntensity = 0.5,

    // Completed field effect
    this.completedEffect = CompletedEffect.fill,
    this.completedFieldOpacity = 1.0,
    this.completedFieldGlowRadius = 0.0,
    this.completedFieldIntensity = 0.1,
    this.completedFieldTransition = const Duration(milliseconds: 150),

    // Field placeholder (empty state)
    this.showPlaceholder = false,
    this.placeholderCharacter = '-',
    this.placeholderStyle,

    // Feedback
    this.enableHapticFeedback = false,
    this.hapticFeedbackType = HapticFeedbackType.light,
  });

  // Field dimensions
  /// Width of the field
  final double fieldWidth;

  /// Height of the field
  final double fieldHeight;

  /// Border radius of the field
  final double borderRadius;

  /// Border width of the field
  final double borderWidth;

  /// Minimum field width in responsive mode
  final double minResponsiveWidth;

  /// Maximum field height
  final double maxFieldHeight;

  /// Optional aspect ratio for fields (width:height)
  final double? aspectRatio;

  // Colors
  /// Primary color for the field
  final Color primaryColor;

  /// Secondary color for the field
  final Color secondaryColor;

  /// Background color for the field
  final Color backgroundColor;

  /// Color for placeholder text
  final Color? placeholderColor;

  // Typography
  /// Text style for the field
  final TextStyle? fieldStyle;

  /// Font size for field text
  final double fieldFontSize;

  /// Font weight for field text
  final FontWeight fieldFontWeight;

  /// Letter spacing for field text
  final double letterSpacing;

  /// Line height for field text
  final double lineHeight;

  // Cursor
  /// Color of the cursor
  final Color? cursorColor;

  /// Height of the cursor
  final double? cursorHeight;

  /// Width of the cursor
  final double cursorWidth;

  /// Whether to enable cursor blinking
  final bool enableBlink;

  /// Duration for cursor blink
  final Duration blinkDuration;

  // Shadow effects
  /// Whether to enable shadow for the field
  final bool enableShadow;

  /// Color of the shadow
  final Color? shadowColor;

  /// Blur radius of the shadow
  final double shadowBlurRadius;

  /// Spread radius of the shadow
  final double shadowSpreadRadius;

  /// Offset of the shadow
  final Offset shadowOffset;

  /// Whether to enable inner shadow
  final bool enableInnerShadow;

  /// Color of the inner shadow
  final Color? innerShadowColor;

  /// Blur radius of the inner shadow
  final double innerShadowBlurRadius;

  /// Spread radius of the inner shadow
  final double innerShadowSpreadRadius;

  /// Offset of the inner shadow
  final Offset innerShadowOffset;

  // Field shape
  /// Shape of the field
  final OtpFieldShape fieldShape;

  /// Configuration for custom field shape
  final OtpFieldShapeConfig? fieldShapeConfig;

  // Advanced styling
  /// Whether to enable gradient background
  final bool enableGradient;

  /// Configuration for gradient background
  final OtpGradientConfig? gradientConfig;

  /// Whether to enable custom decoration
  final bool enableCustomDecoration;

  /// Custom decoration for the field
  final BoxDecoration? customDecoration;

  // Focus effect
  /// Type of focus effect to apply
  final FocusEffect focusEffect;

  /// Scale factor when focus effect is scale
  final double focusScaleFactor;

  /// Highlight color for focus glow
  final Color? focusHighlightColor;

  /// Radius of the focus glow
  final double focusGlowRadius;

  /// Intensity of the focus glow (0.0-1.0)
  final double focusGlowIntensity;

  // Completed field effect
  /// Type of effect for completed fields
  final CompletedEffect completedEffect;

  /// Opacity for completed field effect
  final double completedFieldOpacity;

  /// Glow radius for completed field
  final double completedFieldGlowRadius;

  /// Intensity of completed field effect (0.0-1.0)
  final double completedFieldIntensity;

  /// Transition duration for completed field effect
  final Duration completedFieldTransition;

  // Field placeholder
  /// Whether to show placeholder in empty fields
  final bool showPlaceholder;

  /// Character to use for placeholder
  final String placeholderCharacter;

  /// Style for placeholder text
  final TextStyle? placeholderStyle;

  // Feedback
  /// Whether to enable haptic feedback on field interaction
  final bool enableHapticFeedback;

  /// Type of haptic feedback
  final HapticFeedbackType hapticFeedbackType;

  /// Creates a copy of this object with the given fields replaced with the new values
  OtpFieldConfig copyWith({
    // Field dimensions
    double? fieldWidth,
    double? fieldHeight,
    double? borderRadius,
    double? borderWidth,
    double? minResponsiveWidth,
    double? maxFieldHeight,
    double? aspectRatio,

    // Colors
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? placeholderColor,

    // Typography
    TextStyle? fieldStyle,
    double? fieldFontSize,
    FontWeight? fieldFontWeight,
    double? letterSpacing,
    double? lineHeight,

    // Cursor
    Color? cursorColor,
    double? cursorHeight,
    double? cursorWidth,
    bool? enableBlink,
    Duration? blinkDuration,

    // Shadow effects
    bool? enableShadow,
    Color? shadowColor,
    double? shadowBlurRadius,
    double? shadowSpreadRadius,
    Offset? shadowOffset,
    bool? enableInnerShadow,
    Color? innerShadowColor,
    double? innerShadowBlurRadius,
    double? innerShadowSpreadRadius,
    Offset? innerShadowOffset,

    // Field shape
    OtpFieldShape? fieldShape,
    OtpFieldShapeConfig? fieldShapeConfig,

    // Advanced styling
    bool? enableGradient,
    OtpGradientConfig? gradientConfig,
    bool? enableCustomDecoration,
    BoxDecoration? customDecoration,

    // Focus effect
    FocusEffect? focusEffect,
    double? focusScaleFactor,
    Color? focusHighlightColor,
    double? focusGlowRadius,
    double? focusGlowIntensity,

    // Completed field effect
    CompletedEffect? completedEffect,
    double? completedFieldOpacity,
    double? completedFieldGlowRadius,
    double? completedFieldIntensity,
    Duration? completedFieldTransition,

    // Field placeholder
    bool? showPlaceholder,
    String? placeholderCharacter,
    TextStyle? placeholderStyle,

    // Feedback
    bool? enableHapticFeedback,
    HapticFeedbackType? hapticFeedbackType,
  }) {
    return OtpFieldConfig(
      // Field dimensions
      fieldWidth: fieldWidth ?? this.fieldWidth,
      fieldHeight: fieldHeight ?? this.fieldHeight,
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      minResponsiveWidth: minResponsiveWidth ?? this.minResponsiveWidth,
      maxFieldHeight: maxFieldHeight ?? this.maxFieldHeight,
      aspectRatio: aspectRatio ?? this.aspectRatio,

      // Colors
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      placeholderColor: placeholderColor ?? this.placeholderColor,

      // Typography
      fieldStyle: fieldStyle ?? this.fieldStyle,
      fieldFontSize: fieldFontSize ?? this.fieldFontSize,
      fieldFontWeight: fieldFontWeight ?? this.fieldFontWeight,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      lineHeight: lineHeight ?? this.lineHeight,

      // Cursor
      cursorColor: cursorColor ?? this.cursorColor,
      cursorHeight: cursorHeight ?? this.cursorHeight,
      cursorWidth: cursorWidth ?? this.cursorWidth,
      enableBlink: enableBlink ?? this.enableBlink,
      blinkDuration: blinkDuration ?? this.blinkDuration,

      // Shadow effects
      enableShadow: enableShadow ?? this.enableShadow,
      shadowColor: shadowColor ?? this.shadowColor,
      shadowBlurRadius: shadowBlurRadius ?? this.shadowBlurRadius,
      shadowSpreadRadius: shadowSpreadRadius ?? this.shadowSpreadRadius,
      shadowOffset: shadowOffset ?? this.shadowOffset,
      enableInnerShadow: enableInnerShadow ?? this.enableInnerShadow,
      innerShadowColor: innerShadowColor ?? this.innerShadowColor,
      innerShadowBlurRadius:
          innerShadowBlurRadius ?? this.innerShadowBlurRadius,
      innerShadowSpreadRadius:
          innerShadowSpreadRadius ?? this.innerShadowSpreadRadius,
      innerShadowOffset: innerShadowOffset ?? this.innerShadowOffset,

      // Field shape
      fieldShape: fieldShape ?? this.fieldShape,
      fieldShapeConfig: fieldShapeConfig ?? this.fieldShapeConfig,

      // Advanced styling
      enableGradient: enableGradient ?? this.enableGradient,
      gradientConfig: gradientConfig ?? this.gradientConfig,
      enableCustomDecoration:
          enableCustomDecoration ?? this.enableCustomDecoration,
      customDecoration: customDecoration ?? this.customDecoration,

      // Focus effect
      focusEffect: focusEffect ?? this.focusEffect,
      focusScaleFactor: focusScaleFactor ?? this.focusScaleFactor,
      focusHighlightColor: focusHighlightColor ?? this.focusHighlightColor,
      focusGlowRadius: focusGlowRadius ?? this.focusGlowRadius,
      focusGlowIntensity: focusGlowIntensity ?? this.focusGlowIntensity,

      // Completed field effect
      completedEffect: completedEffect ?? this.completedEffect,
      completedFieldOpacity:
          completedFieldOpacity ?? this.completedFieldOpacity,
      completedFieldGlowRadius:
          completedFieldGlowRadius ?? this.completedFieldGlowRadius,
      completedFieldIntensity:
          completedFieldIntensity ?? this.completedFieldIntensity,
      completedFieldTransition:
          completedFieldTransition ?? this.completedFieldTransition,

      // Field placeholder
      showPlaceholder: showPlaceholder ?? this.showPlaceholder,
      placeholderCharacter: placeholderCharacter ?? this.placeholderCharacter,
      placeholderStyle: placeholderStyle ?? this.placeholderStyle,

      // Feedback
      enableHapticFeedback: enableHapticFeedback ?? this.enableHapticFeedback,
      hapticFeedbackType: hapticFeedbackType ?? this.hapticFeedbackType,
    );
  }

  /// Creates a preset configuration for a specific style
  factory OtpFieldConfig.preset(OtpFieldPreset preset) {
    switch (preset) {
      case OtpFieldPreset.modern:
        return const OtpFieldConfig(
          fieldWidth: 55,
          fieldHeight: 60,
          borderRadius: 18,
          borderWidth: 1.5,
          primaryColor: Color(0xFF018CC3),
          backgroundColor: Colors.white,
          enableShadow: true,
          shadowBlurRadius: 8,
          shadowSpreadRadius: 0,
          focusEffect: FocusEffect.glow,
          completedEffect: CompletedEffect.fillAndBorder,
        );

      case OtpFieldPreset.classic:
        return const OtpFieldConfig(
          fieldWidth: 50,
          fieldHeight: 55,
          borderRadius: 8,
          borderWidth: 1.0,
          primaryColor: Color(0xFF2196F3),
          backgroundColor: Colors.white,
          enableShadow: false,
          focusEffect: FocusEffect.color,
          completedEffect: CompletedEffect.color,
        );

      case OtpFieldPreset.minimal:
        return const OtpFieldConfig(
          fieldWidth: 45,
          fieldHeight: 50,
          borderRadius: 4,
          borderWidth: 1.0,
          primaryColor: Color(0xFF757575),
          backgroundColor: Colors.white,
          enableShadow: false,
          focusEffect: FocusEffect.color,
          completedEffect: CompletedEffect.color,
        );

      case OtpFieldPreset.rounded:
        return const OtpFieldConfig(
          fieldWidth: 55,
          fieldHeight: 55,
          borderRadius: 27.5, // Half of height for circle
          borderWidth: 1.5,
          primaryColor: Color(0xFF9C27B0),
          backgroundColor: Colors.white,
          enableShadow: true,
          focusEffect: FocusEffect.glow,
          completedEffect: CompletedEffect.fillAndBorder,
        );

      case OtpFieldPreset.underlined:
        return const OtpFieldConfig(
          fieldWidth: 45,
          fieldHeight: 50,
          borderRadius: 0,
          borderWidth: 2.0,
          fieldShape: OtpFieldShape.custom,
          fieldShapeConfig: OtpFieldShapeConfig(
            borderStyle: OtpBorderStyle.bottomOnly,
          ),
          primaryColor: Color(0xFF000000),
          backgroundColor: Colors.transparent,
          enableShadow: false,
          focusEffect: FocusEffect.color,
          completedEffect: CompletedEffect.color,
        );

      case OtpFieldPreset.outlined:
        return const OtpFieldConfig(
          fieldWidth: 55,
          fieldHeight: 60,
          borderRadius: 8,
          borderWidth: 1.5,
          primaryColor: Color(0xFF4CAF50),
          backgroundColor: Colors.white,
          enableShadow: false,
          focusEffect: FocusEffect.color,
          completedEffect: CompletedEffect.fillAndBorder,
        );
    }
  }
}

/// Type of focus effect for OTP fields
enum FocusEffect {
  /// Change border color only
  color,

  /// Scale the field slightly
  scale,

  /// Add glow effect around the field
  glow,

  /// Both color and scale
  colorAndScale,

  /// No special effect
  none,
}

/// Type of effect for completed fields
enum CompletedEffect {
  /// Change border color
  color,

  /// Fill with background color
  fill,

  /// Both border and background color
  fillAndBorder,

  /// Add glow effect
  glow,

  /// No special effect
  none,
}

/// Type of haptic feedback
enum HapticFeedbackType {
  /// Light impact
  light,

  /// Medium impact
  medium,

  /// Heavy impact
  heavy,

  /// Selection click
  selection,
}

/// Preset configurations for OTP fields
enum OtpFieldPreset {
  /// Modern style with rounded corners and shadow
  modern,

  /// Classic style with standard elements
  classic,

  /// Minimal design with clean look
  minimal,

  /// Rounded/circular fields
  rounded,

  /// Underlined fields without borders
  underlined,

  /// Material Design outlined fields
  outlined,
}

/// Configuration for gradient background
class OtpGradientConfig {
  /// Creates a new gradient configuration
  const OtpGradientConfig({
    required this.colors,
    this.type = GradientType.linear,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.center,
    this.radius = 0.5,
    this.stops,
    this.tileMode = TileMode.clamp,
    this.focal,
    this.focalRadius = 0.0,
  });

  /// Colors for the gradient
  final List<Color> colors;

  /// Type of gradient
  final GradientType type;

  /// Start alignment for linear gradient
  final Alignment begin;

  /// End alignment for linear gradient
  final Alignment end;

  /// Center point for radial gradient
  final Alignment? center;

  /// Radius for radial gradient
  final double radius;

  /// Stops for the gradient
  final List<double>? stops;

  /// Tile mode for the gradient
  final TileMode tileMode;

  /// Focal point for radial gradient
  final Alignment? focal;

  /// Focal radius for radial gradient
  final double focalRadius;

  /// Creates a copy of this object with the given fields replaced with the new values
  OtpGradientConfig copyWith({
    List<Color>? colors,
    GradientType? type,
    Alignment? begin,
    Alignment? end,
    Alignment? center,
    double? radius,
    List<double>? stops,
    TileMode? tileMode,
    Alignment? focal,
    double? focalRadius,
  }) {
    return OtpGradientConfig(
      colors: colors ?? this.colors,
      type: type ?? this.type,
      begin: begin ?? this.begin,
      end: end ?? this.end,
      center: center ?? this.center,
      radius: radius ?? this.radius,
      stops: stops ?? this.stops,
      tileMode: tileMode ?? this.tileMode,
      focal: focal ?? this.focal,
      focalRadius: focalRadius ?? this.focalRadius,
    );
  }

  /// Creates a preset gradient configuration
  factory OtpGradientConfig.preset(GradientPreset preset) {
    switch (preset) {
      case GradientPreset.blueToIndigo:
        return OtpGradientConfig(
          colors: [Colors.blue.shade400, Colors.indigo.shade600],
          type: GradientType.linear,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );

      case GradientPreset.greenToTeal:
        return OtpGradientConfig(
          colors: [Colors.green.shade400, Colors.teal.shade700],
          type: GradientType.linear,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );

      case GradientPreset.purpleToDeepPurple:
        return OtpGradientConfig(
          colors: [Colors.purple.shade300, Colors.deepPurple.shade700],
          type: GradientType.linear,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );

      case GradientPreset.orangeToDeepOrange:
        return OtpGradientConfig(
          colors: [Colors.orange.shade300, Colors.deepOrange.shade600],
          type: GradientType.linear,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );

      case GradientPreset.blueGrayToGray:
        return OtpGradientConfig(
          colors: [Colors.blueGrey.shade200, Colors.grey.shade600],
          type: GradientType.linear,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
    }
  }
}

/// Preset gradients
enum GradientPreset {
  /// Blue to indigo gradient
  blueToIndigo,

  /// Green to teal gradient
  greenToTeal,

  /// Purple to deep purple gradient
  purpleToDeepPurple,

  /// Orange to deep orange gradient
  orangeToDeepOrange,

  /// Blue gray to gray gradient
  blueGrayToGray,
}

/// Type of gradient
enum GradientType {
  /// Linear gradient
  linear,

  /// Radial gradient
  radial,

  /// Sweep gradient
  sweep,
}
