import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/common_widgets.dart';
import 'package:get/get.dart';
import '../../controllers/group_chat_screen_controller/group_chat_screen_controller.dart';
import 'group_chat_screen_widgets.dart';



class GroupChatScreen extends StatelessWidget {
  //GroupChatScreen({Key? key}) : super(key: key);
  GroupChatScreen({Key? key}) : super(key: key);
  final groupChatScreenController = Get.put(GroupChatScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
      ),
    );
  }
}
