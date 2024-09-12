import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tasktopro/controller/utils/custom_text_style.dart';
import '../../../controller/utils/custom_color.dart';
import '../../custom_widgets/custom_sized.dart';
class RatingReviewScreen extends StatefulWidget {
  const RatingReviewScreen({super.key});

  @override
  State<RatingReviewScreen> createState() => _RatingReviewScreenState();
}

class _RatingReviewScreenState extends State<RatingReviewScreen> {
  List<String> data=[
    "Very cooperative seller and equipment just like new.",
    "Very cooperative seller and equipment just like new.",
    "Very cooperative seller and equipment just like new.",
    "Very cooperative seller and equipment just like new.",
    "Very cooperative seller and equipment just like new.",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 2.h),
          child: Column(children: [
            SizedBox(height: 8.h), // Adjust spacing as needed
            Container(
              padding: EdgeInsets.only(bottom: 2.h),
              decoration: const BoxDecoration(
                border:  Border(
                  bottom: BorderSide(width: 1.0, color: CustomColor.greyColor2), // Bottom border only
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(onTap: () {
                    Get.back();
                  },
                      child: const Icon(Icons.arrow_back_ios_new_outlined)),
                  Text("Ratings & Reviews",style: CustomTextStyle.textStartBlack,),
                  SizedBox(height: 10.px,width: 10.px,)
                ],
              ),
            ),
            getVerticalSpace(1.3.h),
            Center(child: Text("5.0", style: CustomTextStyle.text5)),
            SizedBox(width: 0.5.h),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar(
                  filledIcon: Icons.star,
                  filledColor: CustomColor.orangeColor1,
                  size: 18,
                  emptyIcon: Icons.star_border,
                  onRatingChanged: (value) => debugPrint('$value'),
                  initialRating: 5,
                  maxRating: 5,
                ),
              ],
            ),
            getVerticalSpace(5.h),
            ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return   Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RatingBar(
                            filledIcon: Icons.star,
                            filledColor: CustomColor.orangeColor1,
                            size: 12,
                            emptyIcon: Icons.star_border,
                            onRatingChanged: (value) => debugPrint('$value'),
                            initialRating: 5,
                            maxRating: 5,
                          ),
                          SizedBox(width: 0.5.h),
                          Text("Mohsin", style: CustomTextStyle.textName1),
                        ],
                      ),
                      getVerticalSpace(1.h),
                      Text(data[index],style: CustomTextStyle.textWithBlack,),
                      getVerticalSpace(1.3.h),
                       Divider(color: CustomColor.greyColor,)
                    ],
                  );

                })

          ],),
        ),
      ),
    );
  }
}
