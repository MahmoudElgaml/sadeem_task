import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:sadeem_task/core/api/api_result.dart';
import 'package:sadeem_task/core/error/error_handler.dart';
import 'package:sadeem_task/features/products_feature/domain/entites/response/product_entity.dart';
import 'package:sadeem_task/features/products_feature/domain/use_case/get_product_use_case.dart';
import 'package:sadeem_task/features/products_feature/presentation/cubit/product_actions.dart';

part 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  GetProductUseCase getProductUseCase;
  int limit = 20;
  int skip = 0;
  bool hasMore = true;
  List<ProductEntity> products = [];
  ProductCubit(this.getProductUseCase) : super(ProductInitial());

  doAction(ProductActions action) {
    print("soooo");
    switch (action) {
      case GetProductsAction():
        {
          Logger().d("GetProductsAction");
          getProducts();
        }
        break;
    }
  }

  getProducts({bool isLoadingMore = false}) async {
    if (!hasMore && isLoadingMore) {
      return;
    }
    if (!isLoadingMore) {
      skip = 0;
    
      hasMore = true;
      products = [];
      emit(GetProductLoading());
    }

    var result = await getProductUseCase.call(limit: limit, skip: skip);

    switch (result) {
      case Success<ProductsEntity>():
        {
          if (result.data.products!.isEmpty) {
            hasMore = false;
          } else {
            products.addAll(result.data.products!);
            skip += limit;
          }
          emit(GetProductSuccess(ProductsEntity(products: products)));
        }
        break;
      case Fail():
        emit(
          GetProductError(
            ErrorHandler.handle(result.exception!).message ?? "Unknown Error",
          ),
        );
        break;
    }
  }
}
