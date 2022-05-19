import 'dart:async';
import 'dart:developer';

import 'package:friend_fitness_app/common/sharedpreference_data/sharedpreference_data.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/screens/index_screen/index_screen.dart';
import 'package:friend_fitness_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController{
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  goToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserDetails.isUserLoggedIn = prefs.getBool(sharedPreferenceData.isUserLoggedInKey) ?? false;
    UserDetails.userId = prefs.getInt(sharedPreferenceData.userIdKey) ?? 0;
    UserDetails.gameId = prefs.getString(sharedPreferenceData.gameIdKey) ?? "";
    UserDetails.userIdToken = prefs.getString(sharedPreferenceData.userIdTokenKey) ?? "";
    UserDetails.roleId = prefs.getInt(sharedPreferenceData.roleIdKey) ?? 0;
    //UserDetails.weight = prefs.getString(sharedPreferenceData.userWeightKey) ?? "";
    bool isLoggedIn = UserDetails.isUserLoggedIn;
    log('isLoggedIn: $isLoggedIn');
    if(isLoggedIn == true) {
      Get.offAll(()=> IndexScreen(), transition: Transition.zoom);
    } else {
      Get.offAll(()=> SignInScreen(), transition: Transition.zoom);
    }

  }

  @override
  void onInit() {
    Timer(const Duration(seconds: 2), () => goToNextScreen());
    super.onInit();
  }
}