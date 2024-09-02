import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tasktopro/controller/utils/custom_text_style.dart';
import 'package:tasktopro/view/screens/authentication_screens/verification_screen.dart';
import '../../custom_widgets/custom_elevated_button.dart';
import '../../custom_widgets/custom_sized.dart';
import '../../custom_widgets/custom_text_form_field.dart';
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getVerticalSpace(9.h),
              GestureDetector(onTap: () {
                Get.back();
              },
                  child: const Icon(Icons.arrow_back_ios_new)),
              getVerticalSpace(3.h),
              Align(alignment: Alignment.topCenter,
                  child: Text("Reset Your Password",style: CustomTextStyle.textResetOrange,)),
              getVerticalSpace(1.h),
              Align(alignment: Alignment.topCenter,
                  child: Text("Enter your email and we'll send you a link to reset your\n password.",
                    style: CustomTextStyle.textWithBlack,textAlign: TextAlign.center,)),
              getVerticalSpace(10.h),
              Text("Email address",style: CustomTextStyle.textEmailBlack,),
              getVerticalSpace(.7),
              CustomTextFormField(hintText: 'Your email address',controller: emailController,),
              getVerticalSpace(2.h),
              Center(
                child: CustomElevatedButton(text: "Next", onPressed: (){
                  Get.to(()=>VerificationScreen());
                }),
              ),


            ],),
        ),
      ),
    );
  }
}
