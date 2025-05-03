import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sadeem_task/config/routes/routes.dart';
import 'package:sadeem_task/core/utils/app_color.dart';
import 'package:sadeem_task/features/products_feature/presentation/cubit/product_cubit.dart';
import 'package:sadeem_task/features/products_feature/presentation/widgets/product_item.dart';

class ProductGridBuilder extends StatelessWidget {
  const ProductGridBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
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
        } else if (state is GetProductSuccess ||
            state is GetProductLoadingMore) {
          final productsEntity =
              state is GetProductSuccess
                  ? state.productsEntity
                  : (state as GetProductLoadingMore).productsEntity;
          return Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (state is! GetProductLoadingMore &&
                    notification.metrics.pixels >=
                        notification.metrics.maxScrollExtent * 0.88 &&
                    notification.depth == 0) {
                  context.read<ProductCubit>().getProducts(
                    isLoadingMore: true,
                  );
                }
                return true;
              },
              child: GridView.builder(
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 191 / 270,
                    ),
                itemBuilder: (context, index) {
                  if (index >= productsEntity.products!.length &&
                      state is GetProductLoadingMore) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return InkWell(
                    onTap: () {
                      context.push(
                        AppRoute.productDetail,
                        extra: productsEntity.products![index],
                      );
                    },
                    child: ProductItem(
                      productEntity: productsEntity.products![index],
                    ),
                  );
                },
                itemCount:
                    (productsEntity.products?.length ?? 0) +
                    (state is GetProductLoadingMore ? 2 : 0),
              ),
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
    );
  }
}