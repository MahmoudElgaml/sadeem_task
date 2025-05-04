import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sadeem_task/features/products_feature/domain/entites/response/product_entity.dart';
import 'package:sadeem_task/features/products_feature/presentation/widgets/IncreaseDecreaseOrderButton.dart';
import 'package:sadeem_task/features/products_feature/presentation/widgets/product_detail_image.dart';

import '../../../../core/utils/app_style.dart';

class ProductInfoWidget extends StatelessWidget {
  ProductInfoWidget({super.key, required this.productEntity});

  num quantity = 1;
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpandablePageView.builder(
          itemCount: productEntity.images?.length ?? 0,
          itemBuilder:
              (context, index) => ProductDetailImage(
                isOutOfStock: productEntity.isAvailable,
                index: index,
                image: productEntity.images ?? [],
              ),
        ),
        const Gap(24),
        Row(
          children: [
            SizedBox(
              width: 250,
              child: Text(
                productEntity.title ?? "No Name",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: AppStyle.style18(context),
              ),
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  productEntity.formattedDiscountedPrice,
                  style: AppStyle.style18(context),
                ),

                Text(
                  productEntity.formattedPrice,
                  style: AppStyle.textRegular14(context).copyWith(
                    color: const Color(0x9906004E),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Gap(24),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0x4C004182),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                " ${productEntity.stock} inStock",
                style: AppStyle.textRegular14(context),
              ),
            ),
            const Gap(16),
            const Icon(Icons.star, color: Colors.yellow),
            Text(
              productEntity.rating.toString(),
              style: AppStyle.textRegular14(context),
            ),
            const Spacer(),

            IncreaseDecreaseOrderButton(quantity: quantity),
          ],
        ),
        const Gap(16),
        Text("Description", style: AppStyle.style18(context)),
        const Gap(8),
        Text(
          productEntity.description ?? "No description",
          style: AppStyle.textRegular14(
            context,
          ).copyWith(color: const Color(0x9906004E)),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
