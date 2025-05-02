
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sadeem_task/core/utils/app_images.dart';
import 'package:sadeem_task/core/utils/app_style.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

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
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.asset(Assets.productTest, fit: BoxFit.fill),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: SvgPicture.asset(Assets.iconPlus,
                 ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("productName", style: AppStyle.textRegular14(context)),
                Text(
                  "productdescription",
                  style: AppStyle.textRegular14(context),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("price", style: AppStyle.textRegular14(context)),
                    const SizedBox(width: 16),
                    Text(
                      "dissacount",
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
                    Text("(4.6)", style: AppStyle.textRegular12(context)),
                    const SizedBox(height: 4),
                    const Icon(Icons.star, color: Colors.yellow),
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
