import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sadeem_task/core/utils/app_color.dart';
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
          side: const BorderSide(width: 1, color: AppColor.primaryColor),
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
              child: CachedNetworkImage(
                imageUrl: productEntity.thumbnail ?? "",
                fit: BoxFit.fill,
                errorWidget: (context, url, error) {
                  return const Icon(Icons.error, color: Colors.black);
                },
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
                const Gap(6),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      productEntity.formattedDiscountedPrice,
                      style: AppStyle.style20(context),
                    ),
                    const Gap(12),
                    Text(
                      productEntity.formattedPrice,
                      style: AppStyle.textRegular12(
                        context,
                      ).copyWith(decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
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
                    const Spacer(),
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
