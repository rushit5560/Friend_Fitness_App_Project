import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:avoid_keyboard/avoid_keyboard.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
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
              child: Icon(Icons.arrow_back),
            ),
          ),
          Text(
            screenController.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(
            width: 42,
            height: 42,
          ),
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
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(const Duration(seconds: 1), () {
          screenController.getAllMessageFunction(
              gameId: screenController.gameId);
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 30),

          screenController.getAllMessageList.isEmpty
              ? const Center(child: Text("No message"))
              : Expanded(
                  child: ListView.builder(
                   // controller: screenController.scrollController,
                    reverse: true,
                    itemCount: screenController.getAllMessageList.length,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      /// For reverse get message list and scrolling messages
                      int reverseIndex = screenController.getAllMessageList.length - 1 - i;
                      log('screenController.getAllMessageList[i].userid: ${screenController.getAllMessageList[i].userid}');
                      log('UserDetails.userId: ${UserDetails.userId}');
                      /*return SingleMessageBubble(
                isSendByMe: screenController.userChatList[i].isSendByMe,
                message: screenController.userChatList[i].message,
              );*/
                      return messageList(i, reverseIndex);
                    },
                  ).commonSymmetricPadding(horizontal: 15),
                ),
        ],
      ),
    );
  }

  Widget messageList(i, reverseIndex) {
    return screenController.getAllMessageList[reverseIndex].userid == UserDetails.userId
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
                padding: const EdgeInsets.all(12),

                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //const SizedBox(width: 50),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    screenController.getAllMessageList[reverseIndex].message,
                                    style: const TextStyle(fontSize: 12),
                                  ),


                                  const SizedBox(height: 10),
                                  screenController.getAllMessageList[reverseIndex].file.isNotEmpty
                                      ? SizedBox(
                                      height: 80,
                                      width: 80,
                                      // decoration: BoxDecoration(
                                      //     borderRadius: BorderRadius.circular(10.0),
                                      //     //border: Border.all(color: AppColors.colorLightGrey),
                                      //     boxShadow: [
                                      //       BoxShadow(
                                      //           blurRadius: 1,
                                      //           blurStyle: BlurStyle.outer,
                                      //           color: Colors.grey.shade500
                                      //       )
                                      //     ]
                                      // ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10.0),
                                        child: Image.network(
                                          "https://squadgame.omdemo.co.in/asset/uploads/chat/" +
                                              screenController
                                                  .getAllMessageList[reverseIndex].file,
                                          //     height: 150, width: 150, fit: BoxFit.cover),
                                        ),
                                      ))
                                      : Container()
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              // height: 150, width: 150,
                              // decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(10.0),
                              //     //border: Border.all(color: AppColors.colorLightGrey),
                              //     boxShadow: [
                              //       BoxShadow(
                              //           blurRadius: 1,
                              //           blurStyle: BlurStyle.outer,
                              //           color: Colors.grey.shade500
                              //       )
                              //     ]
                              // ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: screenController.getAllMessageList[reverseIndex].profile.isNotEmpty
                                    ? Image.network("https://squadgame.omdemo.co.in/asset/uploads/" + screenController.getAllMessageList[reverseIndex].profile,fit: BoxFit.cover,
                                    height: 40,
                                    width: 40)
                                    : Container(),
                              ),
                            )
                          ],
                        ),
                      ),


                    ])),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              padding: const EdgeInsets.all(12),
              // decoration: BoxDecoration(
              //   // color: AppColors.colorLightGrey,
              //   boxShadow: [
              //     BoxShadow(
              //       blurRadius: 3,
              //       blurStyle: BlurStyle.outer,
              //       color: AppColors.colorLightGrey,
              //     ),
              //   ],
              //   borderRadius: const BorderRadius.only(
              //     topRight: Radius.circular(15),
              //     topLeft: Radius.circular(15),
              //     bottomRight: Radius.circular(15),
              //     bottomLeft: Radius.circular(15),
              //   ),
              // ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // height: 150, width: 150,
                          // decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(10.0),
                          //     //border: Border.all(color: AppColors.colorLightGrey),
                          //     boxShadow: [
                          //       BoxShadow(
                          //           blurRadius: 1,
                          //           blurStyle: BlurStyle.outer,
                          //           color: Colors.grey.shade500
                          //       )
                          //     ]
                          // ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: screenController
                                .getAllMessageList[reverseIndex].profile.isNotEmpty
                                ? Image.network(
                                "https://squadgame.omdemo.co.in/asset/uploads/" +
                                    screenController
                                        .getAllMessageList[reverseIndex].profile,
                                fit: BoxFit.cover,
                                height: 40,
                                width: 40)
                                : Container(),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              screenController.getAllMessageList[reverseIndex].message,
                              style: const TextStyle(fontSize: 12),
                            ),


                            const SizedBox(height: 10),
                            screenController.getAllMessageList[reverseIndex].file.isNotEmpty
                                ? SizedBox(
                                height: 80,
                                width: 80,
                                // decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(10.0),
                                //     //border: Border.all(color: AppColors.colorLightGrey),
                                //     boxShadow: [
                                //       BoxShadow(
                                //           blurRadius: 1,
                                //           blurStyle: BlurStyle.outer,
                                //           color: Colors.grey.shade500
                                //       )
                                //     ]
                                // ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    "https://squadgame.omdemo.co.in/asset/uploads/chat/" +
                                        screenController
                                            .getAllMessageList[reverseIndex].file,
                                    //     height: 150, width: 150, fit: BoxFit.cover),
                                  ),
                                ))
                                : Container()
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
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
class SendMessageModule extends StatefulWidget {
  //SendMessageModule({Key? key}) : super(key: key);

