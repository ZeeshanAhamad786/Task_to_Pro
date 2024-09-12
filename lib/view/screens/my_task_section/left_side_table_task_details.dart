import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/calender_controller.dart';
import '../../../controller/utils/custom_color.dart';
import '../../../controller/utils/custom_text_style.dart';
import '../../custom_widgets/custom_sized.dart';
import '../chat_section/live_chat_screen.dart';
import '../profile_section/profile_details_screen.dart';
class LeftSideTableTaskDetails extends StatefulWidget {
  const LeftSideTableTaskDetails({super.key});
  @override
  State<LeftSideTableTaskDetails> createState() => _LeftSideTableTaskDetailsState();
}

class _LeftSideTableTaskDetailsState extends State<LeftSideTableTaskDetails> {
  CalendarController calendarController=Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 2.h),
        child: SingleChildScrollView(
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
              Divider(color: CustomColor.greyColor,),
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
      ),
    );
  }
}
