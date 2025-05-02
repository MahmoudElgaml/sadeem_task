import 'package:injectable/injectable.dart';
import 'package:sadeem_task/core/api/api_result.dart';

import 'package:sadeem_task/features/products_feature/domain/entites/response/product_entity.dart';
import 'package:sadeem_task/features/products_feature/domain/repo/product_repo.dart';

@injectable
class GetProductUseCase {
  final ProductRepo _productRepo;
  GetProductUseCase(this._productRepo);

  Future<DataResult<ProductsEntity>> call() async {
    return await _productRepo.getProducts();
  }
}
