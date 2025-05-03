import 'package:flutter/material.dart';
import 'package:sadeem_task/core/utils/app_color.dart';

class AppStyle {
  static TextStyle style12Reqular(BuildContext context) {
    return TextStyle(
      color: Colors.black,
      fontSize: responsiveFont(fontSize: 12, context: context),
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle style18(BuildContext context) {
    return TextStyle(
      color: Colors.black,
      fontSize: responsiveFont(fontSize: 18, context: context),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle style20(BuildContext context) {
    return TextStyle(
      color: Colors.black,
      fontSize: responsiveFont(fontSize: 20, context: context),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle style24(BuildContext context) {
    return TextStyle(
      color: Colors.black,
      fontSize: responsiveFont(fontSize: 24, context: context),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle style34(BuildContext context) {
    return TextStyle(
      color: AppColor.authColor,
      fontSize: responsiveFont(fontSize: 34, context: context),
      fontWeight: FontWeight.bold,
    );
  }
   static TextStyle textRegular16(context) {
    return TextStyle(
      color: AppColor.blackColor,
      fontSize: AppStyle.responsiveFont(context: context, fontSize: 16),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textBold16(BuildContext context) {
    return TextStyle(
      color: AppColor.blackColor,
      fontSize: AppStyle.responsiveFont(context: context, fontSize: 16),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
    );
  }
   static TextStyle textBold17(BuildContext context) {
    return TextStyle(
      color: AppColor.blackColor,
      fontSize: AppStyle.responsiveFont(context: context, fontSize: 17),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textMedium16(BuildContext context) {
    return TextStyle(
      color: AppColor.blackColor,
      fontSize: AppStyle.responsiveFont(context: context, fontSize: 16),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
    );
  }
    static TextStyle textMedium18(BuildContext context) {
    return TextStyle(
      color: AppColor.blackColor,
      fontSize: AppStyle.responsiveFont(context: context, fontSize: 18),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
    );
  }


  static TextStyle textMedium20(BuildContext context) {
    return TextStyle(
      color: AppColor.blackColor,
      fontSize: AppStyle.responsiveFont(context: context, fontSize: 20),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textSemiBold16(BuildContext context) {
    return TextStyle(
      color: AppColor.blackColor,
      fontSize: AppStyle.responsiveFont(context: context, fontSize: 16),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textSemiBold20(BuildContext context) {
    return TextStyle(
      color: AppColor.blackColor,
      fontSize: AppStyle.responsiveFont(context: context, fontSize: 20),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
    
  }
  static TextStyle textBold20(BuildContext context) {
    return TextStyle(
      color: AppColor.blackColor,
      fontSize: AppStyle.responsiveFont(context: context, fontSize: 20),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold,
    );
    
  }

  static TextStyle textRegular12(BuildContext context) {
    return TextStyle(
      color: AppColor.blackColor,
      fontSize: AppStyle.responsiveFont(context: context, fontSize: 12),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textSemiBold24(BuildContext context) {
    return TextStyle(
      color: AppColor.blackColor,
      fontSize: AppStyle.responsiveFont(context: context, fontSize: 24),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textRegular14(BuildContext context) {
    return TextStyle(
      color: AppColor.blackColor,
      fontSize: AppStyle.responsiveFont(context: context, fontSize: 14),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle textRegular25(BuildContext context) {
    return TextStyle(
      color: AppColor.blackColor,
      fontSize: AppStyle.responsiveFont(context: context, fontSize: 25),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textSemiBold18(BuildContext context) {
    return TextStyle(
      color: AppColor.blackColor,
      fontSize: AppStyle.responsiveFont(context: context, fontSize: 18),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

  static double scaleFactor(double width) {
    if (width < 500) {
      return width / 400;
    } else if (width > 1200) {
      return width / 1000;
    } else {
      return width / 300;
    }
  }

  static double responsiveFont({
    required double fontSize,
    required BuildContext context,
  }) {
    double width = MediaQuery.of(context).size.width;
    double scalefactor = scaleFactor(width);
    double lowerLimit = fontSize * .8;
    double upperLimit = fontSize * 1.3;

    double responsiveFont = fontSize * scalefactor;
    return responsiveFont.clamp(lowerLimit, upperLimit);
  }
}
