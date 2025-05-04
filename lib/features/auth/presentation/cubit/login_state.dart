part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginSuccessState extends LoginState {
  final LoginResponseEntity loginResponseEntity;

  LoginSuccessState(this.loginResponseEntity);
}
final class LoginFailureState extends LoginState {
  final ErrorModel errorMessage;

  LoginFailureState(this.errorMessage);
}
