import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/common_widgets.dart';
import 'package:friend_fitness_app/common/constants/app_images.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/controllers/group_list_screen_controller/group_list_screen_controller.dart';
import 'package:friend_fitness_app/screens/game_wise_view_members_list_screen/game_wise_view_members_list_screen.dart';
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
            "Game",
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
    return RefreshIndicator(
      onRefresh: (){
        return Future.delayed(
            const Duration(seconds: 1),(){
          screenController.getAllGameList();
        });
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 30),
            screenController.getGameList.isEmpty ?
                const Center(child: Text("No Game")):
              ListView.builder(
              itemCount: screenController.getGameList.length,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return _groupListTile(i).commonSymmetricPadding(vertical: 6, horizontal: 14);
              },
            ),
          ],
        ),
      ),

    );
  }

  Widget _groupListTile(i) {
    return GestureDetector(
      onTap: () {
        Get.to(()=> GroupChatScreen(),
            arguments: [
              screenController.getGameList[i].id.toString(),
              screenController.getGameList[i].userid.toString(),
              screenController.getGameList[i].name,
            ]);
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
                Row(
                  children: [const Text(
                    "Name: ",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold
                    ),
                  ),
                    Text(
                      screenController.getGameList[i].name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      "Rewards Points: ",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      screenController.getGameList[i].rewardpoints.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,

                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      "Join Person: ",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      screenController.getGameList[i].person.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      "Amount: ",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15,fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      screenController.getGameList[i].amount.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      "Cheat day: ",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15,fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      screenController.getGameList[i].cheatday,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),


            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    screenController.memberJoinGame(gameId: screenController.getGameList[i].id, totalPerson: screenController.getGameList[i].person);
                  },
                  child: Container(
                    width: 130,
                    height: 35,
                    decoration: BoxDecoration(
                      color: AppColors.colorDarkGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        "JOIN GAME",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),

                // UserDetails.roleId == 3 ? const SizedBox(height: 10) : Container(),
                //
                // UserDetails.roleId == 3 ?
                // GestureDetector(
                //   onTap: () {
                //     Get.to(() => GameWiseViewMembersListScreen(), arguments: screenController.getGameList[i].id);
                //     //screenController.memberJoinGame(gameId: screenController.getGameList[i].id, totalPerson: screenController.getGameList[i].person);
                //   },
                //   child: Container(
                //     width: 130,
                //     height: 35,
                //     decoration: BoxDecoration(
                //       color: AppColors.colorDarkGrey,
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     child: const Center(
                //       child: Text(
                //         "VIEW MEMBER",
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           color: Colors.white,
                //           fontSize: 13,
                //         ),
                //       ),
                //     ),
                //   ),
                // ) : Container(),
              ],
            )
          ],
        ).commonAllSidePadding(padding: 10),
      ),
    );
  }

}

