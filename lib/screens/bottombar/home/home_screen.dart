// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_lah/screens/bottombar/home/home_screen_widget.dart';
import 'package:work_lah/utility/colors.dart';
import 'package:work_lah/utility/display_function.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          SizedBox(height: commonHeight(context) * 0.05),
          TopBarWidget(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: commonHeight(context) * 0.03),
                    SearchWidget(),
                    SizedBox(height: commonHeight(context) * 0.03),
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20.h),
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return JobWidget();
                      },
                    )
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
