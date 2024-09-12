import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tasktopro/view/screens/rating_review_section/rating_review_screen.dart';

import '../../../controller/utils/custom_color.dart';
import '../../../controller/utils/custom_text_style.dart';
import '../../custom_widgets/custom_sized.dart';
class ProfileDetailsScreen extends StatefulWidget {

  const ProfileDetailsScreen({super.key, });

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
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
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 2.h),
          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    Text("Mohsin Shop",style: CustomTextStyle.textStartBlack,),
                    SizedBox(height: 10.px,width: 10.px,)
                  ],
                ),
              ),
              getVerticalSpace(3.h),
              Center(
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/png/profileImage.png"),
                  radius: 40,
                ),
              ),
              getVerticalSpace(1.h),
              Center(child: Text("Mohsin", style: CustomTextStyle.textName)),
              getVerticalSpace(0.3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar(
                    filledIcon: Icons.star,
                    filledColor: CustomColor.orangeColor1,
                    size: 16,
                    emptyIcon: Icons.star_border,
                    onRatingChanged: (value) => debugPrint('$value'),
                    initialRating: 5,
                    maxRating: 5,
                  ),
                  SizedBox(width: 0.5.h),
                  Text("5.0", style: CustomTextStyle.textName2),
                ],
              ),
              getVerticalSpace(3.h),
              Text("Contractor Details ",style:CustomTextStyle.textEmailBlack),
                  getVerticalSpace(1.2.h),
                  Text("Name",style: TextStyle(color: Colors.black,fontSize: 12.px,fontWeight: FontWeight.w800),),
            
                  SizedBox(height: 0.5.h,),
              Text("Mohsin ali raza",style: TextStyle(color: Colors.black,fontSize: 14.px,fontWeight: FontWeight.w400),),
              Divider(color: Colors.grey.withOpacity(0.2),),
              SizedBox(height: 1.h,),
              Text("Email",style: TextStyle(color: Colors.black,fontSize: 12.px,fontWeight: FontWeight.w800),),
              SizedBox(height: 0.5.h,),
              Text("Mohsin ali raza",style: TextStyle(color: Colors.black,fontSize: 14.px,fontWeight: FontWeight.w400),),
              Divider(color: Colors.grey.withOpacity(0.2),),
              SizedBox(height: 1.h,),
              Text("Phone Number",style: TextStyle(color: Colors.black,fontSize: 12.px,fontWeight: FontWeight.w800),),
              SizedBox(height: 0.5.h,),
              Text("92 3204626050",style: TextStyle(color: Colors.black,fontSize: 14.px,fontWeight: FontWeight.w400),),
              Divider(color: Colors.grey.withOpacity(0.2),),
                  SizedBox(height: 1.h,),
                  Text("Post code",style: TextStyle(color: Colors.black,fontSize: 12.px,fontWeight: FontWeight.w800),),
                  SizedBox(height: 0.5.h,),
                  Text("0901116",style: TextStyle(color: Colors.black,fontSize: 14.px,fontWeight: FontWeight.w400),),
                  Divider(color: Colors.grey.withOpacity(0.2),),
                  getVerticalSpace(2.h),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ratings & Reviews",
                        style: CustomTextStyle.textProfile,
                      ),
                      GestureDetector(onTap: () {
                        Get.to(()=>const RatingReviewScreen());
                      },
                        child: Text(
                          "View all",
                          style: CustomTextStyle.textBlackColor5,
                        ),
                      ),
                    ],
                  ),
                  getVerticalSpace(1.2.h),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
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
            
                      }),
            
                ]
            ),
          ),
        )
    );
  }
}

