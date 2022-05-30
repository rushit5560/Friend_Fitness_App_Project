import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:get/get.dart';
import '../../common/constants/app_colors.dart';
import '../../common/field_validation.dart';
import '../../controllers/change_password_screen_controller/change_password_screen_controller.dart';

/// AppBar
class ChangePasswordScreenAppBarModule extends StatelessWidget {
  const ChangePasswordScreenAppBarModule({Key? key}) : super(key: key);

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
            "Change Password",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(width: 42,
            height: 42),
        ],
      ),
    );
  }
}

/// Old Password Field
class OldPasswordTextFieldModule extends StatelessWidget {
  OldPasswordTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<ChangePasswordScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 52,
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
          () => TextFormField(
            controller: screenController.oldPasswordFieldController,
            keyboardType: TextInputType.text,
            cursorColor: Colors.grey,
            obscureText: screenController.isOldPassShow.value,
            decoration: passwordInputDecoration(
                hintText: "Old Password",
                index: 0,
                controller: screenController),
            validator: (value) => fieldValidator.validatePassword(value!),
          ),
        ),
      ],
    );
  }
}

/// New Password Field
class NewPasswordTextFieldModule extends StatelessWidget {
  NewPasswordTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<ChangePasswordScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 52,
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
          () => TextFormField(
            controller: screenController.newPasswordFieldController,
            keyboardType: TextInputType.text,
            cursorColor: Colors.grey,
            obscureText: screenController.isNewPassShow.value,
            decoration: passwordInputDecoration(
                hintText: "New Password",
                index: 1,
                controller: screenController),
            validator: (value) => fieldValidator.validatePassword(value!),
          ),
        ),
      ],
    );
  }
}

/// Confirm New Password Field
class ConfirmNewPasswordTextFieldModule extends StatelessWidget {
  ConfirmNewPasswordTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<ChangePasswordScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 52,
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
              () => TextFormField(
            controller: screenController.cNewPasswordFieldController,
            keyboardType: TextInputType.text,
            cursorColor: Colors.grey,
            obscureText: screenController.isCNewPassShow.value,
            decoration: passwordInputDecoration(
                hintText: "Confirm Password",
                index: 2,
                controller: screenController),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter password";
              } else if(value.length < 8){
                return "Password length should be minimum 8 character";
              } else if(screenController.newPasswordFieldController.text != screenController.cNewPasswordFieldController.text){
                return "Password and confirm password should be same";
              } else {
                return null;
              }
            },
          ),
        ),
      ],
    );
  }
}

/// Save Button
class SaveButtonModule extends StatelessWidget {
  SaveButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(screenController.changePassFormKey.currentState!.validate()) {
          screenController.changePasswordWithFirebaseAPI();
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
          "SAVE",
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ).commonSymmetricPadding(horizontal: 28, vertical: 14),
      ),
    );
  }
}


/// Password Field Decoration
InputDecoration passwordInputDecoration(
    {required String hintText,
    required int index,
    required ChangePasswordScreenController controller}) {
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
              controller.isOldPassShow.value = !controller.isOldPassShow.value;
            },
            child: Obx(
              () => Icon(
                controller.isOldPassShow.value
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
                  controller.isNewPassShow.value =
                      !controller.isNewPassShow.value;
                },
                child: Obx(
                  () => Icon(
                    controller.isNewPassShow.value
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    color: Colors.grey,
                    size: 22,
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {
                  controller.isCNewPassShow.value =
                      !controller.isCNewPassShow.value;
                },
                child: Obx(
                  () => Icon(
                    controller.isCNewPassShow.value
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    color: Colors.grey,
                    size: 22,
                  ),
                ),
              ),
  );
}
