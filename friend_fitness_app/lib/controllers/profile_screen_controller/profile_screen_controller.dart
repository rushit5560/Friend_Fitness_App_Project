import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/sharedpreference_data/sharedpreference_data.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/model/get_profile_model/get_profile_model.dart';
import 'package:friend_fitness_app/model/update_profile_model/update_profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ProfileScreenController extends GetxController{

  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;
  List<User> profileList = [];
  String name = "";
  String email = "";
  File ? profile;

  TextEditingController nameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController weightFieldController = TextEditingController();
  TextEditingController measurementFieldController = TextEditingController();
  TextEditingController heightFieldController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfileWithFirebaseAPI();
  }

  getProfileWithFirebaseAPI() async {
    isLoading(true);
    String url = "https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=AIzaSyDErCea5X6odORA9eA3SZYtATsXUbVCH0w";
    log('url: $url');
    log('UserDetails.userIdToken: ${UserDetails.userIdToken}');
    try{
      Map<String, dynamic> data = {
        "idToken" : UserDetails.userIdToken
      };

      log('data: $data');
      http.Response response = await http.post(Uri.parse(url), body: data);
      log('Response : ${response.body}');
      GetProfileModel getProfileModel = GetProfileModel.fromJson(json.decode(response.body));
      // log('signInModel: ${signUpModel.name}');
      isSuccessStatusCode = response.statusCode.obs;
      log('isStatus: $isSuccessStatusCode');

      if(isSuccessStatusCode.value == 200){
        log('Success');
        profileList = getProfileModel.users;
        for(int i = 0; i < profileList.length ; i++){
          nameFieldController.text = profileList[i].displayName;
          emailFieldController.text = profileList[i].email;
          profile = File(profileList[i].photoUrl);
          //UserDetails.weight = weightFieldController.text.trim();
          //SharedPreferenceData().setUserLoginDetailsInPrefs(weight: UserDetails.weight);
          log('name: ${profileList[i].displayName}');
          log('email: ${profileList[i].email}');
          log('profile: ${profileList[i].photoUrl}');
        }

        log('profileList: $profileList');
      }else{
        log('Fail');
      }
    }catch(e){
      log('Error: $e');
    } finally{
      isLoading(false);
    }
  }

  updateProfileWithFirebaseAPI() async {
    isLoading(true);
    String url = "https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyDErCea5X6odORA9eA3SZYtATsXUbVCH0w";
    log('url: $url');
    log('UserDetails.userIdToken: ${UserDetails.userIdToken}');
    try{
      Map<String, dynamic> data = {
        "idToken" : UserDetails.userIdToken,
        "displayName": nameFieldController.text.trim(),
        "photoUrl" : profile!.path,
        "returnSecureToken" : "true",
        "email" : emailFieldController.text.trim(),
        "weight" : weightFieldController.text.trim(),
        "measurement": measurementFieldController.text.trim(),
        "height" : heightFieldController.text.trim()
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
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}