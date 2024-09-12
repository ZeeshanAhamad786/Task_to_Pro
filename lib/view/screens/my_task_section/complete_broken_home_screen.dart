import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../controller/utils/calender_controller.dart';
import '../../../controller/utils/custom_color.dart';
import '../../../controller/utils/custom_text_style.dart';
import '../../custom_widgets/custom_sized.dart';
import 'complete_contract_details.dart';
import 'left_side_table_contract_details.dart';
import 'left_side_table_task_details.dart';
class CompleteBrokenHomeScreen extends StatefulWidget {
  const CompleteBrokenHomeScreen({super.key});

  @override
  State<CompleteBrokenHomeScreen> createState() => _CompleteBrokenHomeScreenState();
}

class _CompleteBrokenHomeScreenState extends State<CompleteBrokenHomeScreen> {
  PageController controller = PageController();
  CalendarController calendarController=Get.put(CalendarController());
  // Method to navigate to the next image
  void nextPage() {
    if (controller.page != 2) { // Assuming you have 3 images, adjust index as needed
      controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  // Method to navigate to the previous image
  void previousPage() {
    if (controller.page != 0) {
      controller.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        getVerticalSpace(8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(onTap:(){
                Get.back();
              },
                  child: const Icon(Icons.arrow_back_ios_new)),
              Text(
                "The left side leg of the table is broken",
                style: CustomTextStyle.textLeft,
              ),
              SizedBox(height: 10.px,width: 10.px,)
            ],
          ),
        ),
        getVerticalSpace(1.2.h),
        Stack(
          children: [
            // PageView to handle image scrolling
            SizedBox(
              height: 240.px, // Set a height to prevent layout issues
              child: PageView(
                controller: controller,
                children: [
                  Image.asset("assets/png/tableImage.png", ),
                  Image.asset("assets/png/tableImage.png",
                  ),
                  Image.asset("assets/png/tableImage.png", ),
                ],
              ),
            ),
            // Left arrow
            Positioned(
              bottom: 5.h,
              left: 2.h,
              child: GestureDetector(
                onTap: previousPage,
                child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Right arrow
            Positioned(
              bottom: 5.h,
              right: 2.h,
              child: GestureDetector(
                onTap: nextPage,
                child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Page Indicator
            Positioned(
              bottom: 2.2.h,
              left: MediaQuery.of(context).size.width * 0.45,
              child: SmoothPageIndicator(
                controller: controller,
                count: 3, // The number of pages/images
                axisDirection: Axis.horizontal,
                effect: const SlideEffect(
                  spacing: 8.0,
                  radius: 4.0,
                  dotWidth: 8.0,
                  dotHeight: 8.0,
                  paintStyle: PaintingStyle.fill,
                  strokeWidth: 1.5,
                  dotColor: Colors.grey,
                  activeDotColor: CustomColor.orangeColor1,
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: DefaultTabController(
            length: 2, // Number of tabs
            child: Column(
              children: [
                // Tab bar
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border:  Border(
                      bottom: BorderSide(width: 1.0, color: CustomColor.greyColor2), // Bottom border only
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
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
                        Tab(text: "Task Details"),
                        Tab(text: "Contract Details"),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 1.h), // Space between TabBar and TabBarView
                const Expanded(
                  child: TabBarView(
                    children: [
                      // Content for Tab 1
                      LeftSideTableTaskDetails(),
                      // Content for Tab 2
                      CompleteContractDetailsScreen(),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

      ],),
    );
  }
}
