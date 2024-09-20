import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tasktopro/controller/utils/custom_text_style.dart';
import '../../controller/utils/custom_color.dart';
import 'custom_sized.dart'; // Assuming you are using the Sizer package for responsive layout

class ProjectOfferProposal extends StatelessWidget {
  final String projectTitle;
  final String projectDurationStartDate;
  final String projectDurationEndDate;
  final String projectCost;
  final String projectDetails;

  const ProjectOfferProposal({
    super.key,
    required this.projectTitle,
    required this.projectDurationStartDate,
    required this.projectDurationEndDate,
    required this.projectCost,
    required this.projectDetails,
  });

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
            projectTitle,
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
              'Project Duration',
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
                        projectDurationStartDate,
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
                      SvgPicture.asset("assets/svg/calenderIcon.svg"),
                      getHorizontalSpace(1.w),
                      Text(
                        projectDurationEndDate,
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
              'Cost of the project',
              style: CustomTextStyle.textAccountBlack1,
            ),
          ),
          getVerticalSpace(.4),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              projectCost,
              style: CustomTextStyle.textLoginOrange,
            ),
          ),
          SizedBox(height: 1.h), // Responsive vertical spacing
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Project Details',
              style: CustomTextStyle.textAccountBlack1,
            ),
          ),
          SizedBox(height: 1.h), // Responsive vertical spacing
          Text(
            projectDetails,
            style: CustomTextStyle.textOpiBlack,
          ),
        ],
      ),
    );
  }
}


// ProjectOfferProposal(
// projectTitle: 'Project offer Proposal',
// projectDurationStartDate: '12/2/2024',
// projectDurationEndDate: '15/4/2024',
// projectCost: '15\$',
// projectDetails: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
// )