import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/constants/api_header.dart';
import 'package:friend_fitness_app/common/constants/api_url.dart';
import 'package:friend_fitness_app/common/sharedpreference_data/sharedpreference_data.dart';
import 'package:friend_fitness_app/model/verify_otp_model/verify_otp_model.dart';
import 'package:friend_fitness_app/screens/reset_password_screen/reset_password_screen.dart';
import 'package:friend_fitness_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VerifyOtpScreenController extends GetxController{

  GlobalKey<FormState> verifyOtpFormKey = GlobalKey();
  TextEditingController otpFieldController = TextEditingController();

  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  RxBool isLoading = false.obs;
  ApiHeader apiHeader = ApiHeader();
  RxBool isSuccessStatus = false.obs;
  int userId = 0;

  verifyOtpFunction() async {
    isLoading(true);
    String url = ApiUrl.verifyOtpApi;
    log('url: $url');

    try{
      Map<String, dynamic> data = {
        "otp": otpFieldController.text.trim(),
      };
      log('data: $data');

      http.Response response = await http.post(Uri.parse(url), body: data, headers: apiHeader.headers);
      log('Response : ${response.body}');
      VerifyOtpModel verifyOtpModel = VerifyOtpModel.fromJson(json.decode(response.body));
      // log('signInModel: ${signUpModel.name}');
      isSuccessStatus = verifyOtpModel.success.obs;
      log('isStatus: $isSuccessStatus');


      if(isSuccessStatus.value){
        log('Success');
        userId = verifyOtpModel.list.id;
        Fluttertoast.showToast(msg: verifyOtpModel.message);
        clearOtpFieldsFunction();
        Get.to(() => ResetPasswordScreen(), arguments: userId);

      }else{
        log('Fail');
        Fluttertoast.showToast(msg: verifyOtpModel.message);
        if(verifyOtpModel.message == "Token don't match"){
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

  clearOtpFieldsFunction(){
    otpFieldController.clear();
  }
}