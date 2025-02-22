import 'package:clean_architecture_bloc/features/auth/login/presentation/pages/login/login_view.dart';
import 'package:clean_architecture_bloc/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/theme/theme_light.dart';

void main() {
 // initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeLight().theme,
      home: LoginPage(),
    );
  }
}

