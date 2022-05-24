import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/constants/app_colors.dart';
import 'package:friend_fitness_app/common/constants/app_images.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/controllers/game_wise_view_members_list_screen_controller/game_wise_view_member_list_screen_controller.dart';
import 'package:friend_fitness_app/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:get/get.dart';

class GameWiseViewMembersAppBarModule extends StatelessWidget {
  const GameWiseViewMembersAppBarModule({Key? key}) : super(key: key);

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
          GestureDetector(
            onTap: () => Get.back(),
            child: const SizedBox(
              width: 42,
              height: 42,
              child: Icon(
                  Icons.arrow_back
              ),
            ),
          ),
          const Text(
            "View Members",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(width: 42,
            height: 42,),
        ],
      ),
    );
  }
}

class ViewMembersListModule extends StatelessWidget {
  ViewMembersListModule({Key? key}) : super(key: key);
  final screenController = Get.find<GameWiseViewMembersListScreenController>();

  @override
  Widget build(BuildContext context) {
    log('Get all Game Members List: ${screenController.gameWiseMembersList.length}');
    return RefreshIndicator(
      child: screenController.gameWiseMembersList.isEmpty ?
      const Center(child: Text("No Members")) :
      ListView.builder(
        itemCount: screenController.gameWiseMembersList.length,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, i) {
          return _leaderBoardListTile(i);
        },
      ).commonAllSidePadding(padding: 8),
      onRefresh: (){
        //return screenController.getAllGameMemberFunction();
        return Future.delayed(
            const Duration(seconds: 1),(){
          screenController.getAllGameMemberFunction();
        });
      },
    );
  }

  Widget _leaderBoardListTile(i) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.colorLightGrey1,
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration:  const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AppImages.personImg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              screenController.gameWiseMembersList[i].gamename,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            screenController.gameWiseMembersList[i].point.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ],
      ).commonAllSidePadding(padding: 12),
    ).commonAllSidePadding(padding: 5);
  }
}
