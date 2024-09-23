import 'package:flutter/material.dart';

import 'app_style.dart';

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 20.0,
    fontWeight: AppFontWeight.bold,
    color: AppColors.black,
  );
  static const TextStyle heading1 = TextStyle(
    fontSize: 17.0,
    fontWeight: AppFontWeight.bold,
    color: AppColors.black,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 14.0,
    fontWeight: AppFontWeight.medium,
    color: AppColors.lightGrey,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 14.0,
    fontWeight: AppFontWeight.semiBold,
    color: AppColors.white,
  );

  static const TextStyle heading4 = TextStyle(
    fontSize: 14.0,
    fontWeight: AppFontWeight.regular,
    color: AppColors.darkGrey,
  );
  static const TextStyle heading5 = TextStyle(
    fontSize: 14.0,
    fontWeight: AppFontWeight.bold,
    color: AppColors.darkGrey,
  );

  static const TextStyle subheading = TextStyle(
    fontSize: 16.0,
    fontWeight: AppFontWeight.regular,
    color: AppColors.white,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 14.0,
    fontWeight: AppFontWeight.regular,
    color: AppColors.black,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 12.0,
    fontWeight: AppFontWeight.medium,
    color: AppColors.white,
  );

  static const TextStyle hintText = TextStyle(
      fontSize: 12.0,
      fontWeight: AppFontWeight.medium,
      color: AppColors.lightGrey,
      backgroundColor: AppColors.white);

  static TextStyle errorText = const TextStyle(
      fontSize: 10.0,
      fontWeight: AppFontWeight.medium,
      color: AppColors.red,
      backgroundColor: AppColors.white);

  static const TextStyle caption = TextStyle(
    fontSize: 12.0,
    fontWeight: AppFontWeight.regular,
    color: AppColors.lightGrey,
  );
}
