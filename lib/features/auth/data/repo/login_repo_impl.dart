import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:sadeem_task/core/api/api_execute.dart';
import 'package:sadeem_task/core/api/api_result.dart';
import 'package:sadeem_task/features/auth/data/data_source/remote/login_remote.dart';
import 'package:sadeem_task/features/auth/data/mapper/auth_mapper.dart';
import 'package:sadeem_task/features/auth/domain/entites/request/login_request_entity.dart';
import 'package:sadeem_task/features/auth/domain/entites/response/login_response_entity.dart';
import 'package:sadeem_task/features/auth/domain/repo/login_repo.dart';
@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  LoginRemote loginRemote;
  LoginRepoImpl(this.loginRemote);
  @override
  Future<DataResult<LoginResponseEntity>> login(
    LoginRequestEntity loginRequestEntity,
  )async {
   return  executeApi(() async{
  
    var response= await loginRemote.login(
          AuthMapper.loginRequestEntityToDto(loginRequestEntity),
        );
       return AuthMapper.ginResponseDtoToEntity(response);
    });
  }
}
