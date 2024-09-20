import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controller/utils/custom_color.dart';
import '../../controller/utils/custom_text_style.dart';
import 'custom_sized.dart'; // Assuming you are using the Sizer package for responsive layout

class SiteVisitProposal extends StatelessWidget {
  final String siteVisitTitle;
  final String siteVisitStartDate;
  final String siteVisitEndDate;
  final String siteVisitCharges;

  const SiteVisitProposal({
    Key? key,
    required this.siteVisitTitle,
    required this.siteVisitStartDate,
    required this.siteVisitEndDate,
    required this.siteVisitCharges,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0XFFECECEC)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            siteVisitTitle,
            style: CustomTextStyle.textBlack1.copyWith(
              fontSize: 18.sp, // Responsive font size
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(color: CustomColor.greyColor),

          SizedBox(height: 1.h), // Responsive vertical spacing
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Site visit date & time',
              style: CustomTextStyle.textAccountBlack1,
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Date",
                    style: CustomTextStyle.textWithBlack,
                  ),
                  getVerticalSpace(.5),
                  Row(
                    children: [
                      SvgPicture.asset("assets/svg/calenderIcon.svg"),
                      getHorizontalSpace(1.w),
                      Text(
                        siteVisitStartDate,
                        style: CustomTextStyle.textLoginBlack,
                      ),
                    ],
                  ),
                ],
              ),
              getHorizontalSpace(4.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "End Date",
                    style: CustomTextStyle.textWithBlack,
                  ),
                  getVerticalSpace(.5),
                  Row(
                    children: [
                      SvgPicture.asset("assets/svg/timeIcon.svg"),
                      getHorizontalSpace(1.w),
                      Text(
                        siteVisitEndDate,
                        style: CustomTextStyle.textLoginBlack,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 1.h), // Responsive vertical spacing
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Site visit charges',
              style: CustomTextStyle.textAccountBlack1,
            ),
          ),
          getVerticalSpace(.4),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              siteVisitCharges,
              style: CustomTextStyle.textLoginOrange,
            ),
          ),
        ],
      ),
    );
  }
}


// SiteVisitProposal(
// siteVisitTitle: 'Site Visit Proposal',
// siteVisitStartDate: '12/2/2024',
// siteVisitEndDate: '15/4/2024',
// siteVisitCharges: '15\$',
// )