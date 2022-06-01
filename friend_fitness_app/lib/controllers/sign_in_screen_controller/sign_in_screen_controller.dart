import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/constants/api_url.dart';
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

  signInFunction() async {
    isLoading(true);
    String url = ApiUrl.loginApi;
    log('url: $url');

    try{
      Map<String, dynamic> data = {
        "email": emailFieldController.text.trim(),
        "password": passwordFieldController.text.trim(),
      };
      log('data: $data');
      http.Response response = await http.post(Uri.parse(url), body: data);
      log('Response : ${response.body}');
      UserSignInModel signInModel = UserSignInModel.fromJson(json.decode(response.body));
      // log('signInModel: ${signUpModel.name}');
      isSuccessStatus = signInModel.success.obs;
      log('isStatus: $isSuccessStatus');



      if(isSuccessStatus.value){
        log('Success');
        for(int i =0; i < signInModel.list.length; i++){
          UserDetails.userId = signInModel.list[i].id;
          UserDetails.userIdToken = signInModel.list[i].rememberToken;
          UserDetails.roleId = signInModel.list[i].roleid;
          UserDetails.gameId = signInModel.list[i].joingameid.toString();
        }

        //UserDetails.gameId = "8";
        //UserDetails.gameId = "${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}";
        log('UserDetails.userId: ${UserDetails.userId}');
        //log('UserDetails.userIdToken: ${UserDetails.userIdToken}');
       // log('UserDetails.roleId: ${UserDetails.roleId}');
        log('UserDetails.gameId: ${UserDetails.gameId}');
        await sharedPreferenceData.setUserLoginDetailsInPrefs(userId: UserDetails.userId, userIdToken: UserDetails.userIdToken, gameId: UserDetails.gameId, roleId: UserDetails.roleId);
        Get.snackbar(signInModel.messege, '');
        Get.offAll(()=> IndexScreen(), transition: Transition.zoom);

        clearSignInFieldsFunction();

      }else{
        log('Fail');
        //log(signInModel.message);
        //Get.snackbar(signInModel.messege, '');
        Fluttertoast.showToast(msg: signInModel.messege);
        //Get.snackbar("Wrong Email/Password", '');
      }
    }catch(e){
      log('Error: $e');
    } finally{
      isLoading(false);
    }
  }

  clearSignInFieldsFunction() {
    emailFieldController.clear();
    passwordFieldController.clear();
  }

}