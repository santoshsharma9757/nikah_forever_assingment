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

//Snackbar
  static showSnackBar(String message, BuildContext context) {
    return SnackBar(backgroundColor: Colors.red, content: Text(message));
  }

//Dialog
  static Future<void> showMyDialog(
    String title,
    String message,
    BuildContext context,
  ) async {
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
                  )),
              content: Align(alignment: Alignment.center, child: Text(message)),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      text: "Cancel",
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      borderRadius: 5.0,
                      buttonColor: Colors.transparent,
                      textColor: AppColors.primary,
                      height: 30.0,
                      width: context.screenWidth * 0.25,
                      fontSize: 15,
                    ),
                    CustomButton(
                      text: "Logout",
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      borderRadius: 20.0,
                      textColor: AppColors.white,
                      buttonColor: AppColors.primary,
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
