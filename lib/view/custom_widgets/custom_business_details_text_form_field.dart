import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tasktopro/controller/utils/custom_color.dart';
class CustomBusinessDetailsField extends StatelessWidget {
  final bool obscureText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const CustomBusinessDetailsField({
    super.key,
    this.obscureText = false,
     this.controller,
    this.keyboardType = TextInputType.text,
    this.hintText,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 2,
      cursorColor: CustomColor.orangeColor,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,hintStyle: TextStyle(fontSize: 12.px,fontWeight: FontWeight.w400, color:CustomColor.blackColor2),
        contentPadding: const EdgeInsets.all(10),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: CustomColor.orangeColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: CustomColor.greyColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
