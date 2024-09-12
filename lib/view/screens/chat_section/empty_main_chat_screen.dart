import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/custom_color.dart';
import '../../../controller/utils/custom_text_style.dart';
import '../../custom_widgets/custom_sized.dart';
import '../notification_section/notification_screen.dart';
class EmptyMainChatScreen extends StatelessWidget {
  const EmptyMainChatScreen({super.key, });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        SizedBox(height: 8.h), // Adjust spacing as needed
        Container(
          padding: EdgeInsets.only(bottom: 2.h),
          decoration: const BoxDecoration(
            border:  Border(
              bottom: BorderSide(width: 1.0, color: CustomColor.greyColor2), // Bottom border only
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Task To Pro",
                  style: CustomTextStyle.textSearchOrange1,
                ),
                GestureDetector(onTap: () {
                  Get.to(()=>const NotificationScreen());

                },
                    child: SvgPicture.asset("assets/svg/notificationIcon.svg")),
              ],
            ),
          ),
        ),
        getVerticalSpace(18.h),
        Center(
          child: GestureDetector(
            child: Image.asset(
              "assets/png/noMessageImage.png",
              width: 220.px,
              height: 195.px,
            ),
          ),
        ),
        getVerticalSpace(2.h),
        Text(
          "No Messages Yet",
          style: CustomTextStyle.textNameBlack6,
        ),
        ]
    )
    );
  }
}

