import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/constants/api_url.dart';
import 'package:friend_fitness_app/model/user_signup_model/user_signup_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxBool isStatus = false.obs;

  GlobalKey<FormState> signUpFormKey = GlobalKey();
  TextEditingController nameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController phoneFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  TextEditingController cPasswordFieldController = TextEditingController();
  RxBool isPasswordShow = true.obs;
  RxBool isCPasswordShow = true.obs;
  RxInt roleValue = 1.obs;

  signUpWithFirebaseFunction()async{
    isLoading(true);
    String url = ApiUrl.signUpApi;
    log('url: $url');

    try{
      Map<String, dynamic> data = {
        "name" : nameFieldController.text.trim(),
        "email": emailFieldController.text.trim(),
        "password": passwordFieldController.text.trim(),
        "c_password": cPasswordFieldController.text.trim(),
        //"roleid" : "3"
        "roleid" : "${roleValue.value}"
      };
      log('data: $data');
      http.Response response = await http.post(Uri.parse(url), body: data);
      log('Response : ${response.body}');
      UserSignUpModel userSignUpModel = UserSignUpModel.fromJson(json.decode(response.body));
      //log('signInModel: ${signUpModel.name}');
      isStatus = userSignUpModel.success.obs;
      log('isStatus: $isStatus');
      //isStatus = signInModel.statusCode.obs;

      if(isStatus.value){
        log('Success');
        Get.snackbar(userSignUpModel.messege, '');
        clearSignUpFieldsFunction();
        Get.back();

      }else{
        log('Fail');
        log('isStatus.value: ${isStatus.value}');
        Get.snackbar("User Already Register", '');
        // if(userSignUpModel.error.email[0].contains("validation.unique")){
        //   Get.snackbar(userSignUpModel.error.email[0], '');
        // }

      }
    }catch(e){
      log('Error: $e');
    } finally{
      isLoading(false);
    }
  }

  clearSignUpFieldsFunction() {
    nameFieldController.clear();
    emailFieldController.clear();
    passwordFieldController.clear();
    cPasswordFieldController.clear();
    //roleValue(0);
  }
}