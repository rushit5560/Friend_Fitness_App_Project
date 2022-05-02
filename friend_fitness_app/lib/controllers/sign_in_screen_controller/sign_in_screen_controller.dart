import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:friend_fitness_app/model/user_signin_model/user_signin_model.dart';
import 'package:friend_fitness_app/screens/home_screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignInScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt isStatus = 0.obs;

  GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController emailFieldController = TextEditingController(text: "abc@gmail.com");
  TextEditingController passwordFieldController = TextEditingController(text: "123456");
  RxBool isPasswordShow = true.obs;

  signInWithFirebaseFunction()async{
    isLoading(true);
    String url = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDErCea5X6odORA9eA3SZYtATsXUbVCH0w";
    log('url: $url');

    try{
      Map<String, dynamic> data = {
        "email": emailFieldController.text.trim(),
        "password": passwordFieldController.text.trim(),
        "returnSecureToken" : "true"
      };
      log('data: $data');
      http.Response response = await http.post(Uri.parse(url), body: data);
      log('Response : ${response.body}');
      UserSignInModel signInModel = UserSignInModel.fromJson(json.decode(response.body));
      //log('signInModel: ${signUpModel.name}');
      isStatus = response.statusCode.obs;
      log('isStatus: $isStatus');
      //isStatus = signInModel.statusCode.obs;

      if(isStatus.value == 200){
        log('Success');
        Get.offAll(()=> HomeScreen(), transition: Transition.zoom);
        Get.snackbar(signInModel.email + " Login Successfully", '');

      }else{
        log('Fail');
        Get.snackbar("Email Not Found", '');
      }
    }catch(e){
      log('Error: $e');
    } finally{
      isLoading(false);
    }
  }

}