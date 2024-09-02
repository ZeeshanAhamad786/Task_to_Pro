import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tasktopro/controller/utils/custom_color.dart';
import 'package:tasktopro/view/screens/authentication_screens/sign_up_screen.dart';
import '../../custom_widgets/custom_sized.dart';
import 'login_screen.dart';
class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  RxBool isFirstButtonActive = true.obs;

  @override
  Widget build(BuildContext context) {
    return
      Obx(() =>  Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getVerticalSpace(32.h),
                Center(child: SvgPicture.asset("assets/svg/logo.svg")),
                getVerticalSpace(20.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 5.2.h),
                    foregroundColor: isFirstButtonActive.value ? Colors.white : CustomColor.orangeColor,
                    backgroundColor: isFirstButtonActive.value ? CustomColor.orangeColor : Colors.white,
                    side: const BorderSide(color: CustomColor.orangeColor, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Get.off(() => const SignUpScreen());
                    isFirstButtonActive.value = true;
                  },
                  child: Text(
                    "Signup",
                    style: TextStyle(
                      color: isFirstButtonActive.value ? Colors.white : CustomColor.orangeColor,
                    ),
                  ),
                ),
                getVerticalSpace(1.2.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 5.2.h),
                    foregroundColor: !isFirstButtonActive.value ? Colors.white : CustomColor.orangeColor,
                    backgroundColor: !isFirstButtonActive.value ?CustomColor.orangeColor : Colors.white,
                    side: const BorderSide(color: CustomColor.orangeColor, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Get.off(()=>const LoginScreen());
                    isFirstButtonActive.value = false;

                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: !isFirstButtonActive.value ? Colors.white : CustomColor.orangeColor,
                    ),
                  ),
                ),
                SizedBox(height: 40.px,width: 40.px,)
              ],
            ),
          ),
        ),
      ));
  }
}
