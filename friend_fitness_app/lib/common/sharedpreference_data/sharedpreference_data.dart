import 'dart:developer';

import 'package:friend_fitness_app/common/user_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData{

  String isUserLoggedInKey = "isUserLoggedInKey";
  String userIdKey = "userIdKey";
  String userIdTokenKey = "userIdToken";
  String userProfileKey = "userProfile";
  String userWeightKey = "userProfile";

  // This Function Use For Set UserLoginStatus, UserId & Token in sharedPreference
  setUserLoginDetailsInPrefs({required String userId, required String userIdToken, required String userProfile}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Remove Old Id & Token
    prefs.remove(userIdKey);
    prefs.remove(userIdTokenKey);
    prefs.remove(userProfileKey);
    prefs.remove(userWeightKey);

    //Add UserId, Token & UserLoggedInStatus
    prefs.setBool(isUserLoggedInKey, true);
    prefs.setString(userIdKey, userId);
    prefs.setString(userIdTokenKey, userIdToken);
    prefs.setString(userProfileKey, userProfile);
    //prefs.setString(userWeightKey, weight);

    // Now Set Prefs Data in UserDetails in Code
    UserDetails.isUserLoggedIn = prefs.getBool(isUserLoggedInKey) ?? false;
    UserDetails.userId = prefs.getString(userIdKey) ?? "";
    UserDetails.userIdToken = prefs.getString(userIdTokenKey) ?? "";
    UserDetails.userProfile = prefs.getString(userProfileKey) ?? "";
    UserDetails.weight = prefs.getString(userWeightKey) ?? "";

    log('UserDetails.isUserLoggedIn : ${UserDetails.isUserLoggedIn}');
    log('UserDetails.userId : ${UserDetails.userId}');
    log('UserDetails.userIdToken : ${UserDetails.userIdToken}');
    log('UserDetails.userIdToken : ${UserDetails.userProfile}');
    log('UserDetails.weight : ${UserDetails.weight}');
  }


  /// Clear All UserLoggedIn Data
  clearUserLoginDetailsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Add UserId, Token & UserLoggedInStatus
    prefs.setBool(isUserLoggedInKey, false);
    prefs.setString(userIdKey, "");
    prefs.setString(userIdTokenKey, "");
    prefs.setString(userProfileKey, "");
    prefs.setString(userWeightKey, "");
    // print('Clear isUserLoggedInKey : ${prefs.getBool(isUserLoggedInKey)}');
    // print('Clear userIdKey : ${prefs.getString(userIdKey)}');
    // print('Clear userRoleKey : ${prefs.getString(userRoleKey)}');
    // print('Clear userTokenKey : ${prefs.getString(userTokenKey)}');
    // print('Clear userWalletIdKey : ${prefs.getString(userWalletIdKey)}');
  }
}