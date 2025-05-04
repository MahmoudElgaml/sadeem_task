import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:sadeem_task/core/utils/app_style.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Nike Air Jordon", style: AppStyle.style18(context)),
        const Gap(13),
        Row(
          children: [
            Container(
              width: 15,
              height: 15,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            const Gap(8),
            Text(
              "Orange | Size: 40",
              style: AppStyle.style18(
                context,
              ).copyWith(color: Color(0x9906004E)),
            ),
          ],
        ),
        const Gap(15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("EGP 3,500", style: AppStyle.style18(context))],
        ),
        const Gap(8),
      ],
    );
  }
}
