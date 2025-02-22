
import 'package:clean_architecture_bloc/core/extensions/build_context_extension.dart';
import 'package:clean_architecture_bloc/core/extensions/size_extension.dart';
import '../../../../../../core/components/app_button.dart';
import '../../../../../../core/components/app_text_field.dart';
import '../../../../../../core/constants/imports.dart';
import '../../../../../../core/mixins/validators.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../widgets/custom_rich_text.dart';

class LoginPage extends StatelessWidget with Validators {
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
                  fit: BoxFit.cover),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SB.h(context.height * 0.15),
                    Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(Assets.icons.logo),
                          50.h,
                          CustomTextField(
                            title: "Email",
                            hintText: "Type your email",
                            validator: validateEmail,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SB.h(context.height * 0.02),
                          CustomTextField(
                            title: "Password",
                            isPasswordField: true,
                            hintText: "Type your password",
                            validator: validatePassword,
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(


                                  child: Text(
                                    "Forgot your password?",
                                    style: context.bodyMedium!
                                        .copyWith(color: context.primary),
                                  ))),
                          50.h,
                          AppButton.primary(
                            title: 'Log In',
                          ),
                          25.h,
                          // socialButton(context, true),
                          // 35.h,
                          CustomRichText(
                            text: 'Not a member yet? ',
                            highlightedText: 'Sign up',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

    );

}}
