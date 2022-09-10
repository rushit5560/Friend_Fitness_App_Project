import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/constants/api_header.dart';
import 'package:friend_fitness_app/common/constants/api_url.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/model/game_wise_view_members_list_model/game_wise_view_members_list_model.dart';
import 'package:friend_fitness_app/model/get_all_game_list_model/get_all_game_list_model.dart';
import 'package:friend_fitness_app/model/winner_member_model/winner_member_model.dart';
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
  int userId = 0;


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

        for(int i = 0; i < gameWiseMembersList.length; i++){
          userId = gameWiseMembersList[i].userid;
        }

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

  /// Get Members Winner
  memberWinnerFunction()async{
    isLoading(true);
    String url = ApiUrl.winnerMemberApi;
    log('Winner Member url: $url');

    Map<String, dynamic> bodyData = {
      "userid" : "$userId",
      "gameid" : UserDetails.gameId
    };

    try{
      http.Response response = await http.post(Uri.parse(url), headers: apiHeader.headers, body : bodyData);
      log('winnerGameMembersList Response : ${response.body}');
      WinnerGameMemberModel winnerGameMemberModel = WinnerGameMemberModel.fromJson(json.decode(response.body));
      //log('signInModel: ${signUpModel.name}');
      isSuccessStatusCode = winnerGameMemberModel.success.obs;
      log('isSuccessStatusCode: $isSuccessStatusCode');
      //isStatus = signInModel.statusCode.obs;

      if(isSuccessStatusCode.value){
        log('Success');
       Fluttertoast.showToast(msg: winnerGameMemberModel.messege);

      }else{
        log('Fail');
        Fluttertoast.showToast(msg: winnerGameMemberModel.messege);

      }
    }catch(e){
      log('winnerGameMembersList Error: $e');
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