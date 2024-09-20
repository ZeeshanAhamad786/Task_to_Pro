import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tasktopro/view/custom_widgets/custom_sized.dart';

import '../../../controller/utils/custom_color.dart';
class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 2.h),
          child: Column(children: [
            getVerticalSpace(20.h),
            Image.asset("assets/png/noInternet.png",width: 310.px,height: 314.px,),
            getVerticalSpace(5.h),
            SvgPicture.asset("assets/svg/internet.svg"),
            getVerticalSpace(10.h),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 5.2.h),
                foregroundColor:  Colors.white ,
                backgroundColor:  CustomColor.orangeColor,
                side: const BorderSide(color: CustomColor.orangeColor, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                // Get.to(() => const SignUpScreen());
              },
              child: Text(
                "TRY AGAIN",
                style: TextStyle(
                  color: Colors.white ,
                ),
              ),
            ),
SizedBox(height: 20,width: 20,)
          ],),
        ),
      ),
    );
  }
}
