import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/common/loding_page.dart';
import 'package:twitter_clone/constants/constants.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/features/auth/view/login_view.dart';
import '../../../theme/pallete.dart';
import '../../../widgets/auth_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpView extends ConsumerStatefulWidget{
  static route() => MaterialPageRoute(
    builder: (context) => const SignUpView(),
  );
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView>{
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onSignUp(){
      ref.read(authControllerProvider.notifier)
          .signUp(
          email: emailController.text,
          password: passwordController.text,
          context: context,
      );
  }
  @override
  Widget build(BuildContext context){
    final isLoding = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: appbar,
      body: isLoding
          ? const Loader()
          : Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20
            ),
            child: Column(
              children: [
                AuthField(
                    controller: emailController,
                    hintText: 'Email address'
                ),
                const SizedBox(height: 25),
                AuthField(
                    controller: passwordController,
                    hintText: 'Password'
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.topRight,
                  child: RoundedSmallButton(
                      onTap: onSignUp,
                      label: 'Done'
                  ),
                ),
                const SizedBox(height: 40),
                RichText(text: TextSpan(
                    text: "Already have an account?",
                    style: const TextStyle(
                        fontSize: 16
                    ),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: const TextStyle(
                          color: Pallete.blueColor,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              LoginView.route(),
                            );
                          },
                      ),
                    ],
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}