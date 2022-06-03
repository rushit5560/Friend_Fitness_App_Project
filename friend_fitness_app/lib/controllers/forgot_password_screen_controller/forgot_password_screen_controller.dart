import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/constants/api_header.dart';
import 'package:friend_fitness_app/common/constants/api_url.dart';
import 'package:friend_fitness_app/common/sharedpreference_data/sharedpreference_data.dart';
import 'package:friend_fitness_app/model/forgot_password_model/forgot_password_model.dart';
import 'package:friend_fitness_app/model/verify_otp_model/verify_otp_model.dart';
import 'package:friend_fitness_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:friend_fitness_app/screens/verify_otp_screen/verify_otp_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  GlobalKey<FormState> forgotPassFormKey = GlobalKey();

  TextEditingController emailFieldController = TextEditingController();

  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  forgotPasswordFunction() async {
    isLoading(true);
    String url = ApiUrl.forgotPasswordApi;
    log('url: $url');

    try{
      Map<String, dynamic> data = {
        "email": emailFieldController.text.trim(),
      };
      log('data: $data');
      http.Response response = await http.post(Uri.parse(url), body: data, headers: apiHeader.headers);
      log('Response : ${response.body}');
      ForgotPasswordModel forgotPasswordModel = ForgotPasswordModel.fromJson(json.decode(response.body));
      // log('signInModel: ${signUpModel.name}');
      isSuccessStatus = forgotPasswordModel.success.obs;
      log('isStatus: $isSuccessStatus');



      if(isSuccessStatus.value){
        log('Success');
        Fluttertoast.showToast(msg: forgotPasswordModel.message);
        clearForgotPasswordFieldsFunction();
        Get.to(() => VerifyOtpScreen());

      }else{
        log('Fail');
        Fluttertoast.showToast(msg: forgotPasswordModel.message);

        if(forgotPasswordModel.message == "Token don't match"){
          sharedPreferenceData.clearUserLoginDetailsFromPrefs();
          Get.offAll(SignInScreen(), transition: Transition.zoom);
        }
      }
    }catch(e){
      log('Error: $e');
    } finally{
      isLoading(false);
    }
  }



  clearForgotPasswordFieldsFunction() {
    emailFieldController.clear();
  }


}