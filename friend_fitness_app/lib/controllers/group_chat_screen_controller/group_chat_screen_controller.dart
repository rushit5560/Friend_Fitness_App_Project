import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupChatScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  TextEditingController userMessageFieldController = TextEditingController();

  List<UserChatMessageModel> userChatList = [
    UserChatMessageModel(isSendByMe: false, message: "Hi lorem Ipsum dummy text ever since the 150s, when an unknown printer to ok a gallery of type "),
    UserChatMessageModel(isSendByMe: false, message: "Hi lorem Ipsum dummy text ever"),
    UserChatMessageModel(isSendByMe: true, message: "Hi lorem Ipsum dummy text ever since the 150s, when an unknown printer to ok a gallery of type"),
    UserChatMessageModel(isSendByMe: true, message: "Hi lorem Ipsum dummy text ever"),
    UserChatMessageModel(isSendByMe: false, message: "Hi lorem Ipsum dummy text ever"),
    UserChatMessageModel(isSendByMe: false, message: "Hi lorem Ipsum dummy text ever"),
    UserChatMessageModel(isSendByMe: true, message: "Hi lorem Ipsum dummy text ever since the 150s, when an unknown printer to ok a gallery of type"),
  ];

}

class UserChatMessageModel {
  final bool isSendByMe;
  final String message;

  UserChatMessageModel({required this.isSendByMe, required this.message});
}