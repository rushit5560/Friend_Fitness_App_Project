import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/model/update_profile_model/update_profile_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

/*
class EditProfileScreenController extends GetxController{
  File? profileImage;
  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;

  TextEditingController nameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController weightFieldController = TextEditingController();
  TextEditingController measurementFieldController = TextEditingController();
  TextEditingController heightFieldController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //updateProfileWithFirebaseAPI();
  }

  */
/*updateProfileWithFirebaseAPI() async {
    isLoading(true);
    String url = "https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyDErCea5X6odORA9eA3SZYtATsXUbVCH0w";
    log('url: $url');
    log('UserDetails.userIdToken: ${UserDetails.userIdToken}');
    try{
      Map<String, dynamic> data = {
        "idToken" : UserDetails.userIdToken,
        "displayName": nameFieldController.text.trim(),
        "photoUrl" : profileImage!.path,
        "returnSecureToken" : "true"
      };

      log('data: $data');
      http.Response response = await http.post(Uri.parse(url), body: data);
      log('Response : ${response.body}');
      UpdateProfileModel getProfileModel = UpdateProfileModel.fromJson(json.decode(response.body));
      // log('signInModel: ${signUpModel.name}');
      isSuccessStatusCode = response.statusCode.obs;
      log('isStatus: $isSuccessStatusCode');

      if(isSuccessStatusCode.value == 200){
        log('Success');
        Fluttertoast.showToast(msg: "Successfully Profile Updated");
      }else{
        log('Fail');
      }
    }catch(e){
      log('Error: $e');
    } finally{
      isLoading(false);
    }
  }*//*


  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}*/
