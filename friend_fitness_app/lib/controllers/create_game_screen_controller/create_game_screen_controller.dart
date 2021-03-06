import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/constants/api_header.dart';
import 'package:friend_fitness_app/common/constants/api_url.dart';
import 'package:friend_fitness_app/common/sharedpreference_data/sharedpreference_data.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/model/create_game_model/create_game_model.dart';
import 'package:friend_fitness_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CreateGameScreenController extends GetxController{
  GlobalKey<FormState> createGameFormKey = GlobalKey();
  TextEditingController nameFieldController = TextEditingController();
  TextEditingController dayFieldController = TextEditingController();
  TextEditingController personFieldController = TextEditingController();
  TextEditingController amountFieldController = TextEditingController();
  TextEditingController rewardPointFieldController = TextEditingController();

  ApiHeader apiHeader = ApiHeader();

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxString weekDayValue = 'Monday'.obs;

  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  createGameFunction()async{
    isLoading(true);
    String url = ApiUrl.createGameApi;
    log('url: $url');

    try{
      Map<String, dynamic> data = {
        "name" : nameFieldController.text.trim(),
        "days": dayFieldController.text.trim(),
        "person": personFieldController.text.trim(),
        "amount": amountFieldController.text.trim(),
        "rewardpoints": rewardPointFieldController.text.trim(),
        "userid" : "${UserDetails.userId}",
        "cheatday": weekDayValue.value
      };
      log('data: $data');
      http.Response response = await http.post(Uri.parse(url), body: data, headers: apiHeader.headers);
      log('Response : ${response.body}');
      CreateGameModel createGameModel = CreateGameModel.fromJson(json.decode(response.body));
      isSuccessStatus = createGameModel.success.obs;
      log('isSuccessStatus: $isSuccessStatus');

      if(isSuccessStatus.value){
        log('Success');
        Fluttertoast.showToast(msg: createGameModel.messege);
        clearCreateGameFieldsFunction();

      }else{
        Fluttertoast.showToast(msg: createGameModel.messege);

        if(createGameModel.messege == "Token don't match"){
          sharedPreferenceData.clearUserLoginDetailsFromPrefs();
          Get.offAll(SignInScreen(), transition: Transition.zoom);
        }
        log('Fail');
        log('isStatus.value: ${isSuccessStatus.value}');

      }
    }catch(e){
      log('Error: $e');
    } finally{
      isLoading(false);
    }
  }

  clearCreateGameFieldsFunction() {
    nameFieldController.clear();
    dayFieldController.clear();
    personFieldController.clear();
    amountFieldController.clear();
    rewardPointFieldController.clear();
    //roleValue("");
  }
}