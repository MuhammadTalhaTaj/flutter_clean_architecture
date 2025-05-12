// lib/features/auth/login/domain/usecases/login_usecase.dart
    import 'package:clean_architecture_bloc/features/auth/login/domain/entities/user_entity.dart';

import '../entities/token_entity.dart';
import '../repository/auth_repository.dart';

 class LoginUseCase{
   final AuthRepository repository;
   LoginUseCase(this.repository);

   Future<UserEntity> call(String email,String password) async{
     return repository.login(email, password);
   }

 }