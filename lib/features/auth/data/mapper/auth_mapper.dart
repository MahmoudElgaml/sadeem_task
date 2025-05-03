import 'package:sadeem_task/features/auth/data/model/request/login_request_dto.dart';
import 'package:sadeem_task/features/auth/data/model/response/log_in_response_dto.dart';
import 'package:sadeem_task/features/auth/domain/entites/request/login_request_entity.dart';
import 'package:sadeem_task/features/auth/domain/entites/response/login_response_entity.dart';

class AuthMapper {
  static LoginResponseEntity ginResponseDtoToEntity(
    LogInResponseDto loginResponseDto,
  ) {
    return LoginResponseEntity(
      email: loginResponseDto.email,
      image: loginResponseDto.image,
      name: " ${loginResponseDto.firstName} ${loginResponseDto.lastName}",
      id: loginResponseDto.id,
    );
  }
 static LoginRequestDto loginRequestEntityToDto(
    LoginRequestEntity loginRequestEntity,
  ) {
    return LoginRequestDto(
      email: loginRequestEntity.email,
      password: loginRequestEntity.password,
    );
  }
}
