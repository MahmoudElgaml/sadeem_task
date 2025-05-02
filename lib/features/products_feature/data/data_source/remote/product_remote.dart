 import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:sadeem_task/core/api/end_points.dart';
import 'package:sadeem_task/features/products_feature/data/model/response/product_dto.dart';
part 'product_remote.g.dart';
@injectable
@RestApi(baseUrl: EndPoints.baseUrl)
abstract class ProductRemote {

  @factoryMethod
  factory ProductRemote(Dio dio) = _ProductRemote;

  @GET(EndPoints.products)
  Future<ProductDto> getProducts();

}
 