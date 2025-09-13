import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Defines advanced customization options for OTP fields.
///
/// This class provides a comprehensive set of customization options
/// for OTP fields, allowing for complex visual effects and animations.
class AdvancedFieldCustomization {
  /// Creates advanced customization options for OTP fields.
  const AdvancedFieldCustomization({
    this.cursorConfig = const CursorConfig(),
    this.animationConfig = const AnimationConfig(),
    this.inputConfig = const InputConfig(),
    this.accessibilityConfig = const AccessibilityConfig(),
    this.shapesConfig = const ShapesConfig(),
    this.effectsConfig = const EffectsConfig(),
  });

  /// Configuration for cursor appearance and behavior.
  final CursorConfig cursorConfig;

  /// Configuration for animations.
  final AnimationConfig animationConfig;

  /// Configuration for input behavior.
  final InputConfig inputConfig;

  /// Configuration for accessibility features.
  final AccessibilityConfig accessibilityConfig;

  /// Configuration for field shapes and borders.
  final ShapesConfig shapesConfig;

  /// Configuration for visual effects.
  final EffectsConfig effectsConfig;

  /// Creates a copy with the given fields replaced.
  AdvancedFieldCustomization copyWith({
    CursorConfig? cursorConfig,
    AnimationConfig? animationConfig,
    InputConfig? inputConfig,
    AccessibilityConfig? accessibilityConfig,
    ShapesConfig? shapesConfig,
    EffectsConfig? effectsConfig,
  }) {
    return AdvancedFieldCustomization(
      cursorConfig: cursorConfig ?? this.cursorConfig,
      animationConfig: animationConfig ?? this.animationConfig,
      inputConfig: inputConfig ?? this.inputConfig,
      accessibilityConfig: accessibilityConfig ?? this.accessibilityConfig,
      shapesConfig: shapesConfig ?? this.shapesConfig,
      effectsConfig: effectsConfig ?? this.effectsConfig,
    );
  }
}

/// Configuration for cursor appearance and behavior.
class CursorConfig {
  /// Creates a cursor configuration.
  const CursorConfig({
    this.showCursor = true,
    this.cursorColor,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorOffset,
    this.cursorOpacity = 1.0,
    this.blinkDuration = const Duration(milliseconds: 500),
    this.blinkInterval = const Duration(milliseconds: 500),
    this.style = CursorStyle.vertical,
    this.showOnlyWhenFocused = true,
  });

  /// Whether to show the cursor.
  final bool showCursor;

  /// The color of the cursor.
  final Color? cursorColor;

  /// The width of the cursor.
  final double cursorWidth;

  /// The height of the cursor. If null, uses the height of the text.
  final double? cursorHeight;

  /// The radius of the cursor.
  final Radius? cursorRadius;

  /// The offset of the cursor.
  final Offset? cursorOffset;

  /// The opacity of the cursor.
  final double cursorOpacity;

  /// The duration of the cursor blink animation.
  final Duration blinkDuration;

  /// The interval between cursor blinks.
  final Duration blinkInterval;

  /// The style of the cursor.
  final CursorStyle style;

  /// Whether to show the cursor only when the field is focused.
  final bool showOnlyWhenFocused;

  /// Creates a copy with the given fields replaced.
  CursorConfig copyWith({
    bool? showCursor,
    Color? cursorColor,
    double? cursorWidth,
    double? cursorHeight,
    Radius? cursorRadius,
    Offset? cursorOffset,
    double? cursorOpacity,
    Duration? blinkDuration,
    Duration? blinkInterval,
    CursorStyle? style,
    bool? showOnlyWhenFocused,
  }) {
    return CursorConfig(
      showCursor: showCursor ?? this.showCursor,
      cursorColor: cursorColor ?? this.cursorColor,
      cursorWidth: cursorWidth ?? this.cursorWidth,
      cursorHeight: cursorHeight ?? this.cursorHeight,
      cursorRadius: cursorRadius ?? this.cursorRadius,
      cursorOffset: cursorOffset ?? this.cursorOffset,
      cursorOpacity: cursorOpacity ?? this.cursorOpacity,
      blinkDuration: blinkDuration ?? this.blinkDuration,
      blinkInterval: blinkInterval ?? this.blinkInterval,
      style: style ?? this.style,
      showOnlyWhenFocused: showOnlyWhenFocused ?? this.showOnlyWhenFocused,
    );
  }
}

