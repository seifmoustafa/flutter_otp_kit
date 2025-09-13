import 'package:flutter/material.dart';

/// A comprehensive theme system for OTP fields
/// but with enhanced capabilities and better integration with flutter_otp_kit
class PinTheme {
  /// Creates a new PinTheme with the given properties
  const PinTheme({
    this.width = 56.0,
    this.height = 60.0,
    this.textStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    this.margin = const EdgeInsets.symmetric(horizontal: 4),
    this.padding = EdgeInsets.zero,
    this.constraints = const BoxConstraints(),
    this.decoration,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth = 2.0,
    this.showCursor = true,
    this.enableShadow = false,
    this.shadowColor,
    this.shadowBlurRadius = 8.0,
    this.shadowSpreadRadius = 0.0,
    this.shadowOffset = const Offset(0, 4),
    this.borderRadius = 8.0,
    this.borderWidth = 1.0,
    this.borderColor,
    this.backgroundColor,
    this.textColor,
    this.placeholderCharacter,
    this.placeholderStyle,
    this.placeholderColor,
    this.fieldFontSize = 20.0,
    this.fieldShape = PinFieldShape.rectangle,
    this.fieldShapeConfig,
    this.enableAnimation = true,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.hapticFeedback = true,
    this.enableInteractiveSelection = true,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.center,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.obscuringWidget,
    this.errorBorderColor,
    this.errorBackgroundColor,
    this.errorTextColor,
    this.errorTextStyle,
    this.focusedBorderColor,
    this.focusedBackgroundColor,
    this.focusedTextColor,
    this.submittedBorderColor,
    this.submittedBackgroundColor,
    this.submittedTextColor,
    this.followingBorderColor,
    this.followingBackgroundColor,
    this.followingTextColor,
    this.disabledBorderColor,
    this.disabledBackgroundColor,
    this.disabledTextColor,
  });

  /// Width of the pin field
  final double width;

  /// Height of the pin field
  final double height;

  /// Text style for the pin field
  final TextStyle textStyle;

  /// Margin around the pin field
  final EdgeInsetsGeometry margin;

  /// Padding inside the pin field
  final EdgeInsetsGeometry padding;

  /// Constraints for the pin field
  final BoxConstraints constraints;

  /// Decoration for the pin field
  final BoxDecoration? decoration;

  /// Color of the cursor
  final Color? cursorColor;

  /// Height of the cursor
  final double? cursorHeight;

  /// Width of the cursor
  final double cursorWidth;

  /// Whether to show the cursor
  final bool showCursor;

  /// Whether to enable shadow
  final bool enableShadow;

  /// Color of the shadow
  final Color? shadowColor;

  /// Blur radius of the shadow
  final double shadowBlurRadius;

  /// Spread radius of the shadow
  final double shadowSpreadRadius;

  /// Offset of the shadow
  final Offset shadowOffset;

  /// Border radius of the pin field
  final double borderRadius;

  /// Width of the border
  final double borderWidth;

  /// Color of the border
  final Color? borderColor;

  /// Background color of the pin field
  final Color? backgroundColor;

  /// Text color of the pin field
  final Color? textColor;

  /// Placeholder character
  final String? placeholderCharacter;

  /// Style for placeholder text
  final TextStyle? placeholderStyle;

  /// Color for placeholder text
  final Color? placeholderColor;

  /// Font size for the field text
  final double fieldFontSize;

  /// Shape of the pin field
  final PinFieldShape fieldShape;

  /// Configuration for custom field shapes
  final PinFieldShapeConfig? fieldShapeConfig;

  /// Whether to enable animations
  final bool enableAnimation;

  /// Duration of animations
  final Duration animationDuration;

  /// Curve for animations
  final Curve animationCurve;

  /// Whether to enable haptic feedback
  final bool hapticFeedback;

  /// Whether to enable interactive selection
  final bool enableInteractiveSelection;

  /// Text capitalization
  final TextCapitalization textCapitalization;

  /// Text alignment
  final TextAlign textAlign;

  /// Whether to obscure text
  final bool obscureText;

  /// Character to use for obscuring text
  final String obscuringCharacter;

  /// Widget to use for obscuring text (overrides obscuringCharacter)
  final Widget? obscuringWidget;

  /// Border color for error state
  final Color? errorBorderColor;

  /// Background color for error state
  final Color? errorBackgroundColor;

  /// Text color for error state
  final Color? errorTextColor;

  /// Text style for error state
  final TextStyle? errorTextStyle;

  /// Border color for focused state
  final Color? focusedBorderColor;

  /// Background color for focused state
  final Color? focusedBackgroundColor;

  /// Text color for focused state
  final Color? focusedTextColor;

  /// Border color for submitted state
  final Color? submittedBorderColor;

