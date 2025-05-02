import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sadeem_task/core/api/end_points.dart';
import 'package:sadeem_task/features/auth/data/model/request/login_request_dto.dart';
import 'package:sadeem_task/features/auth/data/model/response/log_in_response_dto.dart';
part 'login_remote.g.dart';
@injectable
@RestApi(baseUrl: EndPoints.baseUrl)
abstract class LoginRemote {
  @factoryMethod
  factory LoginRemote(Dio dio) = _LoginRemote;

  @POST(EndPoints.login)
  Future<LogInResponseDto> login(@Body() LoginRequestDto loginRequestDto);
}
