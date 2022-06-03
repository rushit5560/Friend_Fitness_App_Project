import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/constants/api_header.dart';
import 'package:friend_fitness_app/common/constants/api_url.dart';
import 'package:friend_fitness_app/common/sharedpreference_data/sharedpreference_data.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/model/add_star_point_model/add_star_point_model.dart';
import 'package:friend_fitness_app/model/get_all_game_members_model/get_all_game_members_model.dart';
import 'package:friend_fitness_app/screens/sign_in_screen/sign_in_screen.dart';
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
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

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

        if(getAllGameMembersModel.messege == "Token don't match"){
          sharedPreferenceData.clearUserLoginDetailsFromPrefs();
          Get.offAll(SignInScreen(), transition: Transition.zoom);
        }
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
        if(addStarPointModel.messege == "Token don't match"){
          sharedPreferenceData.clearUserLoginDetailsFromPrefs();
          Get.offAll(SignInScreen(), transition: Transition.zoom);
        }
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
