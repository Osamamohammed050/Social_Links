import 'package:flutter/material.dart';

/// A helper class for responsive typography
class ResponsiveTypography {
  ResponsiveTypography._();

  /// Get responsive font size for display large
  static double getDisplayLargeFontSize(double width) {
    if (width < 375) return 28;
    if (width < 600) return 32;
    if (width < 1024) return 40;
    return 48;
  }

  /// Get responsive font size for display medium
  static double getDisplayMediumFontSize(double width) {
    if (width < 375) return 24;
    if (width < 600) return 28;
    if (width < 1024) return 36;
    return 44;
  }

  /// Get responsive font size for title large
  static double getTitleLargeFontSize(double width) {
    if (width < 375) return 16;
    if (width < 600) return 18;
    if (width < 1024) return 20;
    return 22;
  }

  /// Get responsive font size for title medium
  static double getTitleMediumFontSize(double width) {
    if (width < 375) return 14;
    if (width < 600) return 16;
    if (width < 1024) return 18;
    return 20;
  }

  /// Get responsive font size for body large
  static double getBodyLargeFontSize(double width) {
    if (width < 375) return 12;
    if (width < 600) return 13;
    if (width < 1024) return 14;
    return 16;
  }

  /// Get responsive font size for body medium
  static double getBodyMediumFontSize(double width) {
    if (width < 375) return 11;
    if (width < 600) return 12;
    if (width < 1024) return 13;
    return 14;
  }

  /// Get responsive font size for body small
  static double getBodySmallFontSize(double width) {
    if (width < 375) return 10;
    if (width < 600) return 11;
    if (width < 1024) return 12;
    return 12;
  }

  /// Get responsive line height multiplier
  static double getLineHeightMultiplier(double width) {
    if (width < 600) return 1.4;
    if (width < 1024) return 1.5;
    return 1.6;
  }

  /// Get responsive letter spacing
  static double getLetterSpacing(double width) {
    if (width < 600) return 0;
    if (width < 1024) return 0.2;
    return 0.4;
  }
}

/// Extension for responsive text styling in BuildContext
extension ResponsiveTextX on BuildContext {
  double get displayLargeFontSize =>
      ResponsiveTypography.getDisplayLargeFontSize(
        MediaQuery.of(this).size.width,
      );

  double get displayMediumFontSize =>
      ResponsiveTypography.getDisplayMediumFontSize(
        MediaQuery.of(this).size.width,
      );

  double get titleLargeFontSize => ResponsiveTypography.getTitleLargeFontSize(
    MediaQuery.of(this).size.width,
  );

  double get titleMediumFontSize => ResponsiveTypography.getTitleMediumFontSize(
    MediaQuery.of(this).size.width,
  );

  double get bodyLargeFontSize =>
      ResponsiveTypography.getBodyLargeFontSize(MediaQuery.of(this).size.width);

  double get bodyMediumFontSize => ResponsiveTypography.getBodyMediumFontSize(
    MediaQuery.of(this).size.width,
  );

  double get bodySmallFontSize =>
      ResponsiveTypography.getBodySmallFontSize(MediaQuery.of(this).size.width);

  double get lineHeightMultiplier =>
      ResponsiveTypography.getLineHeightMultiplier(
        MediaQuery.of(this).size.width,
      );

  double get letterSpacing =>
      ResponsiveTypography.getLetterSpacing(MediaQuery.of(this).size.width);
}
