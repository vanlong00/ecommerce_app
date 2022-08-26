import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/data/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {
    on<AuthEvent>((event, emit) {
      // When User Presses the SignIn Button, we will send the SignInRequested Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
      on<SignInRequested>((event, emit) async {
        emit(AuthLoading());
        try {
          await authRepository.signIn(
              email: event.email, password: event.password);
          emit(Authenticated());
        } catch (e) {
          emit(AuthError(e.toString()));
          emit(UnAuthenticated());
        }
      });

      // When User Presses the SignUp Button, we will send the SignUpRequest Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
      on<SignUpRequested>((event, emit) async {
        emit(AuthLoading());
        try {
          await authRepository.signUp(
              email: event.email, password: event.password);
          emit(Authenticated());
        } catch (e) {
          emit(AuthError(e.toString()));
          emit(UnAuthenticated());
        }
      });

      // When User Presses the SignOut Button, we will send the SignOutRequested Event to the AuthBloc to handle it and emit the UnAuthenticated State
      on<SignOutRequested>((event, emit) async {
        emit(AuthLoading());
        await authRepository.signOut();
        emit(UnAuthenticated());
      });
    });
  }
}
