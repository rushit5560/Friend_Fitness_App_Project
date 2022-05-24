import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/constants/app_colors.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/common/field_validation.dart';
import 'package:friend_fitness_app/controllers/reset_password_screen_controller/reset_password_screen_controller.dart';
import 'package:get/get.dart';

/// AppBar
class ResetScreenAppBarModule extends StatelessWidget {
  const ResetScreenAppBarModule({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          color: AppColors.colorLightGrey
        //color: Colors.grey
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: const SizedBox(
              width: 42,
              height: 42,
              child: Icon(
                  Icons.arrow_back
              ),
            ),
          ),
          const Text(
            "Reset Password",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(width: 42,
              height: 42),
        ],
      ),
    );
  }
}

class NewPasswordTextFieldModule extends StatelessWidget {
  NewPasswordTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<ResetPasswordScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                blurStyle: BlurStyle.outer,
                color: AppColors.colorLightGrey,
              ),
            ],
          ),
        ),
        TextFormField(
          controller: screenController.newPasswordFieldController,
          keyboardType: TextInputType.visiblePassword,
          cursorColor: Colors.grey,
          decoration: emailInputDecoration(hintText: "New Password"),
          //validator: (value) => fieldValidator.validateEmail(value!),
        ),
      ],
    );
  }

  InputDecoration emailInputDecoration({required String hintText}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey.shade200)),
      focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey.shade200)),
      errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey.shade200)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey.shade200)),
    );
  }
}

class ConfirmPasswordTextFieldModule extends StatelessWidget {
  ConfirmPasswordTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<ResetPasswordScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                blurStyle: BlurStyle.outer,
                color: AppColors.colorLightGrey,
              ),
            ],
          ),
        ),
        TextFormField(
          controller: screenController.confirmPasswordFieldController,
          keyboardType: TextInputType.visiblePassword,
          cursorColor: Colors.grey,
          decoration: emailInputDecoration(hintText: "Confirm Password"),
          //validator: (value) => fieldValidator.validateEmail(value!),
        ),
      ],
    );
  }

  InputDecoration emailInputDecoration({required String hintText}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey.shade200)),
      focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey.shade200)),
      errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey.shade200)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey.shade200)),
    );
  }
}

/// Reset Password Button
class ResetPasswordButtonModule extends StatelessWidget {
  ResetPasswordButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<ResetPasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (screenController.resetPasswordFormKey.currentState!.validate()) {
          screenController.resetPasswordFunction();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.colorDarkGrey,
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              blurStyle: BlurStyle.outer,
              color: AppColors.colorLightGrey,
            ),
          ],
        ),
        child: const Text(
          "RESET PASSWORD",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ).commonSymmetricPadding(horizontal: 28, vertical: 14),
      ),
    );
  }
}
