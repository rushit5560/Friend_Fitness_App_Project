import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/constants/api_header.dart';
import 'package:friend_fitness_app/common/constants/api_url.dart';
import 'package:friend_fitness_app/common/sharedpreference_data/sharedpreference_data.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/model/add_star_point_model/add_star_point_model.dart';
import 'package:friend_fitness_app/model/get_profile_model/get_profile_model.dart';
import 'package:friend_fitness_app/model/get_update_profile_model/get_update_profile_model.dart';
import 'package:friend_fitness_app/model/update_profile_model/update_profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class EditProfileScreenController extends GetxController{

  RxBool isLoading = false.obs;
  RxBool isSuccessStatusCode = false.obs;
  RxBool isAddStarSuccessStatusCode = false.obs;
  //List<User> profileList = [];
  String name = "";
  String email = "";
  File ? profile;
  String userProfile = "";

  File? beforeImageProfile;
  String userBeforeImageProfile = "";

  File? afterImageProfile;
  String userAfterImageProfile = "";

  RxString genderValue = 'Female'.obs;
  GlobalKey<FormState> profileFormKey = GlobalKey();
  GlobalKey<FormState> editProfileFormKey = GlobalKey();
  ApiHeader apiHeader = ApiHeader();

  TextEditingController nameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController addressFieldController = TextEditingController();
  TextEditingController genderFieldController = TextEditingController();
  TextEditingController weightFieldController = TextEditingController();
  TextEditingController heightFieldController = TextEditingController();
  TextEditingController chestFieldController = TextEditingController();
  TextEditingController leftArmFieldController = TextEditingController();
  TextEditingController rightArmFieldController = TextEditingController();
  TextEditingController waistFieldController = TextEditingController();
  TextEditingController hipsFieldController = TextEditingController();
  TextEditingController leftThighFieldController = TextEditingController();
  TextEditingController rightThighFieldController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfileAPI();

  }

  getProfileAPI() async {
    isLoading(true);
    String url = ApiUrl.getProfileApi + "${UserDetails.userId}";
    log('url: $url');
    log('UserDetails.userId: ${UserDetails.userId}');
    log('UserDetails.userIdToken: ${UserDetails.userIdToken}');
    try{
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log('Response : ${response.body}');
      GetUserProfileModel getUserProfileModel = GetUserProfileModel.fromJson(json.decode(response.body));
      isSuccessStatusCode = getUserProfileModel.success.obs;
      log('isStatus: $isSuccessStatusCode');

      if(isSuccessStatusCode.value){
        log('Success');
        nameFieldController.text = getUserProfileModel.list.name;
        emailFieldController.text = getUserProfileModel.list.email;
        addressFieldController.text = getUserProfileModel.list.address;
        genderValue.value = getUserProfileModel.list.gender;
         weightFieldController.text = getUserProfileModel.list.weight;
         heightFieldController.text =  getUserProfileModel.list.height;
        chestFieldController.text =  getUserProfileModel.list.chest;
        leftArmFieldController.text =  getUserProfileModel.list.lArm;
        rightArmFieldController.text =  getUserProfileModel.list.rArm;
        waistFieldController.text =  getUserProfileModel.list.walst;
        hipsFieldController.text =  getUserProfileModel.list.hlps;
        leftThighFieldController.text =  getUserProfileModel.list.lThigh;
        rightThighFieldController.text =  getUserProfileModel.list.rThigh;
        userProfile =  "https://squadgame.omdemo.co.in/asset/uploads/" + getUserProfileModel.list.image;
        userBeforeImageProfile = "https://squadgame.omdemo.co.in/asset/uploads/" + getUserProfileModel.list.beforeimage;
        userAfterImageProfile = "https://squadgame.omdemo.co.in/asset/uploads/" + getUserProfileModel.list.afterimage;

      }else{
        log('Fail');
        Fluttertoast.showToast(msg: getUserProfileModel.messege);
        Fluttertoast.showToast(msg: getUserProfileModel.errorMessage);
      }
    }catch(e){
      log('Get Profile Error: $e');
    } finally{
     // isLoading(false);
      addStarPointAPI();
    }
  }

  updateProfileAPI() async {
    isLoading(true);
    String url = ApiUrl.updateProfileApi;
    log('url: $url');
    log('UserDetails.userId: ${UserDetails.userId}');
    try{
      if(profile != null){
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(profile!.openRead());
        var beforeStream = http.ByteStream(beforeImageProfile!.openRead());
        var afterStream = http.ByteStream(afterImageProfile!.openRead());

        stream.cast();
        beforeStream.cast();
        afterStream.cast();

        var length = await profile!.length();
        var beforeLength = await beforeImageProfile!.length();
        var afterLength = await afterImageProfile!.length();

        request.files.add(await http.MultipartFile.fromPath("image", profile!.path));
        request.files.add(await http.MultipartFile.fromPath("beforeimage", profile!.path));
        request.files.add(await http.MultipartFile.fromPath("afterimage", profile!.path));

        request.headers.addAll(apiHeader.headers);

        request.fields['id'] = "${UserDetails.userId}";
        request.fields['name'] = nameFieldController.text.trim();
        request.fields['address'] = addressFieldController.text.trim();
        request.fields['gender'] = genderValue.value;
        request.fields['height'] = heightFieldController.text.trim();
        request.fields['weight'] = weightFieldController.text.trim();
        request.fields['chest'] = chestFieldController.text.trim();
        request.fields['l_arm'] = leftArmFieldController.text.trim();
        request.fields['r_arm'] = rightArmFieldController.text.trim();
        request.fields['walst'] = waistFieldController.text.trim();
        request.fields['hlps'] = hipsFieldController.text.trim();
        request.fields['l_thigh'] = leftThighFieldController.text.trim();
        request.fields['r_thigh'] = rightThighFieldController.text.trim();


        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');

        var multiPart = http.MultipartFile(
          'image',
          stream,
          length,
        );
        var beforeMultiPart = http.MultipartFile(
          'beforeimage',
          beforeStream,
          beforeLength,
        );
        var afterMultiPart = http.MultipartFile(
          'afterimage',
          afterStream,
          afterLength,
        );

        request.files.add(multiPart);
        request.files.add(beforeMultiPart);
        request.files.add(afterMultiPart);

        //var multiPart = http.MultipartFile('file', stream, length);
        // request.files.add(multiPart);
        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) {
          GetUserUpdateProfileModel response1 = GetUserUpdateProfileModel.fromJson(json.decode(value));
          log('response1 ::::::$response1');
          isSuccessStatusCode = response1.success.obs;
          log('status : $isSuccessStatusCode');

          if(isSuccessStatusCode.value){
            Fluttertoast.showToast(msg: response1.messege);
            getProfileAPI();
          } else {
            log('status code false: ${response1.success}');
            log('response1.errorMessage: ${response1.errorMessage}');
            //if(response1.errorMessage.contains("Token don't match")){
              Fluttertoast.showToast(msg: response1.errorMessage);
            Fluttertoast.showToast(msg: response1.messege);
           // }

            log('False False');
          }
        });
      }
      else if(profile == null){
        var request = http.MultipartRequest('POST', Uri.parse(url));

        // var stream = http.ByteStream(profile!.openRead());
        // var beforeStream = http.ByteStream(beforeImageProfile!.openRead());
        // var afterStream = http.ByteStream(afterImageProfile!.openRead());
        //
        // stream.cast();
        // beforeStream.cast();
        // afterStream.cast();
        //
        // var length = await profile!.length();
        // var beforeLength = await beforeImageProfile!.length();
        // var afterLength = await afterImageProfile!.length();

        // request.files.add(await http.MultipartFile.fromPath("image", profile!.path));
        // request.files.add(await http.MultipartFile.fromPath("beforeimage", profile!.path));
        // request.files.add(await http.MultipartFile.fromPath("afterimage", profile!.path));

        request.headers.addAll(apiHeader.headers);

        request.fields['id'] = "${UserDetails.userId}";
        request.fields['name'] = nameFieldController.text.trim();
        request.fields['address'] = addressFieldController.text.trim();
        request.fields['gender'] = genderValue.value;
        request.fields['height'] = heightFieldController.text.trim();
        request.fields['weight'] = weightFieldController.text.trim();
        request.fields['chest'] = chestFieldController.text.trim();
        request.fields['l_arm'] = leftArmFieldController.text.trim();
        request.fields['r_arm'] = rightArmFieldController.text.trim();
        request.fields['walst'] = waistFieldController.text.trim();
        request.fields['hlps'] = hipsFieldController.text.trim();
        request.fields['l_thigh'] = leftThighFieldController.text.trim();
        request.fields['r_thigh'] = rightThighFieldController.text.trim();


        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');

        // var multiPart = http.MultipartFile(
        //   'image',
        //   stream,
        //   length,
        // );
        // var beforeMultiPart = http.MultipartFile(
        //   'beforeimage',
        //   beforeStream,
        //   beforeLength,
        // );
        // var afterMultiPart = http.MultipartFile(
        //   'afterimage',
        //   afterStream,
        //   afterLength,
        // );
        //
        // request.files.add(multiPart);
        // request.files.add(beforeMultiPart);
        // request.files.add(afterMultiPart);

        //var multiPart = http.MultipartFile('file', stream, length);
        // request.files.add(multiPart);
        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) {
          GetUserUpdateProfileModel response1 = GetUserUpdateProfileModel.fromJson(json.decode(value));
          log('response1 ::::::$response1');
          isSuccessStatusCode = response1.success.obs;
          log('status : $isSuccessStatusCode');
          //log('success : ${response1.statusCode}');

          if(isSuccessStatusCode.value){
            Fluttertoast.showToast(msg: response1.messege);
            getProfileAPI();
          } else {
            log('status code false: ${response1.success}');
            log('response1.errorMessage: ${response1.errorMessage}');
            //if(response1.errorMessage.contains("Token don't match")){
              Fluttertoast.showToast(msg: response1.errorMessage);
            Fluttertoast.showToast(msg: response1.messege);
            //}
            log('False False');
          }
        });
      }

    }catch(e){
      log('Error: $e');
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
      //"gameid" : "${UserDetails.gameId}"
    };
    try{
      http.Response response = await http.post(Uri.parse(url), body: data, headers: apiHeader.headers);
      log('Response : ${response.body}');
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

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}