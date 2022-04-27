import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/screens/home_screen/home_screen.dart';
import 'package:friend_fitness_app/screens/profile_screen/profile_screen.dart';
import 'package:get/get.dart';

import '../../common/constants/app_colors.dart';
import '../../common/field_validation.dart';
import '../../controllers/sign_up_screen_controller/sign_up_screen_controller.dart';


/// Login Header Text Module
class RegisterHeaderModule extends StatelessWidget {
  const RegisterHeaderModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Register",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 35,
      ),
    ).commonSymmetricPadding(horizontal: 40);
  }
}


/// Register Form
class RegisterFormModule extends StatelessWidget {
  RegisterFormModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: screenController.signUpFormKey,
      child: Column(
        children: [
          SignUpNameTextFieldModule(),
          const SizedBox(height: 20),
          SignUpEmailTextFieldModule(),
          const SizedBox(height: 20),
          SignUpPhoneTextFieldModule(),
          const SizedBox(height: 20),
          SignUpPasswordTextFieldModule(),
          const SizedBox(height: 20),
          SignUpConfirmPasswordTextFieldModule(),
        ],
      ),
    );
  }
}

/// Name Field
class SignUpNameTextFieldModule extends StatelessWidget {
  SignUpNameTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();
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
          controller: screenController.nameFieldController,
          keyboardType: TextInputType.text,
          cursorColor: Colors.grey,
          decoration: signUpInputDecoration(hintText: "Name", controller: screenController),
          validator: (value) => fieldValidator.validateName(value!),
        ),

      ],
    );
  }
}

/// Email Field
class SignUpEmailTextFieldModule extends StatelessWidget {
  SignUpEmailTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();
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
          decoration: signUpInputDecoration(hintText: "Email", controller: screenController),
          validator: (value) => fieldValidator.validateEmail(value!),
        ),

      ],
    );
  }
}

/// Phone Field
class SignUpPhoneTextFieldModule extends StatelessWidget {
  SignUpPhoneTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();
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
          controller: screenController.phoneFieldController,
          keyboardType: TextInputType.phone,
          cursorColor: Colors.grey,
          maxLength: 12,
          decoration: signUpInputDecoration(hintText: "Phone", controller: screenController),
          validator: (value) => fieldValidator.validateMobile(value!),
        ),

      ],
    );
  }
}

/// Password Field
class SignUpPasswordTextFieldModule extends StatelessWidget {
  SignUpPasswordTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();
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

        Obx(
          ()=> TextFormField(
            controller: screenController.passwordFieldController,
            keyboardType: TextInputType.text,
            cursorColor: Colors.grey,
            obscureText: screenController.isPasswordShow.value,
            decoration: signUpInputDecoration(hintText: "Password", controller: screenController, index: 1),
            validator: (value) => fieldValidator.validatePassword(value!),
          ),
        ),

      ],
    );
  }
}

/// Confirm Password Field
class SignUpConfirmPasswordTextFieldModule extends StatelessWidget {
  SignUpConfirmPasswordTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();
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

        Obx(
          ()=> TextFormField(
            controller: screenController.cPasswordFieldController,
            keyboardType: TextInputType.text,
            cursorColor: Colors.grey,
            obscureText: screenController.isCPasswordShow.value,
            decoration: signUpInputDecoration(hintText: "Confirm Password", controller: screenController, index: 2),
            validator: (value) => fieldValidator.validateConfirmPassword(value!, screenController.cPasswordFieldController.text.trim()),
          ),
        ),

      ],
    );
  }
}

/// Register Button
class RegisterButtonModule extends StatelessWidget {
  RegisterButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (screenController.signUpFormKey.currentState!.validate()) {
              // log("");
              Get.offAll(()=> HomeScreen(), transition: Transition.zoom);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.colorDarkGrey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "REGISTER",
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


/// SignIn Fields Decoration
InputDecoration signUpInputDecoration(
    {required String hintText,
    int index = 0,
    required SignUpScreenController controller}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.grey),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
    filled: true,
    fillColor: Colors.white,
    counterText: "",
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
              controller.isPasswordShow.value =
                  !controller.isPasswordShow.value;
            },
            child: Obx(
              () => Icon(
                controller.isPasswordShow.value
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
                color: Colors.grey,
                size: 22,
              ),
            ),
          )
        : index == 2
            ? GestureDetector(
                onTap: () {
                  controller.isCPasswordShow.value =
                      !controller.isCPasswordShow.value;
                },
                child: Obx(
                  () => Icon(
                    controller.isCPasswordShow.value
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    color: Colors.grey,
                    size: 22,
                  ),
                ),
              )
            : null,
  );
}