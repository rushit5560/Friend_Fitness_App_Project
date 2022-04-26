import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:get/get.dart';
import '../../controllers/sign_in_screen_controller/sign_in_screen_controller.dart';
import 'sign_in_screen_widgets.dart';


class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final signInScreenController = Get.put(SignInScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              const LoginHeaderModule(),

              const SizedBox(height: 100),
              LoginFormModule().commonSymmetricPadding(horizontal: 35),

              const SizedBox(height: 10),
              const ForgotPasswordTextModule().commonSymmetricPadding(horizontal: 35),

              const SizedBox(height: 25),
              LoginButtonModule(),

              const SizedBox(height: 25),
              const OrTextModule(),

              const SizedBox(height: 25),
              const SocialMediaButton(),

              const SizedBox(height: 25),
              const SignUpTextModule(),

            ],
          ),
        ),
      ),
    );
  }
}
