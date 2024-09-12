import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tasktopro/controller/utils/custom_color.dart';
import 'package:tasktopro/controller/utils/custom_text_style.dart';
import 'package:tasktopro/view/custom_widgets/custom_sized.dart';
import 'package:tasktopro/view/screens/profile_section/profile_details_screen.dart';

import '../../../controller/utils/calender_controller.dart';
import '../chat_section/live_chat_screen.dart';

class LeftSideTableBroken extends StatefulWidget {
  const LeftSideTableBroken({super.key});

  @override
  State<LeftSideTableBroken> createState() => _LeftSideTableBrokenState();
}

class _LeftSideTableBrokenState extends State<LeftSideTableBroken> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                  const Icon(Icons.more_vert),
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
            getVerticalSpace(1.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 2.h),
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(onTap:(){
                        Get.to(()=>const ProfileDetailsScreen());
                      },
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/png/profileImage.png"),
                          radius: 24,
                        ),
                      ),
                      getHorizontalSpace(2.w),
                      GestureDetector(onTap: () {
                        Get.to(()=>const ProfileDetailsScreen());

                      },
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Mohsin Shop",style: CustomTextStyle.textAccountBlack1,),
                            Text("Task Details ",style: CustomTextStyle.textDetails,)
                          ],
                        ),
                      ),
                      Spacer(),
                      GestureDetector(onTap: () {
                        Get.to(()=>const LiveChatScreen());

                      },
                          child: SvgPicture.asset("assets/svg/messageIcon.svg")),
                      getHorizontalSpace(2.w),
                      GestureDetector(onTap: () {
                        Get.to(()=>const LiveChatScreen());
                      },
                          child: Text("Send Message",style: CustomTextStyle.textForgotOrange,)),
                    ],
                  ),
                  getVerticalSpace(2.h),
                  Text("Task Details ",style: CustomTextStyle.textNameBlack6,),
                  getVerticalSpace(1.h),
                  Text("Task Title",style: CustomTextStyle.textAccountBlack1,),
                  getVerticalSpace(.4.h),
                  Text("The left side leg of the table is broken.",style: CustomTextStyle.textNameBlackNew,),
                  getVerticalSpace(1.h),
                  const Divider(color: CustomColor.greyColor,),
                  getVerticalSpace(1.h),
                  Text("Service Category",style: CustomTextStyle.textAccountBlack1,),
                  getVerticalSpace(.4.h),
                  Text("Carpenter",style:CustomTextStyle.textCarpenter ,),
                  getVerticalSpace(1.h),
                  const Divider(color: CustomColor.greyColor,),
                  getVerticalSpace(1.h),
                  Text("Task Description ",style: CustomTextStyle.textAccountBlack1,),
                  getVerticalSpace(.4.h),
                 Text("""Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.""",
                   style:CustomTextStyle.textDesc ,),
                  getVerticalSpace(1.h),
                  const Divider(color: CustomColor.greyColor,),
                  getVerticalSpace(1.h),
Text("Contact Email/Phone Number",style:CustomTextStyle.textAccountBlack1 ,),
                  getVerticalSpace(.4.h),
Text("Example@gmail.com",style: CustomTextStyle.textDesc,),
                  getVerticalSpace(1.h),
                  const Divider(color: CustomColor.greyColor,),
                  getVerticalSpace(1.h),
Row(mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text("Location",style:CustomTextStyle.textAccountBlack1 ),
    Text("(Postcode)",style: CustomTextStyle.textPostcode,),
  ],
),
                  getVerticalSpace(.4.h),
                  Text("0901116",style: CustomTextStyle.textDesc,),
                  getVerticalSpace(1.h),
                  const Divider(color: CustomColor.greyColor,),
                  getVerticalSpace(1.h),
                  Text("Preferred Date Range",style:CustomTextStyle.textData ,),
                  getVerticalSpace(1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Text("Start Date"),
                      getHorizontalSpace(15.w),
                      Text("End Date"),
                    ],
                  ),
                  getVerticalSpace(.7.h),
                  Obx(() => Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(onTap: () {
                        calendarController.selectStartDate(context);

                      },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/calenderIcon.svg",
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              DateFormat('yyyy-MM-dd').format(calendarController.selectedStartDate.value),
                              style: CustomTextStyle.textLoginBlack,
                            ),
                          ],
                        ),
                      ),
                      getHorizontalSpace(2.5.w),
                       Text("To",style: CustomTextStyle.textSeeAllOrange1,),
                      getHorizontalSpace(2.5.w),

                      Obx(() => GestureDetector(onTap: () {
                        calendarController.selectEndDate(context);
                      },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 2.w),

                            SvgPicture.asset(
                              "assets/svg/calenderIcon.svg",
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              DateFormat('yyyy-MM-dd').format(calendarController.selectedEndDate.value),
                              style: CustomTextStyle.textLoginBlack,
                            ),
                          ],
                        ),
                      )),
                    ],
                  )),
                  SizedBox(height: 20.px,width: 20.px,)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
