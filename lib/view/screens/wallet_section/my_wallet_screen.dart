import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tasktopro/controller/utils/custom_text_style.dart';
import '../../../controller/utils/custom_color.dart';
import '../../../model/history_payment_model.dart';
import '../../../model/with_draw_model.dart';
import '../../custom_widgets/custom_sized.dart';
class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  List<WithDrawModel> data=[
    WithDrawModel(dollar: '-\$23', time: '10:00 am , 12 jul 2023')
  ];
  List<HistoryPaymentModel> data1=[
    HistoryPaymentModel(dollar: '-\$23', name: 'Payment', time: '10:00 am , 12 jul 2023'),
    HistoryPaymentModel(dollar: '-\$23', name: 'Withdraw', time: '10:00 am , 12 jul 2023'),
    HistoryPaymentModel(dollar: '+\$23', name: 'Deposit', time: '10:00 am , 12 jul 2023'),
    HistoryPaymentModel(dollar: '+\$23', name: 'Deposit', time: '10:00 am , 12 jul 2023'),
    HistoryPaymentModel(dollar: '+\$23', name: 'Deposit', time: '10:00 am , 12 jul 2023'),

  ];
  RxBool isDepositSelected = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
                Text("My Wallet",style: CustomTextStyle.textStartBlack,),
                SizedBox(height: 10.px,width: 10.px,)
              ],
            ),
          ),
          getVerticalSpace(2.h),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 6.h,),
            decoration: BoxDecoration( color: CustomColor.orangeColor1,
                borderRadius:
                BorderRadius.circular(16.px)),

            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Total Balance",style: CustomTextStyle.textNameBalance,),
                getVerticalSpace(1.2.h),
                Text("\$23.0",style: CustomTextStyle.textDollarBalance,),
              ],
            ),
          ),
          getVerticalSpace(2.h),
          Obx(() => GestureDetector(
            onTap: () {
              isDepositSelected.value = true;
              showPaymentBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 1.2.h),
              decoration: BoxDecoration(
                color:  CustomColor.orangeColor1,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: CustomColor.orangeColor1),
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Flexible(
                    child: SvgPicture.asset("assets/svg/withDraw.svg",color: Colors.white ),
                  ),
                  getHorizontalSpace(1.w),
                  Flexible(
                    child: Text(textAlign: TextAlign.center,
                      isDepositSelected.value ==true?  'Deposit Now':"Withdraw Request",
                      style: TextStyle(
                          color:  Colors.white,
                          fontSize: 14.px,fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getVerticalSpace(3.h),
                  Text("Withdraw",style: CustomTextStyle.textSignUpOrange,),
                  getVerticalSpace(2.h),
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        return   Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Withdraw Request",style: CustomTextStyle.textBlackColor,),
                            getVerticalSpace(1.h),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(data[index].time,style: CustomTextStyle.textWithBlack,),
                                Text(data[index].dollar,style: CustomTextStyle.textRed,)
                              ],
                            ),
                            getVerticalSpace(1.3.h),
                            const Divider(color: CustomColor.greyColor,)
                          ],
                        );

                      }),
                  getVerticalSpace(2.h),
                  Text("History",style: CustomTextStyle.textSignUpOrange,),
                  getVerticalSpace(2.h),
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data1.length,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        return   Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data1[index].name,
                              style: CustomTextStyle.textBlackColor,),
                            getVerticalSpace(1.h),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(data1[index].time,style: CustomTextStyle.textWithBlack,),
                                Text(data1[index].dollar,
                                  style: data1[index].name == "Deposit"
                                      ? CustomTextStyle.textGreen
                                      : CustomTextStyle.textRed,
                                ),
                              ],
                            ),
                            getVerticalSpace(1.3.h),
                             const Divider(color: CustomColor.greyColor,)
                          ],
                        );

                      }),
                ],
              ),
            ),
          )
        ],),
      ),
    );
  }
  final FocusNode cardNumberFocus = FocusNode();
  final FocusNode expiryDateFocus = FocusNode();
  final FocusNode cvvFocus = FocusNode();
  final FocusNode cardHolderNameFocus = FocusNode();

  void showPaymentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16.0,
            right: 16.0,
            top: 24.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/svg/card-add.svg"),
                  getHorizontalSpace(2.w),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Add card",style: CustomTextStyle.textBlack1,),
                        getVerticalSpace(.3.h),
                        Text("Streamline your checkout process by adding a new card for future transactions. Your card information is secured with advanced encryption technology.",
                          style: CustomTextStyle.textLight,),
                      ],
                    ),
                  )
                ],
              ),
              getVerticalSpace(1.h),
              Divider(color: CustomColor.greyColor,),
              getVerticalSpace(4.h),
              TextFormField(
                focusNode: cardNumberFocus,
                decoration: InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  hintText: "00000",
                  hintStyle: CustomTextStyle.textBlack1,
                  labelText: 'Card Number',
                  labelStyle: cardNumberFocus.hasFocus
                      ? CustomTextStyle.textForgotOrange
                      : CustomTextStyle.textBlack1,
                  suffixIcon: Transform.scale(
                    scale: .4,
                    child: SvgPicture.asset(
                      "assets/svg/cardNumberIcon.svg",
                      color: cardNumberFocus.hasFocus
                          ? CustomColor.orangeColor1
                          : CustomColor.greyColor7,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: CustomColor.orangeColor1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: CustomColor.greyColor7),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      focusNode: expiryDateFocus,
                      decoration: InputDecoration(
                        isDense: true,
                        isCollapsed: true,
                        hintText: "MM/YY",
                        hintStyle: CustomTextStyle.textBlack1,
                        labelText: 'Expiry Date',
                        labelStyle: expiryDateFocus.hasFocus
                            ? CustomTextStyle.textForgotOrange
                            : CustomTextStyle.textBlack1,
                        contentPadding: const EdgeInsets.all(10),
                        suffixIcon: Transform.scale(
                          scale: .4,
                          child: SvgPicture.asset(
                            "assets/svg/expiryDateIcon.svg",
                            color: expiryDateFocus.hasFocus
                                ? CustomColor.orangeColor1
                                : CustomColor.greyColor7,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          const BorderSide(color: CustomColor.orangeColor1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: CustomColor.greyColor7),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  SizedBox(width: 2.h),
                  Expanded(
                    child: TextFormField(
                      focusNode: cvvFocus,
                      decoration: InputDecoration(
                        isDense: true,
                        isCollapsed: true,
                        hintText: "***",
                        hintStyle: CustomTextStyle.textBlack1,
                        labelText: 'CVV',
                        labelStyle: cvvFocus.hasFocus
                            ? CustomTextStyle.textForgotOrange
                            : CustomTextStyle.textBlack1,
                        contentPadding: const EdgeInsets.all(10),
                        suffixIcon: Transform.scale(
                          scale: 0.4,
                          child: SvgPicture.asset(
                            "assets/svg/ccvIcon.svg",
                            color: cvvFocus.hasFocus
                                ? CustomColor.orangeColor1
                                : CustomColor.greyColor7,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          const BorderSide(color: CustomColor.orangeColor1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: CustomColor.greyColor7),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              TextFormField(
                focusNode: cardHolderNameFocus,
                decoration: InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  hintText: "Enter cardholder’s full name",
                  hintStyle: CustomTextStyle.textBlack1,
                  labelText: 'Cardholder’s Name',
                  labelStyle: cardHolderNameFocus.hasFocus
                      ? CustomTextStyle.textForgotOrange
                      : CustomTextStyle.textBlack1,
                  contentPadding: const EdgeInsets.all(10),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: CustomColor.orangeColor1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: CustomColor.greyColor7),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 2.h),
              ElevatedButton(
                onPressed: () {
                  // Add your deposit logic here
                },
                child: Text(
                  'Next',
                  style: CustomTextStyle.textSignUpWhite,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColor.orangeColor2,
                  padding: EdgeInsets.symmetric(
                    vertical: 1.5.h,
                    horizontal: 20.w,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36),
                  ),
                ),
              ),
              SizedBox(height: 10.px,width: 10.px,)
            ],
          ),
        );
      },
    );
  }
}
