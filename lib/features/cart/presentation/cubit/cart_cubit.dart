import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:sadeem_task/core/api/api_result.dart';
import 'package:sadeem_task/core/cache/hive/hive_keyes.dart';
import 'package:sadeem_task/core/cache/hive/hive_manager.dart';
import 'package:sadeem_task/core/di/config.dart';
import 'package:sadeem_task/core/error/error_handler.dart';
import 'package:sadeem_task/features/cart/domain/enttites/request/update_cart_entity.dart';
import 'package:sadeem_task/features/cart/domain/enttites/response/cart_entity.dart';
import 'package:sadeem_task/features/cart/domain/use_case/get_cart_use_case.dart';
import 'package:sadeem_task/features/cart/domain/use_case/update_cart_use_case.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  GetCartUseCase getCartUseCase;
  UpdateCartUseCase updateCartUseCase;

  CartCubit(this.getCartUseCase, this.updateCartUseCase) : super(CartInitial());

  Future<void> getCartItems() async {
    var userId = getIt<HiveManager>().retrieveUserData(HiveKeys.userBox)?.id;
    emit(GetCartLoading());
    var result = await getCartUseCase(userId.toString());

    switch (result) {
      case Success<CartEntity>():
        {
          if (result.data.items == null ||
              (result.data.items?.isEmpty ?? true)) {
            if (result.data.total == 0) {
              emit(GetCartEmpty());
            }
          } else {
            emit(GetCartSuccess(result.data));
          }
        }
        break;
      case Fail<CartEntity>():
        emit(GetCartError(ErrorHandler.handle(result.exception!).message!));
        break;
    }
  }

  Future<void> updateCartItems(
    String cartId,
    UpdateCartRequestEntity cartData,
  ) async {
    emit(GetCartLoading());

    var result = await updateCartUseCase(cartId, cartData);

    switch (result) {
      case Success<CartEntity>():
        {
          emit(GetCartSuccess(result.data));
        }
        break;
      case Fail<CartEntity>():
        emit(GetCartError(ErrorHandler.handle(result.exception!).message!));
        break;
    }
  }
}
