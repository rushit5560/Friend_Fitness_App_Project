import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/common_widgets.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:get/get.dart';
import '../../common/common_functions.dart';
import '../../controllers/sign_up_screen_controller/sign_up_screen_controller.dart';
import 'sign_up_screen_widgets.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final signUpScreenController = Get.put(SignUpScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(),
      child: Scaffold(
        body: Obx(
          ()=> signUpScreenController.isLoading.value
          ? const CustomCircularProgressIndicator()
          : SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //const SizedBox(height: 80),
                    const RegisterHeaderModule(),

                    const SizedBox(height: 80),
                    RegisterFormModule().commonSymmetricPadding(horizontal: 35),

                    const SizedBox(height: 25),
                    RegisterButtonModule(),

                    const SizedBox(height: 25),
                    const SignInTextModule()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
