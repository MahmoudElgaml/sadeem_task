import 'package:sadeem_task/features/cart/data/model/request/update_cart_request_dto.dart';
import 'package:sadeem_task/features/cart/data/model/response/cart_dto.dart';
import 'package:sadeem_task/features/cart/domain/enttites/request/update_cart_entity.dart';
import 'package:sadeem_task/features/cart/domain/enttites/response/cart_entity.dart';

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
   // Request mappings
  static UpdateCartRequestDto updateCartEntityToDto(UpdateCartRequestEntity entity) {
    return UpdateCartRequestDto(
      merge: entity.merge,
      products: entity.products?.map((product) => cartProductEntityToDto(product)).toList(),
    );
  }
  
  static CartProductRequestDto cartProductEntityToDto(CartProductRequestEntity entity) {
    return CartProductRequestDto(
      id: entity.id,
      quantity: entity.quantity,
    );
  }
}
