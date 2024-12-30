// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_lah/utility/colors.dart';
import 'package:work_lah/utility/display_function.dart';
import 'package:work_lah/utility/image_path.dart';
import 'package:work_lah/utility/style_inter.dart';
import 'package:work_lah/utility/syle_poppins.dart';

class AccountStatusAndId extends StatelessWidget {
  const AccountStatusAndId({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Account status: ',
                        style: CustomTextInter.medium12(
                          AppColors.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: ' Verified',
                        style: CustomTextInter.semiBold12(
                          AppColors.greenColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Id: ',
                      style: CustomTextInter.semiBold12(
                        AppColors.blackColor,
                      ),
                    ),
                    TextSpan(
                      text: ' ID6567',
                      style: CustomTextInter.regular12(
                        AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              Icon(
                Icons.star,
                color: AppColors.starColor,
                size: 16.sp,
              ),
              Text(
                '4.8/5',
                style: CustomTextInter.regular12(
                  AppColors.blackColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  final bool profileCompleted;
  const ProfileDetails({super.key, required this.profileCompleted});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 110.h,
            width: 125.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  right: 0,
                  top: 0,
                  child: Image.asset(ImagePath.editIMG),
                ),
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(50),
                  dashPattern: [4, 4],
                  borderPadding: EdgeInsets.all(-1),
                  color: AppColors.blackColor,
                  strokeWidth: 1,
                  child: Image.asset(
                    profileCompleted
                        ? ImagePath.profilePic1
                        : ImagePath.personIMG,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          if (profileCompleted) ...[
            Text(
              'Steve Ryan',
              style: CustomTextPopins.medium24(AppColors.blackColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone,
                  size: 20.sp,
                ),
                SizedBox(width: 5.w),
                Text(
                  '+65 1234567893',
                  style: CustomTextPopins.regular12(AppColors.blackColor),
                ),
              ],
            ),
            Text(
              'Joined Jul 2023',
              style: CustomTextPopins.regular12(AppColors.fieldHintColor),
            ),
          ]
        ],
      ),
    );
  }
}

class MyWalletWidget extends StatelessWidget {
  final bool profileCompleted;
  const MyWalletWidget({super.key, required this.profileCompleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.blackColor,
      ),
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 10.h,
        bottom: 10.h,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.account_balance_wallet_outlined,
                color: AppColors.fieldBorderColor,
              ),
              SizedBox(width: 5.w),
              Text(
                'Your e-Wallet amount',
                style: CustomTextInter.medium12(AppColors.fieldBorderColor),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  profileCompleted ? '\$4,553' : '\$0',
                  style: CustomTextInter.medium24(AppColors.whiteColor),
                ),
              ),
              Container(
                height: 35.h,
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: profileCompleted
                      ? AppColors.themeColor
                      : AppColors.textGreyColor,
                ),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        'Cash Out',
                        style: CustomTextInter.medium12(AppColors.whiteColor),
                      ),
                      SizedBox(width: 5.w),
                      Icon(
                        Icons.arrow_outward,
                        color: AppColors.whiteColor,
                        size: 20.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TotalCompleteJobStatus extends StatelessWidget {
  const TotalCompleteJobStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 4,
              child: commonColorWidget(AppColors.completedColor),
            ),
            SizedBox(width: 10.w),
            Expanded(
              flex: 2,
              child: commonColorWidget(AppColors.canceledColor),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: commonColorWidget(AppColors.noShowColor),
            ),
          ],
        ),
        SizedBox(height: commonHeight(context) * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            commonStatusRow(
                AppColors.completedColor, '96.53%', 'Completed Jobs'),
            commonStatusRow(AppColors.canceledColor, '2.78%', 'Cancelled Jobs'),
            commonStatusRow(AppColors.noShowColor, '0.69%', 'No Show'),
          ],
        ),
      ],
    );
  }

  Widget commonColorWidget(Color color) {
    return Container(
      height: 21.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color,
      ),
    );
  }

  Widget commonStatusRow(Color color, String percent, String text) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w, right: 5.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Container(
              height: 11.h,
              width: 11.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                percent,
                style: CustomTextInter.semiBold12(AppColors.blackColor),
              ),
              Text(
                text,
                style: CustomTextInter.regular12(AppColors.blackColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DemeritPoints extends StatelessWidget {
  const DemeritPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20.h,
        bottom: 20.h,
        left: 10.w,
        right: 10.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.demoriteColor,
      ),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'Demerit Points: ',
              style: CustomTextInter.medium14(
                AppColors.demoriteTextColor,
              ),
            ),
            TextSpan(
              text: '\$5',
              style: CustomTextInter.medium16(
                AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecentPastJobWiget extends StatelessWidget {
  const RecentPastJobWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 10.h, right: 10.w, top: 20.h, bottom: 20.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.lightBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(ImagePath.jobLogoIMG),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(ImagePath.dishIMG),
                        SizedBox(width: 5.w),
                        Text(
                          'Tray Collector',
                          style:
                              CustomTextInter.semiBold16(AppColors.blackColor),
                        ),
                      ],
                    ),
                    Text(
                      'Food Dynasty (United Square)',
                      style: CustomTextInter.regular12(AppColors.subTitColor),
                    ),
                  ],
                ),
              ),
              Icon(Icons.share),
            ],
          ),
          SizedBox(height: 10.h),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '5 Hours - ',
                  style: CustomTextInter.light14(
                    AppColors.greenColor,
                  ),
                ),
                TextSpan(
                  text: 'Completed',
                  style: CustomTextInter.regular14(
                    AppColors.greenColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  'November 2024',
                  style: CustomTextInter.light14(
                    AppColors.blackColor,
                  ),
                ),
              ),
              Text(
                'Right Service PTE. LTD.',
                style: CustomTextInter.light14(
                  AppColors.themeColor,
                  isUnderline: true,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
