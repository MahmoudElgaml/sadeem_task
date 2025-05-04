import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sadeem_task/core/api/end_points.dart';
import 'package:sadeem_task/features/cart/data/model/request/add_cart_request_dto.dart';
import 'package:sadeem_task/features/cart/data/model/request/update_cart_request_dto.dart';
import 'package:sadeem_task/features/cart/data/model/response/cart_dto.dart';
import 'package:sadeem_task/features/cart/data/model/response/delete_cart_response.dart';
part 'cart_remote.g.dart';

@injectable
@RestApi(baseUrl: EndPoints.baseUrl)
abstract class CartRemote {
  @factoryMethod
  factory CartRemote(Dio dio) = _CartRemote;

  @GET(EndPoints.getCart)
  Future<CartDto> getCartItems(@Path('id') String userId);
  @PUT(EndPoints.updateCart)
  Future<Cart> updateCartItems(
    @Path('id') String cartId,
    @Body() UpdateCartRequestDto updateCartRequestDto,
  );
  @DELETE(EndPoints.deleteCart)
  Future<DeleteCartResponse> deleteCartItems(@Path('id') String cartId);
  @POST(EndPoints.addCart)
  Future<Cart> addCartItems(@Body() AddCartRequestDto addCartRequestDto);
}
