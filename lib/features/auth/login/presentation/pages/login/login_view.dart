import 'package:clean_architecture_bloc/core/extensions/build_context_extension.dart';
import 'package:clean_architecture_bloc/core/extensions/size_extension.dart';
import 'package:clean_architecture_bloc/features/home/presentation/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../config/routes/routes.dart';
import '../../../../../../core/components/app_button.dart';
import '../../../../../../core/components/app_text_field.dart';
import '../../../../../../core/constants/imports.dart';
import '../../../../../../core/mixins/validators.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../widgets/custom_rich_text.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';

class LoginPage extends StatelessWidget with Validators {
  final emailController = TextEditingController(text: 'hh@gmail.com');
  final passwordController = TextEditingController(text: '890890Tt\$');
  final _formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.background2.path),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.home,
                );
              } else if (state is AuthFailure) {

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: context.height * 0.15),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SvgPicture.asset(Assets.icons.logo),
                          50.h,
                          CustomTextField(
                            title: "Email",
                            hintText: "Type your email",
                            validator: validateEmail,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          20.h,
                          CustomTextField(
                            title: "Password",
                            isPasswordField: true,
                            hintText: "Type your password",
                             validator: validatePassword,
                            controller: passwordController,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                              },
                              child: Text(
                                "Forgot your password?",
                                style: context.bodyMedium!.copyWith(
                                  color: context.primary,
                                ),
                              ),
                            ),
                          ),
                          50.h,
                          state is AuthLoading
                              ? const CircularProgressIndicator()
                              : AppButton.primary(
                            title: 'Log In',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                  LoginRequested(
                                    emailController.text,
                                    passwordController.text,

                                  ),
                                );
                              }
                            },
                          ),
                          25.h,
                          const CustomRichText(
                            text: 'Not a member yet? ',
                            highlightedText: 'Sign up',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
