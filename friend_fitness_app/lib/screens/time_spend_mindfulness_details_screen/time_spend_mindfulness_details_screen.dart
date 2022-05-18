import 'package:flutter/material.dart';
import 'package:friend_fitness_app/screens/time_spend_mindfulness_details_screen/time_spend_mindfulness_details_screen_widgets.dart';

class TimeSpendMindfulnessDetailsScreen extends StatelessWidget {
  const TimeSpendMindfulnessDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // child: Obx(
        //       () => exerciseDetailsScreenController.isLoading.value
        //       ? const CustomCircularProgressIndicator()
        //       :
        child : Column(
          children: [
            TimeSpendDetailsScreenAppBarModule(),
            const SizedBox(height: 15),
            Expanded(
              // child: SingleChildScrollView(
              //   child: Column(
              //     children: [
              //       const ImageModule(),
              //       const SizedBox(height: 15),
              //       const TimerTextModule(),
              //       const SizedBox(height: 20),
              //       PlayButtonModule(),
              //       const SizedBox(height: 20),
              //     ],
              //   ),
              // ),
              child: TimeSpendDetailsListModule(),
            ),
          ],
        ),
        //),
      ),
    );
  }
}
