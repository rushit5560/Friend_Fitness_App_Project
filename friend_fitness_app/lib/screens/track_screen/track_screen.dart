import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/common_widgets.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/controllers/track_screen_controller/track_screen_controller.dart';
import 'package:friend_fitness_app/screens/track_screen/track_screen_widgets.dart';
import 'package:get/get.dart';

class TrackScreen extends StatelessWidget {
  TrackScreen({Key? key}) : super(key: key);
  final trackScreenController = Get.put(TrackScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => trackScreenController.isLoading.value
            ? const CustomCircularProgressIndicator()
            : SafeArea(
                child: Column(
                  children: [
                    const TrackScreenAppBarModule(),
                    const SizedBox(height: 15),
                    MainTabsModule(),
                    Expanded(
                      child: Container(
                        child: trackScreenController.isPositiveSelected.value ?
                          const PositivePointModule() :
                        NegativePointModule()
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
