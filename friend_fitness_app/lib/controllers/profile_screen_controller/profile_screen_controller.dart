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
  //List<User> profileList = [];
  String name = "";
  String email = "";
  File ? profile;
  File? beforeImageProfile;
  File? afterImageProfile;
  //RxString profileImage = "".obs;

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
    String url = "https://fitness-app-f51fa-default-rtdb.firebaseio.com/profile.json";
    log('url: $url');
    log('UserDetails.userIdToken: ${UserDetails.userIdToken}');
    try{
      // Map<String, dynamic> data = {
      //   "idToken" : UserDetails.userIdToken
      // };
      //
      // log('data: $data');
      http.Response response = await http.get(Uri.parse(url));
      log('Response : ${response.body}');
      GetProfileModel getProfileModel = GetProfileModel.fromJson(json.decode(response.body));
      // log('signInModel: ${signUpModel.name}');
      isSuccessStatusCode = response.statusCode.obs;
      log('isStatus: $isSuccessStatusCode');

      if(isSuccessStatusCode.value == 200){
        log('Success');
        nameFieldController.text = getProfileModel.name;
        emailFieldController.text = getProfileModel.email;
        weightFieldController.text = getProfileModel.weight;
        measurementFieldController.text = getProfileModel.measurement;
        heightFieldController.text = getProfileModel.height;
        profile = File(getProfileModel.profileImage);
        beforeImageProfile = File(getProfileModel.beforeImage);
        afterImageProfile = File(getProfileModel.afterImage);

        //log('profileList: $profileList');
      }else{
        Fluttertoast.showToast(msg: "Token Expired, Please Login Again");
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
    String uniqueId = "${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}${DateTime.now().hour}${DateTime.now().minute}${DateTime.now().second}${DateTime.now().millisecond}";
    String url = "https://fitness-app-f51fa-default-rtdb.firebaseio.com/profile.json";
    log('url: $url');
    log('UserDetails.userId: ${UserDetails.userId}');
    try{
      Map<String, dynamic> data = {
        "id" : uniqueId,
        "user_id": UserDetails.userId,
        "profile_image" : profile!.path,
        "name" : nameFieldController.text.trim(),
        "email" : emailFieldController.text.trim(),
        "weight" : weightFieldController.text.trim(),
        "measurement": measurementFieldController.text.trim(),
        "height" : heightFieldController.text.trim(),
        "before_image" : beforeImageProfile!.path,
        "after_image" : afterImageProfile!.path
      };

      log('data: $data');
      http.Response response = await http.patch(Uri.parse(url), body: jsonEncode(data));
      log('Response : ${response.body}');
      UpdateProfileModel getProfileModel = UpdateProfileModel.fromJson(json.decode(response.body));
      // log('signInModel: ${signUpModel.name}');
      isSuccessStatusCode = response.statusCode.obs;
      log('isStatus: $isSuccessStatusCode');

      if(isSuccessStatusCode.value == 200){
        log('Success');
        //UserDetails.weight = weightFieldController.text.trim();
        //SharedPreferenceData().setUserLoginDetailsInPrefs(weight: UserDetails.weight, userId: "", userProfile: "", userIdToken: "");
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