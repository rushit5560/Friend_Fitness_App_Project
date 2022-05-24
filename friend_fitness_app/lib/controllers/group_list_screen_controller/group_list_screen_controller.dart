import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/constants/api_header.dart';
import 'package:friend_fitness_app/common/constants/api_url.dart';
import 'package:friend_fitness_app/common/sharedpreference_data/sharedpreference_data.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/model/get_all_game_list_model/get_all_game_list_model.dart';
import 'package:friend_fitness_app/model/member_join_game_model/member_join_game_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GroupListScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatusCode = false.obs;
  List<ListElement1> getGameList = [];

  ApiHeader apiHeader= ApiHeader();
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllGameList();
  }

  getAllGameList() async {
    isLoading(true);
    String url = ApiUrl.getAllGameApi;
    log("Get All Game API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log('Response:  ${response.body}');

     GetAllGameListModel getAllGameListModel = GetAllGameListModel.fromJson(json.decode(response.body));
      isSuccessStatusCode = getAllGameListModel.success.obs;
      log('isStatus: $isSuccessStatusCode');

      if(isSuccessStatusCode.value) {

        // for(int i=0 ; i < getAllGameListModel.list.length; i++){
        //   UserDetails.gameId = getAllGameListModel.list[i].id.toString();
        //   log('UserDetails.gameId : ${UserDetails.gameId}');
        //   await sharedPreferenceData.setUserLoginDetailsInPrefs(userId: UserDetails.userId, userIdToken: UserDetails.userIdToken, gameId: UserDetails.gameId, roleId: UserDetails.roleId);
        // }

        getGameList = getAllGameListModel.list;
        log('getGameList : $getGameList');
      }

    } catch(e) {
      log("getGameList Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  memberJoinGame({required int gameId, required int totalPerson, required int userId}) async {
    isLoading(true);
    String url = ApiUrl.memberJoinGameApi;
    log("Get All Member Join Game API URL : $url");
    log('gameId: $gameId');

    String date = "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";

    Map<String, dynamic> data = {
      "person": "$totalPerson",
      "gameid" : "$gameId",
      "userid" : "$userId",//"${UserDetails.userId}"
      "joindate" : date
    };
    log('data: $data');

    try {
      http.Response response = await http.post(Uri.parse(url), body: data, headers: apiHeader.headers);
      log('Response:  ${response.body}');

      MemberJoinGameModel memberJoinGameModel = MemberJoinGameModel.fromJson(json.decode(response.body));
      // log('signInModel: ${signUpModel.name}');
      isSuccessStatusCode = memberJoinGameModel.success.obs;
      log('isStatus: $isSuccessStatusCode');

      if(isSuccessStatusCode.value) {
        Fluttertoast.showToast(msg: memberJoinGameModel.messege);
      }else{
        Fluttertoast.showToast(msg: memberJoinGameModel.messege);
      }

    } catch(e) {
      log("memberJoinGame Error ::: $e");
    } finally {
      isLoading(false);
    }
  }
}