import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/constants/app_style.dart';
import 'package:nikah_forever_assignment/core/constants/app_text_style.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isEnabled;
  final String? errorMessage;
  final bool isValid;
  final ValueChanged<String>? onChanged;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.label,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.isEnabled = true,
    this.errorMessage,
    this.isValid = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 48,
          child: TextFormField(
            controller: controller,
            obscureText: isPassword,
            keyboardType: keyboardType,
            validator: validator,
            enabled: isEnabled,
            onChanged: (value) {
              if (onChanged != null) {
                onChanged!(value);
              }
            },
            decoration: InputDecoration(
              labelText: label,
              hintText: hintText,
              labelStyle: TextStyle(
                  fontSize: !isValid ? 11 : 13, color: AppColors.lightGrey),
              hintStyle: TextStyle(
                  fontSize: !isValid ? 11 : 13, color: AppColors.lightGrey),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide:
                    BorderSide(color: isValid ? AppColors.darkGrey : Colors.red),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                    color: isValid ? AppColors.darkGrey : Colors.red),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: AppColors.darkGrey),
              ),
            ),
          ),
        ),
        if (errorMessage != null && !isValid)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(errorMessage!, style: AppTextStyles.errorText),
          ),
      ],
    );
  }
}
