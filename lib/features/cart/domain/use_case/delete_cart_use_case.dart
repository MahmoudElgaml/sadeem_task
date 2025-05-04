import 'package:injectable/injectable.dart';
import 'package:sadeem_task/core/api/api_result.dart';
import 'package:sadeem_task/features/cart/data/model/response/delete_cart_response.dart';
import 'package:sadeem_task/features/cart/domain/repo/cart_repo.dart';
@injectable
class DeleteCartUseCase {
  CartRepo cartRepo;
  DeleteCartUseCase(this.cartRepo);
  Future<DataResult<DeleteCartResponse>> call(String cartId) async {
    return await cartRepo.deleteCartItems(cartId);
  }
}