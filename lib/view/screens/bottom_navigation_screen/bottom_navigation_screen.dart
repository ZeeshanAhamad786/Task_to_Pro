import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tasktopro/controller/utils/custom_color.dart';
import 'package:tasktopro/view/screens/home_section/home_screen.dart';
import 'package:tasktopro/view/screens/profile_section/profile_home_screen.dart';

import '../chat_section/empty_main_chat_screen.dart';
import '../chat_section/main_chat_screen.dart';
import '../my_task_section/my_task_home_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  BottomNavigationScreenState createState() => BottomNavigationScreenState();
}

class BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Obx(() =>
        Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex.value,
        backgroundColor: Colors.white,
        selectedItemColor: CustomColor.orangeColor,
        unselectedItemColor: CustomColor.blackColor5,
        selectedLabelStyle: textTheme.bodySmall?.copyWith(fontSize: 12.px),
        unselectedLabelStyle: textTheme.bodySmall?.copyWith(fontSize: 12.px),
        onTap: (value) {
          currentIndex.value = value; // Update current index on item tap
        },
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: _buildNavItem(
              icon: SvgPicture.asset(
                "assets/svg/homeIcon.svg",
                colorFilter: ColorFilter.mode(
                  currentIndex.value == 0
                      ? CustomColor.orangeColor
                      : CustomColor.blackColor5,
                  BlendMode.srcIn,
                ),
              ),
              label: "Home", // Search Icon
              isSelected: currentIndex.value == 0,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: _buildNavItem(
              icon: SvgPicture.asset(
                "assets/svg/myTaskIcon.svg",
                colorFilter: ColorFilter.mode(
                  currentIndex.value == 1
                      ? CustomColor.orangeColor
                      : CustomColor.blackColor5,
                  BlendMode.srcIn,
                ),
              ),
              label: "My Task", // Favorites Icon
              isSelected: currentIndex.value == 1,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: _buildNavItem(
              icon: SvgPicture.asset(
                "assets/svg/chatIcon.svg",
                colorFilter: ColorFilter.mode(
                  currentIndex.value == 2
                      ? CustomColor.orangeColor
                      : CustomColor.blackColor5,
                  BlendMode.srcIn,
                ),
              ),
              label: "Chat", // Equipment Icon
              isSelected: currentIndex.value == 2,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: _buildNavItem(
              icon: SvgPicture.asset(
                "assets/svg/personIcon.svg",
                colorFilter: ColorFilter.mode(
                  currentIndex.value == 3
                      ? CustomColor.orangeColor
                      : CustomColor.blackColor5,
                  BlendMode.srcIn,
                ),
              ),
              label: "Profile", // Inbox Icon
              isSelected: currentIndex.value == 3,
            ),
          ),
        ],
      ),
      body: Obx(() {
        switch (currentIndex.value) {
          case 0:
            return const HomeScreen(); // Replace with actual screen
          case 1:
          // return the corresponding Favorites screen
            return const MyTaskHomeScreen(); // Replace with actual screen
          case 2:
          // return the corresponding Equipment screen
            return const MainChatScreen(); // Replace with actual screen
          case 3:
          // return the corresponding Inbox screen
            return const ProfileHomeScreen(); // Replace with actual screen
          default:
            return const SizedBox();
        }
      }),
    )
    );
  }
  Widget _buildNavItem({
    required Widget icon,
    required String label,
    required bool isSelected,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        Text(
          label,
          style: TextStyle(
            color: isSelected ? CustomColor.orangeColor : CustomColor.blackColor5,
            fontSize: 12.px,
          ),
        ),
      ],
    );
  }
}
