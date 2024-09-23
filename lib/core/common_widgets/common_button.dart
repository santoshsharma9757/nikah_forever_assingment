import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double borderRadius;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? padding;
  final TextStyle? textStyle;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.borderRadius = 8.0,
    this.buttonColor,
    this.textColor,
    this.width,
    this.height,
    this.padding,
    this.textStyle,
    this.border,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding ?? 8.0),
        decoration: BoxDecoration(
          color: buttonColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
          boxShadow: boxShadow,
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              text,
              style: textStyle ??
                  TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: 13.0,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
