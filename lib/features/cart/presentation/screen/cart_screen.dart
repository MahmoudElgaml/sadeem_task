import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sadeem_task/core/di/config.dart';
import 'package:sadeem_task/core/utils/app_color.dart';
import 'package:sadeem_task/core/utils/app_string.dart';
import 'package:sadeem_task/core/utils/app_style.dart';
import 'package:sadeem_task/core/utils/component/dialog/dilog_utils.dart';
import 'package:sadeem_task/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:sadeem_task/features/cart/presentation/widget/cart_item.dart';
import 'package:sadeem_task/features/cart/presentation/widget/price_order_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Cart", style: AppStyle.style18(context)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              size: 35,
              Icons.search,
              color: AppColor.primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {
              var cubit = context.read<CartCubit>();
              if (cubit.cartId == null) return;
              cubit.deleteCartItems(cubit.cartId.toString());
            },
            icon: const Icon(
              size: 35,
              Icons.delete,
              color: AppColor.primaryColor,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
        child: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            if (state is DeleteCartState) {
              DialogUtils.showSuccesLoading(
                context,
                AppString.cartDeletedMessage,
              );
            }
          },
          builder: (context, state) {
            if (state is GetCartLoading) {
              return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: AppColor.primaryColor,
                  size: 50,
                ),
              );
            } else if (state is GetCartError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(state.error, style: AppStyle.style18(context)),
                  ),
                ],
              );
            } else if (state is GetCartEmpty) {
              return Center(
                child: Text(
                  "Your cart is empty",
                  style: AppStyle.style18(context),
                ),
              );
            } else if (state is GetCartSuccess) {
              return Column(
                children: [
                  Expanded(
                    child: FadeInUp(
                      curve: Curves.linearToEaseOut,
                      duration: const Duration(milliseconds: 900),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder:
                            (context, index) => ProductCart(
                              cartId: state.cartEntity.id ?? 0,
                              cartItem: state.cartEntity.items![index],
                            ),
                        separatorBuilder: (context, index) => const Gap(20),
                        itemCount: state.cartEntity.items?.length ?? 0,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: PriceOrderButton(cartEntity: state.cartEntity),
                  ),
                ],
              );
            } else if (state is DeleteCartState) {
              return Center(
                child: Text(
                  "Your cart is empty",
                  style: AppStyle.style18(context),
                ),
              );
            } else {
              return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: AppColor.primaryColor,
                  size: 50,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
