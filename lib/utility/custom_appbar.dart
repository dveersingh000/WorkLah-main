// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_lah/screens/notification_screen.dart';
import 'package:work_lah/utility/colors.dart';
import 'package:work_lah/utility/display_function.dart';
import 'package:work_lah/utility/style_inter.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final bool isAction;
  final bool isLeading;
  final Color? leadingBack, leadingIcon, titleColor;
  const CustomAppbar(
      {super.key,
      required this.title,
      this.isAction = false,
      this.isLeading = true,
      this.leadingBack,
      this.leadingIcon,
      this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isLeading
            ? GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: leadingBack ?? AppColors.themeColor,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: leadingIcon ?? AppColors.whiteColor,
                    ),
                  ),
                ),
              )
            : SizedBox(),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            title,
            style: CustomTextInter.medium16(titleColor ?? AppColors.blackColor),
          ),
        ),
        if (isAction) ...[
          GestureDetector(
            onTap: () {
              moveToNext(context, NotificationScreen());
            },
            child: Icon(
              Icons.notifications_outlined,
              color: AppColors.themeColor,
            ),
          ),
          SizedBox(width: 10.w),
          Icon(Icons.menu_outlined),
          SizedBox(width: 10.w),
        ]
      ],
    );
  }
}
