import 'dart:convert';
import 'dart:developer';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/model/home_screen_models/water_intake_model.dart';
import 'package:http/http.dart' as http;
import 'package:friend_fitness_app/model/home_screen_models/fitness_model.dart';
import 'package:get/get.dart';

class TrackScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;
  RxInt waterIntakeValue = 0.obs;

  List<FitnessModel> exerciseList = [];
  List<FitnessModel> movementList = [];
  List<FitnessModel> mindfulnessList = [];
  List<WaterIntakeModel> waterIntakeList = [];

  @override
  void onInit() {
    getAllFitnessFromFirebaseFunction();
    super.onInit();
  }

  /// Get Exercise, Movement, Mindfulness List From Firebase Using Postman API
  getAllFitnessFromFirebaseFunction() async {
    isLoading(true);
    String url = "https://fitness-app-f51fa-default-rtdb.firebaseio.com/fitness.json";
    log("All Fitness API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      isSuccessStatusCode = response.statusCode.obs;
      log("isSuccessStatusCode : $isSuccessStatusCode");

      if(isSuccessStatusCode.value == 200) {
        Map<String, dynamic> newMapResponse = jsonDecode(response.body);
        // log("newMapResponse : $newMapResponse");
        List<FitnessModel> allList = [];

        newMapResponse.forEach((key, value)=> allList.add(
            FitnessModel(
                fitnessId: value['fitness_id'],
                fitnessCategoryName: value['fitness_category_name'],
                fitnessName: value['fitness_name'],
                fitnessImage: value['fitness_image'],
                fitnessPoint: double.parse(value['fitness_point'].toString())
            )));

        // log("allList : $allList");
        exerciseList.clear();
        movementList.clear();
        mindfulnessList.clear();

        for(int i = 0; i < allList.length; i++) {
          if(allList[i].fitnessCategoryName == "exercise") {
            exerciseList.add(allList[i]);
          } else if(allList[i].fitnessCategoryName == "movement") {
            movementList.add(allList[i]);
          } else if(allList[i].fitnessCategoryName == "mindfulness") {
            mindfulnessList.add(allList[i]);
          }
        }

      } else {
        log("getAllFitnessFromFirebaseFunction Else Else");
      }

    } catch(e) {
      log("getAllFitnessFromFirebaseFunction Error : $e");
    } finally {
      // isLoading(false);
      await getWaterIntakeFromFirebaseFunction();
    }
  }

  /// Get Water Intake From Firebase Using postman API
  getWaterIntakeFromFirebaseFunction() async {
    isLoading(true);
    String url = "https://fitness-app-f51fa-default-rtdb.firebaseio.com/water_intake.json";
    log("Water Intake API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      isSuccessStatusCode = response.statusCode.obs;
      log('isStatus: $isSuccessStatusCode');

      if(isSuccessStatusCode.value == 200){
        log('Success');
        Map<String, dynamic> newMapResponse = jsonDecode(response.body);
        log("newMapResponse : $newMapResponse");

        waterIntakeList.clear();

        newMapResponse.forEach((k, v) => waterIntakeList.add(WaterIntakeModel(
          waterIntakeId: v['water_intake_id'],
          waterIntakeImage: v['water_intake_image'],
          waterIntakeName: v['water_intake_name'],
          waterIntakeDes: v['water_intake_description'],
          waterIntakePoint: v['water_intake_point'],
        )));
        for(int i =0; i < waterIntakeList.length; i++) {
          log(waterIntakeList[i].waterIntakeId.toString());
          log(waterIntakeList[i].waterIntakeName);
        }

      } else {
        log('Something went wrong!');
      }

    } catch(e) {
      log("getWaterIntakeFromFirebaseFunction Error ::: $e");
      if(e.toString().contains("HandshakeException")) {
        await getWaterIntakeFromFirebaseFunction();
      }
    } finally {
      isLoading(false);
    }

  }

  /// Add Water Intake Record In Firebase Using Postman API
  addWaterIntakeRecordInFirebaseFunction() async {
    // isLoading(true);
    String uniqueId = "${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}${DateTime.now().hour}${DateTime.now().minute}${DateTime.now().second}${DateTime.now().millisecond}";
    String date = "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
    String url = "https://fitness-app-f51fa-default-rtdb.firebaseio.com/water_intake_entry.json";
    log("Add Water Intake API URL : $url");

    try {
      Map<String, dynamic> data = {
        "id" : uniqueId,
        "user_id" : UserDetails.userId,
        "water_intake_id" : waterIntakeList[0].waterIntakeId,
        "water_intake_name" : waterIntakeList[0].waterIntakeName,
        "date" : date,
        "point" : waterIntakeList[0].waterIntakePoint
      };

      log("data : $data");

      http.Response response = await http.post(Uri.parse(url), body: jsonEncode(data));
      log("response : ${response.body}");

    } catch(e) {
      log("addWaterIntakeRecordInFirebaseFunction Error ::: $e");
    } finally {
      // isLoading(false);
    }

  }


}