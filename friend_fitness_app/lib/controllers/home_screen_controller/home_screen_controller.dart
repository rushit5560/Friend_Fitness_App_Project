import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/constants/api_header.dart';
import 'package:friend_fitness_app/common/constants/api_url.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/model/add_star_point_model/add_star_point_model.dart';
import 'package:friend_fitness_app/model/get_all_game_members_model/get_all_game_members_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../model/home_screen_models/fitness_model.dart';
import '../../model/home_screen_models/water_intake_model.dart';



class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatusCode = false.obs;
  RxBool isAddStarSuccessStatusCode = false.obs;
  RxInt waterIntakeValue = 0.obs;

  ApiHeader apiHeader = ApiHeader();
  List<ListElement> getAllGameMembersList = [];

  String gameName = "";

  // List<FitnessModel> exerciseList = [];
  // List<FitnessModel> movementList = [];
  // List<FitnessModel> mindfulnessList = [];
  // List<WaterIntakeModel> waterIntakeList = [];




  /// Get Water Intake From Firebase Using postman API
 /* getWaterIntakeFromFirebaseFunction() async {
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
    } finally {
      isLoading(false);
    }

  }*/

  /// Get Exercise List From Firebase Using Postman API
  /*getExerciseFromFirebaseFunction() async {
    isLoading(true);
    String url = "https://fitness-app-f51fa-default-rtdb.firebaseio.com/exercise.json";
    log('url: $url');

    try {
      http.Response response = await http.get(Uri.parse(url));
      isSuccessStatusCode = response.statusCode.obs;
      log('isStatus: $isSuccessStatusCode');

      if(isSuccessStatusCode.value == 200) {
        Map<String, dynamic> newMapResponse = jsonDecode(response.body);
        log("newMapResponse : $newMapResponse");

        newMapResponse.forEach((k, v) => exerciseList.add(ExerciseModel(
            exerciseId: v['exercise_id'],
            exerciseName: v['exercise_name'],
            exerciseImage: v['exercise_image'],
            exercisePoint: v['exercise_point']
        )));
        // log("mindFullNessList: ${mindFullNessList.first}");
        for(int i =0; i < exerciseList.length; i++) {
          log(exerciseList[i].exerciseId.toString());
          log(exerciseList[i].exerciseName);
        }


      } else {
        log('Something went wrong!');
      }
    } catch(e) {
      log("getExerciseFromFirebaseFunction Error ::: $e");
    } finally{
      // isLoading(false);
      await getMovementFromFirebaseFunction();
    }
  }*/

  /// Get Movement List From Firebase Using Postman API
  /*getMovementFromFirebaseFunction() async {
    isLoading(true);
    String url = "https://fitness-app-f51fa-default-rtdb.firebaseio.com/movement.json";
    log("Movement API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      isSuccessStatusCode = response.statusCode.obs;
      log('isStatus: $isSuccessStatusCode');

      if(isSuccessStatusCode.value == 200) {
        Map<String, dynamic> newMapResponse = jsonDecode(response.body);
        log("newMapResponse : $newMapResponse");

        newMapResponse.forEach((k, v) => movementList.add(MovementModel(
            movementId: v['movement_id'],
            movementName: v['movement_name'],
            movementImage: v['movement_image'],
            movementPoint: v['movement_point']
        )));
        // log("mindFullNessList: ${mindFullNessList.first}");
        for(int i =0; i < movementList.length; i++) {
          log(movementList[i].movementId.toString());
          log(movementList[i].movementName);
        }


      } else {
        log('Something went wrong!');
      }

    } catch(e) {
      log("getMovementFromFirebaseFunction Error ::: $e");
    } finally {
      isLoading(false);
      await getMindFullNessFromFirebaseFunction();
    }
  }*/

  /// Get Mindfulness List From Firebase Using Postman API
  /*getMindFullNessFromFirebaseFunction() async {
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

      }else {
        log('Something went wrong!');
      }
    }catch(e){
      log('Error ::: $e');
    } finally{
      // isLoading(false);
      await getWaterIntakeFromFirebaseFunction();
    }
  }*/

  /// Get Exercise From Firebase Function
  /*Stream<List<ExerciseModel>> getAllExerciseFromFirebase() {
    return FirebaseFirestore.instance.collection("exercise")
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => ExerciseModel.fromJson(doc.data()))
            .toList());
  }*/

  /// Get Movement From Firebase Function
  /*Stream<List<MovementModel>> getAllMovementFromFirebase() {
    return FirebaseFirestore.instance.collection("movement")
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => MovementModel.fromJson(doc.data()))
            .toList());
  }*/

  /// Get WaterIntake From Firebase Function
  /*Stream<List<WaterIntakeModel>> getWaterIntakeFromFirebase() {
    return FirebaseFirestore.instance.collection("water_intake")
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => WaterIntakeModel.fromJson(doc.data()))
            .toList());
  }*/

  /// Get WaterIntake From Firebase Function
  /*Stream<List<MindfulnessModel>> getAllMindfulnessFromFirebase() {
    return FirebaseFirestore.instance.collection("mindfulness")
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => MindfulnessModel.fromJson(doc.data()))
            .toList());
  }*/

  /// Get All Members Point wise
  getAllGameMemberFunction()async{
    isLoading(true);
    String url = ApiUrl.gameMemberApi+ "${UserDetails.gameId}";
    log('Game Member url: $url');

    try{
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log('getAllGameMembersList Response : ${response.body}');
      GetAllGameMembersModel getAllGameMembersModel = GetAllGameMembersModel.fromJson(json.decode(response.body));
      //log('signInModel: ${signUpModel.name}');
      isSuccessStatusCode = getAllGameMembersModel.success.obs;
      log('isSuccessStatusCode: $isSuccessStatusCode');
      //isStatus = signInModel.statusCode.obs;

      if(isSuccessStatusCode.value){
        log('Success');
         getAllGameMembersList = getAllGameMembersModel.list;
         log('getAllGameMembersList : $getAllGameMembersList');
        gameName = getAllGameMembersModel.gamename;

      }else{
        log('Fail');
        log('isStatus.value: ${isSuccessStatusCode.value}');
        Fluttertoast.showToast(msg: getAllGameMembersModel.messege);
        //Fluttertoast.showToast(msg: getAllGameMembersModel.errorMessage);
      }
    }catch(e){
      log('getAllGameMembersList Error: $e');
    } finally{
      //isLoading(false);
      addStarPointAPI();
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
      log('Star point add Response : ${response.body}');
      AddStarPointModel addStarPointModel = AddStarPointModel.fromJson(json.decode(response.body));
      isAddStarSuccessStatusCode = addStarPointModel.success.obs;
      log('isStatus: $isAddStarSuccessStatusCode');

      if(isAddStarSuccessStatusCode.value){
        log('Success');
        //Fluttertoast.showToast(msg: addStarPointModel.messege);
      }else{
        // Fluttertoast.showToast(msg: addStarPointModel.messege);
        log('Fail');
      }
    }catch(e){
      log('Get Profile Error: $e');
    } finally{
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAllGameMemberFunction();
    super.onInit();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }



}



/*
class TrackExerciseModel {
  String img;
  String name;

  TrackExerciseModel({required this.img, required this.name});


}*/
