import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:sadeem_task/core/api/api_result.dart';
import 'package:sadeem_task/core/error/error_handler.dart';
import 'package:sadeem_task/core/error/error_model.dart';
import 'package:sadeem_task/features/auth/domain/entites/request/login_request_entity.dart';
import 'package:sadeem_task/features/auth/domain/entites/response/login_response_entity.dart';
import 'package:sadeem_task/features/auth/domain/use_case/login_use_case.dart';
import 'package:sadeem_task/features/auth/presentation/cubit/auth_action.dart';

part 'login_state.dart';
@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;


   void doAction(AuthAction action) {
    switch (action) {
      case AuthActionLogin():
        login(action.loginRequestEntity);
    }
  }
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  void login(LoginRequestEntity loginRequestEntity ) async {
    emit(LoginLoading());
    final result = await loginUseCase(
      loginRequestEntity,
    );
   switch(result){
    case Success<LoginResponseEntity>():
    emit(LoginSuccessState(result.data));
    break;
    case Fail<LoginResponseEntity>():
    emit(LoginFailureState(ErrorHandler.handle(result.exception!)));

   }
  }







}
