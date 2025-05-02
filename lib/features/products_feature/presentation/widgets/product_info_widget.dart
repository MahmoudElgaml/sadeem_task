import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sadeem_task/features/products_feature/presentation/widgets/IncreaseDecreaseOrderButton.dart';
import 'package:sadeem_task/features/products_feature/presentation/widgets/product_detail_image.dart';

import '../../../../core/utils/app_style.dart';

class ProductInfoWidget extends StatelessWidget {
  ProductInfoWidget({super.key});

  num quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpandablePageView.builder(
          itemCount: 3,
          itemBuilder:
              (context, index) => ProductDetailImage(
                // index: index,
                // images: product.images ?? [],
              ),
        ),
        const Gap(24),
        Row(
          children: [
            SizedBox(
              width: 250,
              child: Text(
                "test",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppStyle.style18(context),
              ),
            ),
            const Spacer(),
            Text("EGP ", style: AppStyle.style18(context)),
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
              child: Text(" Sold", style: AppStyle.textRegular14(context)),
            ),
            const Gap(16),
            const Icon(Icons.star, color: Colors.yellow),
            Text("ratting average ", style: AppStyle.textRegular14(context)),
            const Spacer(),

            const IncreaseDecreaseOrderButton(),
          ],
        ),
        const Gap(16),
        Text("Description", style: AppStyle.style18(context)),
        const Gap(8),
        Text(
          "Descriptin",
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
