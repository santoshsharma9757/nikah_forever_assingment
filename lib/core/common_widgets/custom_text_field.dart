import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/constants/app_style.dart';
import 'package:nikah_forever_assignment/core/constants/app_text_style.dart';
import 'package:nikah_forever_assignment/features/auth/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class CustomInputField extends StatefulWidget {
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
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 48,
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.isPassword,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            enabled: widget.isEnabled,
            onChanged: (value) {
              setState(() {});
            },
            onTapOutside: (event) {
              context.read<AuthViewModel>().onSaved();
            },
            onFieldSubmitted: (value) {
              context.read<AuthViewModel>().onSaved();
            },
            decoration: InputDecoration(
              labelText: widget.label,
              hintText: widget.hintText,
              labelStyle: TextStyle(
                  fontSize: !widget.isValid ? 13 : 14,
                  color: AppColors.lightGrey),
              hintStyle: TextStyle(
                  fontSize: !widget.isValid ? 13 : 14,
                  color: AppColors.lightGrey),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                    color: widget.isValid ? AppColors.darkGrey : Colors.red),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                    color: widget.isValid ? AppColors.darkGrey : Colors.red),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: AppColors.darkGrey),
              ),
            ),
          ),
        ),
        if (widget.errorMessage != null && !widget.isValid)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(widget.errorMessage!, style: AppTextStyles.errorText),
          ),
      ],
    );
  }
}