  SendMessageModule({Key? key}) : super(key: key);

  @override
  State<SendMessageModule> createState() => _SendMessageModuleState();
}

class _SendMessageModuleState extends State<SendMessageModule> {
  final screenController = Get.find<GroupChatScreenController>();

  final ImagePicker imagePicker = ImagePicker();

  final FieldValidator fieldValidator = FieldValidator();

  bool emojiShowing = false;

  _onEmojiSelected(Emoji emoji) {
    screenController.userMessageFieldController
      ..text += emoji.emoji.toString()
      ..selection = TextSelection.fromPosition(TextPosition(
          offset: screenController.userMessageFieldController.text.length));
  }

  _onBackspacePressed() {
    screenController.userMessageFieldController
      ..text = screenController.userMessageFieldController.text.characters
          .skipLast(1)
          .toString()
      ..selection = TextSelection.fromPosition(TextPosition(
          offset: screenController.userMessageFieldController.text.length));
  }
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [


        Row(
          children: [
            GestureDetector(
              onTap: () async {
                gallery();
              },
              child: Container(
                height: 52,
                padding: EdgeInsets.symmetric(horizontal: 12),
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
                child: const Center(
                  child: Icon(Icons.image),
                ),
              ),
            ),
            const SizedBox(width: 10),

            /* GestureDetector(
            onTap: (){
              setState(() {
                emojiShowing = !emojiShowing;
              });
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
                child: Icon(Icons.emoji_emotions)),
          ),*/

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
                    focusNode: screenController.focusNode,
                    controller: screenController.userMessageFieldController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.grey,
                    decoration:
                        messageInputDecoration(hintText: "Type a something", screenController: screenController),
                    validator: (value) => fieldValidator.validateEmail(value!),
                  )
                ],
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () async {
                // if(screenController.userMessageFieldController.text.isEmpty) {
                //   log("Message : ${screenController.userMessageFieldController.text}");
                // } else {
                //   log("Message1 : ${screenController.userMessageFieldController.text}");
                // }

                await screenController.sendMessageApi();
                screenController.userMessageFieldController.clear();
                //screenController.scrollController.animateTo(screenController.scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
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
                  child: Image.asset(AppImages.sendImg, scale: 1.5)
                      .commonAllSidePadding(),
                ),
              ),
            ),
          ],
        ).commonSymmetricPadding(horizontal: 15),
        Obx(()=>
          Offstage(
            offstage: !screenController.isEmojiVisible.value,
            child: SizedBox(
              height: 250,
              child: EmojiPicker(
                  onEmojiSelected: (Category category, Emoji emoji) {
                    //_onEmojiSelected(emoji);
                    log('emoji: ${emoji.name}');
                    setState(() {
                      screenController.userMessageFieldController.text = screenController.userMessageFieldController.text + emoji.emoji;
                      log('screenController.userMessageFieldController.text: ${screenController.userMessageFieldController.text}');
                    });
                  },
                  onBackspacePressed: _onBackspacePressed,
                  config: Config(
                      columns: 7,
                      // Issue: https://github.com/flutter/flutter/issues/28894
                      emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                      verticalSpacing: 0,
                      horizontalSpacing: 0,
                      initCategory: Category.RECENT,
                      bgColor: const Color(0xFFF2F2F2),
                      indicatorColor: Colors.blue,
                      iconColor: Colors.grey,
                      iconColorSelected: Colors.blue,
                      progressIndicatorColor: Colors.blue,
                      backspaceColor: Colors.blue,
                      skinToneDialogBgColor: Colors.white,
                      skinToneIndicatorColor: Colors.grey,
                      enableSkinTones: true,
                      showRecentsTab: true,
                      recentsLimit: 28,
                      noRecents: const Text(
                        'No Recents',
                        style: TextStyle(fontSize: 20, color: Colors.black26),
                        textAlign: TextAlign.center,
                      ),
                      tabIndicatorAnimDuration: kTabScrollDuration,
                      categoryIcons: const CategoryIcons(),
                      buttonMode: ButtonMode.MATERIAL)),
            ),
          ),
        ),
      ],
    );
  }

  void gallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      screenController.addPhoto = File(image.path);
      screenController.loadUI();
    } else {}
  }

  InputDecoration messageInputDecoration({required String hintText, required GroupChatScreenController screenController}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      filled: true,
      fillColor: Colors.white,
      prefixIcon: GestureDetector(
          onTap: () {
            // setState(() {
            //   emojiShowing = !emojiShowing;
            // });
            screenController.isEmojiVisible.value =! screenController.isEmojiVisible.value;
            screenController.focusNode.unfocus();
            screenController.focusNode.canRequestFocus = true;
          },
          child: const Icon(Icons.emoji_emotions, size: 28)),
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
}
