import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tasktopro/controller/utils/custom_text_style.dart';
import 'package:tasktopro/view/screens/authentication_screens/create_task_pro.dart';
import 'package:tasktopro/view/screens/authentication_screens/login_screen.dart';
import '../../custom_widgets/custom_elevated_button.dart';
import '../../custom_widgets/custom_sized.dart';
import '../../custom_widgets/custom_text_form_field.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController confirmController=TextEditingController();

  RxBool isPasswordObscure = true.obs;
  RxBool isConfirmPasswordObscure = true.obs;
  void togglePasswordVisibility() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordObscure.value = !isConfirmPasswordObscure.value;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [getVerticalSpace(9.h),
              GestureDetector(onTap: () {
                Get.back();
              },
                  child: Icon(Icons.arrow_back_ios_new)),
              getVerticalSpace(5.h),
              Text("Welcome to, Task to pro",style: CustomTextStyle.textWelcomeBlack,),
              getVerticalSpace(1.h),
              Text("Enter your detail to create Task to\npro account.",style: CustomTextStyle.textAccountBlack,),
              getVerticalSpace(4.h),
              Text("Email address",style: CustomTextStyle.textEmailBlack,),
              getVerticalSpace(.8),
              CustomTextFormField(hintText: 'Your email address',controller: emailController,),
              getVerticalSpace(2.h),
              Text("Password",style: CustomTextStyle.textEmailBlack,),
              getVerticalSpace(.8),
              Obx(() => CustomTextFormField(
                hintText: 'Your password',
                controller: passwordController,
                obscureText: isPasswordObscure.value,
                suffixIcon: SvgPicture.asset(
                  isPasswordObscure.value
                      ? "assets/svg/eye.svg"
                      : "assets/svg/closeEye.svg",
                ),
                onSuffixIconPressed: () {
                  togglePasswordVisibility();
                },
              )),
              getVerticalSpace(2.h),
              Text("Confirm Password",style: CustomTextStyle.textEmailBlack,),
              getVerticalSpace(.8),
              Obx(() => CustomTextFormField(
                hintText: 'Confirm Password',
                controller: confirmController,
                obscureText: isConfirmPasswordObscure.value,
                suffixIcon: SvgPicture.asset(
                  isConfirmPasswordObscure.value
                      ? "assets/svg/eye.svg"
                      : "assets/svg/closeEye.svg",
                ),
                onSuffixIconPressed: () {
                  toggleConfirmPasswordVisibility();
                },
              )),
              getVerticalSpace(3.h),
              Center(
                child: CustomElevatedButton(text: "Next", onPressed: (){
                  Get.to(()=>const CreateTaskPro());
                }),
              ),

              getVerticalSpace(2.h),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("I have a Task to pro account?",style: CustomTextStyle.textOpiBlack,),
                  getHorizontalSpace(.8.w),
                  GestureDetector(onTap: () {
                    Get.to(()=>const LoginScreen());
                  },
                      child: Text("Login",style: CustomTextStyle.textSignUpOrange,)),
                ],
              )

            ],),
        ),
      ),
    );
  }
}
