import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/custom_color.dart';
import '../../../controller/utils/custom_text_style.dart';
import '../../custom_widgets/custom_sized.dart';
class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        SizedBox(height: 8.h), // Adjust spacing as needed
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.h),
          padding: EdgeInsets.only(bottom: 2.h),
          decoration: BoxDecoration(
            border:  Border(
              bottom: BorderSide(width: 1.0, color: CustomColor.greyColor2), // Bottom border only
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(onTap: () {
                Get.back();
              },
                  child: const Icon(Icons.arrow_back_ios_new_outlined)),
              Text("Subscription",style: CustomTextStyle.textStartBlack,),
              SizedBox(height: 10.px,width: 10.px,)
            ],
          ),
        ),
        SizedBox(height: 7.h),
        Image.asset("assets/png/proIcon.png",height: 166.px,width: 166.px,),
        SizedBox(height: 2.h), // Responsive vertical spacing
        Text(  textAlign: TextAlign.center,
          'Upgrade To Pro',
          style: CustomTextStyle.upgrade
          ),
      SizedBox(height: 1.2.h), // Responsive vertical spacing
      Text(
        'Get access to advanced features',
        style: CustomTextStyle.textTask.copyWith(
          fontSize: 16.sp, // Responsive font size
        ),),
        getVerticalSpace(2.2.h),

        Padding(
          padding:  EdgeInsets.only(left: 26.w),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/svg/tick.svg"),
                  getHorizontalSpace(1.w),
                  Text("Chat with clients",style: CustomTextStyle.textTaskChat1,),

                ],
              ),
              Row(

                children: [
                  SvgPicture.asset("assets/svg/tick.svg"),
                  getHorizontalSpace(1.w),
                  Text("Access to client details",style: CustomTextStyle.textTaskChat1,),
                ],
              ),
              Row(

                children: [
                  SvgPicture.asset("assets/svg/tick.svg"),
                  getHorizontalSpace(1.w),
                  Text("Send project proposals",style: CustomTextStyle.textTaskChat1,),
                ],
              ),
              Row(

                children: [
                  SvgPicture.asset("assets/svg/tick.svg"),
                  getHorizontalSpace(1.w),
                  Text("Schedule site visits",style: CustomTextStyle.textTaskChat1,),
                ],
              ),

            ],
          ),
        ),

        SizedBox(height: 5.h), // Responsive vertical spacing
        GestureDetector(
          onTap: () {
            // Handle 'Yes' action
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            padding: EdgeInsets.symmetric(
              vertical: 1.2.h, // Responsive vertical padding
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: CustomColor.orangeColor1,
              borderRadius: BorderRadius.circular(1.5.h),
            ),
            child: Text(
              'Buy Now at \$19.99',
              style: CustomTextStyle.textAccountBlack.copyWith(
                color: Colors.white,
                fontSize: 16.sp, // Responsive font size
              ),
            ),
          ),
        ),
      ],),

    );
  }
}
