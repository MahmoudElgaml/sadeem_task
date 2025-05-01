import 'package:flutter/material.dart';
import 'package:sadeem_task/core/utils/app_color.dart';

class AppStyle {
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
