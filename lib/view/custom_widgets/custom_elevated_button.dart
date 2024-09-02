import 'package:flutter/material.dart';
import 'package:tasktopro/controller/utils/custom_color.dart';
import 'package:tasktopro/controller/utils/custom_text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 500, // default width for buttons
    this.height = 45, // default width for buttons
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColor.orangeColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: CustomColor.orangeColor,width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: FittedBox(fit: BoxFit.scaleDown,
          child: Text(
            text,style: CustomTextStyle.textSignUpWhite,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            // style: Constant.loginSignUpButton,
          ),
        ),
      ),
    );
  }
}
