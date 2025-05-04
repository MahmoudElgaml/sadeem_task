import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sadeem_task/core/utils/app_color.dart';
import 'package:sadeem_task/core/utils/app_images.dart';
import 'package:sadeem_task/core/utils/app_style.dart';




class IncreaseDecreaseOrderButton extends StatelessWidget {
  const IncreaseDecreaseOrderButton({super.key, required this.quantity});
 final  num quantity;
  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 122,
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
      decoration: ShapeDecoration(
        color: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: AlignmentDirectional.center,
        child: Row(
          children: [
            Image.asset(Assets.imagesDecreaseIocn),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Text(
                quantity.toString(),
                style: AppStyle.style18(context).copyWith(color: Colors.white),
              ),
            ),
            SvgPicture.asset(Assets.imagesIncreaseIcon),
          ],
        ),
      ),
    );
  }
}
