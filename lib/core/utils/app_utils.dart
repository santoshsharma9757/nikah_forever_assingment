import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/common_widgets/common_button.dart';
import 'package:nikah_forever_assignment/core/common_widgets/common_sheet.dart';
import 'package:nikah_forever_assignment/core/common_widgets/common_sheet2.dart';
import 'package:nikah_forever_assignment/core/constants/app_style.dart';
import 'package:nikah_forever_assignment/core/constants/app_text_style.dart';
import 'package:nikah_forever_assignment/core/extensions/app_extensions.dart';

class AppUtils {
  //Show Bottom sheet
  static showCommonBottomSheet(BuildContext context, String key) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => CommonBottomSheet(contentKey: key),
    );
  }

  //BottomSheet
  static showCommonBottomSheetBasicDetail(BuildContext context, String key) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => CommonBottomSheetBasicDetails(contentKey: key),
    );
  }

//Dialog
  static Future<void> showMyDialog({
    required String title,
    required String message,
    required BuildContext context,
    required String primaryButtonText,
    required VoidCallback onPrimaryButtonPressed,
    String? secondaryButtonText,
    VoidCallback? onSecondaryButtonPressed,
  }) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlertDialog(
              title: Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: AppTextStyles.heading5,
                ),
              ),
              content: Align(
                alignment: Alignment.center,
                child: Text(message),
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      text: primaryButtonText,
                      onPressed: onPrimaryButtonPressed,
                      borderRadius: 20.0,
                      textColor: AppColors.primary,
                      buttonColor: Colors.transparent,
                      height: 30.0,
                      width: context.screenWidth * 0.25,
                      fontSize: 30,
                    ),
                    CustomButton(
                      text: secondaryButtonText!,
                      onPressed: onSecondaryButtonPressed,
                      borderRadius: 20.0,
                      buttonColor: AppColors.primary,
                      textColor: AppColors.white,
                      height: 30.0,
                      width: context.screenWidth * 0.25,
                      fontSize: 15,
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
