


import 'package:clean_architecture_bloc/features/auth/login/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:clean_architecture_bloc/features/auth/login/domain/repository/auth_repository.dart';

import '../../domain/entities/user_entity.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<UserEntity> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }
}