import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sadeem_task/core/utils/app_color.dart';
import 'package:sadeem_task/core/utils/app_images.dart';
import 'package:sadeem_task/features/products_feature/presentation/widgets/offer_idndector.dart';

class ProductDetailImage extends StatelessWidget {
  const ProductDetailImage({
    super.key,
    required this.index,
    required this.image,
    required this.isOutOfStock,
  });

  final int index;
  final List<String> image;
  final bool isOutOfStock;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AspectRatio(
          aspectRatio: 398 / 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: image[index],
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                isOutOfStock
                    ? Image.asset(
                      Assets.imagesOutOfStock,
                      color: AppColor.primaryColor,
                    )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OfferImageIndicator(
            selectedIndex: index,
            numberIndicator: image.length,
          ),
        ),
      ],
    );
  }
}
