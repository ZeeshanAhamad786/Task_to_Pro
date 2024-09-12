import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tasktopro/controller/utils/custom_text_style.dart';
class RequestPendingScreen extends StatelessWidget {
  const RequestPendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(children: [
          SizedBox(height: 8.h),
          Text(
            "Request Pending",
            style: CustomTextStyle.textNameBlack6,
          ),
          SizedBox(height: 25.h),
          Center(
            child: Image.asset(
              "assets/png/reuestPendingImage.png",
              width: 200.px,
              height: 200.px,
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            "Your request is currently under verification.",
            style: CustomTextStyle.textNameBlack6,textAlign: TextAlign.center,
          ),
          SizedBox(height: 1.2.h),
          Text(
            "This process typically takes up to 48 hours. We will notify you once it's completed. Thank you for your patience.",
            style: CustomTextStyle.textNameBlack9,
            textAlign: TextAlign.center,
          ),

        ],),
      ),
    );
  }
}
