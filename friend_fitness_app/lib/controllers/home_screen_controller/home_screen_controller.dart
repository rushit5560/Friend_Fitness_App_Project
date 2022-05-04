import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:friend_fitness_app/model/home_screen_models/movement_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/constants/app_images.dart';
import '../../model/home_screen_models/exercise_model.dart';
import '../../model/home_screen_models/mindfulness_model.dart';
import '../../model/home_screen_models/water_intake_model.dart';

class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;
  RxInt waterIntakeValue = 0.obs;

  List<MindfulnessModel> mindfulnessList = [];


  /// Get Mindfulness List From Firebase Using Postman API
  getMindFullNessFromFirebaseFunction() async {
    isLoading(true);
    String url = "https://fitness-app-f51fa-default-rtdb.firebaseio.com/mindfulness.json";
    log('url: $url');

    try{
      http.Response response = await http.get(Uri.parse(url));
      isSuccessStatusCode = response.statusCode.obs;
      log('isStatus: $isSuccessStatusCode');


      if(isSuccessStatusCode.value == 200){
        log('Success');
        Map<String, dynamic> newMapResponse = jsonDecode(response.body);
        log("newMapResponse : $newMapResponse");

        newMapResponse.forEach((k, v) => mindfulnessList.add(MindfulnessModel(
          mindfulnessId: v['mindfulness_id'],
          mindfulnessImage: v['mindfulness_image'],
          mindfulnessName: v['mindfulness_name'],
          mindfulnessPoint: v['mindfulness_point'],
        )));
        // log("mindFullNessList: ${mindFullNessList.first}");
        for(int i =0; i < mindfulnessList.length; i++) {
          log(mindfulnessList[i].mindfulnessId.toString());
          log(mindfulnessList[i].mindfulnessName);
        }

      }else{
        log('Fail');
        Fluttertoas
        // Get.snackbar("Wrong Email/Password", '');
      }
    }catch(e){
      log('Error: $e');
    } finally{
      isLoading(false);
    }
  }

  /// Get Exercise List From Firebase Using Postman API
  getExerciseFromFirebaseFunction() async {
    isLoading(true);
    String url = "https://fitness-app-f51fa-default-rtdb.firebaseio.com/exercise.json";
    log('url: $url');

    try {

    } catch(e) {
      log("");
    } finally{
      isLoading(false);
    }
  }






  /// Get Exercise From Firebase Function
  Stream<List<ExerciseModel>> getAllExerciseFromFirebase() {
    return FirebaseFirestore.instance.collection("exercise")
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => ExerciseModel.fromJson(doc.data()))
            .toList());
  }

  /// Get Movement From Firebase Function
  Stream<List<MovementModel>> getAllMovementFromFirebase() {
    return FirebaseFirestore.instance.collection("movement")
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => MovementModel.fromJson(doc.data()))
            .toList());
  }

  /// Get WaterIntake From Firebase Function
  Stream<List<WaterIntakeModel>> getWaterIntakeFromFirebase() {
    return FirebaseFirestore.instance.collection("water_intake")
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => WaterIntakeModel.fromJson(doc.data()))
            .toList());
  }

  /// Get WaterIntake From Firebase Function
  Stream<List<MindfulnessModel>> getAllMindfulnessFromFirebase() {
    return FirebaseFirestore.instance.collection("mindfulness")
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => MindfulnessModel.fromJson(doc.data()))
            .toList());
  }

  List<TrackExerciseModel> trackMovementList = [
    TrackExerciseModel(img: AppImages.walkingImg, name: "Walking"),
    TrackExerciseModel(img: AppImages.coachingImg, name: "Coaching kids"),
    TrackExerciseModel(img: AppImages.weightsImg, name: "Stretching"),
  ];

  List<TrackExerciseModel> trackMindFullnessList = [
    TrackExerciseModel(img: AppImages.journalImg, name: "Journal"),
    TrackExerciseModel(img: AppImages.meditationImg, name: "Meditation"),
  ];

  @override
  void onInit() {
    getMindFullNessFromFirebaseFunction();
    super.onInit();
  }


}



class TrackExerciseModel {
  String img;
  String name;

  TrackExerciseModel({required this.img, required this.name});


}