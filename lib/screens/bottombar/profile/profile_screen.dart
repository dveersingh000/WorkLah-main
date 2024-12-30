// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_lah/screens/bottombar/profile/profile_widget.dart';
import 'package:work_lah/utility/colors.dart';
import 'package:work_lah/utility/custom_appbar.dart';
import 'package:work_lah/utility/dashed_divider.dart';
import 'package:work_lah/utility/display_function.dart';
import 'package:work_lah/utility/image_path.dart';
import 'package:work_lah/utility/style_inter.dart';

class ProfileScreen extends StatefulWidget {
  final bool profileCompleted;
  const ProfileScreen({super.key, required this.profileCompleted});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: widget.profileCompleted
          ? getCompleteProfileBody()
          : getNotCompleteProfileBody(),
    );
  }

  Widget getCompleteProfileBody() {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: commonHeight(context) * 0.05),
            CustomAppbar(
              title: 'Profile',
              isAction: true,
              isLeading: false,
            ),
            SizedBox(height: commonHeight(context) * 0.02),
            AccountStatusAndId(),
            SizedBox(height: commonHeight(context) * 0.02),
            ProfileDetails(profileCompleted: widget.profileCompleted),
            SizedBox(height: commonHeight(context) * 0.03),
            MyWalletWidget(profileCompleted: widget.profileCompleted),
            SizedBox(height: commonHeight(context) * 0.03),
            DashedDivider(),
            SizedBox(height: commonHeight(context) * 0.03),
            myDetailsWidget(),
            SizedBox(height: commonHeight(context) * 0.03),
            DashedDivider(),
            SizedBox(height: commonHeight(context) * 0.03),
            totalCompletedJobWidget(),
            SizedBox(height: commonHeight(context) * 0.02),
            TotalCompleteJobStatus(),
            SizedBox(height: commonHeight(context) * 0.02),
            DemeritPoints(),
            SizedBox(height: commonHeight(context) * 0.03),
            recentText(),
            SizedBox(height: commonHeight(context) * 0.02),
            RecentPastJobWiget(),
            SizedBox(height: commonHeight(context) * 0.03),
            reviewText(),
            SizedBox(height: commonHeight(context) * 0.01),
            Center(
              child: Text(
                'No Reviews Found',
                style: CustomTextInter.regular16(AppColors.blackColor),
              ),
            ),
            SizedBox(height: commonHeight(context) * 0.05),
          ],
        ),
      ),
    );
  }

  Widget getNotCompleteProfileBody() {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: commonHeight(context) * 0.05),
            CustomAppbar(
              title: 'Profile',
              isAction: true,
              isLeading: false,
            ),
            SizedBox(height: commonHeight(context) * 0.02),
            ProfileDetails(profileCompleted: widget.profileCompleted),
            SizedBox(height: commonHeight(context) * 0.03),
            MyWalletWidget(profileCompleted: widget.profileCompleted),
            SizedBox(height: commonHeight(context) * 0.03),
            DashedDivider(),
            SizedBox(height: commonHeight(context) * 0.03),
            myDetailsWidget(),
            SizedBox(height: commonHeight(context) * 0.03),
            DashedDivider(),
            SizedBox(height: commonHeight(context) * 0.03),
            Center(
              child: Column(
                children: [
                  Text(
                    'Complete your profile',
                    style: CustomTextInter.medium20(AppColors.blackColor),
                  ),
                  SizedBox(height: commonHeight(context) * 0.02),
                  Image.asset(ImagePath.noProfileIMG),
                  SizedBox(height: commonHeight(context) * 0.02),
                  Text(
                    'Complete your profile to unlock\nand view all your stats.',
                    style: CustomTextInter.regular16(AppColors.blackColor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: commonHeight(context) * 0.05),
          ],
        ),
      ),
    );
  }

  Widget myDetailsWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          commonColumn('Age', widget.profileCompleted ? '25' : '--'),
          commonColumn('Gender', widget.profileCompleted ? 'Male' : 'NIL'),
          commonColumn(
            'Total Hours worked',
            widget.profileCompleted ? '84 Hrs' : '-- Hrs',
          ),
        ],
      ),
    );
  }

  Widget commonColumn(String title, String subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomTextInter.semiBold14(AppColors.fieldTitleColor),
        ),
        SizedBox(height: 10.h),
        Text(
          subTitle,
          style: CustomTextInter.medium14(AppColors.blackColor),
        ),
      ],
    );
  }

  Widget totalCompletedJobWidget() {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Total Completed Job',
            style: CustomTextInter.medium14(AppColors.blackColor),
          ),
        ),
        Text(
          '139',
          style: CustomTextInter.semiBold24(AppColors.blackColor),
        ),
      ],
    );
  }

  Widget recentText() {
    return Text(
      'Recent Past Jobs',
      style: CustomTextInter.medium14(AppColors.blackColor),
    );
  }

  Widget reviewText() {
    return Text(
      'Reviews',
      style: CustomTextInter.semiBold14(AppColors.blackColor),
    );
  }
}
