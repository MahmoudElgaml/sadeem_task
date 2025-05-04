import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sadeem_task/core/utils/app_images.dart';
import 'package:sadeem_task/core/utils/app_string.dart';
import 'package:sadeem_task/core/utils/app_style.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Assets.imagesEmptyCart),
        const Gap(15),
        Text(AppString.cartEmptyMessage, style: AppStyle.textBold20(context)),
      ],
    );
  }
}
