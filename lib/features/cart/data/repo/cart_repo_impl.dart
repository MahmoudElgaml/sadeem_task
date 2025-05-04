import 'package:injectable/injectable.dart';
import 'package:sadeem_task/core/api/api_execute.dart';
import 'package:sadeem_task/core/api/api_result.dart';
import 'package:sadeem_task/features/cart/data/data_source/remote/cart_remote.dart';
import 'package:sadeem_task/features/cart/data/mapper/cart_mapper.dart';
import 'package:sadeem_task/features/cart/data/model/response/cart_dto.dart';
import 'package:sadeem_task/features/cart/domain/enttites/cart_entity.dart';
import 'package:sadeem_task/features/cart/domain/repo/cart_repo.dart';

@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  CartRemote cartRemote;
  CartRepoImpl(this.cartRemote);
  @override
  Future<DataResult<CartEntity>> getCartItems(String userId) async {
    return await executeApi(() async {
      var response = await cartRemote.getCartItems("6");

      return CartMapper.singleCartToEntity(
        response.carts!.isNotEmpty
            ? response.carts!.first
            : Cart(
              id: 0,
              products: [],
              total: 0,
              discountedTotal: 0,
              totalProducts: 0,
              totalQuantity: 0,
            ),
      );
    });
  }
}
