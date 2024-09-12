import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tasktopro/controller/utils/custom_text_style.dart';
import 'package:tasktopro/view/screens/profile_section/profile_details_screen.dart';
import '../../../controller/utils/calender_controller.dart';
import '../../../controller/utils/custom_color.dart';
import '../../../controller/utils/time_picker_controller.dart';
import '../../custom_widgets/custom_business_details_text_form_field.dart';
import '../../custom_widgets/custom_sized.dart';
import '../../custom_widgets/custom_text_form_field.dart';
class LiveChatScreen extends StatefulWidget {
  const LiveChatScreen({super.key, this.title, this.imagePath});
  final String? title;
  final String? imagePath;

  @override
  State<LiveChatScreen> createState() => _LiveChatScreenState();
}

class _LiveChatScreenState extends State<LiveChatScreen> {
  CalendarController calendarController=Get.put(CalendarController());
  final TimePickerController timePickerController = Get.put(TimePickerController());

  final TextEditingController controller=TextEditingController();
  final TextEditingController nameController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    RxList<String> chatList = <String>[].obs;
    RxInt selectedIndex = 0.obs;

    RxString messageLength = ''.obs;
    final TextEditingController chatController = TextEditingController();
    return Scaffold(backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          children: [
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back_ios_new),
                ),
                Text(
                  "Mohsin Shop",
                  style: CustomTextStyle.textProfile,
                ),
                PopupMenuButton<int>(
                  icon: const Icon(Icons.more_vert),
                  onSelected: (int result) {
                    // Handle the selected menu item
                    print('Selected: $result');
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[

                    PopupMenuItem<int>(
                      value: 1,
                      child: GestureDetector(onTap: () {
                        Get.to(()=>const ProfileDetailsScreen());
                      },
                          child: Text('See Profile',style: CustomTextStyle.textAddBlack6,)),
                    ),
                    PopupMenuItem<int>(
                      value: 3,
                      child: GestureDetector(onTap: () {
                            Get.back();
                      },
                          child: Text('Delete Chat',style: CustomTextStyle.textAddBlack6,)),
                    ),
                  ],
                  color: Colors.white,

                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  getVerticalSpace(3.h),
                  Container(
                    padding: EdgeInsets.only(right: 2.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: CustomColor.greyColor1.withOpacity(0.1),
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/png/carpenterImage.png",
                          height: 88.px,
                          width: 120.px,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 2.h),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 1.h),
                              Text("Carpenter", style: CustomTextStyle.textBlackColor5),
                              SizedBox(height: .7.h),
                              Row(
                                children: [
                                  Expanded(child: Text("The left side leg of the table is broken.", style: CustomTextStyle.textBlackColor)),
                                  Text("12 May", style: CustomTextStyle.textBlackColor5),

                                ],
                              ),
                              SizedBox(height: 0.2.h),
                              Text(
                                "2 Days ago",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: CustomColor.blackColor2,
                                ),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  getVerticalSpace(3.8.h),
                  Text(
                    '12:10AM',style: CustomTextStyle.textTime,
                  ),
                  Obx(
                        () => ListView.builder(
                      itemCount: chatList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Row(
                              children: [
                                // CircleAvatar(
                                //   radius: 2.5.h,
                                //   backgroundImage: AssetImage(widget.imagePath!),
                                // ),
                                // getHorizontalSpace(1.5.h),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.h),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(1.h),
                                  decoration: BoxDecoration(
                                    color: CustomColor.orangeColor1,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.px),
                                      bottomRight: Radius.circular(10.px),
                                      topRight: Radius.circular(10.px),
                                    ),
                                  ),
                                  child: Text(
                                    chatList[index],
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                      color: const Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.px,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(onTap:(){
                            siteVisitDialog(context);
                          },
                              child: const Icon(Icons.add,color: CustomColor.greyColorSite,size: 16,)),
                          GestureDetector(onTap: () {
                            siteVisitDialog(context);
                          },
                              child: Text("Site Visit",style: CustomTextStyle.greyColorSite,)),
                          getHorizontalSpace(2.w),
                          Container(height: 10.px,width: .5,
                            decoration: const BoxDecoration(
                          color: CustomColor.greyColorSite,
                          ),),
                          getHorizontalSpace(2.w),

                          GestureDetector(onTap: () {
                            createOfferDialog(context);
                          },
                              child:  Icon(Icons.add,color: CustomColor.greyColorSite,size: 16,)),
                          GestureDetector(onTap: () {
                            createOfferDialog(context);

                          },
                              child: Text("Create offer",style: CustomTextStyle.greyColorSite,)),
                        ],
                      ),
                      getVerticalSpace(1.2.h),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [

                                Expanded(
                                  child: TextFormField(
                                    controller: chatController,
                                    onChanged: (value) {
                                      messageLength.value = value;
                                    },
                                    autocorrect: false,
                                    enableSuggestions: false,
                                    cursorColor: CustomColor.orangeColor1,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      prefixIcon: Transform.scale(scale: .6,
                                          child: SvgPicture.asset("assets/svg/attachFile.svg")),
                                      fillColor: const Color(0xffF8F8F8),
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3.h),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3.h),
                                        borderSide: const BorderSide(color: CustomColor.greyColor5),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3.h),
                                        borderSide:  const BorderSide(color:CustomColor.orangeColor1),
                                      ),
                                      isCollapsed: true,
                                      contentPadding:  EdgeInsets.symmetric(horizontal: 10.px,vertical: 10.px),
                                      hintText: 'Type your message',
                                      hintStyle: TextStyle(
                                          fontSize: 12.px,
                                          fontWeight: FontWeight.w400,
                                          color: CustomColor.blackColor12
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                          getHorizontalSpace(1.h),
                          GestureDetector(
                            onTap: () {
                              if (chatController.text.isNotEmpty) {
                                chatList.add(chatController.text);
                                chatController.clear();
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
                              decoration: BoxDecoration(
                                color: CustomColor.orangeColor2,
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(24.px),
                                  right: Radius.circular(24.px),
                                ),
                              ),
                              child: SvgPicture.asset(
                                'assets/svg/sentIconWhite.svg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  getVerticalSpace(2.2.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void siteVisitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent, // Transparent background for Material
            child: Container(
              width: 90.w, // Width responsive to screen width
padding: EdgeInsets.symmetric(horizontal: 2.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.h), // Responsive border radius
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min, // Adjust the height based on content
                children: [
                  getVerticalSpace(2.h),
                  Text(
                    'Site Visit Proposal',
                    style: CustomTextStyle.textBlack1.copyWith(
                      fontSize: 18.sp, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(color:CustomColor.greyColor ,),

                  SizedBox(height: 1.h), // Responsive vertical spacing
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      'Site visit date & time',
                      style: CustomTextStyle.textAccountBlack1,
                    ),
                  ),
                  getVerticalSpace(1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Text("Select Date"),
                      getHorizontalSpace(15.w),
                      Text("Select Time"),
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
                      getHorizontalSpace(3.5.w),
                      Text("To",style: CustomTextStyle.textSeeAllOrange1,),
                      getHorizontalSpace(3.5.w),

                      Center(
                        child: Obx(() => GestureDetector(
                          onTap: () {
                            timePickerController.selectEndTime(context); // Trigger the time picker
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 2.w),
                              SvgPicture.asset("assets/svg/timeIcon.svg"),
                              SizedBox(width: 2.w),

                              // Display selected time in the format you want (e.g., HH:mm a)
                              Text(
                                "${timePickerController.selectedEndTime.value.format(context)}",
                                style: CustomTextStyle.textLoginBlack,
                              ),
                            ],
                          ),
                        )),
                      ),
                    ],
                  )),
                  getVerticalSpace(2.h),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Site visit charges", style: CustomTextStyle.textEmailBlack),
                      Text("(It's optional)", style: CustomTextStyle.textOpiBlack),
                    ],
                  ),
                  getVerticalSpace(1.h),
                  CustomTextFormField(
                    controller: controller,
                  ),
                  SizedBox(height: 2.5.h), // Responsive vertical spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Equal spacing
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Handle 'Yes' action
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 1.2.h, // Responsive vertical padding
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color:     CustomColor.greyColor,
                              borderRadius: BorderRadius.circular(1.h),
                            ),
                            child: Text(
                              'Deny',
                              style: CustomTextStyle.textAccountBlack.copyWith(
                                color: Colors.white,
                                fontSize: 16.sp, // Responsive font size
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 2.h), // Responsive horizontal spacing
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.back(); // Dismiss the dialog
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 1.2.h, // Responsive vertical padding
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xff34C759),
                              borderRadius: BorderRadius.circular(1.h),
                              border: Border.all(color: const Color(0xff34C759)),
                            ),
                            child: Text(
                              'Send',
                              style: CustomTextStyle.textForgotOrange.copyWith(
                                color: Colors.white,
                                fontSize: 16.sp, // Responsive font size
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,width: 15,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }}
  void createOfferDialog(BuildContext context) {
    CalendarController calendarController1=Get.put(CalendarController());
    final TextEditingController controller1=TextEditingController();


    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent, // Transparent background for Material
            child: Container(
              width: 90.w, // Width responsive to screen width
padding: EdgeInsets.symmetric(horizontal: 2.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.h), // Responsive border radius
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min, // Adjust the height based on content
                children: [
                  getVerticalSpace(2.h),
                  Text(
                    'Project offer Proposal',
                    style: CustomTextStyle.textBlack1.copyWith(
                      fontSize: 18.sp, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(color:CustomColor.greyColor ,),

                  SizedBox(height: 1.h), // Responsive vertical spacing
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      'Project Duration',style: CustomTextStyle.textAccountBlack1,

                    ),
                  ),
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
                        calendarController1.selectStartDate(context);

                      },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/calenderIcon.svg",
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              DateFormat('yyyy-MM-dd').format(calendarController1.selectedStartDate.value),
                              style: CustomTextStyle.textLoginBlack,
                            ),
                          ],
                        ),
                      ),
                      getHorizontalSpace(2.5.w),
                      Text("To",style: CustomTextStyle.textSeeAllOrange1,),
                      getHorizontalSpace(2.5.w),

                      Obx(() => GestureDetector(onTap: () {
                        calendarController1.selectEndDate(context);
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
                              DateFormat('yyyy-MM-dd').format(calendarController1.selectedEndDate.value),
                              style: CustomTextStyle.textLoginBlack,
                            ),
                          ],
                        ),
                      )),
                    ],
                  )),
                  getVerticalSpace(2.h),
                  Align(alignment: Alignment.centerLeft,
                      child: Text("Cost of the project", style: CustomTextStyle.textEmailBlack)),
                  getVerticalSpace(1.h),
                  CustomTextFormField(
                    controller: controller1,
                  ),
                  getVerticalSpace(2.h),
                  Align(alignment: Alignment.centerLeft,
                      child: Text("Project Details ", style: CustomTextStyle.textEmailBlack)),
                  getVerticalSpace(1.h),
                  CustomBusinessDetailsField(
                  ),
                  SizedBox(height: 2.5.h), // Responsive vertical spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Equal spacing
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Handle 'Yes' action
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 1.2.h, // Responsive vertical padding
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color:     CustomColor.greyColor,
                              borderRadius: BorderRadius.circular(1.h),
                            ),
                            child: Text(
                              'Deny',
                              style: CustomTextStyle.textAccountBlack.copyWith(
                                color: Colors.white,
                                fontSize: 16.sp, // Responsive font size
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 2.h), // Responsive horizontal spacing
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.back(); // Dismiss the dialog
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 1.2.h, // Responsive vertical padding
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xff34C759),
                              borderRadius: BorderRadius.circular(1.h),
                              border: Border.all(color: const Color(0xff34C759)),
                            ),
                            child: Text(
                              'Send',
                              style: CustomTextStyle.textForgotOrange.copyWith(
                                color: Colors.white,
                                fontSize: 16.sp, // Responsive font size
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,width: 15,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }


