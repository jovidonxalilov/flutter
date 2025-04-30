import 'package:flutter/material.dart';
import 'package:loggy/core/color/app_colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key,
    required this.callback,
    required this.text,
    this.backgroundColor = Colors.white,
    this.borderColor = AppColors.buttonBorder,
    this.textColor = AppColors.black,
  });

  final VoidCallback callback;
  final String text;
  final Color backgroundColor, borderColor, textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: borderColor, width: 1.5),
            ),
          ),
          onPressed: callback,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          )),
    );
  }
}
