import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sadeem_task/core/utils/app_images.dart';
import 'package:sadeem_task/core/utils/app_style.dart';
import 'package:sadeem_task/features/products_feature/domain/entites/response/product_entity.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Color(0x4C004182)),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: AspectRatio(
              aspectRatio: 191 / 128,
              child: Image.network(
                productEntity.images?[0] ?? "",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productEntity.title ?? "No Name",
                  style: AppStyle.textRegular14(context),
                ),
                // Text(
                //   productEntity.description ?? "No Description",
                //   overflow: TextOverflow.ellipsis,
                //   style: AppStyle.textRegular14(context),
                // ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      productEntity.price.toString(),
                      style: AppStyle.textRegular14(context),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      productEntity.discountPercentage.toString(),
                      style: AppStyle.textRegular12(
                        context,
                      ).copyWith(decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Review", style: AppStyle.textRegular14(context)),
                    const SizedBox(height: 4),
                    Text(
                      "(${productEntity.rating})",
                      style: AppStyle.textRegular12(context),
                    ),
                    const SizedBox(height: 4),
                    const Icon(Icons.star, color: Colors.yellow),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: SvgPicture.asset(Assets.iconPlus),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
