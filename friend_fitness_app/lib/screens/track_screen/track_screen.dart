import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/common_widgets.dart';
import 'package:friend_fitness_app/common/custom_drawer/custom_drawer.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/controllers/track_screen_controller/track_screen_controller.dart';
import 'package:friend_fitness_app/screens/track_screen/track_screen_widgets.dart';
import 'package:get/get.dart';

class TrackScreen extends StatefulWidget {
  TrackScreen({Key? key}) : super(key: key);

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  final trackScreenController = Get.put(TrackScreenController());

  @override
  void initState() {
    trackScreenController.getAllPositiveCategoryFromFirebaseFunction();
    trackScreenController.getAllNegativeCategoryFromFirebaseFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('track UserDetails.gameId: ${UserDetails.gameId}');
    return Scaffold(
      drawer: CustomDrawer(),
      body: Obx(
        () => trackScreenController.isLoading.value
            ? const CustomCircularProgressIndicator()
            : SafeArea(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const TrackScreenAppBarModule(),
                    const SizedBox(height: 15),

                    (int.parse(UserDetails.gameId) == 0) ?
                        const Text("Please join with any game"):

                    Expanded(
                      child: Column(
                        children: [
                          MainTabsModule(),
                          Expanded(
                            child: Container(
                                child: trackScreenController.isPositiveSelected.value ?
                                PositivePointModule() :
                                NegativePointModule()
                            ),
                          )
                        ],
                      ),
                    )

                    /*Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TrackExerciseModule(),
                            const SizedBox(height: 10),
                            TrackMovementModule(),
                            const SizedBox(height: 10),
                            TrackWaterIntakeModule(),
                            const SizedBox(height: 10),
                            TrackTimeSpendOnMindFullnessModule(),
                            const SizedBox(height: 10),
                          ],
                        ).commonAllSidePadding(),
                      ),
                    )*/
                  ],
                ),
              ),
      ),
    );
  }
}
