
import 'package:injectable/injectable.dart';
import 'package:sadeem_task/core/api/api_result.dart';

import 'package:sadeem_task/features/cart/domain/enttites/request/update_cart_entity.dart';
import 'package:sadeem_task/features/cart/domain/repo/cart_repo.dart';

import '../enttites/response/cart_entity.dart';

@injectable
class UpdateCartUseCase {
  final CartRepo cartRepository;

  UpdateCartUseCase(this.cartRepository);

  Future<DataResult<CartEntity>> call(String cartId, UpdateCartRequestEntity cartData) async {
   return  cartRepository.updateCartItems(cartId, cartData);
  }
  
}