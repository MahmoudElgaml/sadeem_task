import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:sadeem_task/core/utils/app_style.dart';
import 'package:sadeem_task/features/cart/domain/enttites/cart_entity.dart';

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
        const Gap(13),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(cartItem.price.toString(), style: AppStyle.style18(context)),
          ],
        ),
        const Gap(8),
      ],
    );
  }
}
