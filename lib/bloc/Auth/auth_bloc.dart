import 'dart:async';

import 'package:ecommerce_app/data/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(UnAuthenticated()) {
    on<SignInRequested>(_signInRequested);
    on<SignOutRequested>(_signOutRequested);
    on<SignUpRequested>(_signUpRequested);
  }

  FutureOr<void> _signInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(Loading());
    try {
      await _authRepository.signIn(
        email: event.email,
        password: event.password,
      );
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  FutureOr<void> _signOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(Loading());
    await _authRepository.signOut();
    emit(UnAuthenticated());
  }

  FutureOr<void> _signUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(Loading());
    try {
      await _authRepository.signUp(
        email: event.email,
        password: event.password,
      );
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }
}
