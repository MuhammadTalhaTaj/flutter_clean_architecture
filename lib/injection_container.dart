
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'features/auth/login/data/data_sources/remote/auth_remote_data_source.dart';
import 'features/auth/login/data/repository/article_repository_impl.dart';
import 'features/auth/login/domain/repository/auth_repository.dart';
import 'features/auth/login/domain/usecases/login_usecase.dart';
import 'features/auth/login/presentation/pages/login/bloc/login_bloc.dart';
import 'features/home/presentation/home/bloc/home_bloc.dart';
final sl =GetIt.instance;


Future<void> initializeDependencies() async {
  sl.registerSingleton<http.Client>(http.Client());

  sl.registerLazySingleton<AuthRemoteDataSource>(
  () => AuthRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<AuthRepository>(
  () => AuthRepositoryImpl(sl()));

  sl.registerLazySingleton(() => LoginUseCase(sl()));

  sl.registerFactory(() => AuthBloc(sl()));

  sl.registerFactory(() => HomeBloc());

}