// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_lah/utility/colors.dart';
import 'package:work_lah/utility/custom_appbar.dart';
import 'package:work_lah/utility/display_function.dart';
import 'package:work_lah/utility/syle_poppins.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Column(
          children: [
            SizedBox(height: commonHeight(context) * 0.05),
            CustomAppbar(title: 'Notifications'),
            SizedBox(height: commonHeight(context) * 0.02),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                itemCount: 5,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return commonNotificationWidget();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget commonNotificationWidget() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 13,
            color: AppColors.blackColor.withOpacity(0.1),
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.lightOrangeColor,
                    ),
                    child: Center(
                      child: Text(
                        'U',
                        style: CustomTextPopins.light32(AppColors.blackColor),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 8,
                    child: Container(
                      height: 11.h,
                      width: 11.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.redColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Text(
                '07 Oct',
                style: CustomTextPopins.regular12(AppColors.blackColor),
              ),
            ],
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Features Now Available',
                  style: CustomTextPopins.regular14(AppColors.blackColor),
                ),
                SizedBox(height: 5.h),
                Text(
                  'We\'re excited to introduce some new features designed to enha....',
                  style: CustomTextPopins.regular14(
                    AppColors.fieldHintColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
