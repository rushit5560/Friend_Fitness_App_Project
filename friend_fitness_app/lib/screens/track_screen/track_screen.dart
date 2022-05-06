import 'package:flutter/material.dart';
import 'package:friend_fitness_app/controllers/track_screen_controller/track_screen_controller.dart';
import 'package:friend_fitness_app/screens/track_screen/track_screen_widgets.dart';
import 'package:get/get.dart';

class TrackScreen extends StatelessWidget {
  TrackScreen({Key? key}) : super(key: key);
  final trackScreenController = Get.put(TrackScrenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TrackScreenAppBarModule(),
            const SizedBox(height: 15),
            Expanded(
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
