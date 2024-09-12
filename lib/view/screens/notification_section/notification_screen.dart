import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tasktopro/controller/utils/custom_color.dart';
import 'package:tasktopro/controller/utils/custom_text_style.dart';
import 'package:tasktopro/view/custom_widgets/custom_sized.dart';

import '../../../model/notification_screen_model.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationScreenModel> data = [
    NotificationScreenModel(
      day: 'Today',
      name: 'Task Done',
      time: '4:00am',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, ',
    ),
    NotificationScreenModel(
      day: 'Yesterday',
      name: 'New Offer',
      time: '4:00am',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, ',
    ),
    NotificationScreenModel(
      day: '30/06/24',
      name: 'New Message',
      time: '4:00am',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, ',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 2.w),
        child: Column(
          children: [  SizedBox(
              height: 8.h), // Adjust spacing as needed
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(onTap: () {
                    Get.back();
                  },
                      child: const Icon(Icons.arrow_back_ios_new_outlined)),
                  Text("Notification",style: CustomTextStyle.textStartBlack,),
                  SizedBox(height: 10.px,width: 10.px,)
                ],
              ),
            ),
            getVerticalSpace(2.h),
            Expanded(
              child: GestureDetector(onTap: () {
                // Get.to(()=>const NewRentalRequestScreen());
              },
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical:1.h, horizontal: 2.h),
                          child: Row(
                            children: [
                              Text(
                                  data[index].day,
                                  style: CustomTextStyle.textForgotOrange
                              ),
                              // Use Divider with adjusted properties
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: CustomColor.greyColor1.withOpacity(.5), // Ensure this color contrasts with the background
                                  margin:  EdgeInsets.symmetric(horizontal: 1.h), // Add margin if needed
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                        data[index].name,
                                        style: CustomTextStyle.textOpiBlack
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      data[index].time,
                                      style: CustomTextStyle.textForgotOrange,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                  data[index].description,
                                  style:CustomTextStyle.textNameBlack2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
