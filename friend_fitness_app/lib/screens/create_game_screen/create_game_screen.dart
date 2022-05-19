import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/controllers/create_game_screen_controller/create_game_screen_controller.dart';
import 'package:get/get.dart';

import 'create_game_screen_widgets.dart';

class CreateGameScreen extends StatelessWidget {
  CreateGameScreen({Key? key}) : super(key: key);
  final createGameScreenController = Get.put(CreateGameScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CreateGameScreenAppBarModule(),
            
            Expanded(
              child: Form(
                key: createGameScreenController.createGameFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      NameTextFieldModule(),
                      const SizedBox(height: 20),
                      DaysTextFieldModule(),
                      const SizedBox(height: 20),
                      PersonTextFieldModule(),
                      const SizedBox(height: 20),
                      AmountTextFieldModule(),
                      const SizedBox(height: 20),
                      RewardPointsTextFieldModule(),
                      const SizedBox(height: 20),
                      SelectDayDropDownModule(),
                      const SizedBox(height: 25),
                      CreateGameButtonModule()
                    ],
                  ).commonAllSidePadding(padding: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
