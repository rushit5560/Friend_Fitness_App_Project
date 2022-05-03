import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/constants/app_colors.dart';
import 'package:friend_fitness_app/controllers/splash_screen_controller/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLightGrey,
      body: const SafeArea(
        child: Center(
          child: Text("Friend Fitness"),
        ),
      ),
    );
  }
}
