import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/app_colors.dart';
import '../../controllers/group_chat_screen_controller/group_chat_screen_controller.dart';


class GroupChatScreenAppBarModule extends StatelessWidget {
  const GroupChatScreenAppBarModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          color: AppColors.colorLightGrey
        //color: Colors.grey
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          const Text(
            "Group Name",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(),
        ],
      ),
    );
  }
}

// class GroupChatListModule extends StatelessWidget {
//   GroupChatListModule({Key? key}) : super(key: key);
//   final screenController = Get.find<GroupChatScreenController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder();
//   }
// }
