// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_lah/utility/colors.dart';
import 'package:work_lah/utility/style_inter.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final VoidCallback onTap;
  final String text;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  const CustomButton({
    super.key,
    this.height,
    this.width,
    required this.onTap,
    required this.text,
    this.textStyle,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: height ?? 44.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.themeColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle ?? CustomTextInter.regular14(AppColors.whiteColor),
          ),
        ),
      ),
    );
  }
}
