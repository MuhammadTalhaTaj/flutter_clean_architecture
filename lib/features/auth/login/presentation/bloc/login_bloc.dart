// presentation/bloc/auth_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/login_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc(this.loginUseCase) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await loginUseCase(event.email, event.password);
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthFailure('Login failed: ${e.toString()}'));
      }
    });
  }
}
