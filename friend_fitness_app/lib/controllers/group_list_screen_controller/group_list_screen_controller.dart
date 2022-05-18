import 'dart:convert';
import 'dart:developer';

import 'package:friend_fitness_app/common/constants/api_header.dart';
import 'package:friend_fitness_app/common/constants/api_url.dart';
import 'package:friend_fitness_app/model/get_all_game_list_model/get_all_game_list_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GroupListScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatusCode = false.obs;
  List<ListElement> getGameList = [];

  ApiHeader apiHeader= ApiHeader();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllGameList();
  }

  getAllGameList()async{
    isLoading(true);
    String url = ApiUrl.getAllGameApi;
    log("Get All Game API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log('Response:  ${response.body}');

      GetAllGameListModel getAllGameListModel = GetAllGameListModel.fromJson(json.decode(response.body));
      // log('signInModel: ${signUpModel.name}');
      isSuccessStatusCode = getAllGameListModel.success.obs;
      log('isStatus: $isSuccessStatusCode');

      if(isSuccessStatusCode.value) {

        getGameList = getAllGameListModel.list;
        log('getAllNegativeCategoryList : $getGameList');

      }

    } catch(e) {
      log("getAllNegativeCategoryList Error ::: $e");
    } finally {
      isLoading(false);
    }
  }
}