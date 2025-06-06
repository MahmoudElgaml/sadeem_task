import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:sadeem_task/core/utils/app_color.dart';
import 'package:sadeem_task/core/utils/app_style.dart';
import 'package:sadeem_task/features/cart/domain/enttites/response/cart_entity.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.cartItem});
  final CartItemEntity cartItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cartItem.title ?? "No Name",
          style: AppStyle.style18(context),
          maxLines: 1,
        ),
        const Gap(5),

        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              cartItem.formattedDiscountedPrice,
              style: AppStyle.style24(
                context,
              ).copyWith(color: AppColor.primaryColor),
            ),
            Text(
              cartItem.formattedPrice,
              style: AppStyle.style18(
                context,
              ).copyWith(decoration: TextDecoration.lineThrough),
            ),
          ],
        ),
        const Gap(8),
      ],
    );
  }
}
