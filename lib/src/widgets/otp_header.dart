import 'package:flutter/material.dart';
import '../utils/otp_masker.dart';
import '../masking_type.dart';

/// Header widget for OTP verification widget
class OtpHeader extends StatelessWidget {
  /// Creates a new OTP header
  const OtpHeader({
    Key? key,
    this.title,
    this.subtitle,
    required this.primaryColor,
    required this.secondaryColor,
    required this.spacing,
    this.titleWidget,
    this.subtitleWidget,
    this.titleStyle,
    this.subtitleStyle,
    this.contactInfo,
    this.maskingType = MaskingType.none,
    this.semanticLabel,
  }) : super(key: key);

  /// Title text (optional - can use titleWidget instead)
  final String? title;

  /// Subtitle text (optional - can use subtitleWidget instead)
  final String? subtitle;

  /// Primary color for styling
  final Color primaryColor;

  /// Secondary color for styling
  final Color secondaryColor;

  /// Spacing between elements
  final double spacing;

  /// Custom title widget
  final Widget? titleWidget;

  /// Custom subtitle widget
  final Widget? subtitleWidget;

  /// Style for title text
  final TextStyle? titleStyle;

  /// Style for subtitle text
  final TextStyle? subtitleStyle;

  /// Contact information to display in subtitle
  final String? contactInfo;

  /// Masking type for contact information
  final MaskingType maskingType;

  /// Semantic label for accessibility
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    // Add title if available
    final titleWidget = _buildTitle();
    if (titleWidget != null) {
      children.add(titleWidget);
      children.add(SizedBox(height: spacing * 1.25));
    }

    // Add subtitle if available
    final subtitleWidget = _buildSubtitle();
    if (subtitleWidget != null) {
      children.add(subtitleWidget);
    }

    return Column(children: children);
  }

  /// Builds the title widget (custom or default)
  Widget? _buildTitle() {
    if (titleWidget != null) {
      return titleWidget!;
    }

    if (title != null) {
      return Semantics(
        label: semanticLabel ?? title,
        header: true,
        child: Text(
          title!,
          style: titleStyle ??
              TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
          textAlign: TextAlign.center,
        ),
      );
    }

    return null;
  }

  /// Builds the subtitle widget (custom or default)
  Widget? _buildSubtitle() {
    if (subtitleWidget != null) {
      return subtitleWidget!;
    }

    if (subtitle != null) {
      return Text(
        contactInfo != null
            ? subtitle!.replaceAll('{contactInfo}',
                OtpMasker.maskContactInfo(contactInfo!, maskingType))
            : subtitle!,
        style: subtitleStyle ??
            TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: secondaryColor,
            ),
        textAlign: TextAlign.center,
      );
    }

    return null;
  }
}
