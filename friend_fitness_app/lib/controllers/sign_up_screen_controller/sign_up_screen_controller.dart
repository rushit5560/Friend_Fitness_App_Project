import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  GlobalKey<FormState> signUpFormKey = GlobalKey();
  TextEditingController nameFieldController = TextEditingController(text: "Demo");
  TextEditingController emailFieldController = TextEditingController(text: "demo@gmail.com");
  TextEditingController phoneFieldController = TextEditingController(text: "1234567890");
  TextEditingController passwordFieldController = TextEditingController(text: "123456");
  TextEditingController cPasswordFieldController = TextEditingController(text: "123456");
  RxBool isPasswordShow = true.obs;
  RxBool isCPasswordShow = true.obs;
}