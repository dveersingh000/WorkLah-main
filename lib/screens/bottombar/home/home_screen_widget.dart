// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_lah/screens/bottombar/home/job_detail/job_details.dart';
import 'package:work_lah/screens/notification_screen.dart';
import 'package:work_lah/utility/colors.dart';
import 'package:work_lah/utility/display_function.dart';
import 'package:work_lah/utility/image_path.dart';
import 'package:work_lah/utility/style_inter.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 53.h,
                width: 53.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.themeColor),
                  // image: DecorationImage(
                  //   image: AssetImage(
                  //     ImagePath.profilePic1,
                  //   ),
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
              SizedBox(
                height: 45.h,
                width: 45.w,
                child: Image.asset(
                  ImagePath.profilePic1,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good morning!',
                  style: CustomTextInter.medium12(AppColors.fieldHintColor),
                ),
                Text(
                  'Steve',
                  style: CustomTextInter.bold20(AppColors.blackColor),
                ),
              ],
            ),
          ),
          Icon(Icons.qr_code_scanner_outlined),
          SizedBox(width: 10.w),
          GestureDetector(
              onTap: () {
                moveToNext(context, NotificationScreen());
              },
              child: Icon(
                Icons.notifications_outlined,
                color: AppColors.themeColor,
              )),
          SizedBox(width: 10.w),
          Icon(Icons.menu_outlined),
        ],
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: Offset(0, 3),
                  color: AppColors.blackColor.withOpacity(0.1),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: TextFormField(
                cursorColor: AppColors.fieldHintColor,
                style: CustomTextInter.medium12(
                  AppColors.blackColor,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search Jobs..',
                  hintStyle: CustomTextInter.medium12(
                    AppColors.fieldHintColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 20.w),
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.themeColor,
          ),
          child: Icon(
            Icons.search,
            color: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }
}

class JobWidget extends StatelessWidget {
  const JobWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: commonHeight(context) * 0.55,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: AppColors.fieldBorderColor,
      ),
      child: Stack(
        children: [
          Image.asset(
            ImagePath.IMG1,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Positioned(
            top: 10,
            left: 20,
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: AppColors.chipColor,
              ),
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Center(
                child: Text(
                  '1 min ago',
                  style: CustomTextInter.regular12(
                    AppColors.blackColor,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 18,
            right: 20,
            child: Container(
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.whiteColor,
              ),
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    color: AppColors.redColor,
                    size: 15.sp,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    '98%',
                    style: CustomTextInter.light10(
                      AppColors.blackColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: commonHeight(context) * 0.15,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.whiteColor,
              ),
              padding: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
                top: 9.h,
                bottom: 9.h,
              ),
              child: Center(
                child: Text(
                  'Kaanha',
                  style: CustomTextInter.light16(
                    AppColors.blackColor,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    offset: Offset(0, 3),
                    spreadRadius: 0,
                    color: AppColors.blackColor.withOpacity(0.1),
                  ),
                ],
                border: Border.all(
                  color: AppColors.borderColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'General Cleaning',
                            style: CustomTextInter.semiBold16(
                              AppColors.blackColor,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.location_pin,
                          size: 15.sp,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          '50, Jurong street',
                          style: CustomTextInter.regular12(
                            AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Potential total wages: ',
                                  style: CustomTextInter.semiBold12(
                                    AppColors.primaryGreyColor,
                                  ),
                                ),
                                TextSpan(
                                  text: '\$100',
                                  style: CustomTextInter.semiBold16(
                                    AppColors.greenColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Icon(
                          Icons.calendar_month,
                          size: 15.sp,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          '9 Oct, 11 Oct, 12...',
                          style: CustomTextInter.regular12(
                            AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '\$20/Hr ',
                                  style: CustomTextInter.semiBold10(
                                    AppColors.blackColor,
                                  ),
                                ),
                                TextSpan(
                                  text: '- (5 Hrs + 1 hrs unpaid break)',
                                  style: CustomTextInter.regular10(
                                    AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            moveToNext(context, JobDetailsScreen());
                          },
                          child: Text(
                            'show dates',
                            style: CustomTextInter.regular12(
                              AppColors.blackColor,
                              isUnderline: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Shifts available:',
                      style: CustomTextInter.semiBold12(
                        AppColors.primaryGreyColor,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: List.generate(
                              3,
                              (index) {
                                return Container(
                                  height: 28.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border:
                                        Border.all(color: AppColors.themeColor),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '09:00',
                                      style: CustomTextInter.regular14(
                                        AppColors.themeColor,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: 28.h,
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColors.redColor.withOpacity(0.1),
                          ),
                          child: Center(
                            child: Text(
                              'Few shifts left',
                              style: CustomTextInter.regular10(
                                AppColors.redColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    GestureDetector(
                      onTap: () {
                        moveToNext(context, JobDetailsScreen());
                      },
                      child: Container(
                        height: 44.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.themeColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.themeColor,
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Apply',
                            style:
                                CustomTextInter.regular16(AppColors.themeColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