/// Configuration for animations.
class AnimationConfig {
  /// Creates an animation configuration.
  const AnimationConfig({
    this.enableFieldAnimation = true,
    this.enableFocusAnimation = true,
    this.enableErrorAnimation = true,
    this.enableCompletionAnimation = true,
    this.enableTransitionAnimation = true,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.errorAnimationDuration = const Duration(milliseconds: 400),
    this.errorAnimationCurve = Curves.elasticIn,
    this.focusAnimationDuration = const Duration(milliseconds: 200),
    this.focusAnimationCurve = Curves.easeOutCubic,
    this.completionAnimationDuration = const Duration(milliseconds: 300),
    this.completionAnimationCurve = Curves.bounceOut,
    this.transitionAnimationDuration = const Duration(milliseconds: 150),
    this.transitionAnimationCurve = Curves.easeInOut,
    this.animationType = AnimationType.scale,
  });

  /// Whether to enable field animation.
  final bool enableFieldAnimation;

  /// Whether to enable focus animation.
  final bool enableFocusAnimation;

  /// Whether to enable error animation.
  final bool enableErrorAnimation;

  /// Whether to enable completion animation.
  final bool enableCompletionAnimation;

  /// Whether to enable transition animation.
  final bool enableTransitionAnimation;

  /// Duration for the main animation.
  final Duration animationDuration;

  /// Curve for the main animation.
  final Curve animationCurve;

  /// Duration for the error animation.
  final Duration errorAnimationDuration;

  /// Curve for the error animation.
  final Curve errorAnimationCurve;

  /// Duration for the focus animation.
  final Duration focusAnimationDuration;

  /// Curve for the focus animation.
  final Curve focusAnimationCurve;

  /// Duration for the completion animation.
  final Duration completionAnimationDuration;

  /// Curve for the completion animation.
  final Curve completionAnimationCurve;

  /// Duration for the transition animation.
  final Duration transitionAnimationDuration;

  /// Curve for the transition animation.
  final Curve transitionAnimationCurve;

  /// Type of animation to use.
  final AnimationType animationType;

  /// Creates a copy with the given fields replaced.
  AnimationConfig copyWith({
    bool? enableFieldAnimation,
    bool? enableFocusAnimation,
    bool? enableErrorAnimation,
    bool? enableCompletionAnimation,
    bool? enableTransitionAnimation,
    Duration? animationDuration,
    Curve? animationCurve,
    Duration? errorAnimationDuration,
    Curve? errorAnimationCurve,
    Duration? focusAnimationDuration,
    Curve? focusAnimationCurve,
    Duration? completionAnimationDuration,
    Curve? completionAnimationCurve,
    Duration? transitionAnimationDuration,
    Curve? transitionAnimationCurve,
    AnimationType? animationType,
  }) {
    return AnimationConfig(
      enableFieldAnimation: enableFieldAnimation ?? this.enableFieldAnimation,
      enableFocusAnimation: enableFocusAnimation ?? this.enableFocusAnimation,
      enableErrorAnimation: enableErrorAnimation ?? this.enableErrorAnimation,
      enableCompletionAnimation:
          enableCompletionAnimation ?? this.enableCompletionAnimation,
      enableTransitionAnimation:
          enableTransitionAnimation ?? this.enableTransitionAnimation,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      errorAnimationDuration:
          errorAnimationDuration ?? this.errorAnimationDuration,
      errorAnimationCurve: errorAnimationCurve ?? this.errorAnimationCurve,
      focusAnimationDuration:
          focusAnimationDuration ?? this.focusAnimationDuration,
      focusAnimationCurve: focusAnimationCurve ?? this.focusAnimationCurve,
      completionAnimationDuration:
          completionAnimationDuration ?? this.completionAnimationDuration,
      completionAnimationCurve:
          completionAnimationCurve ?? this.completionAnimationCurve,
      transitionAnimationDuration:
          transitionAnimationDuration ?? this.transitionAnimationDuration,
      transitionAnimationCurve:
          transitionAnimationCurve ?? this.transitionAnimationCurve,
      animationType: animationType ?? this.animationType,
    );
  }
}

