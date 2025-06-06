// presentation/bloc/auth_event.dart
import 'package:clean_architecture_bloc/core/constants/imports.dart';

abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested(this.email, this.password);
}
