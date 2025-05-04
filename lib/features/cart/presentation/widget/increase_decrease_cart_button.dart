import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sadeem_task/core/utils/app_color.dart';
import 'package:sadeem_task/core/utils/app_images.dart';
import 'package:sadeem_task/core/utils/app_style.dart';
import 'package:sadeem_task/features/cart/domain/enttites/request/update_cart_entity.dart';
import 'package:sadeem_task/features/cart/presentation/cubit/cart_cubit.dart';

class IncreaseDecreaseCartButton extends StatelessWidget {
  const IncreaseDecreaseCartButton({
    super.key,
    required this.quantity,
    required this.cartId,
    required this.productId,
  });
  final num quantity;
  final num cartId;
  final num productId;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 122,
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
      decoration: ShapeDecoration(
        color: AppColor.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: AlignmentDirectional.center,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                if(quantity==1){
                  return;
                }
                context.read<CartCubit>().updateCartItems(
                  cartId.toString(),
                  UpdateCartRequestEntity(
                    merge: true,
                    products: [
                      CartProductRequestEntity(
                        id: productId.toInt(),
                        quantity: (quantity - 1).toInt(),
                      ),
                    ],
                  ),
                );
              },
              child: Image.asset(Assets.imagesDecreaseIocn),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Text(
                quantity.toString(),
                style: AppStyle.style18(context).copyWith(color: Colors.white),
              ),
            ),
            InkWell(
              onTap: () {
                context.read<CartCubit>().updateCartItems(
                  cartId.toString(),
                  UpdateCartRequestEntity(
                    merge: true,
                    products: [
                      CartProductRequestEntity(
                        id: productId.toInt(),
                        quantity: (quantity + 1).toInt(),
                      ),
                    ],
                  ),
                );
              },
              child: SvgPicture.asset(Assets.imagesIncreaseIcon),
            ),
          ],
        ),
      ),
    );
  }
}
