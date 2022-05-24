import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/common_functions.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:get/get.dart';

import '../../controllers/forgot_password_screen_controller/forgot_password_screen_controller.dart';
import 'forgot_password_screen_widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final forgotPasswordScreenController = Get.put(ForgotPasswordScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const ForgotPasswordScreenAppBarModule(),
              const SizedBox(height: 15),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Form(
                        key: forgotPasswordScreenController.forgotPassFormKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            ForgotPasswordEmailTextFieldModule(),
                            const SizedBox(height: 50),
                            SendOtpButtonModule(),

                          ],
                        ),
                      ).commonSymmetricPadding(horizontal: 25),
                      const SizedBox(height: 50),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
