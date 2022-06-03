import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/common_widgets.dart';
import 'package:get/get.dart';
import '../../controllers/group_chat_screen_controller/group_chat_screen_controller.dart';
import 'group_chat_screen_widgets.dart';



class GroupChatScreen extends StatefulWidget {
  //GroupChatScreen({Key? key}) : super(key: key);
  GroupChatScreen({Key? key}) : super(key: key);

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final groupChatScreenController = Get.put(GroupChatScreenController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    groupChatScreenController.getAllMessageFunction(gameId: groupChatScreenController.gameId);
  }

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

              WillPopScope(
                onWillPop: (){
                  if(groupChatScreenController.isEmojiVisible.value){
                    groupChatScreenController.isEmojiVisible.value = false;
                  } else{
                    Get.back();
                  }
                  return Future.value(false);
                },
                child: Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: GroupChatListModule(),
                      ),
                      const SizedBox(height: 10),
                      SendMessageModule(),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
