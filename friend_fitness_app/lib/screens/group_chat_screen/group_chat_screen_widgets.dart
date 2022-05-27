import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_images.dart';
import '../../common/field_validation.dart';
import '../../controllers/group_chat_screen_controller/group_chat_screen_controller.dart';


class GroupChatScreenAppBarModule extends StatelessWidget {
  GroupChatScreenAppBarModule({Key? key}) : super(key: key);
  final screenController = Get.find<GroupChatScreenController>();

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
          Text(
            screenController.name,
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

class GroupChatListModule extends StatelessWidget {
  GroupChatListModule({Key? key}) : super(key: key);
  final screenController = Get.find<GroupChatScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.getAllMessageList.isEmpty ?
        const Center(child: Text("No message")):
      ListView.builder(
      itemCount: screenController.getAllMessageList.length,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        log('screenController.getAllMessageList[i].userid: ${screenController.getAllMessageList[i].userid}');
        log('UserDetails.userId: ${UserDetails.userId}');
        /*return SingleMessageBubble(
          isSendByMe: screenController.userChatList[i].isSendByMe,
          message: screenController.userChatList[i].message,
        );*/
        return messageList(i);
      },
    ).commonSymmetricPadding(horizontal: 15);
  }

  Widget messageList(i){
    return screenController.getAllMessageList[i].userid == UserDetails.userId ?
      Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        // color: AppColors.colorLightGrey,
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            blurStyle: BlurStyle.outer,
            color: AppColors.colorLightGrey,
          ),
        ],
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            screenController.getAllMessageList[i].message!,
            style: const TextStyle(fontSize: 12),
          ),
          screenController.profile != null ?
          Container(
            height: 150, width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                //border: Border.all(color: AppColors.colorLightGrey),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 1,
                      blurStyle: BlurStyle.outer,
                      color: Colors.grey.shade500
                  )
                ]
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.file(screenController.profile!,
                  height: 150, width: 150, fit: BoxFit.cover),
            ),
          ):
          Container()
        ],
      ),
    ) :
    Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        // color: AppColors.colorLightGrey,
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            blurStyle: BlurStyle.outer,
            color: AppColors.colorLightGrey,
          ),
        ],
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            screenController.getAllMessageList[i].message!,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}


// class SingleMessageBubble extends StatelessWidget {
//   final bool isSendByMe;
//   final String message;
//
//   const SingleMessageBubble(
//       {Key? key, required this.isSendByMe, required this.message})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(5),
//       padding: isSendByMe
//           ? const EdgeInsets.only(left: 40)
//           : const EdgeInsets.only(right: 40),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Column(
//             mainAxisAlignment:
//             isSendByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
//             crossAxisAlignment:
//             isSendByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(15),
//                 decoration: BoxDecoration(
//                   // color: AppColors.colorLightGrey,
//                   boxShadow: [
//                     BoxShadow(
//                       blurRadius: 6,
//                       blurStyle: BlurStyle.outer,
//                       color: AppColors.colorLightGrey,
//                     ),
//                   ],
//                   borderRadius: BorderRadius.only(
//                     topRight: const Radius.circular(15),
//                     topLeft: const Radius.circular(15),
//                     bottomRight: Radius.circular(isSendByMe ? 0 : 15),
//                     bottomLeft: Radius.circular(isSendByMe ? 15 : 0),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: isSendByMe
//                       ? CrossAxisAlignment.end
//                       : CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       message,
//                       style: const TextStyle(fontSize: 12),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

/*class MessagesList extends StatelessWidget {
  //MessagesList({Key? key, required this.i}) : super(key: key);
  int index;
  MessagesList({required this.index});

  final screenController = Get.find<GroupChatScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        // color: AppColors.colorLightGrey,
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            blurStyle: BlurStyle.outer,
            color: AppColors.colorLightGrey,
          ),
        ],
        borderRadius: BorderRadius.only(
          topRight: const Radius.circular(15),
          topLeft: const Radius.circular(15),
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            screenController.getAllMessageList[index].message!,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}*/



/// Email Field
class SendMessageModule extends StatelessWidget {
  //SendMessageModule({Key? key}) : super(key: key);

  SendMessageModule({Key? key}) : super(key: key);
  final screenController = Get.find<GroupChatScreenController>();
  final ImagePicker imagePicker = ImagePicker();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: (){
            gallery();
          },
          child: Container(
            height: 52, width: 50,
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
              child: Icon(Icons.image)),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Stack(
            children: [
              Container(
                height: 52,
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
              ),
              TextFormField(
                controller: screenController.userMessageFieldController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.grey,
                decoration: messageInputDecoration(hintText: "Type a something"),
                validator: (value) => fieldValidator.validateEmail(value!),
              ),
            ],
          ),
        ),

        const SizedBox(width: 10),

        GestureDetector(
          onTap: () {
            // if(screenController.userMessageFieldController.text.isEmpty) {
            //   log("Message : ${screenController.userMessageFieldController.text}");
            // } else {
            //   log("Message1 : ${screenController.userMessageFieldController.text}");
            // }
            screenController.sendMessageApi();
            screenController.userMessageFieldController.clear();
          },
          child: Container(
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  blurStyle: BlurStyle.outer,
                  color: AppColors.colorLightGrey,
                ),
              ],
            ),
            child: Center(
              child: Image.asset(AppImages.sendImg,
              scale: 1.5).commonAllSidePadding(),
            ),
          ),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 15);
  }

  void gallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if(image != null){
      screenController.profile = File(image.path);
      screenController.loadUI();
    } else{
    }
  }
}


InputDecoration messageInputDecoration(
    {required String hintText}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.grey),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade200)),
    focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade200)),
    errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade200)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade200)),
  );
}