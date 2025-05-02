import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sadeem_task/config/routes/routes.dart';
import 'package:sadeem_task/core/utils/app_color.dart';
import 'package:sadeem_task/features/products_feature/presentation/cubit/product_cubit.dart';
import 'package:sadeem_task/features/products_feature/presentation/widgets/product_item.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is GetProductLoading) {
                    return Center(
                      child: LoadingAnimationWidget.fourRotatingDots(
                        color: AppColor.authColor,
                        size: 50,
                      ),
                    );
                  } else if (state is GetProductError) {
                    return Center(child: Text(state.error));
                  } else if (state is GetProductSuccess) {
                    return Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 191 / 265,
                            ),
                        itemBuilder:
                            (context, index) => InkWell(
                              onTap: () {},
                              child: ProductItem(
                                productEntity:
                                    state.productsEntity.products![index],
                              ),
                            ),
                        itemCount: 20,
                      ),
                    );
                  } else {
                    return Center(
                      child: LoadingAnimationWidget.fourRotatingDots(
                        color: AppColor.authColor,
                        size: 50,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
