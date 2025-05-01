import 'package:injectable/injectable.dart';
import 'package:sadeem_task/core/api/api_result.dart';
import 'package:sadeem_task/features/auth/domain/entites/request/login_request_entity.dart';
import 'package:sadeem_task/features/auth/domain/entites/response/login_response_entity.dart';
@injectable
abstract class LoginRepo {
  Future<DataResult<LoginResponseEntity>> login(
    LoginRequestEntity loginRequestEntity);
}
