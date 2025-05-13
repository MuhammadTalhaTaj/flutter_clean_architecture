import 'package:clean_architecture_bloc/config/theme/app_theme.dart';
import 'package:clean_architecture_bloc/features/auth/login/presentation/pages/login/login_view.dart';
import 'package:clean_architecture_bloc/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'config/routes/routes.dart';
import 'config/theme/theme_light.dart';
import 'features/auth/login/data/data_sources/remote/auth_remote_data_source.dart';
import 'features/auth/login/data/repository/article_repository_impl.dart';
import 'features/auth/login/domain/usecases/login_usecase.dart';
import 'features/auth/login/presentation/pages/login/bloc/login_bloc.dart';
import 'features/home/presentation/home/bloc/home_bloc.dart';
import 'features/home/presentation/home/bloc/home_event.dart';
import 'features/home/presentation/home/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  const MyApp({super.key, });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => sl<AuthBloc>(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) {
            final homeBloc = sl<HomeBloc>();
            homeBloc.add(FetchProgressList());
            return homeBloc;
          },
        ),
      ],
      child: MaterialApp(
        theme: ThemeLight().theme,
        initialRoute: '/login',
        routes: {
          Routes.login: (context) => LoginPage(),
          Routes.home: (context) => HomeView(),
        },
      ),
    );

  }
}

