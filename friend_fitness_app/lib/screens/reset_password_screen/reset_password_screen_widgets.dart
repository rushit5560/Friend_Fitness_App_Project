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
    return Obx(()=>
       Stack(
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
            obscureText: screenController.isNewPass.value,
            decoration: passwordInputDecoration(
                hintText: "New Password", index: 0, controller: screenController),
            validator: (value) => fieldValidator.validatePassword(value!),
          ),
        ],
      ),
    );
  }


}



class ConfirmPasswordTextFieldModule extends StatelessWidget {
  ConfirmPasswordTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<ResetPasswordScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Stack(
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
            obscureText: screenController.isCPassShow.value,
            decoration: passwordInputDecoration(hintText: "Confirm Password", index: 1, controller: screenController),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter password";
              } else if(value.length < 8){
                return "Password length should be minimum 8 character";
              } else if(screenController.newPasswordFieldController.text != screenController.confirmPasswordFieldController.text){
                return "Password and confirm password should be same";
              } else {
                return null;
              }
            },
          ),
        ],
      ),
    );
  }

}

InputDecoration passwordInputDecoration({required String hintText, required int index, required ResetPasswordScreenController controller}) {
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
      suffixIcon: index == 0
          ? GestureDetector(
        onTap: () {
          controller.isNewPass.value = !controller.isNewPass.value;
        },
        child: Obx(
              () =>
              Icon(
                controller.isNewPass.value
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
                color: Colors.grey,
                size: 22,
              ),
        ),
      )
          : index == 1
          ? GestureDetector(
        onTap: () {
          controller.isCPassShow.value =
          !controller.isCPassShow.value;
        },
        child: Obx(
              () =>
              Icon(
                controller.isCPassShow.value
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
                color: Colors.grey,
                size: 22,
              ),
        ),
      ) : Container()
  );
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
          "Reset Password",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ).commonSymmetricPadding(horizontal: 28, vertical: 14),
      ),
    );
  }
}
