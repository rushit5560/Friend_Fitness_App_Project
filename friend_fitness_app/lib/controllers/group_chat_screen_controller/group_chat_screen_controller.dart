import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/constants/api_header.dart';
import 'package:friend_fitness_app/common/constants/api_url.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/controllers/send_message_model/send_message_model.dart';
import 'package:friend_fitness_app/model/get_all_message_model/get_all_message_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GroupChatScreenController extends GetxController {
  /// Getting From Group List Screen
  String gameId = Get.arguments[0];
  String userId = Get.arguments[1];
  String name = Get.arguments[2];

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;




  File ? profile;

  RxBool isSuccessStatusCode = false.obs;
  List<List1> getAllMessageList = [];

  ApiHeader apiHeader = ApiHeader();

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

  sendMessageApi() async{
    isLoading(true);
    String url = ApiUrl.sendMessageApi;
    log('url: $url');
    log('userId: $userId');
    log('gameId: $gameId');
    try{
      if(profile != null){
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(profile!.openRead());

        stream.cast();

        var length = await profile!.length();

        request.files.add(await http.MultipartFile.fromPath("file", profile!.path));

        request.headers.addAll(apiHeader.headers);

        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['gameid'] = gameId;
        request.fields['message'] = userMessageFieldController.text.trim();


        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');

        var multiPart = http.MultipartFile(
          'file',
          stream,
          length
        );

        request.files.add(multiPart);

        //var multiPart = http.MultipartFile('file', stream, length);
        // request.files.add(multiPart);
        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) {
          SendMessageModel response1 = SendMessageModel.fromJson(json.decode(value));
          log('response1 ::::::$response1');
          isSuccessStatusCode = response1.success.obs;
          log('status : $isSuccessStatusCode');

          if(isSuccessStatusCode.value){
            Fluttertoast.showToast(msg: response1.messege);
            //getAllMessageFunction(gameId: gameId, userId: userId);
          } else {
            Fluttertoast.showToast(msg: response1.messege);
            Fluttertoast.showToast(msg: response1.errorMessage);
            log('False False');
          }
        });
      }
      else if(profile == null){
        var request = http.MultipartRequest('POST', Uri.parse(url));

        // var stream = http.ByteStream(profile!.openRead());
        // var beforeStream = http.ByteStream(beforeImageProfile!.openRead());
        // var afterStream = http.ByteStream(afterImageProfile!.openRead());
        //
        // stream.cast();
        // beforeStream.cast();
        // afterStream.cast();
        //
        // var length = await profile!.length();
        // var beforeLength = await beforeImageProfile!.length();
        // var afterLength = await afterImageProfile!.length();

        // request.files.add(await http.MultipartFile.fromPath("image", profile!.path));
        // request.files.add(await http.MultipartFile.fromPath("beforeimage", profile!.path));
        // request.files.add(await http.MultipartFile.fromPath("afterimage", profile!.path));

        request.headers.addAll(apiHeader.headers);

        request.fields['userid'] = "${UserDetails.userId}";
        request.fields['gameid'] = gameId;
        request.fields['message'] = userMessageFieldController.text.trim();


        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');

        // var multiPart = http.MultipartFile(
        //   'image',
        //   stream,
        //   length,
        // );
        // var beforeMultiPart = http.MultipartFile(
        //   'beforeimage',
        //   beforeStream,
        //   beforeLength,
        // );
        // var afterMultiPart = http.MultipartFile(
        //   'afterimage',
        //   afterStream,
        //   afterLength,
        // );
        //
        // request.files.add(multiPart);
        // request.files.add(beforeMultiPart);
        // request.files.add(afterMultiPart);

        //var multiPart = http.MultipartFile('file', stream, length);
        // request.files.add(multiPart);
        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) {
          SendMessageModel response1 = SendMessageModel.fromJson(json.decode(value));
          log('response1 ::::::$response1');
          isSuccessStatusCode = response1.success.obs;
          log('status : $isSuccessStatusCode');

          if(isSuccessStatusCode.value){
            Fluttertoast.showToast(msg: response1.messege);
            //getAllMessageFunction(gameId: gameId, userId: userId);

          } else {
            Fluttertoast.showToast(msg: response1.messege);
            Fluttertoast.showToast(msg: response1.errorMessage);
            log('False False');
          }
        });
      }

    }catch(e){
      log('Error: $e');
    } finally{
      //isLoading(false);
      getAllMessageFunction(gameId: gameId);
    }
  }

  getAllMessageFunction({required String gameId}) async {
    isLoading(true);
    String url = ApiUrl.getAllMessageApi;
    log('url: $url');
    log('userId: ${UserDetails.userId}');
    log('gameId: $gameId');

    Map<String, dynamic> data= {
      "gameid": gameId,
      "userid" : "${UserDetails.userId}"
    };

    try{
      http.Response response = await http.post(Uri.parse(url), body: data, headers: apiHeader.headers);
      log('Get All Message Response : ${response.body}');
      GetAllMessageModel getAllMessageModel = GetAllMessageModel.fromJson(json.decode(response.body));
      isSuccessStatusCode = getAllMessageModel.success!.obs;
      log('isStatus: $isSuccessStatusCode');

      if(isSuccessStatusCode.value){
        log('Success');
        getAllMessageList = getAllMessageModel.list!;
        log('getAllMessageList : $getAllMessageList');

      }else{
        Fluttertoast.showToast(msg: getAllMessageModel.messege!);
        Fluttertoast.showToast(msg: getAllMessageModel.errorMessage!);
        log('Fail');
      }
    }catch(e){
      log('Get All Message Error: $e');
    } finally{
      isLoading(false);
    }
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllMessageFunction(gameId: gameId);
  }

}

class UserChatMessageModel {
  final bool isSendByMe;
  final String message;

  UserChatMessageModel({required this.isSendByMe, required this.message});
}