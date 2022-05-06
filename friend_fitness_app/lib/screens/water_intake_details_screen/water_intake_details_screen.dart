import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/common_widgets.dart';
import 'package:get/get.dart';

import '../../controllers/water_intake_details_screen_controller/water_intake_details_screen_controller.dart';
import 'water_intake_details_screen_widgets.dart';

class WaterIntakeDetailsScreen extends StatelessWidget {
  WaterIntakeDetailsScreen({Key? key}) : super(key: key);
  final waterIntakeDetailsScreenController =
      Get.put(WaterIntakeDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => waterIntakeDetailsScreenController.isLoading.value
              ? const CustomCircularProgressIndicator()
              : Column(
                  children: [
                    WaterIntakeDetailsScreenAppBarModule(),
                    const SizedBox(height: 10),
                    Expanded(child: WaterIntakeListModule()),
                  ],
                ),
        ),
      ),
    );
  }
}
