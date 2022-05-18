import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/common_widgets.dart';
import 'package:friend_fitness_app/controllers/group_list_screen_controller/group_list_screen_controller.dart';
import 'package:get/get.dart';

import 'group_list_screen_widgets.dart';

class GroupListScreen extends StatelessWidget {
  GroupListScreen({Key? key}) : super(key: key);
  final groupScreenController = Get.put(GroupListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GroupListScreenAppBarModule(),
            SizedBox(height: 15),
            Expanded(
              child: groupScreenController.isLoading.value ?
                   const Center(child: CustomCircularProgressIndicator()):
              GroupListModule(),
            ),
          ],
        ),
      ),
    );
  }
}
