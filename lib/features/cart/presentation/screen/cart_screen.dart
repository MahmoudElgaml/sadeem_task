import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sadeem_task/core/utils/app_color.dart';
import 'package:sadeem_task/core/utils/app_style.dart';
import 'package:sadeem_task/features/cart/presentation/widget/cart_item.dart';

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
            onPressed: () {},
            icon: const Icon(
              size: 35,
              Icons.shopping_cart_outlined,
              color: AppColor.primaryColor,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => const ProductCart(),
                separatorBuilder: (context, index) => const Gap(20),
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
