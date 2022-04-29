import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:get/get.dart';

import '../../common/common_functions.dart';
import '../../controllers/change_password_screen_controller/change_password_screen_controller.dart';
import 'change_password_screen_widgets.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final changePasswordScreenController = Get.put(ChangePasswordScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const ChangePasswordScreenAppBarModule(),
              const SizedBox(height: 10),
              Expanded(
                child: Form(
                  key: changePasswordScreenController.changePassFormKey,
                  child: Column(
                    children: [
                      OldPasswordTextFieldModule(),
                      const SizedBox(height: 15),
                      NewPasswordTextFieldModule(),
                      const SizedBox(height: 15),
                      ConfirmNewPasswordTextFieldModule(),
                      const SizedBox(height: 25),
                      PasswordSaveButtonModule(),
                      const SizedBox(height: 15),
                    ],
                  ).commonAllSidePadding(padding: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
