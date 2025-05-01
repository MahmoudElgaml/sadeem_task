// import 'package:dash_board_ieee/features/Auth/data/models/request/signup_reqest_dto.dart';
// import 'package:dash_board_ieee/features/Auth/data/models/response/login_response_dto.dart';
// import 'package:dash_board_ieee/features/Auth/data/models/response/signup_response_dto/signup_response_dto.dart';
// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:retrofit/error_logger.dart';
// import 'package:retrofit/http.dart';
// import '../../../features/Auth/data/models/request/login_request_dto.dart';
// import 'end_points.dart';

// part 'api_manger.g.dart';

// @injectable
// @RestApi(baseUrl: EndPoints.baseUrl)
// abstract class NewApiManger {
//   @factoryMethod
//   factory NewApiManger(Dio dio) = _NewApiManger;

//   @POST(EndPoints.login)
//   Future<LoginResponseDto> login(@Body() LoginRequestDto data);
//   @POST(EndPoints.signup)
//   Future<SignupResponseDto>sinup(@Body() SignupReqestDto data);  
// }
