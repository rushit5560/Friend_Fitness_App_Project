import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:friend_fitness_app/model/user_signup_model/user_signup_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt isStatus = 0.obs;

  GlobalKey<FormState> signUpFormKey = GlobalKey();
  TextEditingController nameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController phoneFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  TextEditingController cPasswordFieldController = TextEditingController();
  RxBool isPasswordShow = true.obs;
  RxBool isCPasswordShow = true.obs;

  signUpWithFirebaseFunction()async{
    isLoading(true);
    String url = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDErCea5X6odORA9eA3SZYtATsXUbVCH0w";
    log('url: $url');

    try{
      Map<String, dynamic> data = {
        "Name" : nameFieldController.text.trim(),
        "email": emailFieldController.text.trim(),
        "Phone": phoneFieldController.text.trim(),
        "password": passwordFieldController.text.trim(),
        "returnSecureToken" : "true"
      };
      log('data: $data');
      http.Response response = await http.post(Uri.parse(url), body: data);
      log('Response : ${response.body}');
      UserSignUpModel signUpModel = UserSignUpModel.fromJson(json.decode(response.body));
      //log('signInModel: ${signUpModel.name}');
      isStatus = response.statusCode.obs;
      log('isStatus: $isStatus');
      //isStatus = signInModel.statusCode.obs;

      if(isStatus.value == 200){
        log('Success');
        Get.snackbar(signUpModel.email + " Registered Successfully", '');

      }else{
        log('Fail');
        Get.snackbar("Email Already Exists", '');
      }
    }catch(e){
      log('Error: $e');
    } finally{
      isLoading(false);
    }
  }
}