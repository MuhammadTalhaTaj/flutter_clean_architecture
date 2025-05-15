import 'package:clean_architecture_bloc/features/activities_view/presentaiton/activities_view.dart';
import 'package:clean_architecture_bloc/features/auth/login/presentation/pages/login/login_view.dart';
import 'package:clean_architecture_bloc/features/community_view/presentaiton/community_view.dart';
import 'package:clean_architecture_bloc/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:clean_architecture_bloc/features/dashboard/presentation/pages/dashboard_page/dashboard_page.dart';
import 'package:clean_architecture_bloc/features/wellbeing_view/presentaiton/wellbeing_view.dart';
import 'package:clean_architecture_bloc/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/routes/routes.dart';
import 'config/theme/theme_light.dart';
import 'features/auth/login/presentation/bloc/login_bloc.dart';
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
        BlocProvider<DashboardBloc>(
          create: (context) => sl<DashboardBloc>(),
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
          Routes.home: (context) => const HomeView(),
          Routes.wellbeing: (context) => const WellbeingView(),
          Routes.community: (context) => const CommunityView(),
          Routes.activity: (context) => const ActivitiesView(),
          Routes.dashboard: (context) => const DashboardView(),
        },
      ),
    );

  }
}

