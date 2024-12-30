// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_lah/screens/bottombar/home/complete_profile/complete_profile_widget.dart';
import 'package:work_lah/screens/bottombar/home/job_detail/confirm_booking_screen.dart';
import 'package:work_lah/utility/colors.dart';
import 'package:work_lah/utility/custom_appbar.dart';
import 'package:work_lah/utility/custom_textform_field.dart';
import 'package:work_lah/utility/display_function.dart';
import 'package:work_lah/utility/image_path.dart';
import 'package:work_lah/utility/style_inter.dart';
import 'package:work_lah/utility/syle_poppins.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController empStatusController = TextEditingController();
  TextEditingController nricController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();

  int selectedGender = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeColor,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: commonHeight(context) * 0.05),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: CustomAppbar(
                  title: 'Complete your profile',
                  leadingBack: AppColors.whiteColor,
                  leadingIcon: AppColors.themeColor,
                  titleColor: AppColors.whiteColor,
                ),
              ),
              SizedBox(height: commonHeight(context) * 0.03),
              WalletAmountCard(),
              SizedBox(height: commonHeight(context) * 0.08),
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: AppColors.whiteColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 40.h,
                      left: 10.w,
                      right: 10.w,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Steve Ryan',
                              style: CustomTextPopins.medium24(
                                  AppColors.blackColor),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          commonTitle('Full Name (As per NRIC)'),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            controller: nameController,
                            hintText: 'Steve Ryan',
                          ),
                          SizedBox(height: 20.h),
                          commonTitle('Phone Number'),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            controller: phoneController,
                            hintText: '+65 1234567892',
                          ),
                          SizedBox(height: 20.h),
                          commonTitle('Email'),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            controller: emailController,
                            hintText: 'axrt@gmail.com',
                          ),
                          SizedBox(height: 20.h),
                          commonTitle('Employment status'),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            controller: empStatusController,
                            hintText: 'Singaporean/PR',
                          ),
                          SizedBox(height: 20.h),
                          commonTitle('NRIC', isRichText: true),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            controller: nricController,
                            hintText: 'Enter your NRIC number',
                          ),
                          SizedBox(height: 20.h),
                          commonTitle('Date of Birth', isRichText: true),
                          SizedBox(height: 10.h),
                          DateDropDownWidget(),
                          SizedBox(height: 20.h),
                          commonTitle('Gender', isRichText: true),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Flexible(child: genderSelection(0, 'Male')),
                              Flexible(
                                flex: 2,
                                child: genderSelection(1, 'Female'),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          commonTitle('Postal Code', isRichText: true),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            controller: postalCodeController,
                            hintText: 'Enter your Postal code',
                          ),
                          SizedBox(height: 20.h),
                          commonTitle(
                            'NRIC Image (Front & Back)',
                            isRichText: true,
                          ),
                          SizedBox(height: 10.h),
                          CaptureImageWidget(title: 'Upload NRIC front image'),
                          SizedBox(height: 10.h),
                          CaptureImageWidget(title: 'Upload NRIC back image'),
                          SizedBox(height: 30.h),
                          GestureDetector(
                            onTap: () =>
                                moveToNext(context, ConfirmBookingScreen()),
                            child: Container(
                              height: 50.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.themeColor,
                              ),
                              child: Center(
                                child: Text(
                                  'Preview',
                                  style: CustomTextPopins.medium16(
                                      AppColors.whiteColor),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 180.h,
              left: MediaQuery.of(context).padding.left + 120.w,
              right: MediaQuery.of(context).padding.right + 120.w,
            ),
            child: SizedBox(
              height: 110.h,
              width: 125.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(50),
                    dashPattern: [4, 4],
                    borderPadding: EdgeInsets.all(-1),
                    color: AppColors.blackColor,
                    strokeWidth: 1,
                    child: Image.asset(
                      ImagePath.profilePic1,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    right: 5,
                    top: 5,
                    child: Container(
                      height: 35.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: AppColors.blackColor.withOpacity(0.2),
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: AppColors.blackColor,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget commonTitle(String title, {bool isRichText = false}) {
    return isRichText
        ? RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: title,
                  style: CustomTextInter.medium12(AppColors.fieldTitleColor),
                ),
                TextSpan(
                  text: '*',
                  style: CustomTextInter.medium12(AppColors.redColor),
                ),
              ],
            ),
          )
        : Text(
            title,
            style: CustomTextInter.medium12(AppColors.fieldTitleColor),
          );
  }

  Widget genderSelection(int index, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = index;
        });
      },
      child: Row(
        children: [
          Container(
            height: 12.h,
            width: 12.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedGender == index
                  ? AppColors.themeColor
                  : AppColors.fieldBorderColor,
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            text,
            style: CustomTextPopins.regular14(AppColors.blackColor),
          ),
        ],
      ),
    );
  }
}
