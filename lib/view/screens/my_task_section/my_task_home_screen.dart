import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tasktopro/controller/utils/custom_color.dart';
import 'package:tasktopro/controller/utils/custom_text_style.dart';
import 'package:tasktopro/view/screens/home_section/post_code_screen.dart';
import 'package:tasktopro/view/screens/my_task_section/complete_screen.dart';

import '../notification_section/notification_screen.dart';
import 'active_screen.dart';
class MyTaskHomeScreen extends StatefulWidget {
  const MyTaskHomeScreen({super.key});

  @override
  State<MyTaskHomeScreen> createState() => _MyTaskHomeScreenState();
}

class _MyTaskHomeScreenState extends State<MyTaskHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h), // Adjust spacing as needed
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.h),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Task To Pro", style: CustomTextStyle.textSearchOrange1),
                GestureDetector(onTap: () {
                  Get.to(()=>const NotificationScreen());
                },
                    child: SvgPicture.asset("assets/svg/notificationIcon.svg"))
              ],
            ),
          ),
          SizedBox(height: 2.h), // Space before the TabBar
          Expanded(
            child: DefaultTabController(
              length: 2, // Number of tabs
              child: Column(
                children: [
                  // Tab bar
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(.1),offset: Offset(0, 0),blurRadius: 8,spreadRadius: 0)]
                    ),
                    child: Align(alignment:Alignment.center ,
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        // padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                        // indicatorPadding: EdgeInsets.symmetric(horizontal: 4.h),
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            width: 2.0,
                            color: CustomColor.orangeColor1,
                          ),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle: CustomTextStyle.textForgotOrange,
                        unselectedLabelColor: CustomColor.blackColor2,
                        tabs: [
                          Tab(text: "Active"),
                          Tab(text: "Complete"),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h), // Space between TabBar and TabBarView
                  const Expanded(
                    child: TabBarView(
                      children: [
                        // Content for Tab 1
                        ActiveScreen(),
                        // Content for Tab 2
                        CompleteScreen(),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}