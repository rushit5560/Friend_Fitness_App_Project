import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/exercise_details_screen_controller/exercise_details_screen_controller.dart';
import 'exercise_details_screen_widgets.dart';


class ExerciseDetailsScreen extends StatelessWidget {
  ExerciseDetailsScreen({Key? key}) : super(key: key);
  final exerciseDetailsScreenController = Get.put(ExerciseDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ExerciseDetailsScreenAppBarModule(),
            // const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const ImageModule(),
                    const SizedBox(height: 15),
                    const TimerTextModule(),
                    const SizedBox(height: 20),
                    PlayButtonModule(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
