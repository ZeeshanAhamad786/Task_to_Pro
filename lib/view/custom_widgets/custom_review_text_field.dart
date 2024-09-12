import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tasktopro/controller/utils/custom_color.dart';
class CustomReviewTextField extends StatelessWidget {
  final bool obscureText;
  final String? hintText;
  // final TextEditingController controller;
  final TextInputType keyboardType;

  const CustomReviewTextField({
    super.key,
    this.obscureText = false,
    // required this.controller,
    this.keyboardType = TextInputType.text,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.greyColor2
        ,
          borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        maxLines: 4,
        cursorColor: CustomColor.orangeColor,
        // controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,hintStyle: TextStyle(fontSize: 12.px,fontWeight: FontWeight.w400, color:CustomColor.blackColor6),
          contentPadding: EdgeInsets.all(10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: CustomColor.orangeColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.withOpacity(.1)),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
