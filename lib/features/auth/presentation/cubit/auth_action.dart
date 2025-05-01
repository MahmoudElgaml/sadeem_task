import 'package:sadeem_task/features/auth/domain/entites/request/login_request_entity.dart';

sealed class AuthAction {

}
class AuthActionLogin extends AuthAction {
 final LoginRequestEntity loginRequestEntity;

  AuthActionLogin(this.loginRequestEntity);   
  
}