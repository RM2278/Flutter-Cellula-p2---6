import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class GoogleAuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GoogleAuthInitial extends GoogleAuthState {}

class GoogleAuthLoading extends GoogleAuthState {}

class GoogleAuthSuccess extends GoogleAuthState {
  final User user;
  GoogleAuthSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class GoogleAuthFailure extends GoogleAuthState {
  final String error;
  GoogleAuthFailure(this.error);

  @override
  List<Object?> get props => [error];
}
