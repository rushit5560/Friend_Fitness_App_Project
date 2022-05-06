import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/sharedpreference_data/sharedpreference_data.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/model/user_signin_model/user_signin_model.dart';
import 'package:friend_fitness_app/screens/index_screen/index_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;



class SignInScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt isStatus = 0.obs;
  RxInt isStatusError = 0.obs;
  GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  RxBool isPasswordShow = true.obs;
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  signInWithFirebaseFunction() async {
    isLoading(true);
    String url = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDErCea5X6odORA9eA3SZYtATsXUbVCH0w";
    log('url: $url');

    try{
      Map<String, dynamic> data = {
        "email": emailFieldController.text.trim().toLowerCase(),
        "password": passwordFieldController.text.trim(),
        "returnSecureToken" : "true"
      };
      log('data: $data');
      http.Response response = await http.post(Uri.parse(url), body: data);
      log('Response : ${response.body}');
      UserSignInModel signInModel = UserSignInModel.fromJson(json.decode(response.body));
      // log('signInModel: ${signUpModel.name}');
      isStatus = response.statusCode.obs;
      log('isStatus: $isStatus');



      if(isStatus.value == 200){
        log('Success');
        UserDetails.userId = signInModel.localId;
        UserDetails.userIdToken = signInModel.idToken;
        //UserDetails.userProfile = signInModel.profilePicture;
        log('UserDetails.userId: ${UserDetails.userId}');
        log('UserDetails.userIdToken: ${UserDetails.userIdToken}');
        log('UserDetails.userProfile: ${UserDetails.userProfile}');
        await sharedPreferenceData.setUserLoginDetailsInPrefs(userId: UserDetails.userId, userIdToken: UserDetails.userIdToken, userProfile: UserDetails.userProfile);
        Get.offAll(()=> IndexScreen(), transition: Transition.zoom);
        Get.snackbar(signInModel.email + " Login Successfully", '');

      }else{
        log('Fail');
        Get.snackbar("Wrong Email/Password", '');
      }
    }catch(e){
      log('Error: $e');
    } finally{
      isLoading(false);
    }
  }

}