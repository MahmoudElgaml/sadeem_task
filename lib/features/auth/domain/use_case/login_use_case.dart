import 'package:injectable/injectable.dart';
import 'package:sadeem_task/core/api/api_result.dart';
import 'package:sadeem_task/features/auth/domain/entites/request/login_request_entity.dart';
import 'package:sadeem_task/features/auth/domain/entites/response/login_response_entity.dart';
import 'package:sadeem_task/features/auth/domain/repo/login_repo.dart';

@injectable
class LoginUseCase {
  LoginRepo loginRepo;
  LoginUseCase(this.loginRepo);
  Future<DataResult<LoginResponseEntity>> call(
    LoginRequestEntity loginRequestEntity,
  ) async {
    return await loginRepo.login(loginRequestEntity);
  }
}
