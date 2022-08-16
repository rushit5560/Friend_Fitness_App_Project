import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/common_widgets.dart';
import 'package:friend_fitness_app/common/custom_drawer/custom_drawer.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/controllers/profile_screen_controller/profile_screen_controller.dart';
import 'package:get/get.dart';

import '../../controllers/home_screen_controller/home_screen_controller.dart';
import 'home_screen_widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final homeScreenController = Get.put(HomeScreenController());

  @override
  void initState(){
    // homeScreenController.loadUI();
    log("Home Init State Call");
    homeScreenController.getAllGameMemberFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Obx(
          () => homeScreenController.isLoading.value
              ? const CustomCircularProgressIndicator()
              : Column(
                  children: [
                    const HomeScreenAppBarModule(),
                    const SizedBox(height: 15),
                    LeaderBoardModule().commonSymmetricPadding(horizontal: 10),

                    const SizedBox(height: 15),

                    UserDetails.roleId == 3 ?
                    StartGameButtonModule() : Container(),

                    const SizedBox(height: 15),

                    UserDetails.roleId == 3 ?
                    EndGameButtonModule() : Container(),
                  ],
                ),
        ),
      ),

      // bottomNavigationBar: ,
    );
  }
}
