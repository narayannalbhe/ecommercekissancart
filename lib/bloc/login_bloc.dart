import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';


class LoginBloc extends Bloc<AuthEvent, LoginState> {
  LoginBloc() : super(AuthInitial()) {
    on<LoginEvent>(_onLoginEvent);
  }

  FutureOr<void> _onLoginEvent(
      LoginEvent event,
      Emitter<LoginState> emit,
      ) async {
    emit(AuthLoading());

    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 2));

      // Mock authentication logic
      if (event.email == 'test@example.com' && event.password == 'password123') {
        emit(AuthSuccess('mock_token_123'));
      } else {
        emit(const AuthFailure('Invalid email or password'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}