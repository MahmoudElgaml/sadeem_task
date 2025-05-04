import 'package:sadeem_task/core/api/api_result.dart';
import 'package:sadeem_task/features/cart/domain/enttites/cart_entity.dart';

abstract class CartRepo {
  Future<DataResult<CartEntity>> getCartItems(String userId);
}
