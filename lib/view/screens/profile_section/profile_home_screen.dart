import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tasktopro/view/screens/notification_section/notification_screen.dart';
import 'package:tasktopro/view/screens/subscription_section/subscription_screen.dart';
import 'package:tasktopro/view/screens/wallet_section/my_wallet_screen.dart';
import '../../../controller/utils/custom_color.dart';
import '../../../controller/utils/custom_text_style.dart';
import '../../../controller/utils/image_picker_controller.dart';
import '../../custom_widgets/custom_sized.dart';

class ProfileHomeScreen extends StatefulWidget {
  const ProfileHomeScreen({super.key});

  @override
  State<ProfileHomeScreen> createState() => _ProfileHomeScreenState();
}

class _ProfileHomeScreenState extends State<ProfileHomeScreen> {
  ImagePickerController imagePickerController = Get.put(ImagePickerController());

  // Adjusted list with matching number of icons and names
  final List<String> names = [
    "Rating & Reviews", "My Wallet", "Subscription", "Settings", "Privacy Policy",
    "Chat Support", "Rate Us", "Share", "Log out"
  ];

  final List<String> imagePaths = [
    "assets/svg/rating1.svg",
    "assets/svg/wallet2.svg",
    "assets/svg/subscription1.svg",
    "assets/svg/setting4.svg",
    "assets/svg/privacy5.svg",
    "assets/svg/chat6.svg",
    "assets/svg/rateUs7.svg",
    "assets/svg/share8.svg", // Added missing SVG for "Share"
    "assets/svg/logout9.svg",
  ];

  void navigateToScreen(int index) {
    switch (index) {
      case 0:
      // Add navigation logic for Rating & Reviews
        break;
      case 1:
      Get.to(()=>const MyWalletScreen());
        break;
      case 2:
        Get.to(()=>const SubscriptionScreen());
        break;
      case 3:
      // Add navigation logic for Settings
        break;
      case 4:
      // Add navigation logic for Privacy Policy
        break;
      case 5:
      // Add navigation logic for Chat Support
        break;
      case 6:
      // Add navigation logic for Rate Us
        break;
      case 7:
      // Add navigation logic for Share
        break;
      case 8:
      // Add navigation logic for Log out
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.greyColor2,
      appBar: AppBar(automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
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
      body: Column(
        children: [
          getVerticalSpace(2.h),
          // Profile Section
          Container(
            padding: EdgeInsets.symmetric(vertical: 3.h),
            margin: EdgeInsets.symmetric(horizontal: 2.h),
            decoration:  BoxDecoration(borderRadius:BorderRadius.circular(16),
              color: Color(0xffffe8dd),
            ),
            child: Column(
              children: [
                getVerticalSpace(1.h),
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/png/profileImage.png"),
                  radius: 40,
                ),
                getVerticalSpace(1.h),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Mohsin", style: CustomTextStyle.textName),
                    getHorizontalSpace(2.w),
                    SvgPicture.asset("assets/svg/proIcon.svg")
                  ],
                ),
                getVerticalSpace(0.3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar(
                      filledIcon: Icons.star,
                      filledColor: CustomColor.orangeColor1,
                      size: 16,
                      emptyIcon: Icons.star_border,
                      onRatingChanged: (value) => debugPrint('$value'),
                      initialRating: 5,
                      maxRating: 5,
                    ),
                    SizedBox(width: 0.5.h),
                    Text("5.0", style: CustomTextStyle.textName2),
                  ],
                ),
                getVerticalSpace(1.h),
                GestureDetector(onTap: () {
                },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.h),
                    padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 0.6.h),
                    decoration: BoxDecoration(color: CustomColor.blueColor,
                      borderRadius: BorderRadius.circular(8),

                    ),
                    child: Text("Edit", style: CustomTextStyle.textWhite),
                  ),
                ),
              ],
            ),
          ),
          // List of Profile Options
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: names.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    navigateToScreen(index);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.h,left: 2.h,right: 2.h),
                    child: Container(
                      padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 2.h),
                                decoration: BoxDecoration(color:   Colors.white,borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          SvgPicture.asset(imagePaths[index]),
                          SizedBox(width: 2.w),
                          Text(names[index], style: CustomTextStyle.textOpiBlack),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,size: 14,)
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
SizedBox(height: 10,width: 10,)
        ],
      ),
    );
  }
}
