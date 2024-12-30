// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:work_lah/utility/colors.dart';

moveToNext(BuildContext context, Widget pageName) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => pageName,
    ),
  );
}

moveReplacePage(BuildContext context, Widget pageName) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => pageName,
    ),
    (route) => false,
  );
}

toast(msg, {Color? backgroundColor}) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: backgroundColor ?? AppColors.themeColor,
  );
}

Future<void> launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

double commonHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double commonWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
