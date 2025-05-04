import 'package:sadeem_task/features/cart/data/model/response/cart_dto.dart';
import 'package:sadeem_task/features/cart/domain/enttites/cart_entity.dart';

class CartMapper {
  static CartEntity singleCartToEntity(Cart cart) {
    return CartEntity(
      id: cart.id,
      items:
          cart.products
              ?.map((product) => cartProductToItemEntity(product))
              .toList(),
      total: cart.total,
      discountedTotal: cart.discountedTotal,
      totalProducts: cart.totalProducts,
      totalQuantity: cart.totalQuantity,
    );
  }

  static CartItemEntity cartProductToItemEntity(CartProduct product) {
    return CartItemEntity(
      id: product.id,
      title: product.title,
      price: product.price,
      quantity: product.quantity,
      total: product.total,
      discountPercentage: product.discountPercentage,
      discountedTotal: product.discountedTotal,
      image: product.thumbnail,
    );
  }
}
