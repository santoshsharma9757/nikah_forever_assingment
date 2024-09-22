import 'package:flutter/material.dart';

extension IntExtension on int {
  Widget height() {
    return SizedBox(
      height: toDouble(),
    );
  }

  Widget width() {
    return SizedBox(
      width: toDouble(),
    );
  }
}

extension MediaQueryExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  double get safeWidth => screenWidth - MediaQuery.of(this).padding.horizontal;
  double get safeHeight => screenHeight - MediaQuery.of(this).padding.vertical;
}
