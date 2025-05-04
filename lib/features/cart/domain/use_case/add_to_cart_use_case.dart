import 'package:injectable/injectable.dart';
import 'package:sadeem_task/core/api/api_result.dart';
import 'package:sadeem_task/features/cart/data/model/response/cart_dto.dart';
import 'package:sadeem_task/features/cart/domain/enttites/request/add_cart_entity.dart';
import 'package:sadeem_task/features/cart/domain/enttites/response/cart_entity.dart';
import 'package:sadeem_task/features/cart/domain/repo/cart_repo.dart';

@injectable
class AddToCartUseCase {
CartRepo cartRepository;
  AddToCartUseCase(this.cartRepository);

  Future<DataResult<CartEntity>> call(AddCartEntity cartData) async {
    return await cartRepository.addCartItems(cartData);
  }
}