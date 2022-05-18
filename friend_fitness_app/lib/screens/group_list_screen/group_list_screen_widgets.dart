import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/common_widgets.dart';
import 'package:friend_fitness_app/common/constants/app_images.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/controllers/group_list_screen_controller/group_list_screen_controller.dart';
import 'package:friend_fitness_app/screens/group_chat_screen/group_chat_screen.dart';
import 'package:get/get.dart';
import '../../common/constants/app_colors.dart';

class GroupListScreenAppBarModule extends StatelessWidget {
  const GroupListScreenAppBarModule({Key? key}) : super(key: key);

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
            "Groups",
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


class GroupListModule extends StatelessWidget {
  GroupListModule({Key? key}) : super(key: key);
  final screenController = Get.find<GroupListScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.getGameList.isEmpty ?
        const Center(child: Text("Empty Game")):
      ListView.builder(
      itemCount: screenController.getGameList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return _groupListTile(i).commonSymmetricPadding(vertical: 6, horizontal: 14);
      },
    );
  }

  Widget _groupListTile(i) {
    return GestureDetector(
      onTap: () {
        Get.to(()=> GroupChatScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              blurStyle: BlurStyle.outer,
              color: AppColors.colorLightGrey,
            ),
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  screenController.getGameList[i].name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ).commonAllSidePadding(padding: 10),

                Text(
                  "Rewards Points: " + screenController.getGameList[i].rewardpoints.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ).commonAllSidePadding(padding: 10),
              ],
            ),

            Text(
              "Total Person: " + screenController.getGameList[i].person.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 17,
              ),
            ).commonAllSidePadding(padding: 10),
          ],
        ),
      ),
    );
  }

}

