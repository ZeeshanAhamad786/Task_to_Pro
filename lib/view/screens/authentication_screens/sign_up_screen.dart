import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tasktopro/controller/utils/custom_color.dart';
import 'package:tasktopro/controller/utils/custom_text_style.dart';
import '../../../controller/utils/image_picker_controller.dart';
import '../../custom_widgets/custom_business_details_text_form_field.dart';
import '../../custom_widgets/custom_elevated_button.dart';
import '../../custom_widgets/custom_sized.dart';
import '../../custom_widgets/custom_text_form_field.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final ImagePickerController imagePickerController = Get.put(ImagePickerController());

  // Separate observables for password and confirm password visibility
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
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getVerticalSpace(8.h),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back_ios_new),
              ),
              getVerticalSpace(5.h),
              Text(
                "Welcome to, Task to pro",
                style: CustomTextStyle.textWelcomeBlack,
              ),
              getVerticalSpace(1.h),
              Text(
                "Enter your detail to create Task to pro account.",
                style: CustomTextStyle.textAccountBlack,
              ),
              getVerticalSpace(5.h),
              Center(
                child: GestureDetector(
                  onTap: () {
                    imagePickerController.getImage();
                  },
                  child: Obx(() => CircleAvatar(
                    backgroundColor: CustomColor.greyColor1,
                    radius: 50, // CircleAvatar's radius
                    child: ClipOval(
                      child: imagePickerController.imagePath.value.isNotEmpty
                          ? Image.file(
                        File(imagePickerController.imagePath.value),
                        fit: BoxFit.cover,
                        width: 100, // Match the CircleAvatar's diameter (radius * 2)
                        height: 100, // Match the CircleAvatar's diameter (radius * 2)
                      )
                          : SizedBox(
                        width: 70, // Keep the default icon size at 70x70
                        height: 70,
                        child: Image.asset(
                          "assets/png/cameraIcon.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )),
                ),
              ),
              getVerticalSpace(3.h),
              Text("Your name", style: CustomTextStyle.textEmailBlack),
              getVerticalSpace(.8),
              CustomTextFormField(
                hintText: 'Your name',
                controller: nameController,
              ),
              getVerticalSpace(2.h),
              Text("Business details", style: CustomTextStyle.textEmailBlack),
              getVerticalSpace(.8),
              CustomBusinessDetailsField(
                hintText: 'Your business details',
                controller: nameController,
              ),
              getVerticalSpace(2.h),
              Text("Email address", style: CustomTextStyle.textEmailBlack),
              getVerticalSpace(.8),
              CustomTextFormField(
                hintText: 'Your email address',
                controller: emailController,
              ),
              getVerticalSpace(2.h),
              Text("Phone number", style: CustomTextStyle.textEmailBlack),
              getVerticalSpace(.8),
              CustomTextFormField(
                hintText: 'Your phone number',
                controller: emailController,
              ),
              getVerticalSpace(2.h),
              Text("Address", style: CustomTextStyle.textEmailBlack),
              getVerticalSpace(.8),
              CustomTextFormField(
                hintText: 'Your address',
                controller: emailController,
              ),
              getVerticalSpace(2.h),
              Text("Password", style: CustomTextStyle.textEmailBlack),
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
              Text("Confirm Password", style: CustomTextStyle.textEmailBlack),
              getVerticalSpace(.8),
              Obx(() => CustomTextFormField(
                hintText: 'Confirm Password',
                controller: confirmPasswordController,
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
              Center(child: CustomElevatedButton(text: "Sign-up ", onPressed: () {})),
              getVerticalSpace(1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("I have a Task to pro account?", style: CustomTextStyle.textOpiBlack),
                  getHorizontalSpace(1.w),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const LoginScreen());
                    },
                    child: Text("Login", style: CustomTextStyle.textSignUpOrange),
                  ),
                ],
              ),
              SizedBox(height: 2.h, width: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
