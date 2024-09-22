import 'package:flutter/material.dart';

// Font weights
class AppFontWeight {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight heavy = FontWeight.w900;
}

// Colors
class AppColors {
  static const Color primary = Color(0xFFed1e5b);
  static const Color black = Color(0xFF0d0d0d);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFFb8b5c1);
  static const Color lightGrey = Color(0xFFb1b1b1);
  static  Color extraLightGrey = Colors.grey.withOpacity(0.3);
  static const Color darkGrey = Color(0xFF4b4949);
  static const Color red = Colors.red;
  static MaterialColor customColor = MaterialColor(
    0xFFF44336,
    <int, Color>{
      50: const Color(0xFFF44336).withOpacity(0.1),
      100: const Color(0xFFF44336).withOpacity(0.2),
      200: const Color(0xFFF44336).withOpacity(0.3),
      300: const Color(0xFFF44336).withOpacity(0.4),
      400: const Color(0xFFF44336).withOpacity(0.5),
      500: const Color(0xFFF44336), // Original color
      600: const Color(0xFFF44336).withOpacity(0.7),
      700: const Color(0xFFF44336).withOpacity(0.8),
      800: const Color(0xFFF44336).withOpacity(0.9),
      900: const Color(0xFFF44336).withOpacity(1.0),
    },
  );
}

// Paddings
class AppPadding {
  static const double extrasmall = 4.0;
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double extraLarge = 32.0;
}

// Margins
class AppMargin {
  static const double veryExtraSmall = 2.0;
  static const double extraSmall = 4.0;
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double extraLarge = 32.0;
}

// Border radii
class AppBorderRadius {
  static const Radius small = Radius.circular(4.0);
  static const Radius medium = Radius.circular(8.0);
  static const Radius large = Radius.circular(16.0);
  static const Radius extraLarge = Radius.circular(32.0);
  static const double circleAvatarRadiusSmall = 30;
  static const double circleAvatarRadius = 40;
}

// Elevations
class AppElevation {
  static const double low = 2.0;
  static const double medium = 6.0;
  static const double high = 12.0;
}

// Thicknesses
class AppThickness {
  static const double thin = 1.0;
  static const double medium = 2.0;
  static const double thick = 4.0;
}

// Icon Sizes
class AppIconSize {
  static const double extrasmall = 8.0;
  static const double small = 16.0;
  static const double medium = 24.0;
  static const double large = 32.0;
  static const double extraLarge = 48.0;
}
