import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tasktopro/model/inbox_main_chat_screen_model.dart';
import 'package:tasktopro/view/screens/chat_section/live_chat_screen.dart';
import '../../../controller/utils/custom_color.dart';
import '../../../controller/utils/custom_text_style.dart';
import '../../custom_widgets/custom_sized.dart';
import '../notification_section/notification_screen.dart';
class MainChatScreen extends StatefulWidget {
  const MainChatScreen({super.key});

  @override
  State<MainChatScreen> createState() => _MainChatScreenState();
}

class _MainChatScreenState extends State<MainChatScreen> {
  final RxList<InboxMainChatScreenModel> items = [
    InboxMainChatScreenModel(
      title: "Mohsin Shop",
      subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ut labore et dolore magna aliqua.",
      imageUrl: "assets/png/profileImage.png",
      time: '15m ago',
    ),
    InboxMainChatScreenModel(
      title: "Mohsin Shop",
      subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ut labore et dolore magna aliqua.",
      imageUrl: "assets/png/profileImage.png",
      time: '1h ago',
    ),
    InboxMainChatScreenModel(
      title: "Mohsin Shop",
      subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ut labore et dolore magna aliqua.",
      imageUrl: "assets/png/profileImage.png",
      time: '15m ago',
    ),
    InboxMainChatScreenModel(
      title: "Mohsin Shop",
      subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ut labore et dolore magna aliqua.",
      imageUrl: "assets/png/profileImage.png",
      time: '1h ago',
    ),
    InboxMainChatScreenModel(
      title: "Mohsin Shop",
      subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ut labore et dolore magna aliqua.",
      imageUrl: "assets/png/profileImage.png",
      time: '15m ago',
    ),
  ].obs;
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
        getVerticalSpace(3.h),
        Expanded(
          child: GestureDetector(onTap:() {

          },
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: items.length,
              shrinkWrap: true,

              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(()=>const LiveChatScreen());
                      },
                      child: ListTile(
                        title: Text(
                          items[index].title,
                          style: CustomTextStyle.textWithBlack,
                        ),
                        subtitle: Text(
                          items[index].subtitle,
                          style: CustomTextStyle.textNameBlack2,
                        ),
                        leading: CircleAvatar(
                          maxRadius: 30,
                          backgroundImage: AssetImage(items[index].imageUrl),
                        ),
                        trailing: Text(
                          items[index].time,
                          style: CustomTextStyle.textNameBlack1,
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 2.h),
                      child: const Divider(color: CustomColor.greyColor,),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ],),
    );
  }
}
