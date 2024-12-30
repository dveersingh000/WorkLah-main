// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_lah/screens/bottombar/home/complete_profile/complete_profile.dart';
import 'package:work_lah/utility/colors.dart';
import 'package:work_lah/utility/display_function.dart';
import 'package:work_lah/utility/image_path.dart';
import 'package:work_lah/utility/style_inter.dart';
import 'package:work_lah/utility/syle_poppins.dart';

class JobRequirements extends StatelessWidget {
  const JobRequirements({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.description,
              color: AppColors.blackColor,
            ),
            SizedBox(width: 5.w),
            Text(
              'Job Requirements',
              style: CustomTextInter.medium16(AppColors.blackColor),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        commonBulletPoint('👕 Black T-shirt'),
        commonBulletPoint('👖 Dark colored long pants / Jeans'),
        commonBulletPoint('👟 Covered Shoes'),
        commonBulletPoint(
          '⏱️ Must Arrive AT LEAST 15 mins before job start time for briefing‼️',
        ),
        commonBulletPoint(
            '⚠️ In case of early dismissal after job completion, freelancers will be paid until the clock out time.'),
        commonBulletPoint('📣Smoking is strictly not allowed'),
        commonBulletPoint('🛎️ Late comers may be rejected for the day\'s job'),
        commonBulletPoint(
            '🚫 Leaving work before job end time is misconduct and may result in no pay. Payment is up to management discretion.'),
        SizedBox(height: 20.h),
        Text(
          'Show more',
          style: CustomTextInter.regular14(
            AppColors.themeColor,
            isUnderline: true,
          ),
        ),
      ],
    );
  }

  Widget commonBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w, left: 10.w),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            color: AppColors.blackColor,
            size: 6.sp,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: CustomTextInter.light14(AppColors.blackColor),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: AppColors.blackColor,
            ),
            SizedBox(width: 5.w),
            Expanded(
              child: Text(
                'Location',
                style: CustomTextInter.medium16(AppColors.blackColor),
              ),
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Map/',
                    style: CustomTextInter.light16(
                      AppColors.blackColor,
                    ),
                  ),
                  TextSpan(
                    text: 'Satellite',
                    style: CustomTextInter.light16(
                      AppColors.textGreyColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Image.asset(ImagePath.mapIMG),
      ],
    );
  }
}

class EmployerWidget extends StatelessWidget {
  var employerDetails;
  EmployerWidget({super.key, required this.employerDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.badge_outlined,
              color: AppColors.blackColor,
            ),
            SizedBox(width: 5.w),
            Text(
              'Employer',
              style: CustomTextInter.medium16(AppColors.blackColor),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Image.asset(ImagePath.serviceLogoIMG),
            SizedBox(width: 10.w),
            Text(
              'Right Service PTE. LTD.',
              style: CustomTextInter.light20(AppColors.blackColor),
            ),
          ],
        ),
        Divider(),
        SizedBox(height: 5.h),
        ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 20.h),
          padding: EdgeInsets.zero,
          itemCount: employerDetails.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = employerDetails[index];
            return commonRowWidget(
              item['icon'] as IconData,
              item['title'].toString(),
              item['subTitle'].toString(),
            );
          },
        ),
        SizedBox(height: 5.h),
      ],
    );
  }

  Widget commonRowWidget(IconData icon, String title, String subTitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.themeColor),
        SizedBox(width: 5.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: CustomTextInter.regular14(AppColors.themeColor),
            ),
            Text(
              subTitle,
              style: CustomTextInter.regular14(AppColors.blackColor),
            ),
          ],
        ),
      ],
    );
  }
}

class CompleteYourProfile extends StatelessWidget {
  const CompleteYourProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => moveToNext(context, CompleteProfile()),
          child: Container(
            height: 50.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.themeColor.withOpacity(0.1),
              border: Border.all(color: AppColors.fieldBorderColor),
            ),
            child: Center(
              child: Text(
                'Complete Your Profile',
                style: CustomTextPopins.regular16(AppColors.blackColor),
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Icon(
              Icons.info,
              color: AppColors.primaryOrangeColor,
            ),
            SizedBox(width: 5.w),
            Text(
              'Complete your profile before shift bookings',
              style: CustomTextPopins.regular12(AppColors.primaryOrangeColor),
            ),
          ],
        ),
      ],
    );
  }
}
