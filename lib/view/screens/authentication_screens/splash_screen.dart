import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tasktopro/controller/utils/custom_color.dart';
import '../../custom_widgets/custom_sized.dart';
import 'logo_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    // Delay for 3 seconds, then navigate to the next screen
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const LogoScreen()); // Replace 'NextScreen()' with the screen you want to navigate to
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.orangeColor1,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height:  MediaQuery.of(context).size.height*.4,),
              Center(child: SvgPicture.asset("assets/svg/splashLogo.svg")),
              getVerticalSpace(3.h),
              Image.asset(
                "assets/png/Task To Pro.png",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
