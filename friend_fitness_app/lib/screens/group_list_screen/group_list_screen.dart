import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/common_widgets.dart';
import 'package:friend_fitness_app/controllers/group_list_screen_controller/group_list_screen_controller.dart';
import 'package:get/get.dart';

import 'group_list_screen_widgets.dart';

class GroupListScreen extends StatefulWidget {
  GroupListScreen({Key? key}) : super(key: key);

  @override
  State<GroupListScreen> createState() => _GroupListScreenState();
}

class _GroupListScreenState extends State<GroupListScreen> {
  final groupScreenController = Get.put(GroupListScreenController());

  @override
  void initState() {
    super.initState();
    groupScreenController.getAllGameList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => groupScreenController.isLoading.value
              ? const CustomCircularProgressIndicator()
              : Column(
                  children: [
                    const GroupListScreenAppBarModule(),
                    const SizedBox(height: 20),
                    Expanded(child: GroupListModule()),
                  ],
                ),
        ),
      ),
      /*body: SafeArea(
        child: Obx(()=>
        groupChatScreenController.isLoading.value ?
        const CustomCircularProgressIndicator():
        Column(
          children: [
            GroupChatScreenAppBarModule(),
            const SizedBox(height: 10),
            Expanded(
              child: GroupChatListModule(),
            ),
            const SizedBox(height: 10),
            SendMessageModule(),
            const SizedBox(height: 10),
          ],
        ),
        ),
      ),*/
    );
  }
}
