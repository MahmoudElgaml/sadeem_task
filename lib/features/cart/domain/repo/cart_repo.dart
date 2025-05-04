import 'package:sadeem_task/core/api/api_result.dart';
import 'package:sadeem_task/features/cart/data/model/response/delete_cart_response.dart';
import 'package:sadeem_task/features/cart/domain/enttites/request/update_cart_entity.dart';
import 'package:sadeem_task/features/cart/domain/enttites/response/cart_entity.dart';

abstract class CartRepo {
  Future<DataResult<CartEntity>> getCartItems(String userId);
  Future<DataResult<CartEntity>> updateCartItems(
    String cartId,
  UpdateCartRequestEntity cartData,
  );
  Future<DataResult<DeleteCartResponse>> deleteCartItems(String cartId);
}
