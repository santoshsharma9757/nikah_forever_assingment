import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/constants/app_string.dart';
import 'package:nikah_forever_assignment/core/constants/app_text_style.dart';

class ResendSmsExample extends StatelessWidget {
  const ResendSmsExample({super.key});

  @override
  Widget build(BuildContext context) {
    const String timerText = AppString.timer;

    return Center(
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: AppString.resendIn,
              style: AppTextStyles.heading4,
            ),
            TextSpan(
              text: timerText,
              style: AppTextStyles.heading5,
            ),
          ],
        ),
      ),
    );
  }
}
