import 'package:sadeem_task/core/api/api_result.dart';
import 'package:sadeem_task/features/products_feature/domain/entites/response/product_entity.dart';

abstract class ProductRepo {
  Future<DataResult<ProductsEntity>> getProducts();
}