/// Configuration for input behavior.
class InputConfig {
  /// Creates an input configuration.
  const InputConfig({
    this.autofocus = true,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.enableInteractiveSelection = true,
    this.textCapitalization = TextCapitalization.none,
    this.autocorrect = false,
    this.enableSuggestions = false,
    this.keyboardType = TextInputType.number,
    this.textInputAction = TextInputAction.next,
    this.autoFillHints = const ['oneTimeCode'],
    this.enablePaste = true,
    this.inputFormatters = const [],
    this.clearOnSubmit = false,
    this.autoClear = false,
    this.autoClearDelay = const Duration(seconds: 5),
    this.moveToNextOnFilled = true,
    this.unfocusOnComplete = true,
    this.hapticFeedbackType = HapticFeedbackType.light,
  });

  /// Whether to auto-focus the field.
  final bool autofocus;

  /// Whether the field is enabled.
  final bool enabled;

  /// Whether the field is read-only.
  final bool readOnly;

  /// Whether to obscure the input text.
  final bool obscureText;

  /// Character to use for obscuring text.
  final String obscuringCharacter;

  /// Whether to enable interactive text selection.
  final bool enableInteractiveSelection;

  /// Text capitalization for the input.
  final TextCapitalization textCapitalization;

  /// Whether to enable autocorrect.
  final bool autocorrect;

  /// Whether to enable suggestions.
  final bool enableSuggestions;

  /// Keyboard type for the input.
  final TextInputType keyboardType;

  /// Text input action for the keyboard.
  final TextInputAction textInputAction;

  /// Auto-fill hints for the input.
  final List<String> autoFillHints;

  /// Whether to enable paste functionality.
  final bool enablePaste;

  /// Input formatters for the input.
  final List<TextInputFormatter> inputFormatters;

  /// Whether to clear the input on submit.
  final bool clearOnSubmit;

  /// Whether to automatically clear the input after a delay.
  final bool autoClear;

  /// Delay before auto-clearing the input.
  final Duration autoClearDelay;

  /// Whether to move to the next field when this one is filled.
  final bool moveToNextOnFilled;

  /// Whether to unfocus when all fields are completed.
  final bool unfocusOnComplete;

  /// Type of haptic feedback to provide.
  final HapticFeedbackType hapticFeedbackType;

