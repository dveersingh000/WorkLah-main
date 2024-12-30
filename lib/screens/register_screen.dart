// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_lah/screens/login_screen.dart';
import 'package:work_lah/utility/colors.dart';
import 'package:work_lah/utility/custom_button.dart';
import 'package:work_lah/utility/custom_otp_field.dart';
import 'package:work_lah/utility/custom_textform_field.dart';
import 'package:work_lah/utility/display_function.dart';
import 'package:work_lah/utility/image_path.dart';
import 'package:work_lah/utility/style_inter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dropDownController = TextEditingController();
  TextEditingController otpControllers = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeColor,
      body: Column(
        children: [
          SizedBox(height: commonHeight(context) * 0.05),
          Center(child: Image.asset(ImagePath.appLogo)),
          SizedBox(height: commonHeight(context) * 0.02),
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
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: commonHeight(context) * 0.03),
                      Center(
                        child: Text(
                          'Create an Account',
                          style: CustomTextInter.medium24(AppColors.blackColor),
                        ),
                      ),
                      SizedBox(height: commonHeight(context) * 0.03),
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
                        controller: phoneController,
                        hintText: 'axrt@gmail.com',
                      ),
                      SizedBox(height: 20.h),
                      commonTitle('Employment Status'),
                      SizedBox(height: 10.h),
                      CustomTextFormField(
                        controller: dropDownController,
                        isDropdown: true,
                        dropdownItems: [
                          'Singaporean/PR',
                          'Singaporean/LTVp',
                          'Student',
                        ],
                        hintText: 'Select Employment Status',
                        onValidate: (value) {
                          if (value!.isEmpty) {
                            return 'Please Select Employment Status';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 50.h),
                      CustomButton(
                        backgroundColor: AppColors.blackColor,
                        onTap: () {},
                        text: 'Generate OTP',
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'OTP',
                        style: CustomTextInter.medium16(AppColors.blackColor),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'Please enter your 6 digit SMS OTP',
                        style: CustomTextInter.light12(AppColors.subTitleColor),
                      ),
                      SizedBox(height: 20.h),
                      CustomOtpField(
                        controller: otpControllers,
                        onValidate: (val) {
                          if (val.toString().isEmpty) {
                            return 'Please Enter Pin';
                          } else if (val.toString().length < 5) {
                            return 'Please Enter Valid Pin';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text(
                            'Resend the code',
                            style: CustomTextInter.light12(
                              AppColors.themeColor,
                              isUnderline: true,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '00:60',
                            style:
                                CustomTextInter.medium12(AppColors.blackColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 50.h),
                      CustomButton(
                        onTap: () {},
                        text: 'Continue',
                      ),
                      SizedBox(height: 10.h),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Already have an account? ',
                                style: CustomTextInter.regular12(
                                    AppColors.blackColor),
                              ),
                              TextSpan(
                                text: 'Log In',
                                style: CustomTextInter.semiBold12(
                                  AppColors.themeColor,
                                  isUnderline: true,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    moveReplacePage(context, LoginScreen());
                                  },
                              ),
                            ],
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
    );
  }

  Widget commonTitle(String title) {
    return RichText(
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
    );
  }
}
