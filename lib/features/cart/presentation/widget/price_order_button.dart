import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sadeem_task/core/utils/app_string.dart';
import 'package:sadeem_task/features/cart/domain/enttites/cart_entity.dart';
import 'package:sadeem_task/features/products_feature/domain/entites/response/product_entity.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_style.dart';

class PriceOrderButton extends StatelessWidget {
  const PriceOrderButton({super.key, required this.cartEntity});
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              "Total Price",
              style: AppStyle.style18(
                context,
              ).copyWith(color: const Color(0x9906004E)),
            ),

            Text(
              cartEntity.discountedTotal.toString(),
              style: AppStyle.style18(context).copyWith(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              cartEntity.total.toString(),

              style: AppStyle.style18(
                context,
              ).copyWith(decoration: TextDecoration.lineThrough),
            ),
          ],
        ),
        const Gap(33),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: FittedBox(
                child: Row(
                  children: [
                    const Gap(25),
                    const Icon(
                      Icons.add_shopping_cart_outlined,
                      color: Colors.white,
                    ),
                    const Gap(24),
                    Text(
                      AppString.orderNow,
                      style: AppStyle.textMedium20(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
