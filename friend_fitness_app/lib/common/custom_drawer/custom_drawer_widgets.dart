import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/constants/enums.dart';
import 'package:friend_fitness_app/common/custom_drawer/custom_drawer_controller.dart';
import 'package:friend_fitness_app/common/sharedpreference_data/sharedpreference_data.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/screens/change_password_screen/change_password_screen.dart';
import 'package:friend_fitness_app/screens/create_game_screen/create_game_screen.dart';
import 'package:friend_fitness_app/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:friend_fitness_app/screens/profile_screen/profile_screen.dart';
import 'package:friend_fitness_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:get/get.dart';

class CustomDrawerSingleItemModule extends StatelessWidget {
  final String name;
  final String img;
  final CustomDrawerOption customDrawerOption;

  CustomDrawerSingleItemModule({
    Key? key,
    required this.name,
    required this.img,
    required this.customDrawerOption,
  }) : super(key: key);

  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();
  final screenController = Get.find<CustomDrawerController>();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
        singleItemOnTap(customDrawerScreenOption: customDrawerOption);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              spreadRadius: 3,
              blurRadius: 5,
              color: Colors.grey.shade300,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(img, height: 25, width: 25),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Image.asset(AppImages.rightArrowImg, scale: 0.95),
            ],
          ),
        ),
      ),
    );
  }

  singleItemOnTap({
    required CustomDrawerOption customDrawerScreenOption,
  }) {
    if (customDrawerScreenOption == CustomDrawerOption.profile) {
      Get.to(() => EditProfileScreen(), transition: Transition.rightToLeft);
    }  else if (customDrawerScreenOption == CustomDrawerOption.changePassword) {
      Get.to(() => ChangePasswordScreen(), transition: Transition.rightToLeft);
    } else if (customDrawerScreenOption == CustomDrawerOption.createGame) {
      Get.to(() => CreateGameScreen(), transition: Transition.rightToLeft);
    } else if (customDrawerScreenOption == CustomDrawerOption.startGame) {
      screenController.startGameFunction();
      //Get.to(() => CreateGameScreen(), transition: Transition.rightToLeft);
    } else if (customDrawerScreenOption == CustomDrawerOption.endGame) {
      log("end game id: ${UserDetails.gameId}");
      if(UserDetails.gameId == 0){
        Fluttertoast.showToast(msg: 'Please join the game');
      } else{
        screenController.endGameFunction();
      }

      //Get.to(() => CreateGameScreen(), transition: Transition.rightToLeft);
    } else if (customDrawerScreenOption == CustomDrawerOption.logout) {
      sharedPreferenceData.clearUserLoginDetailsFromPrefs();
      Get.offAll(() => SignInScreen(), transition: Transition.zoom);
      Get.snackbar('You Have Successfully Logout', '');
      // sharedPreferenceData.clearUserLoginDetailsFromPrefs();
      // Get.offAll(() => SignInScreen(), transition: Transition.rightToLeft);
      // Get.snackbar('You Have Successfully Logout', '');
    }
  }
}
