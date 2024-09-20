import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tasktopro/controller/utils/custom_color.dart';
import 'package:tasktopro/controller/utils/custom_text_style.dart';
import 'package:tasktopro/view/custom_widgets/custom_sized.dart';
import '../../../controller/post_code_controller.dart';

class PostCodeScreen extends StatefulWidget {
  const PostCodeScreen({super.key});
  @override
  State<PostCodeScreen> createState() => _PostCodeScreenState();
}
class _PostCodeScreenState extends State<PostCodeScreen> {

  List<PostCodeController> data = [
    PostCodeController(category: 'Carpenter', imageUrl: 'assets/png/carpenterImage.png', name: 'The left side leg of the table is broken.',
        time: '2 Days ago'),
    PostCodeController(category: 'Electrician', imageUrl: 'assets/png/electricianImage.png', name: 'The left side leg of the table is broken.',
         time: '6 hours ago'),
    PostCodeController(category: 'Plumber', imageUrl: 'assets/png/plumberImage.png', name: 'The left side leg of the table is broken.',
         time: 'Yesterday '),
  ];
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(children: [
          getVerticalSpace(2.h),
          Expanded(
            child: GestureDetector(onTap:() {
              // Get.to(()=>const ShowEquipmentName());
            },
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: Container(
                      padding: EdgeInsets.only(right: 2.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: CustomColor.greyColor1.withOpacity(0.1),
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 0,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            data[index].imageUrl,
                            height: 88.px,
                            width: 120.px,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 2.h),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 1.h),
                                Text(data[index].category, style: CustomTextStyle.textBlackColor5),
                                SizedBox(height: 1.h),
                                Text(data[index].name, style: CustomTextStyle.textBlackColor),
                                SizedBox(height: 0.2.h),
                                Text(
                                  data[index].time,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: CustomColor.blackColor2,
                                  ),
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],),
      ),
      floatingActionButton: Container(
        height: 60,
        padding: EdgeInsets.only(left: 9.w),
        width: MediaQuery.of(context).size.width,
        child: FloatingActionButton(
          backgroundColor: CustomColor.orangeColor1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: .1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/png/ttpdm_logo_white.png", height: 40, width: 40),
                getHorizontalSpace(1.w),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getVerticalSpace(1.h),

                         Text(
                          """Do you need a simple advertising solution?\nDownload Advyro""",
                          style: CustomTextStyle.textAccountBlack1,
                        ),

                      SmoothPageIndicator(
                        controller: controller,
                        count: 2, // The number of pages/images
                        axisDirection: Axis.horizontal,
                        effect: const SlideEffect(
                          spacing: 8.0,
                          radius: 4.0,
                          dotWidth: 8.0,
                          dotHeight: 8.0,
                          paintStyle: PaintingStyle.fill,
                          strokeWidth: 1.5,
                          dotColor: Colors.grey,
                          activeDotColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset("assets/svg/download.svg"),
              ],
            ),
          ),
          onPressed: () {},
        ),
      ),    );
  }
}
