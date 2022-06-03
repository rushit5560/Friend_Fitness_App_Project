import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/constants/api_header.dart';
import 'package:friend_fitness_app/common/constants/api_url.dart';
import 'package:friend_fitness_app/common/sharedpreference_data/sharedpreference_data.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/model/add_water_intake_point_model/add_water_intake_point_model.dart';
import 'package:friend_fitness_app/model/category_model/category_model.dart';
import 'package:friend_fitness_app/model/get_all_negative_category_model/get_all_negative_category_model.dart';
import 'package:friend_fitness_app/model/get_all_positive_category/get_all_positive_category.dart';
import 'package:friend_fitness_app/model/home_screen_models/water_intake_model.dart';
import 'package:friend_fitness_app/model/negative_category_point_model/negative_category_point_model.dart';
import 'package:friend_fitness_app/model/positive_category_point_model/positive_category_point_model.dart';
import 'package:friend_fitness_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:http/http.dart' as http;
import 'package:friend_fitness_app/model/home_screen_models/fitness_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TrackScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatusCode = false.obs;
  RxInt waterIntakeValue = 0.obs;
  RxInt positiveCategoryValue = 0.obs;

  RxBool isPositiveSelected = true.obs;
  RxBool isNegativeSelected = false.obs;

  List<FitnessModel> exerciseList = [];
  List<FitnessModel> movementList = [];
  List<FitnessModel> mindfulnessList = [];
  List<WaterIntakeModel> waterIntakeList = [];

  List<CategoryModel> categoryList = [];

  ApiHeader apiHeader= ApiHeader();
  List<ListElement> getAllPositiveCategoryList = [];
  List<ListElement1> getAllNegativeCategoryList = [];
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();


  @override
  void onInit() {
    //getAllFitnessFromFirebaseFunction();
    getAllPositiveCategoryFromFirebaseFunction();

    super.onInit();
  }

  /// Get Exercise, Movement, Mindfulness List From Firebase Using Postman API
  /*getAllFitnessFromFirebaseFunction() async {
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
  }*/

  /// Get Water Intake From Firebase Using postman API
  /*getWaterIntakeFromFirebaseFunction() async {
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
*/
  /// Add Water Intake Record In Firebase Using Postman API
  /*addWaterIntakeRecordInFirebaseFunction() async {
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

  }*/

  /// Get All Positive Category
  getAllPositiveCategoryFromFirebaseFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllPositiveCategoryApi;
    log("Category API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log('Response:  ${response.body}');

      GetAllPositiveCategoryModel getAllPositiveCategoryModel = GetAllPositiveCategoryModel.fromJson(json.decode(response.body));
      // log('signInModel: ${signUpModel.name}');
      isSuccessStatusCode = getAllPositiveCategoryModel.success.obs;
      log('isStatus: $isSuccessStatusCode');

      if(isSuccessStatusCode.value) {
        /*Map<String, dynamic> newMapResponse = jsonDecode(response.body);
        log("newMapResponse : $newMapResponse");

        newMapResponse.forEach((k, v) => categoryList.add(CategoryModel(
            categoryId: v['category_id'],
            categoryName: v['category_name'],
            categoryImg: v['category_image'],
            categoryPoint: v['category_point']
        )));

        for(int i =0; i < categoryList.length; i++) {
          log(categoryList[i].categoryId.toString());
          log(categoryList[i].categoryName);
        }*/

        getAllPositiveCategoryList = getAllPositiveCategoryModel.list;
        log('getAllPositiveCategoryList : $getAllPositiveCategoryList');

      }else{
        Fluttertoast.showToast(msg: getAllPositiveCategoryModel.messege);
        if(getAllPositiveCategoryModel.messege == "Token don't match"){
          sharedPreferenceData.clearUserLoginDetailsFromPrefs();
          Get.offAll(SignInScreen(), transition: Transition.zoom);
        }
      }

    } catch(e) {
      log("getAllPositiveCategoryList Error ::: $e");
    } finally {
      //isLoading(false);
      getAllNegativeCategoryFromFirebaseFunction();
    }
  }

  /// Get All Positive Category
  getAllNegativeCategoryFromFirebaseFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllNegativeCategoryApi;
    log("Category API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log('Response:  ${response.body}');

      GetAllNegativeCategoryModel getAllNegativeCategoryModel = GetAllNegativeCategoryModel.fromJson(json.decode(response.body));
      // log('signInModel: ${signUpModel.name}');
      isSuccessStatusCode = getAllNegativeCategoryModel.success.obs;
      log('isStatus: $isSuccessStatusCode');

      if(isSuccessStatusCode.value) {

        getAllNegativeCategoryList = getAllNegativeCategoryModel.list;
        log('getAllNegativeCategoryList : $getAllNegativeCategoryList');

      } else{
        Fluttertoast.showToast(msg: getAllNegativeCategoryModel.messege);
        if(getAllNegativeCategoryModel.messege == "Token don't match"){
          sharedPreferenceData.clearUserLoginDetailsFromPrefs();
          Get.offAll(SignInScreen(), transition: Transition.zoom);
        }
      }

    } catch(e) {
      log("getAllNegativeCategoryList Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Add Positive Category Point Entry UserWise
  addPositiveCategoryPointEntry({required int catId, required double point}) async {
    isLoading(true);
    Fluttertoast.showToast(msg: "Please wait!");
    //var formatter = DateFormat('MM');
    //String date = "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String date = formatter.format(now);
    log(date);
    String url = ApiUrl.addPositivePointApi;
    log("Add Category Point Entry API URL : $url");

    try {
      Map<String, dynamic> data = {
        "gameid" : "${UserDetails.gameId}",
        "userid" : "${UserDetails.userId}",
        "categoryid" : "$catId",
        "point" : "$point",
        "date" : date
      };

      // Map<String, dynamic> data = {
      //   "gameid": "1",
      //   "userid" :"9",
      //   "categoryid" :"1",
      //   "point" : "6.5",
      //   "date" :"16-05-2022"
      // };
      log("Category Entry Data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data, headers: apiHeader.headers);
      log("Response : ${response.body}");

      CategoryAddPositivePointModel categoryAddPositivePointModel = CategoryAddPositivePointModel.fromJson(json.decode(response.body));
      // log('signInModel: ${signUpModel.name}');
      isSuccessStatusCode = categoryAddPositivePointModel.success.obs;
      log('isStatus: $isSuccessStatusCode');

      if(isSuccessStatusCode.value) {
        //getAllPositiveCategoryFromFirebaseFunction();
        Fluttertoast.showToast(msg: categoryAddPositivePointModel.messege);

      } else {
        Fluttertoast.showToast(msg: categoryAddPositivePointModel.messege);
        //Fluttertoast.showToast(msg: categoryAddPositivePointModel.errorMessage);
        if(categoryAddPositivePointModel.messege == "Token don't match"){
          sharedPreferenceData.clearUserLoginDetailsFromPrefs();
          Get.offAll(SignInScreen(), transition: Transition.zoom);
        }

        log("addCategoryPointEntryToFirebaseFunction Else Else");
      }

    } catch(e) {
      log("addCategoryPointEntryToFirebaseFunction Error ::: $e");
    } finally {
       isLoading(false);
    }

  }

  /// Add Negative Category Point Entry UserWise
  addNegativeCategoryPointEntry({required int catId, required double point}) async {
    Fluttertoast.showToast(msg: "Please wait!");
    //String gameId = "${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}";
    //String date = "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String date = formatter.format(now);
    log(date);
    // isLoading(true);
    String url = ApiUrl.addNegativePointApi;
    log("Add Category Point Entry API URL : $url");

    try {
      Map<String, dynamic> data = {
        "gameid" : "${UserDetails.gameId}",
        "userid" : "${UserDetails.userId}",
        "categoryid" : "$catId",
        "point" : "$point",
        "date" : date

      };
      log("Negative Category Entry Data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data, headers: apiHeader.headers);
      log("Response : ${response.body}");

      CategoryAddNegativePointModel categoryAddNegativePointModel = CategoryAddNegativePointModel.fromJson(json.decode(response.body));
      // log('signInModel: ${signUpModel.name}');
      isSuccessStatusCode = categoryAddNegativePointModel.success.obs;
      log('isStatus: $isSuccessStatusCode');

      if(isSuccessStatusCode.value) {
        //getAllPositiveCategoryFromFirebaseFunction();
        Fluttertoast.showToast(msg: categoryAddNegativePointModel.messege);

      } else {
        Fluttertoast.showToast(msg: categoryAddNegativePointModel.messege);

        if(categoryAddNegativePointModel.messege == "Token don't match"){
          sharedPreferenceData.clearUserLoginDetailsFromPrefs();
          Get.offAll(SignInScreen(), transition: Transition.zoom);
        }
        //Fluttertoast.showToast(msg: categoryAddNegativePointModel.errorMessage);
        log("addNegativeCategoryPointEntryTFunction Else Else");
      }

    } catch(e) {
      log("addNegativeCategoryPointEntryTFunction Error ::: $e");
    } finally {
      // isLoading(false);
    }

  }

  /// Add Water Intake Category Point Entry UserWise
  addWaterIntakeCategoryPointEntry({required int catId, required double point}) async {
    Fluttertoast.showToast(msg: "Please wait!");
    //String gameId = "${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}";
    String date = "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
    // isLoading(true);
    String url = ApiUrl.addWaterIntakePositivePointApi;
    log("Add Category Point Entry API URL : $url");

    try {
      Map<String, dynamic> data = {
        "gameid" : "${UserDetails.gameId}",
        "userid" : "${UserDetails.userId}",
        "categoryid" : "$catId",
        "point" : "$point",
        "date" : date

      };

      // Map<String, dynamic> data = {
      //   "gameid": "1",
      //   "userid" :"9",
      //   "categoryid" :"1",
      //   "point" : "6.5",
      //   "date" :"16-05-2022"
      // };
      log("Water Intake Category Entry Data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data, headers: apiHeader.headers);
      log("Response : ${response.body}");

      AddWaterIntakePointListModel addWaterIntakePointListModel = AddWaterIntakePointListModel.fromJson(json.decode(response.body));
      // log('signInModel: ${signUpModel.name}');
      isSuccessStatusCode = addWaterIntakePointListModel.success.obs;
      log('isStatus: $isSuccessStatusCode');

      if(isSuccessStatusCode.value) {
        //getAllPositiveCategoryFromFirebaseFunction();
        Fluttertoast.showToast(msg: addWaterIntakePointListModel.messege);

      } else {
        Fluttertoast.showToast(msg: addWaterIntakePointListModel.messege);

        if(addWaterIntakePointListModel.messege == "Token don't match"){
          sharedPreferenceData.clearUserLoginDetailsFromPrefs();
          Get.offAll(SignInScreen(), transition: Transition.zoom);
        }
        //Fluttertoast.showToast(msg: addWaterIntakePointListModel.errorMessage);
        log("addWaterIntakeCategoryPointEntryFunction Else Else");
      }

    } catch(e) {
      log("addWaterIntakeCategoryPointEntryFunction Error ::: $e");
    } finally {
      // isLoading(false);
    }

  }


}