import 'dart:convert';
import 'dart:developer';

import 'package:friend_fitness_app/common/user_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../model/home_screen_models/water_intake_model.dart';
import '../../model/water_intake_record_model/water_intake_record_model.dart';

class WaterIntakeDetailsScreenController extends GetxController {
  /// Data From Water Intake Module
  //WaterIntakeModel waterIntakeData = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  List<WaterIntakeEntryModel> waterIntakeRecordList = [];

  /// Get User Water Intake Record From Firebase
  getUserWaterIntakePointRecordFunction() async {
    isLoading(true);
    String url = "https://fitness-app-f51fa-default-rtdb.firebaseio.com/water_intake_entry.json";
    log("Water Intake Record API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("Water Intake Response : $response");

      if(response.statusCode == 200) {
        Map<String, dynamic> newMapResponse = jsonDecode(response.body);
        log("newMapResponse : $newMapResponse");

        List<WaterIntakeEntryModel> allDataList = [];

        newMapResponse.forEach((key, value) => allDataList.add(
            WaterIntakeEntryModel(
              id: value['id'],
              userId: value['user_id'],
              waterIntakeId: value['water_intake_id'],
              waterIntakeName: value['water_intake_name'],
              date: value['date'],
              point: double.parse(value['point'].toString()),
            )
        ));

        log("allDataList : $allDataList");

        for(int i = 0; i < allDataList.length; i++) {
          if(allDataList[i].userId == UserDetails.userId) {
            waterIntakeRecordList.add(allDataList[i]);
          }
        }

      } else {
       log("getUserWaterIntakePointRecordFunction Else Else");
      }


    } catch(e) {
      log("getUserWaterIntakePointRecordFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }


  @override
  void onInit() {
    getUserWaterIntakePointRecordFunction();
    super.onInit();
  }

}