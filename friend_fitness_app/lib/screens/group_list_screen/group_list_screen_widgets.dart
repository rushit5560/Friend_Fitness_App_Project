import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/constants/app_images.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
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
  const GroupListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return _groupListTile().commonSymmetricPadding(vertical: 6, horizontal: 14);
      },
    );
  }

  Widget _groupListTile() {
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
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: Image.asset(AppImages.groupIconImg).commonAllSidePadding(padding: 8),
            ),
            const SizedBox(width: 15),
            const Expanded(
              child: Text(
                "Group Name",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ).commonAllSidePadding(padding: 10),
      ),
    );
  }

}

