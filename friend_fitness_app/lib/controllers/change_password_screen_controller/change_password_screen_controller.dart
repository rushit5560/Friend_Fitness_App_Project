import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  GlobalKey<FormState> changePassFormKey = GlobalKey();
  TextEditingController oldPasswordFieldController = TextEditingController();
  TextEditingController newPasswordFieldController = TextEditingController();
  TextEditingController cNewPasswordFieldController = TextEditingController();
  RxBool isOldPassShow = true.obs;
  RxBool isNewPassShow = true.obs;
  RxBool isCNewPassShow = true.obs;
}