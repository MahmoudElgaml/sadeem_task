import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:sadeem_task/core/utils/app_color.dart';
import 'package:sadeem_task/core/utils/app_images.dart';
import 'package:sadeem_task/features/cart/data/model/response/cart_dto.dart';
import 'package:sadeem_task/features/cart/domain/enttites/response/cart_entity.dart';
import 'package:sadeem_task/features/cart/presentation/widget/cart_product_information.dart';
import 'package:sadeem_task/features/cart/presentation/widget/increase_decrease_cart_button.dart';
import 'package:sadeem_task/features/products_feature/presentation/widgets/IncreaseDecreaseOrderButton.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key, required this.cartItem, required this.cartId});
  final CartItemEntity cartItem;
  final num cartId;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 389 / 113,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            // width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColor.primaryColor),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: AppColor.primaryColor),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        cartItem.image ?? "",
                        fit: BoxFit.fill,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ),
                const Gap(8),
                Expanded(
                  flex: 2,
                  child: ProductDetail(cartItem: cartItem),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete_outline),
                    color: AppColor.primaryColor,
                    iconSize: 30,
                  ),
                ),
                const Spacer(),
                 Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: IncreaseDecreaseCartButton(
                    cartId: cartId,
                    productId: cartItem.id??0,
                    quantity: cartItem.quantity??0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
