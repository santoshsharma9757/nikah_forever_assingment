import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/constants/app_style.dart';
import 'package:nikah_forever_assignment/core/constants/app_text_style.dart';
import 'package:nikah_forever_assignment/core/extensions/app_extensions.dart';
import 'package:nikah_forever_assignment/features/auth/presentation/components/verification/pinput.dart';
import 'package:nikah_forever_assignment/features/auth/presentation/components/verification/resend_text.dart';

class VerificationStep extends StatelessWidget {
  const VerificationStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: context.screenHeight * 0.15),
          _buildMessageSection(),
          _buildPinputSection(),
          _buildResendSection(),
        ],
      ),
    );
  }

  _buildMessageSection() {
    return const Column(
      children: [
        Text(
          "Verify Mobile Number",
          style: AppTextStyles.heading,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Enter the 4-digit code sent to",
          style: AppTextStyles.heading4,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "+917982620773",
              style: AppTextStyles.heading1,
            ),
            SizedBox(width: 10),
            Icon(
              Icons.edit,
              color: AppColors.primary,
            )
          ],
        ),
      ],
    );
  }

  _buildPinputSection() =>
      const SizedBox(height: 100, child: PinInputExample());
  _buildResendSection() {
    return const Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.mobile_friendly,
            color: AppColors.primary,
            size: 16,
          ),
          SizedBox(
            width: 10,
          ),
          ResendSmsExample()
        ],
      ),
    );
  }
}
