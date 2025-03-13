part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}
class RegisterNotValid extends RegisterState {}
class RegisterValid extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterError extends RegisterState {
  String e;
  RegisterError(this.e);
}
