import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/constants/api_header.dart';
import 'package:friend_fitness_app/common/constants/api_url.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/model/end_game_model/end_game_model.dart';
import 'package:friend_fitness_app/model/start_game_model/start_game_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CustomDrawerController extends GetxController{

  RxBool isLoading = false.obs;
  RxBool isSuccessStatusCode = false.obs;
  ApiHeader apiHeader= ApiHeader();
  RxBool startGame = true.obs;

  startGameFunction() async {
    isLoading(true);
    String url = ApiUrl.startGameApi;
    log('url: $url');

    try{
      Map<String, dynamic> data = {
        "userid" : "${UserDetails.userId}",
        "gameid" : UserDetails.gameId
      };
      log('data: $data');
      http.Response response = await http.post(Uri.parse(url), body: data, headers: apiHeader.headers);
      log('Response : ${response.body}');
      StartGameModel createGameModel = StartGameModel.fromJson(json.decode(response.body));
      //log('signInModel: ${signUpModel.name}');
      isSuccessStatusCode = createGameModel.success.obs;

      log('isSuccessStatusCode: $isSuccessStatusCode');
      //isStatus = signInModel.statusCode.obs;

      if(isSuccessStatusCode.value){
        log('Success');
        Fluttertoast.showToast(msg: createGameModel.messege);
        //clearCreateGameFieldsFunction();

      }else{
        Fluttertoast.showToast(msg: createGameModel.messege);
        //Fluttertoast.showToast(msg: createGameModel.errorMessage);
        log('Fail');
        log('isStatus.value: ${isSuccessStatusCode.value}');
        //Get.snackbar("User Already Register", '');
        // if(userSignUpModel.error.email[0].contains("validation.unique")){
        //   Get.snackbar(userSignUpModel.error.email[0], '');
        // }

      }
    }catch(e){
      log('Error: $e');
    } finally{
      isLoading(false);
    }
  }

  endGameFunction() async {
    isLoading(true);
    String url = ApiUrl.endGameApi;
    log('end game url: $url');

    try{
      Map<String, dynamic> data = {
        "userid" : "${UserDetails.userId}",
        "gameid" : UserDetails.gameId
      };
      log('data: $data');
      http.Response response = await http.post(Uri.parse(url), body: data, headers: apiHeader.headers);
      log('Response : ${response.body}');
      EndGameModel endGameModel = EndGameModel.fromJson(json.decode(response.body));
      //log('signInModel: ${signUpModel.name}');
      isSuccessStatusCode = endGameModel.success.obs;

      log('isSuccessStatusCode: $isSuccessStatusCode');
      //isStatus = signInModel.statusCode.obs;

      if(isSuccessStatusCode.value){
        log('Success');
        Fluttertoast.showToast(msg: endGameModel.messege);
        //clearCreateGameFieldsFunction();

      } else {
        Fluttertoast.showToast(msg: endGameModel.messege);
        //Fluttertoast.showToast(msg: endGameModel.errorMessage);
        log('Fail');
        log('isStatus.value: ${isSuccessStatusCode.value}');
        //Get.snackbar("User Already Register", '');
        // if(userSignUpModel.error.email[0].contains("validation.unique")){
        //   Get.snackbar(userSignUpModel.error.email[0], '');
        // }

      }
    }catch(e){
      log('Error: $e');
    } finally{
      isLoading(false);
    }
  }
}