  /// Background color for submitted state
  final Color? submittedBackgroundColor;

  /// Text color for submitted state
  final Color? submittedTextColor;

  /// Border color for following state
  final Color? followingBorderColor;

  /// Background color for following state
  final Color? followingBackgroundColor;

  /// Text color for following state
  final Color? followingTextColor;

  /// Border color for disabled state
  final Color? disabledBorderColor;

  /// Background color for disabled state
  final Color? disabledBackgroundColor;

  /// Text color for disabled state
  final Color? disabledTextColor;

  /// Creates a copy of this theme with the given fields replaced
  PinTheme copyWith({
    double? width,
    double? height,
    TextStyle? textStyle,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    BoxConstraints? constraints,
    BoxDecoration? decoration,
    Color? cursorColor,
    double? cursorHeight,
    double? cursorWidth,
    bool? showCursor,
    bool? enableShadow,
    Color? shadowColor,
    double? shadowBlurRadius,
    double? shadowSpreadRadius,
    Offset? shadowOffset,
    double? borderRadius,
    double? borderWidth,
    Color? borderColor,
    Color? backgroundColor,
    Color? textColor,
    String? placeholderCharacter,
    TextStyle? placeholderStyle,
    Color? placeholderColor,
    double? fieldFontSize,
    PinFieldShape? fieldShape,
    PinFieldShapeConfig? fieldShapeConfig,
    bool? enableAnimation,
    Duration? animationDuration,
    Curve? animationCurve,
    bool? hapticFeedback,
    bool? enableInteractiveSelection,
    TextCapitalization? textCapitalization,
    TextAlign? textAlign,
    bool? obscureText,
    String? obscuringCharacter,
    Widget? obscuringWidget,
    Color? errorBorderColor,
    Color? errorBackgroundColor,
    Color? errorTextColor,
    TextStyle? errorTextStyle,
    Color? focusedBorderColor,
    Color? focusedBackgroundColor,
    Color? focusedTextColor,
    Color? submittedBorderColor,
    Color? submittedBackgroundColor,
    Color? submittedTextColor,
    Color? followingBorderColor,
    Color? followingBackgroundColor,
    Color? followingTextColor,
    Color? disabledBorderColor,
    Color? disabledBackgroundColor,
    Color? disabledTextColor,
  }) {
    return PinTheme(
      width: width ?? this.width,
      height: height ?? this.height,
      textStyle: textStyle ?? this.textStyle,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      constraints: constraints ?? this.constraints,
      decoration: decoration ?? this.decoration,
      cursorColor: cursorColor ?? this.cursorColor,
      cursorHeight: cursorHeight ?? this.cursorHeight,
      cursorWidth: cursorWidth ?? this.cursorWidth,
      showCursor: showCursor ?? this.showCursor,
      enableShadow: enableShadow ?? this.enableShadow,
      shadowColor: shadowColor ?? this.shadowColor,
      shadowBlurRadius: shadowBlurRadius ?? this.shadowBlurRadius,
      shadowSpreadRadius: shadowSpreadRadius ?? this.shadowSpreadRadius,
      shadowOffset: shadowOffset ?? this.shadowOffset,
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      borderColor: borderColor ?? this.borderColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      placeholderCharacter: placeholderCharacter ?? this.placeholderCharacter,
      placeholderStyle: placeholderStyle ?? this.placeholderStyle,
      placeholderColor: placeholderColor ?? this.placeholderColor,
      fieldFontSize: fieldFontSize ?? this.fieldFontSize,
      fieldShape: fieldShape ?? this.fieldShape,
      fieldShapeConfig: fieldShapeConfig ?? this.fieldShapeConfig,
      enableAnimation: enableAnimation ?? this.enableAnimation,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      hapticFeedback: hapticFeedback ?? this.hapticFeedback,
      enableInteractiveSelection:
          enableInteractiveSelection ?? this.enableInteractiveSelection,
      textCapitalization: textCapitalization ?? this.textCapitalization,
      textAlign: textAlign ?? this.textAlign,
      obscureText: obscureText ?? this.obscureText,
      obscuringCharacter: obscuringCharacter ?? this.obscuringCharacter,
      obscuringWidget: obscuringWidget ?? this.obscuringWidget,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      errorBackgroundColor: errorBackgroundColor ?? this.errorBackgroundColor,
      errorTextColor: errorTextColor ?? this.errorTextColor,
      errorTextStyle: errorTextStyle ?? this.errorTextStyle,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      focusedBackgroundColor:
          focusedBackgroundColor ?? this.focusedBackgroundColor,
      focusedTextColor: focusedTextColor ?? this.focusedTextColor,
      submittedBorderColor: submittedBorderColor ?? this.submittedBorderColor,
      submittedBackgroundColor:
          submittedBackgroundColor ?? this.submittedBackgroundColor,
      submittedTextColor: submittedTextColor ?? this.submittedTextColor,
      followingBorderColor: followingBorderColor ?? this.followingBorderColor,
      followingBackgroundColor:
          followingBackgroundColor ?? this.followingBackgroundColor,
      followingTextColor: followingTextColor ?? this.followingTextColor,
      disabledBorderColor: disabledBorderColor ?? this.disabledBorderColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      disabledTextColor: disabledTextColor ?? this.disabledTextColor,
    );
  }

