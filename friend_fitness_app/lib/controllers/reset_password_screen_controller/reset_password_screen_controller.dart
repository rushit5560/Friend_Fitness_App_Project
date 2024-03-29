import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/constants/api_header.dart';
import 'package:friend_fitness_app/common/constants/api_url.dart';
import 'package:friend_fitness_app/model/reset_password_model/reset_password_model.dart';
import 'package:friend_fitness_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;



class ResetPasswordScreenController extends GetxController{
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey();
  TextEditingController newPasswordFieldController = TextEditingController();
  TextEditingController confirmPasswordFieldController = TextEditingController();

  int userId = Get.arguments;

  RxBool isNewPass = true.obs;
  RxBool isCPassShow = true.obs;

  RxBool isLoading = false.obs;
  ApiHeader apiHeader = ApiHeader();
  RxBool isSuccessStatus = false.obs;

  Future<void> resetPasswordFunction() async {
    isLoading(true);
    String url = ApiUrl.resetPasswordApi;
    log('url: $url');
    log('userId: $userId');
    try{
      Map<String, dynamic> data = {
        "userid": "$userId",
        "password": newPasswordFieldController.text.trim(),
        "password_confirmation" : confirmPasswordFieldController.text.trim()
      };
      log('data: $data');

      http.Response response = await http.post(Uri.parse(url), body: data, headers: apiHeader.headers);
      log('Response : ${response.body}');
      ResetPasswordModel resetPasswordModel = ResetPasswordModel.fromJson(json.decode(response.body));
      // log('signInModel: ${signUpModel.name}');
      isSuccessStatus = resetPasswordModel.success.obs;
      log('isStatus: $isSuccessStatus');


      if(isSuccessStatus.value){
        log('Success');
        Fluttertoast.showToast(msg: resetPasswordModel.message);
        clearResetPasswordFieldsFunction();
        Get.off(()=> SignInScreen());

      }else{
        log('Fail');
        Fluttertoast.showToast(msg: resetPasswordModel.message);
      }
    }catch(e){
      log('Error: $e');
    } finally{
      isLoading(false);
    }
  }

  clearResetPasswordFieldsFunction(){
    newPasswordFieldController.clear();
    confirmPasswordFieldController.clear();
  }
}