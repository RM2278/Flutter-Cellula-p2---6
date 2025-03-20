import 'package:meal_recommender/features/auth/domain/entities/login_user_entity.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginUserEntity loginUserEntity;
  LoginSuccess({required this.loginUserEntity});
}

final class LoginFailure extends LoginState {
  final String message;
  LoginFailure({required this.message});
}

final class LoginFormUpdated extends LoginState {
  final bool isFormValid;
  LoginFormUpdated(this.isFormValid);
}
