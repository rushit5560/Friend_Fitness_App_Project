import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/constants/api_header.dart';
import 'package:friend_fitness_app/common/constants/api_url.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/model/change_password_model/change_password_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
  ApiHeader apiHeader = ApiHeader();

  changePasswordWithFirebaseAPI()async{
    isLoading(true);
    String url = ApiUrl.changePasswordApi;
    log('url: $url');
    try{
      Map<String, dynamic> data = {
        "oldpassword" : oldPasswordFieldController.text.trim(),
        "password": newPasswordFieldController.text.trim(),
        "password_confirmation" : cNewPasswordFieldController.text.trim(),
        "id": "${UserDetails.userId}"
      };

      log('data: $data');
      http.Response response = await http.post(Uri.parse(url), body: data, headers: apiHeader.headers);
      log('Response : ${response.body}');
      ChangePasswordModel chngePasswordModel = ChangePasswordModel.fromJson(json.decode(response.body));
      // log('signInModel: ${signUpModel.name}');
      isSuccessStatus = chngePasswordModel.success.obs;
      log('isStatus: $isSuccessStatus');

      if(isSuccessStatus.value){
        log('Success');
        Fluttertoast.showToast(msg: chngePasswordModel.message);
        clearChangePasswordFieldsFunction();
        //log('profileList: $profileList');
      }else{
        Fluttertoast.showToast(msg: chngePasswordModel.message);
        // if(chngePasswordModel.success.toString().contains("false")){
        //   Fluttertoast.showToast(msg: chngePasswordModel.message);
        // }

        log('Fail');
      }
    }catch(e){
      log('Error: $e');
    } finally{
      isLoading(false);
    }
  }

  clearChangePasswordFieldsFunction(){
    oldPasswordFieldController.clear();
    newPasswordFieldController.clear();
    cNewPasswordFieldController.clear();
  }
}