  /// Creates a copy with the given fields replaced.
  InputConfig copyWith({
    bool? autofocus,
    bool? enabled,
    bool? readOnly,
    bool? obscureText,
    String? obscuringCharacter,
    bool? enableInteractiveSelection,
    TextCapitalization? textCapitalization,
    bool? autocorrect,
    bool? enableSuggestions,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    List<String>? autoFillHints,
    bool? enablePaste,
    List<TextInputFormatter>? inputFormatters,
    bool? clearOnSubmit,
    bool? autoClear,
    Duration? autoClearDelay,
    bool? moveToNextOnFilled,
    bool? unfocusOnComplete,
    HapticFeedbackType? hapticFeedbackType,
  }) {
    return InputConfig(
      autofocus: autofocus ?? this.autofocus,
      enabled: enabled ?? this.enabled,
      readOnly: readOnly ?? this.readOnly,
      obscureText: obscureText ?? this.obscureText,
      obscuringCharacter: obscuringCharacter ?? this.obscuringCharacter,
      enableInteractiveSelection:
          enableInteractiveSelection ?? this.enableInteractiveSelection,
      textCapitalization: textCapitalization ?? this.textCapitalization,
      autocorrect: autocorrect ?? this.autocorrect,
      enableSuggestions: enableSuggestions ?? this.enableSuggestions,
      keyboardType: keyboardType ?? this.keyboardType,
      textInputAction: textInputAction ?? this.textInputAction,
      autoFillHints: autoFillHints ?? this.autoFillHints,
      enablePaste: enablePaste ?? this.enablePaste,
      inputFormatters: inputFormatters ?? this.inputFormatters,
      clearOnSubmit: clearOnSubmit ?? this.clearOnSubmit,
      autoClear: autoClear ?? this.autoClear,
      autoClearDelay: autoClearDelay ?? this.autoClearDelay,
      moveToNextOnFilled: moveToNextOnFilled ?? this.moveToNextOnFilled,
      unfocusOnComplete: unfocusOnComplete ?? this.unfocusOnComplete,
      hapticFeedbackType: hapticFeedbackType ?? this.hapticFeedbackType,
    );
  }
}

/// Configuration for accessibility features.
class AccessibilityConfig {
  /// Creates an accessibility configuration.
  const AccessibilityConfig({
    this.enableScreenReader = true,
    this.semanticLabel,
    this.semanticHint,
    this.semanticValue,
    this.semanticCounter,
    this.enableNavigationOptions = true,
    this.accessibilityOrder,
    this.incrementAction = true,
    this.decrementAction = true,
    this.customActions = const [],
  });

  /// Whether to enable screen reader support.
  final bool enableScreenReader;

  /// Semantic label for the field.
  final String? semanticLabel;

  /// Semantic hint for the field.
  final String? semanticHint;

  /// Semantic value for the field.
  final String? semanticValue;

  /// Semantic counter for the field.
  final String? semanticCounter;

  /// Whether to enable navigation options.
  final bool enableNavigationOptions;

  /// Order for accessibility navigation.
  final int? accessibilityOrder;

  /// Whether to enable increment action.
  final bool incrementAction;

  /// Whether to enable decrement action.
  final bool decrementAction;

  /// Custom accessibility actions.
  final List<CustomAction> customActions;

  /// Creates a copy with the given fields replaced.
  AccessibilityConfig copyWith({
    bool? enableScreenReader,
    String? semanticLabel,
    String? semanticHint,
    String? semanticValue,
    String? semanticCounter,
    bool? enableNavigationOptions,
    int? accessibilityOrder,
    bool? incrementAction,
    bool? decrementAction,
    List<CustomAction>? customActions,
  }) {
    return AccessibilityConfig(
      enableScreenReader: enableScreenReader ?? this.enableScreenReader,
      semanticLabel: semanticLabel ?? this.semanticLabel,
      semanticHint: semanticHint ?? this.semanticHint,
      semanticValue: semanticValue ?? this.semanticValue,
      semanticCounter: semanticCounter ?? this.semanticCounter,
      enableNavigationOptions:
          enableNavigationOptions ?? this.enableNavigationOptions,
      accessibilityOrder: accessibilityOrder ?? this.accessibilityOrder,
      incrementAction: incrementAction ?? this.incrementAction,
      decrementAction: decrementAction ?? this.decrementAction,
      customActions: customActions ?? this.customActions,
    );
  }
}

/// Configuration for field shapes and borders.
class ShapesConfig {
  /// Creates a shapes configuration.
  const ShapesConfig({
    this.fieldShape = FieldShape.rectangle,
    this.borderRadius = 8.0,
    this.borderWidth = 1.0,
    this.focusedBorderWidth = 2.0,
    this.errorBorderWidth = 2.0,
    this.innerPadding = const EdgeInsets.all(8.0),
    this.customShape,
    this.customBorder,
  });

