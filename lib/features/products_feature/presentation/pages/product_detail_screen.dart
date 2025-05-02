import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sadeem_task/core/utils/app_style.dart';
import 'package:sadeem_task/features/products_feature/domain/entites/response/product_entity.dart';
import 'package:sadeem_task/features/products_feature/presentation/widgets/pick_color_list.dart';
import 'package:sadeem_task/features/products_feature/presentation/widgets/pick_size_list.dart';
import 'package:sadeem_task/features/products_feature/presentation/widgets/price_addtocart_widget.dart';
import 'package:sadeem_task/features/products_feature/presentation/widgets/product_info_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductEntity productDetail =
        GoRouterState.of(context).extra! as ProductEntity;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("products details", style: AppStyle.textBold20(context)),
        actions: const [
          Icon(Icons.search, size: 35),
          SizedBox(width: 20),
          InkWell(
            //  onTap: () => context.push(AppRoute.cartScreen),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart_outlined, size: 35),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductInfoWidget(productEntity: productDetail),
              const Gap(16),
              const PickSizeList(),
              const Gap(16),
              const PickColorList(),
              const Gap(48),
              PriceAddToCartWidget(productEntity: productDetail),
            ],
          ),
        ),
      ),
    );
  }
}
