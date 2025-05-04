import 'package:injectable/injectable.dart';
import 'package:sadeem_task/core/api/api_result.dart';
import 'package:sadeem_task/features/cart/domain/enttites/response/cart_entity.dart';
import 'package:sadeem_task/features/cart/domain/repo/cart_repo.dart';

@injectable
class GetCartUseCase {
  CartRepo cartRepo;
  GetCartUseCase(this.cartRepo);
  Future<DataResult<CartEntity>> call(String userId) async {
    return await cartRepo.getCartItems(userId);
  }
}