import 'package:flutter/material.dart';
import 'package:friend_fitness_app/controllers/game_wise_view_members_list_screen_controller/game_wise_view_member_list_screen_controller.dart';
import 'package:friend_fitness_app/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:friend_fitness_app/screens/game_wise_view_members_list_screen/game_wise_view_members_list_screen_widgets.dart';
import 'package:get/get.dart';

class GameWiseViewMembersListScreen extends StatelessWidget {
  GameWiseViewMembersListScreen({Key? key}) : super(key: key);

  final screenController = Get.put(GameWiseViewMembersListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const GameWiseViewMembersAppBarModule(),

            Expanded(
              child: ViewMembersListModule(),
            )
          ],
        ),
      ),
    );
  }
}
