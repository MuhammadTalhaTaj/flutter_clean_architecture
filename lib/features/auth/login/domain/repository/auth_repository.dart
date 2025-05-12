// lib/features/auth/login/domain/repositories/auth_repository.dart
import 'package:clean_architecture_bloc/features/auth/login/domain/entities/user_entity.dart';

import '../entities/token_entity.dart';

abstract class AuthRepository{
  Future<UserEntity> login(String email, String password);
}