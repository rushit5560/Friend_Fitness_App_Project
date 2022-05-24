import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/controllers/reset_password_screen_controller/reset_password_screen_controller.dart';
import 'package:friend_fitness_app/screens/reset_password_screen/reset_password_screen_widgets.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  final resetPasswordScreenController = Get.put(ResetPasswordScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ResetScreenAppBarModule(),
            const SizedBox(height: 15),
            Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: resetPasswordScreenController.resetPasswordFormKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        NewPasswordTextFieldModule(),
                        const SizedBox(height: 10),
                        ConfirmPasswordTextFieldModule(),
                        const SizedBox(height: 50),
                        ResetPasswordButtonModule(),

                      ],
                    ),
                  ).commonSymmetricPadding(horizontal: 25),
                ))
          ],
        ),
      ),
    );
  }
}
