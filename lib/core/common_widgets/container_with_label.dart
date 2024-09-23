import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/constants/app_image.dart';
import 'package:nikah_forever_assignment/core/constants/app_string.dart';
import 'package:nikah_forever_assignment/core/constants/app_style.dart';
import 'package:nikah_forever_assignment/core/constants/app_text_style.dart';

class ContainerWithLabel extends StatelessWidget {
  final String selectedValue;
  final String hintText;
  final bool isValid;

  const ContainerWithLabel({
    super.key,
    required this.selectedValue,
    required this.hintText,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    bool isFilled = selectedValue.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          padding: EdgeInsets.symmetric(
            vertical: isFilled ? 0 : 5,
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: !isValid? AppColors.primary: AppColors.darkGrey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              !isFilled ? const SizedBox(height: 5) : const SizedBox.shrink(),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: isFilled
                    ? Matrix4.translationValues(0, -10, 0)
                    : Matrix4.identity(),
                child: isFilled
                    ? Text(hintText, style: AppTextStyles.hintText)
                    : const SizedBox.shrink(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isFilled ? selectedValue : hintText,
                    style: TextStyle(
                      color: isFilled ? AppColors.black : AppColors.lightGrey,
                      fontSize: isFilled?13:12
                    ),
                  ),
                  Image.asset(
                    AppImages.arrowArrow,
                    width: 17,
                    height: 17,
                    color: AppColors.black,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 5),
          child: !isValid
              ? Text(
                  AppString.emptyErrorMessage,
                  style: AppTextStyles.errorText,
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
