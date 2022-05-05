import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/model/change_password_model/change_password_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChangePasswordScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt isSuccessStatus = 0.obs;

  GlobalKey<FormState> changePassFormKey = GlobalKey();
  TextEditingController oldPasswordFieldController = TextEditingController();
  TextEditingController newPasswordFieldController = TextEditingController();
  TextEditingController cNewPasswordFieldController = TextEditingController();
  RxBool isOldPassShow = true.obs;
  RxBool isNewPassShow = true.obs;
  RxBool isCNewPassShow = true.obs;

  changePasswordWithFirebaseAPI()async{
    isLoading(true);
    String url = "https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyDErCea5X6odORA9eA3SZYtATsXUbVCH0w";
    log('url: $url');
    log('UserDetails.userIdToken: ${UserDetails.userIdToken}');
    try{
      Map<String, dynamic> data = {
        "idToken" : UserDetails.userIdToken,
        "password": newPasswordFieldController.text.trim(),
        "returnSecureToken" : "true"
      };

      log('data: $data');
      http.Response response = await http.post(Uri.parse(url), body: data);
      log('Response : ${response.body}');
      ChangePasswordModel chngePasswordModel = ChangePasswordModel.fromJson(json.decode(response.body));
      // log('signInModel: ${signUpModel.name}');
      isSuccessStatus = response.statusCode.obs;
      log('isStatus: $isSuccessStatus');

      if(isSuccessStatus.value == 200){
        log('Success');
        Fluttertoast.showToast(msg: "Password Change Successfully");
        //log('profileList: $profileList');
      }else{
        log('Fail');
      }
    }catch(e){
      log('Error: $e');
    } finally{
      isLoading(false);
    }
  }
}