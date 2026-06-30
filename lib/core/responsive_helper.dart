import 'package:flutter/material.dart';

/// A responsive helper class that provides breakpoints and responsive values
/// based on the current screen size.
class ResponsiveHelper {
  ResponsiveHelper._();

  /// Mobile breakpoint (< 600px)
  static const double mobileBreakpoint = 600;

  /// Tablet breakpoint (600px - 1024px)
  static const double tabletBreakpoint = 1024;

  /// Desktop breakpoint (1024px+)
  static const double desktopBreakpoint = 1024;

  /// Extra large breakpoint (1440px+)
  static const double extraLargeBreakpoint = 1440;

  /// Ultra wide breakpoint (1920px+)
  static const double ultraWideBreakpoint = 1920;

  /// Get the current device type
  static DeviceType getDeviceType(double width) {
    if (width < mobileBreakpoint) {
      return DeviceType.mobile;
    } else if (width < tabletBreakpoint) {
      return DeviceType.tablet;
    } else if (width < extraLargeBreakpoint) {
      return DeviceType.desktop;
    } else if (width < ultraWideBreakpoint) {
      return DeviceType.extraLarge;
    } else {
      return DeviceType.ultraWide;
    }
  }

  /// Check if device is mobile
  static bool isMobile(double width) => width < mobileBreakpoint;

  /// Check if device is tablet
  static bool isTablet(double width) =>
      width >= mobileBreakpoint && width < tabletBreakpoint;

  /// Check if device is desktop or larger
  static bool isDesktop(double width) => width >= desktopBreakpoint;

  /// Check if device is small phone (320px-375px)
  static bool isSmallPhone(double width) => width < 375;

  /// Check if device is medium phone (375px-430px)
  static bool isMediumPhone(double width) => width >= 375 && width < 430;

  /// Check if device is large phone (430px+)
  static bool isLargePhone(double width) => width >= 430;

  /// Get responsive padding based on screen width
  static EdgeInsets getResponsivePadding(double width) {
    if (width < 375) {
      return const EdgeInsets.symmetric(vertical: 16, horizontal: 12);
    } else if (width < 600) {
      return const EdgeInsets.symmetric(vertical: 20, horizontal: 16);
    } else if (width < 1024) {
      return const EdgeInsets.symmetric(vertical: 24, horizontal: 32);
    } else {
      return const EdgeInsets.symmetric(vertical: 32, horizontal: 48);
    }
  }

  /// Get responsive section padding
  static EdgeInsets getSectionPadding(double width) {
    if (width < 375) {
      return const EdgeInsets.all(12);
    } else if (width < 600) {
      return const EdgeInsets.all(16);
    } else if (width < 1024) {
      return const EdgeInsets.all(24);
    } else {
      return const EdgeInsets.all(28);
    }
  }

  /// Get responsive spacing between sections
  static double getSectionSpacing(double width) {
    if (width < 375) return 16;
    if (width < 600) return 20;
    if (width < 1024) return 24;
    return 32;
  }

  /// Get responsive horizontal spacing
  static double getHorizontalSpacing(double width) {
    if (width < 375) return 8;
    if (width < 600) return 12;
    if (width < 1024) return 16;
    return 20;
  }

  /// Get responsive vertical spacing
  static double getVerticalSpacing(double width) {
    if (width < 375) return 10;
    if (width < 600) return 14;
    if (width < 1024) return 18;
    return 24;
  }

  /// Get responsive border radius
  static double getResponsiveBorderRadius(double width) {
    if (width < 600) return 12;
    if (width < 1024) return 20;
    return 28;
  }

  /// Get responsive card width
  static double getCardWidth(double width) {
    if (width < 600) {
      return width - 32;
    } else if (width < 1024) {
      return (width - 48) / 2 - 8;
    } else {
      return 340;
    }
  }

  /// Get responsive container max width
  static double getContainerMaxWidth(double width) {
    if (width < 600) {
      return width - 32;
    } else if (width < 1024) {
      return 800;
    } else if (width < 1440) {
      return 1240;
    } else if (width < 1920) {
      return 1400;
    } else {
      return 1600;
    }
  }

  /// Get responsive profile avatar size
  static double getAvatarSize(double width) {
    if (width < 375) return 100;
    if (width < 600) return 120;
    if (width < 1024) return 140;
    return 160;
  }

  /// Get responsive wrap spacing
  static double getWrapSpacing(double width) {
    if (width < 375) return 8;
    if (width < 600) return 12;
    if (width < 1024) return 16;
    return 20;
  }

  /// Get responsive wrap run spacing
  static double getWrapRunSpacing(double width) {
    if (width < 375) return 8;
    if (width < 600) return 12;
    if (width < 1024) return 16;
    return 20;
  }

  /// Get responsive app bar height
  static double getAppBarHeight(double width) {
    if (width < 600) return 56;
    return 64;
  }
}

/// Enum for device types
enum DeviceType { mobile, tablet, desktop, extraLarge, ultraWide }

/// Extension for easy access to device type in BuildContext
extension ResponsiveX on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  DeviceType get deviceType => ResponsiveHelper.getDeviceType(screenWidth);

  bool get isMobile => ResponsiveHelper.isMobile(screenWidth);

  bool get isTablet => ResponsiveHelper.isTablet(screenWidth);

  bool get isDesktop => ResponsiveHelper.isDesktop(screenWidth);

  bool get isSmallPhone => ResponsiveHelper.isSmallPhone(screenWidth);

  bool get isMediumPhone => ResponsiveHelper.isMediumPhone(screenWidth);

  bool get isLargePhone => ResponsiveHelper.isLargePhone(screenWidth);

  EdgeInsets get responsivePadding =>
      ResponsiveHelper.getResponsivePadding(screenWidth);

  EdgeInsets get sectionPadding =>
      ResponsiveHelper.getSectionPadding(screenWidth);

  double get sectionSpacing => ResponsiveHelper.getSectionSpacing(screenWidth);

  double get horizontalSpacing =>
      ResponsiveHelper.getHorizontalSpacing(screenWidth);

  double get verticalSpacing =>
      ResponsiveHelper.getVerticalSpacing(screenWidth);

  double get responsiveBorderRadius =>
      ResponsiveHelper.getResponsiveBorderRadius(screenWidth);

  double get cardWidth => ResponsiveHelper.getCardWidth(screenWidth);

  double get containerMaxWidth =>
      ResponsiveHelper.getContainerMaxWidth(screenWidth);

  double get avatarSize => ResponsiveHelper.getAvatarSize(screenWidth);

  double get wrapSpacing => ResponsiveHelper.getWrapSpacing(screenWidth);

  double get wrapRunSpacing => ResponsiveHelper.getWrapRunSpacing(screenWidth);

  double get appBarHeight => ResponsiveHelper.getAppBarHeight(screenWidth);
}