  /// Creates a copy with decoration overrides
  PinTheme copyDecorationWith({
    BoxDecoration? decoration,
    Color? borderColor,
    Color? backgroundColor,
    double? borderRadius,
    double? borderWidth,
    Color? shadowColor,
    double? shadowBlurRadius,
    double? shadowSpreadRadius,
    Offset? shadowOffset,
  }) {
    return copyWith(
      decoration: decoration ?? this.decoration,
      borderColor: borderColor ?? this.borderColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      shadowColor: shadowColor ?? this.shadowColor,
      shadowBlurRadius: shadowBlurRadius ?? this.shadowBlurRadius,
      shadowSpreadRadius: shadowSpreadRadius ?? this.shadowSpreadRadius,
      shadowOffset: shadowOffset ?? this.shadowOffset,
    );
  }

  /// Gets the decoration for a specific state
  BoxDecoration getDecorationForState(PinFieldState state) {
    Color? borderColor;
    Color? backgroundColor;

    switch (state) {
      case PinFieldState.defaultState:
        borderColor = this.borderColor;
        backgroundColor = this.backgroundColor;
        break;
      case PinFieldState.focused:
        borderColor = focusedBorderColor ?? this.borderColor;
        backgroundColor = focusedBackgroundColor ?? this.backgroundColor;
        break;
      case PinFieldState.submitted:
        borderColor = submittedBorderColor ?? this.borderColor;
        backgroundColor = submittedBackgroundColor ?? this.backgroundColor;
        break;
      case PinFieldState.following:
        borderColor = followingBorderColor ?? this.borderColor;
        backgroundColor = followingBackgroundColor ?? this.backgroundColor;
        break;
      case PinFieldState.disabled:
        borderColor = disabledBorderColor ?? this.borderColor;
        backgroundColor = disabledBackgroundColor ?? this.backgroundColor;
        break;
      case PinFieldState.error:
        borderColor = errorBorderColor ?? this.borderColor;
        backgroundColor = errorBackgroundColor ?? this.backgroundColor;
        break;
    }

    return BoxDecoration(
      borderRadius: BorderRadius.circular(
        fieldShape == PinFieldShape.circle ||
                fieldShape == PinFieldShape.stadium
            ? height / 2
            : borderRadius,
      ),
      border: Border.all(
        color: borderColor ?? Colors.grey,
        width: borderWidth,
      ),
      color: backgroundColor,
      boxShadow: enableShadow
          ? [
              BoxShadow(
                color: shadowColor ?? Colors.black.withValues(alpha: 0.1),
                blurRadius: shadowBlurRadius,
                spreadRadius: shadowSpreadRadius,
                offset: shadowOffset,
              ),
            ]
          : null,
    );
  }

  /// Gets the text style for a specific state
  TextStyle getTextStyleForState(PinFieldState state) {
    Color? textColor;

    switch (state) {
      case PinFieldState.defaultState:
        textColor = this.textColor;
        break;
      case PinFieldState.focused:
        textColor = focusedTextColor ?? this.textColor;
        break;
      case PinFieldState.submitted:
        textColor = submittedTextColor ?? this.textColor;
        break;
      case PinFieldState.following:
        textColor = followingTextColor ?? this.textColor;
        break;
      case PinFieldState.disabled:
        textColor = disabledTextColor ?? this.textColor;
        break;
      case PinFieldState.error:
        textColor = errorTextColor ?? this.textColor;
        break;
    }

    return textStyle.copyWith(color: textColor);
  }
}

/// Enum for pin field states
enum PinFieldState {
  defaultState,
  focused,
  submitted,
  following,
  disabled,
  error,
}

/// Enum for pin field shapes
enum PinFieldShape {
  rectangle,
  roundedRectangle,
  circle,
  stadium,
  underlined,
  custom,
}

/// Configuration for custom field shapes
class PinFieldShapeConfig {
  /// Creates a new field shape configuration
  const PinFieldShapeConfig({
    this.decorationBuilder,
    this.customPainter,
  });

  /// Builder for custom decoration
  final BoxDecoration Function(Color borderColor, Color backgroundColor,
      double borderWidth, double borderRadius)? decorationBuilder;

  /// Custom painter for the field
  final CustomPainter? customPainter;
}
