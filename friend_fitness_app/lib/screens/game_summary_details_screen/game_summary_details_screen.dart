import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/controllers/game_summary_details_screen_controller/game_summary_details_screen_controller.dart';
import 'package:friend_fitness_app/screens/game_summary_details_screen/game_summary_details_screen_widgets.dart';
import 'package:get/get.dart';

class GameSummaryDetailsScreen extends StatelessWidget {
  GameSummaryDetailsScreen({Key? key}) : super(key: key);

  final gameSummaryDetailsScreenController = Get.put(GameSummaryDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GameSummaryDetailsScreenAppBarModule(),
            Expanded(
              child: Column(
                children: [
                  Expanded(child: GameSummaryDetailsModule())
                ],
              ).commonAllSidePadding(padding: 15),
            )
          ],
        ),
      ),
    );
  }
}
