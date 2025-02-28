// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_lah/screens/bottombar/bottom_bar_screen.dart';
import 'package:work_lah/screens/register_screen.dart';
import 'package:work_lah/utility/colors.dart';
import 'package:work_lah/utility/custom_button.dart';
import 'package:work_lah/utility/custom_otp_field.dart';
import 'package:work_lah/utility/display_function.dart';
import 'package:work_lah/utility/image_path.dart';
import 'package:work_lah/utility/style_inter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<String> countryCodes = ['+65', '+91', '+70'];
  String selectedCode = '+65';

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
                          'Log In',
                          style: CustomTextInter.medium24(AppColors.blackColor),
                        ),
                      ),
                      SizedBox(height: commonHeight(context) * 0.03),
                      Text(
                        'Enter your mobile number',
                        style: CustomTextInter.medium16(AppColors.blackColor),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'Please confirm your country code and enter\nyour mobile number',
                        style: CustomTextInter.light12(AppColors.subTitleColor),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Country code',
                        style:
                            CustomTextInter.regular14(AppColors.textGreyColor),
                      ),
                      Row(
                        children: [
                          DropdownButton(
                            dropdownColor: AppColors.whiteColor,
                            style:
                                CustomTextInter.regular14(AppColors.blackColor),
                            value: selectedCode,
                            itemHeight: 65.h,
                            onChanged: (newValue) {
                              setState(() {
                                selectedCode = newValue!;
                              });
                            },
                            underline: Container(
                              height: 1,
                              width: double.infinity,
                              color: Color(0XFFC9C9C9),
                            ),
                            items: countryCodes.map((code) {
                              return DropdownMenuItem(
                                value: code,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(code),
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: TextFormField(
                              cursorColor: AppColors.subTitleColor,
                              style: CustomTextInter.regular14(
                                  AppColors.blackColor),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                hintText: 'Mobile number',
                                hintStyle: CustomTextInter.light14(
                                  AppColors.subTitleColor,
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0XFFC9C9C9),
                                  ),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0XFFC9C9C9),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0XFFC9C9C9),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
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
                        onTap: () {
                          moveToNext(context, BottomBarScreen(index: 0));
                        },
                        text: 'Continue',
                      ),
                      SizedBox(height: 10.h),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Don\'t have an account? ',
                                style: CustomTextInter.regular12(
                                    AppColors.blackColor),
                              ),
                              TextSpan(
                                text: 'Create an Account',
                                style: CustomTextInter.semiBold12(
                                  AppColors.themeColor,
                                  isUnderline: true,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    moveToNext(context, RegisterScreen());
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
}
