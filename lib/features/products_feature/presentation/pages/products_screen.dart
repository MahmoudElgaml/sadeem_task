import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:logger/logger.dart';
import 'package:sadeem_task/config/routes/routes.dart';
import 'package:sadeem_task/core/cache/storage_token.dart';
import 'package:sadeem_task/core/di/config.dart';
import 'package:sadeem_task/core/utils/app_color.dart';
import 'package:sadeem_task/core/utils/component/dialog/dilog_utils.dart';
import 'package:sadeem_task/core/utils/component/white_contanier.dart';
import 'package:sadeem_task/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:sadeem_task/features/products_feature/presentation/cubit/product_cubit.dart';
import 'package:sadeem_task/features/products_feature/presentation/widgets/product_grid_builder.dart';
import 'package:sadeem_task/features/products_feature/presentation/widgets/product_item.dart';
import 'package:sadeem_task/features/products_feature/presentation/widgets/welcome_section.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const WelcomeSection(),
            const Gap(16),
            BlocListener<CartCubit, CartState>(
              listener: (context, state) {
                if (state is AddToCartLoadingState) {
                  DialogUtils.showLoadingDialog(context);
                } else if (state is AddToCartErrorState) {
                  context.pop();
                  DialogUtils.showErrorDialog(context, state.error);
                } else if (state is AddToCartSucssessState) {
                  context.pop();
                  DialogUtils.showSuccesLoading(context, "Add Successfully");
                }
              },
              child: const Expanded(
                child: WhiteContanier(child: ProductGridBuilder()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
