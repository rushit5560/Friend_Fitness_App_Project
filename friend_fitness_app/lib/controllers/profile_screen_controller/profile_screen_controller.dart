import 'dart:convert';
import 'dart:developer';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/model/get_profile_model/get_profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ProfileScreenController extends GetxController{

  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;
  List<User> profileList = [];
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
}