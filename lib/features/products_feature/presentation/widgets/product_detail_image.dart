
import 'package:flutter/material.dart';
import 'package:sadeem_task/core/utils/app_images.dart';
import 'package:sadeem_task/features/products_feature/presentation/widgets/offer_idndector.dart';



class ProductDetailImage extends StatelessWidget {
  const ProductDetailImage(
      {super.key});

 

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AspectRatio(
          aspectRatio: 398 / 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child:Image.asset(Assets.productTest)
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: OfferImageIndicator(
            selectedIndex: 1,
            numberIndicator: 3,
          ),
        )
      ],
    );
  }
}
