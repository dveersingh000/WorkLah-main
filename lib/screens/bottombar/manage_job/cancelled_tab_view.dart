// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:work_lah/screens/bottombar/manage_job/common_widget.dart';

class CancelledTabView extends StatelessWidget {
  const CancelledTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return CommonJobWidget(isCancelled: true);
      },
    );
  }
}
