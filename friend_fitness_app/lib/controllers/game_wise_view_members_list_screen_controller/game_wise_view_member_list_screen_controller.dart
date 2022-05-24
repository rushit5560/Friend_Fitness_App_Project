import 'dart:convert';
import 'dart:developer';

import 'package:friend_fitness_app/common/constants/api_header.dart';
import 'package:friend_fitness_app/common/constants/api_url.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/model/game_wise_view_members_list_model/game_wise_view_members_list_model.dart';
import 'package:friend_fitness_app/model/get_all_game_list_model/get_all_game_list_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GameWiseViewMembersListScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatusCode = false.obs;
  RxInt waterIntakeValue = 0.obs;

  ApiHeader apiHeader = ApiHeader();
  List<ListElement> gameWiseMembersList = [];

  /// Get Game Id From Get All Game Screen
  int gameId = Get.arguments;


  /// Get All Members Point wise
  getAllGameMemberFunction()async{
    isLoading(true);
    String url = ApiUrl.gameMemberApi+ "$gameId";
    log('Game Member url: $url');

    try{
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log('getAllGameMembersList Response : ${response.body}');
      GameWiseVIewMembersListModel gameWiseVIewMembersListModel = GameWiseVIewMembersListModel.fromJson(json.decode(response.body));
      //log('signInModel: ${signUpModel.name}');
      isSuccessStatusCode = gameWiseVIewMembersListModel.success.obs;
      log('isSuccessStatusCode: $isSuccessStatusCode');
      //isStatus = signInModel.statusCode.obs;

      if(isSuccessStatusCode.value){
        log('Success');
        gameWiseMembersList = gameWiseVIewMembersListModel.list;
        log('gameWiseVIewMembersListModel : $gameWiseMembersList');

      }else{
        log('Fail');
        log('isStatus.value: ${isSuccessStatusCode.value}');

      }
    }catch(e){
      log('getAllGameMembersList Error: $e');
    } finally{
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAllGameMemberFunction();
    super.onInit();
  }
}