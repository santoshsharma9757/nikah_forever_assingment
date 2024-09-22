import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/constants/app_style.dart';
import 'package:nikah_forever_assignment/core/constants/app_text_style.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  final String label;
  final VoidCallback onChanged;

  const CustomCheckbox({
    super.key,
    required this.isChecked,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.small),
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isChecked ? AppColors.primary : Colors.transparent,
                border: Border.all(
                  color: isChecked ? AppColors.primary : AppColors.black,
                ),
              ),
              child: isChecked
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
          ),
          const SizedBox(width: 10),
          Text(label,style: AppTextStyles.heading4,),
        ],
      ),
    );
  }
}
