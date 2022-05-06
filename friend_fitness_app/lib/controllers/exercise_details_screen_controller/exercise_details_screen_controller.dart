import 'dart:convert';
import 'dart:developer';

import 'package:friend_fitness_app/common/user_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../model/fitness_user_record_model/fitness_user_record_model.dart';
import '../../model/home_screen_models/fitness_model.dart';

class ExerciseDetailsScreenController extends GetxController {
  /// Get from Home Screen
  FitnessModel singleItem = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxBool isPlay = false.obs;
  List<FitnessUserEntryModel> exerciseEntryList = [];


  getUserExercisePointRecordFunction() async {
    isLoading(true);
    String url = "https://fitness-app-f51fa-default-rtdb.firebaseio.com/fitness_user_entry.json";
    log("User Exercise Point API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("Response : $response");

      if(response.statusCode == 200) {
        Map<String, dynamic> newMapResponse = jsonDecode(response.body);
        log("newMapResponse : $newMapResponse");

        List<FitnessUserEntryModel> allDataList = [];

        newMapResponse.forEach((key, value) => allDataList.add(FitnessUserEntryModel(
          id: value['id'],
          userId: value['user_id'],
          fitnessId: value['fitness_id'],
          fitnessCategoryName: value['fitness_category_name'],
          fitnessName: value['fitness_name'],
          date: value['date'],
          point: double.parse(value['point'].toString()),
        )));

        log("allDataList : $allDataList");
        exerciseEntryList.clear();

        for(int i = 0; i < allDataList.length; i++) {
          if(allDataList[i].userId == UserDetails.userId) {
            exerciseEntryList.add(allDataList[i]);
          }
        }

        log("exerciseEntryList : $exerciseEntryList");

      } else {
        log("getUserExercisePointRecordFunction Else Else");
      }

    } catch(e) {
      log("getUserExercisePointRecordFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getUserExercisePointRecordFunction();
    super.onInit();
  }
}