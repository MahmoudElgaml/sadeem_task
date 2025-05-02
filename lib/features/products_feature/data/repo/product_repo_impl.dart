import 'package:injectable/injectable.dart';
import 'package:sadeem_task/core/api/api_execute.dart';
import 'package:sadeem_task/core/api/api_result.dart';
import 'package:sadeem_task/features/products_feature/data/data_source/mapper/product_mapper.dart';
import 'package:sadeem_task/features/products_feature/data/data_source/remote/product_remote.dart';
import 'package:sadeem_task/features/products_feature/domain/entites/response/product_entity.dart';
import 'package:sadeem_task/features/products_feature/domain/repo/product_repo.dart';

@Injectable(as: ProductRepo)
class ProductRepoImpl implements ProductRepo {
  final ProductRemote _productRemote;
  ProductRepoImpl(this._productRemote);
  @override
  Future<DataResult<ProductsEntity>> getProducts() async {
    return executeApi(() async {
      var response = await _productRemote.getProducts();
      return ProductMapper.productDtoToEntity(response);
    });
  }
}