  /// Shape of the field.
  final FieldShape fieldShape;

  /// Border radius for the field.
  final double borderRadius;

  /// Border width for the field.
  final double borderWidth;

  /// Border width when the field is focused.
  final double focusedBorderWidth;

  /// Border width when the field has an error.
  final double errorBorderWidth;

  /// Padding inside the field.
  final EdgeInsets innerPadding;

  /// Custom shape for the field.
  final ShapeBorder? customShape;

  /// Custom border for the field.
  final BoxBorder? customBorder;

  /// Creates a copy with the given fields replaced.
  ShapesConfig copyWith({
    FieldShape? fieldShape,
    double? borderRadius,
    double? borderWidth,
    double? focusedBorderWidth,
    double? errorBorderWidth,
    EdgeInsets? innerPadding,
    ShapeBorder? customShape,
    BoxBorder? customBorder,
  }) {
    return ShapesConfig(
      fieldShape: fieldShape ?? this.fieldShape,
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      focusedBorderWidth: focusedBorderWidth ?? this.focusedBorderWidth,
      errorBorderWidth: errorBorderWidth ?? this.errorBorderWidth,
      innerPadding: innerPadding ?? this.innerPadding,
      customShape: customShape ?? this.customShape,
      customBorder: customBorder ?? this.customBorder,
    );
  }
}

/// Configuration for visual effects.
class EffectsConfig {
  /// Creates an effects configuration.
  const EffectsConfig({
    this.enableShadow = false,
    this.shadowColor,
    this.shadowOffset = const Offset(0, 2),
    this.shadowBlurRadius = 4.0,
    this.shadowSpreadRadius = 0.0,
    this.enableGlow = false,
    this.glowColor,
    this.glowSpreadRadius = 2.0,
    this.enableGradient = false,
    this.gradientColors,
    this.gradientType = GradientType.linear,
    this.gradientBegin = Alignment.topLeft,
    this.gradientEnd = Alignment.bottomRight,
    this.enableInnerShadow = false,
    this.innerShadowColor,
    this.innerShadowOffset = const Offset(0, 2),
    this.innerShadowBlurRadius = 4.0,
  });

  /// Whether to enable shadow effect.
  final bool enableShadow;

  /// Color of the shadow.
  final Color? shadowColor;

  /// Offset of the shadow.
  final Offset shadowOffset;

  /// Blur radius of the shadow.
  final double shadowBlurRadius;

  /// Spread radius of the shadow.
  final double shadowSpreadRadius;

  /// Whether to enable glow effect.
  final bool enableGlow;

  /// Color of the glow.
  final Color? glowColor;

  /// Spread radius of the glow.
  final double glowSpreadRadius;

  /// Whether to enable gradient effect.
  final bool enableGradient;

  /// Colors for the gradient.
  final List<Color>? gradientColors;

  /// Type of gradient to use.
  final GradientType gradientType;

  /// Starting alignment for the gradient.
  final Alignment gradientBegin;

  /// Ending alignment for the gradient.
  final Alignment gradientEnd;

  /// Whether to enable inner shadow effect.
  final bool enableInnerShadow;

  /// Color of the inner shadow.
  final Color? innerShadowColor;

  /// Offset of the inner shadow.
  final Offset innerShadowOffset;

  /// Blur radius of the inner shadow.
  final double innerShadowBlurRadius;

