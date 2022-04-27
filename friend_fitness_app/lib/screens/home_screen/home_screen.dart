import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            const HomeScreenAppBarModule(),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const LeaderBoardModule(),
                    const SizedBox(height: 15),
                    TrackExerciseModule(),
                    const SizedBox(height: 10),
                    TrackMovementModule(),
                    const SizedBox(height: 10),
                    TrackWaterIntakeModule(),
                    const SizedBox(height: 10),
                    TrackTimeSpendOnMindFullnessModule(),
                    const SizedBox(height: 10),
                  ],
                ).commonSymmetricPadding(horizontal: 10),
              ),
            ),
          ],
        ),
      ),

      // bottomNavigationBar: ,
    );
  }
}
