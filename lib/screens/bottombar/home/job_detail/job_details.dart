// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_lah/screens/bottombar/home/job_detail/available_tab/available_tab_view.dart';
import 'package:work_lah/screens/bottombar/home/job_detail/job_details_widget.dart';
import 'package:work_lah/utility/colors.dart';
import 'package:work_lah/utility/custom_appbar.dart';
import 'package:work_lah/utility/display_function.dart';
import 'package:work_lah/utility/style_inter.dart';
import 'package:work_lah/utility/syle_poppins.dart';

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({super.key});

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: commonHeight(context) * 0.05),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: CustomAppbar(title: ''),
            ),
            SizedBox(height: commonHeight(context) * 0.03),
            JobNameWidget(),
            JobIMGWidget(),
            Padding(
              padding: EdgeInsets.only(right: 20.w, top: 10.h, left: 20.w),
              child: Column(
                children: [
                  JobSalary(),
                  JobScopsWidget(),
                  availabeShiftText(),
                  SizedBox(height: 15.h),
                  // Row(
                  //   children: [
                  //     Expanded(child: commonTabWidget(true, 0)),
                  //     SizedBox(width: 5.w),
                  //     Expanded(child: commonTabWidget(false, 1)),
                  //   ],
                  // ),
                ],
              ),
            ),
            AvailableTabView(),
            // selectedIndex == 0 ? AvailableTabView() : AvailableStandByTabView(),
          ],
        ),
      ),
    );
  }

  Widget commonTabWidget(bool isAvailableTab, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 43.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.whiteColor,
          border: Border.all(
            color: selectedIndex == index
                ? AppColors.blackColor
                : AppColors.lightBorderColor,
          ),
          boxShadow: selectedIndex == index
              ? [
                  BoxShadow(
                    blurRadius: 4,
                    color: AppColors.blackColor.withOpacity(0.2),
                    offset: Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisAlignment: isAvailableTab
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceEvenly,
          children: [
            isAvailableTab
                ? Container(
                    height: 10.h,
                    width: 10.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.themeColor),
                      color: AppColors.themeColor.withOpacity(0.1),
                    ),
                  )
                : Container(
                    height: 20.h,
                    width: 20.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.lightOrangeColor,
                      ),
                      color: AppColors.lightOrangeColor,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.person,
                        color: AppColors.blackColor,
                        size: 10.sp,
                      ),
                    ),
                  ),
            isAvailableTab ? SizedBox(width: 5.w) : SizedBox(),
            Text(
              isAvailableTab ? 'Available' : 'Available Standby',
              style: CustomTextPopins.light12(AppColors.blackColor),
            ),
            isAvailableTab
                ? SizedBox()
                : Icon(
                    Icons.info_outline,
                    color: AppColors.blackColor,
                    size: 20.sp,
                  ),
          ],
        ),
      ),
    );
  }

  Widget availabeShiftText() {
    return Row(
      children: [
        Icon(
          Icons.history_toggle_off_outlined,
          color: AppColors.blackColor,
        ),
        SizedBox(width: 5.w),
        Text(
          'Available Shifts',
          style: CustomTextInter.medium16(AppColors.blackColor),
        ),
      ],
    );
  }
}
