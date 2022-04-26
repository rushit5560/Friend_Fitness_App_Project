import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/constants/app_images.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:get/get.dart';

import '../../common/constants/app_colors.dart';
import '../../common/field_validation.dart';
import '../../controllers/sign_in_screen_controller/sign_in_screen_controller.dart';

/// Login Header Text Module
class LoginHeaderModule extends StatelessWidget {
  const LoginHeaderModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Login",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 35,
      ),
    ).commonSymmetricPadding(horizontal: 40);
  }
}

/// Login Form
class LoginFormModule extends StatelessWidget {
  LoginFormModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: screenController.signInFormKey,
      child: Column(
        children: [
          EmailTextFieldModule(),
          const SizedBox(height: 20),
          PasswordTextFieldModule(),
        ],
      ),
    );
  }
}

/// Email Field
class EmailTextFieldModule extends StatelessWidget {
  EmailTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignInScreenController>();
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
          controller: screenController.emailFieldController,
          keyboardType: TextInputType.emailAddress,
          cursorColor: Colors.grey,
          decoration: signInInputDecoration(hintText: "Email", controller: screenController),
          validator: (value) => fieldValidator.validateEmail(value!),
        ),
      ],
    );
  }
}

/// Password Field
class PasswordTextFieldModule extends StatelessWidget {
  PasswordTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignInScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 45,
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
        Obx(
          ()=> TextFormField(
            controller: screenController.passwordFieldController,
            keyboardType: TextInputType.text,
            cursorColor: Colors.grey,
            obscureText: screenController.isPasswordShow.value,
            decoration: signInInputDecoration(hintText: "Password", index: 1, controller: screenController),
            validator: (value) => fieldValidator.validatePassword(value!),
          ),
        ),
      ],
    );
  }
}


/// Forgot Password Text
class ForgotPasswordTextModule extends StatelessWidget {
  const ForgotPasswordTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            // Get.to(()=> ForgotPasswordScreen(), transition: Transition.rightToLeft);
          },
          child: const Text(
            "FORGOT PASSWORD?",
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}

/// Login Button
class LoginButtonModule extends StatelessWidget {
  LoginButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (screenController.signInFormKey.currentState!.validate()) {
              // log("");
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.colorDarkGrey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "LOGIN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ).commonSymmetricPadding(horizontal: 30, vertical: 14),
          ),
        ),
      ],
    );
  }
}

/// Or Text Module
class OrTextModule extends StatelessWidget {
  const OrTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "OR",
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.colorDarkGrey,
          ),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.facebookImg),
              ),
            ),
          ).commonAllSidePadding(padding: 17),
        ),

        const SizedBox(width: 25),

        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.colorDarkGrey,
          ),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.googleImg),
              ),
            ),
          ).commonAllSidePadding(padding: 17),
        ),

      ],
    );
  }
}



/// SignIn Fields Decoration
InputDecoration signInInputDecoration(
    {required String hintText, int index = 0, required SignInScreenController controller}) {
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
    suffixIcon: index == 1
        ? GestureDetector(
      onTap: () {
        controller.isPasswordShow.value = !controller.isPasswordShow.value;
      },
          child: Obx(
            ()=> Icon(
              controller.isPasswordShow.value ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                color: Colors.grey,
                size: 22,
              ),
          ),
        )
        : null,
  );
}
