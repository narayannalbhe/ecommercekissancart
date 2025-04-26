part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends LoginState {}

class AuthLoading extends LoginState {}

class AuthSuccess extends LoginState {
  final String token;

  const AuthSuccess(this.token);

  @override
  List<Object> get props => [token];
}

class AuthFailure extends LoginState {
  final String error;

  const AuthFailure(this.error);

  @override
  List<Object> get props => [error];
}