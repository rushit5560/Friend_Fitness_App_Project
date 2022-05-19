import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/common_widgets.dart';
import 'package:friend_fitness_app/common/custom_drawer/custom_drawer.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:get/get.dart';

import '../../controllers/home_screen_controller/home_screen_controller.dart';
import 'home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeScreenController = Get.put(HomeScreenController());

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
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                              child: homeScreenController.isLoading.value
                                  ? const CustomCircularProgressIndicator() :
                              LeaderBoardModule()),
                        ],
                      ).commonSymmetricPadding(horizontal: 10),
                      ),
                  ],
                ),
        ),
      ),

      // bottomNavigationBar: ,
    );
  }
}
