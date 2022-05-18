import 'dart:convert';
import 'dart:developer';

import 'package:friend_fitness_app/common/constants/api_header.dart';
import 'package:friend_fitness_app/common/constants/api_url.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/model/get_user_wise_point_model/get_user_wise_point_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GameSummaryDetailsScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatusCode = false.obs;
  List<ListElement> getUserWisePointList = [];

  ApiHeader apiHeader= ApiHeader();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllUserWisePointApi();
  }

  getAllUserWisePointApi()async{
    isLoading(true);
    String url = ApiUrl.getAllUserWisePointApi + "${UserDetails.userId}";
    log("Get All User Wise API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log('Get All User Wise Response:  ${response.body}');

      GetUserWisePointModel getUserWisePointModel = GetUserWisePointModel.fromJson(json.decode(response.body));
      // log('signInModel: ${signUpModel.name}');
      isSuccessStatusCode = getUserWisePointModel.success.obs;
      log('isStatus: $isSuccessStatusCode');

      if(isSuccessStatusCode.value) {

        getUserWisePointList = getUserWisePointModel.list;
        log('getUserWisePointList : $getUserWisePointList');

      }

    } catch(e) {
      log("getUserWisePointList Error ::: $e");
    } finally {
      isLoading(false);
    }
  }
}