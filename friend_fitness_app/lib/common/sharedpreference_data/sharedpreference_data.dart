import 'dart:developer';

import 'package:friend_fitness_app/common/user_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData{

  String isUserLoggedInKey = "isUserLoggedInKey";
  String userIdKey = "userIdKey";
  String userIdTokenKey = "userIdToken";
  String gameIdKey = "gameIdKey";
  // String userWeightKey = "userProfile";

  // This Function Use For Set UserLoginStatus, UserId & Token in sharedPreference
  setUserLoginDetailsInPrefs({required int userId, required String userIdToken, required String gameId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Remove Old Id & Token
    prefs.remove(userIdKey);
    prefs.remove(userIdTokenKey);
     prefs.remove(gameIdKey);
    // prefs.remove(userWeightKey);

    //Add UserId, Token & UserLoggedInStatus
    prefs.setBool(isUserLoggedInKey, true);
    prefs.setInt(userIdKey, userId);
     prefs.setString(userIdTokenKey, userIdToken);
     prefs.setString(gameIdKey, gameId);
    //prefs.setString(userWeightKey, weight);

    // Now Set Prefs Data in UserDetails in Code
    UserDetails.isUserLoggedIn = prefs.getBool(isUserLoggedInKey) ?? false;
    UserDetails.userId = prefs.getInt(userIdKey) ?? 0;
    UserDetails.userIdToken = prefs.getString(userIdTokenKey) ?? "";
    UserDetails.gameId = prefs.getString(gameIdKey) ?? "";
    // UserDetails.weight = prefs.getString(userWeightKey) ?? "";

    log('UserDetails.isUserLoggedIn : ${UserDetails.isUserLoggedIn}');
    log('UserDetails.userId : ${UserDetails.userId}');
    log('UserDetails.userIdToken : ${UserDetails.userIdToken}');
    log('UserDetails.gameId : ${UserDetails.gameId}');
    // log('UserDetails.userIdToken : ${UserDetails.userProfile}');
    // log('UserDetails.weight : ${UserDetails.weight}');
  }


  /// Clear All UserLoggedIn Data
  clearUserLoginDetailsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Add UserId, Token & UserLoggedInStatus
    prefs.setBool(isUserLoggedInKey, false);
    prefs.setInt(userIdKey, 0);
    prefs.setString(userIdTokenKey, "");
     prefs.setString(gameIdKey, "");
    // prefs.setString(userWeightKey, "");
    // print('Clear isUserLoggedInKey : ${prefs.getBool(isUserLoggedInKey)}');
    // print('Clear userIdKey : ${prefs.getString(userIdKey)}');
    // print('Clear userRoleKey : ${prefs.getString(userRoleKey)}');
    // print('Clear userTokenKey : ${prefs.getString(userTokenKey)}');
    // print('Clear userWalletIdKey : ${prefs.getString(userWalletIdKey)}');
  }
}