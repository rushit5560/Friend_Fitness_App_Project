import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/constants/api_header.dart';
import 'package:friend_fitness_app/common/constants/api_url.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/model/add_star_point_model/add_star_point_model.dart';
import 'package:friend_fitness_app/model/get_user_wise_point_model/get_user_wise_point_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GameSummaryDetailsScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatusCode = false.obs;
  List<ListElement> getUserWisePositivePointList = [];
  List<ListElement> getUserWiseNegativePointList = [];

  int totalPositivePoint = 0;
  int totalNegativePoint = 0;
  String currentDate = "";
  ApiHeader apiHeader= ApiHeader();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllUserWisePointApi();
    //addStarPointAPI();
  }

  getAllUserWisePointApi()async{
    isLoading(true);
    String url = ApiUrl.getAllUserWisePointApi + "${UserDetails.userId}";
    log("Get All User Wise API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log('Get All User Wise Response:  ${response.body}');

      GetUserWisePointModel getUserWisePointModel = GetUserWisePointModel.fromJson(json.decode(response.body));
      isSuccessStatusCode = getUserWisePointModel.success.obs;
      log('isStatus: $isSuccessStatusCode');

      if(isSuccessStatusCode.value) {

        getUserWisePositivePointList = getUserWisePointModel.list.positive.list;
        log('getUserWisePositivePointList : $getUserWisePositivePointList');

        getUserWiseNegativePointList = getUserWisePointModel.list.negative.list;
        log('getUserWiseNegativePointList : $getUserWiseNegativePointList');

        totalPositivePoint = getUserWisePointModel.list.positive.total;
        totalNegativePoint = getUserWisePointModel.list.negative.total;
        currentDate = getUserWisePointModel.date;
      } else{
        Fluttertoast.showToast(msg: getUserWisePointModel.errorMessage);
        Fluttertoast.showToast(msg: getUserWisePointModel.messege);
      }

    } catch(e) {
      log("getUserWisePointList Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  addStarPointAPI() async {
    isLoading(true);
    String url = ApiUrl.addStarPointApi;
    log('url: $url');
    log('UserDetails.userId: ${UserDetails.userId}');
    log('UserDetails.userIdToken: ${UserDetails.userIdToken}');

    Map<String, dynamic> data= {
      "userid" : "${UserDetails.userId}",
      "gameid" : "${UserDetails.gameId}"
    };
    try{
      http.Response response = await http.post(Uri.parse(url), body: data, headers: apiHeader.headers);
      log('Response : ${response.body}');
      AddStarPointModel addStarPointModel = AddStarPointModel.fromJson(json.decode(response.body));
      isSuccessStatusCode = addStarPointModel.success.obs;
      log('isStatus: $isSuccessStatusCode');

      if(isSuccessStatusCode.value){
        log('Success');
        Fluttertoast.showToast(msg: addStarPointModel.messege);
      }else{
        Fluttertoast.showToast(msg: addStarPointModel.messege);
        Fluttertoast.showToast(msg: addStarPointModel.errorMessage);
        log('Fail');
      }
    }catch(e){
      log('Get Profile Error: $e');
    } finally{
      isLoading(false);
    }
  }
}