  /// Creates a copy with the given fields replaced.
  EffectsConfig copyWith({
    bool? enableShadow,
    Color? shadowColor,
    Offset? shadowOffset,
    double? shadowBlurRadius,
    double? shadowSpreadRadius,
    bool? enableGlow,
    Color? glowColor,
    double? glowSpreadRadius,
    bool? enableGradient,
    List<Color>? gradientColors,
    GradientType? gradientType,
    Alignment? gradientBegin,
    Alignment? gradientEnd,
    bool? enableInnerShadow,
    Color? innerShadowColor,
    Offset? innerShadowOffset,
    double? innerShadowBlurRadius,
  }) {
    return EffectsConfig(
      enableShadow: enableShadow ?? this.enableShadow,
      shadowColor: shadowColor ?? this.shadowColor,
      shadowOffset: shadowOffset ?? this.shadowOffset,
      shadowBlurRadius: shadowBlurRadius ?? this.shadowBlurRadius,
      shadowSpreadRadius: shadowSpreadRadius ?? this.shadowSpreadRadius,
      enableGlow: enableGlow ?? this.enableGlow,
      glowColor: glowColor ?? this.glowColor,
      glowSpreadRadius: glowSpreadRadius ?? this.glowSpreadRadius,
      enableGradient: enableGradient ?? this.enableGradient,
      gradientColors: gradientColors ?? this.gradientColors,
      gradientType: gradientType ?? this.gradientType,
      gradientBegin: gradientBegin ?? this.gradientBegin,
      gradientEnd: gradientEnd ?? this.gradientEnd,
      enableInnerShadow: enableInnerShadow ?? this.enableInnerShadow,
      innerShadowColor: innerShadowColor ?? this.innerShadowColor,
      innerShadowOffset: innerShadowOffset ?? this.innerShadowOffset,
      innerShadowBlurRadius:
          innerShadowBlurRadius ?? this.innerShadowBlurRadius,
    );
  }
}

/// A custom accessibility action.
class CustomAction {
  /// Creates a custom accessibility action.
  const CustomAction({
    required this.label,
    required this.action,
  });

  /// Label for the action.
  final String label;

  /// Callback for the action.
  final VoidCallback action;
}

/// Type of field animation.
enum AnimationType {
  /// No animation.
  none,

  /// Scale animation.
  scale,

  /// Rotate animation.
  rotate,

  /// Slide animation.
  slide,

  /// Fade animation.
  fade,

  /// Bounce animation.
  bounce,

  /// Pulse animation.
  pulse,

  /// Shake animation.
  shake,

  /// Custom animation.
  custom,
}

/// Type of cursor style.
enum CursorStyle {
  /// No visible cursor.
  none,

  /// Standard vertical line cursor.
  vertical,

  /// Bottom border cursor (underlined cursor that looks like "_").
  bottom,

  /// Custom cursor that allows developer to build their own cursor.
  custom,
}

/// Type of field shape.
enum FieldShape {
  /// Rectangular shape.
  rectangle,

  /// Circular shape.
  circle,

  /// Stadium shape (rectangle with rounded ends).
  stadium,

  /// Rounded rectangle shape.
  roundedRectangle,

  /// Custom shape.
  custom,
}

/// Type of gradient.
enum GradientType {
  /// Linear gradient.
  linear,

  /// Radial gradient.
  radial,

  /// Sweep gradient.
  sweep,
}

/// Type of haptic feedback.
enum HapticFeedbackType {
  /// No haptic feedback.
  none,

  /// Light haptic feedback.
  light,

  /// Medium haptic feedback.
  medium,

  /// Heavy haptic feedback.
  heavy,

  /// Selection click haptic feedback.
  selection,
}

/// Extension to apply haptic feedback.
extension HapticFeedbackTypeExtension on HapticFeedbackType {
  /// Triggers the haptic feedback.
  void trigger() {
    switch (this) {
      case HapticFeedbackType.none:
        break;
      case HapticFeedbackType.light:
        HapticFeedback.lightImpact();
        break;
      case HapticFeedbackType.medium:
        HapticFeedback.mediumImpact();
        break;
      case HapticFeedbackType.heavy:
        HapticFeedback.heavyImpact();
        break;
      case HapticFeedbackType.selection:
        HapticFeedback.selectionClick();
        break;
    }
  }
}
