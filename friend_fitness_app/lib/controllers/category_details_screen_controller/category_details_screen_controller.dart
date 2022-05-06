import 'dart:convert';
import 'dart:developer';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../model/category_model/category_model.dart';
import '../../model/category_user_record_model/category_user_record_model.dart';


class CategoryDetailsScreenController extends GetxController {
  /// Get Category Id From Category Screen
  CategoryModel category = Get.arguments;
  RxBool isLoading = false.obs;

  List<CategoryUserEntryModel> categoryUserEntryList = [];



  getCategoryUserPointRecordFunction() async {
    isLoading(true);
    String url = "https://fitness-app-f51fa-default-rtdb.firebaseio.com/category_user_entry.json";
    log("Category User Records API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      // log("Response : ${response.body}");

      if(response.statusCode == 200) {
        Map<String, dynamic> newMapResponse = jsonDecode(response.body);
        // log("newMapResponse : $newMapResponse");

        List<CategoryUserEntryModel> allList = [];
        List<CategoryUserEntryModel> allList2 = [];

        newMapResponse.forEach((key, value) => allList.add(CategoryUserEntryModel(
          id: value['id'],
          userId: value['user_id'],
          categoryId: value['category_id'],
          categoryName: value['category_name'],
          point: double.parse(value['point'].toString()),
          date: value['date']
        )));

        // log("allList : ${allList.length}");

        for(int i = 0; i < allList.length; i++) {
          if(allList[i].userId == UserDetails.userId) {
            if(allList[i].categoryId == category.categoryId) {
              allList2.add(allList[i]);
            }
          }
        }

        categoryUserEntryList = allList2.reversed.toList();

        // log("categoryUserEntryList : $categoryUserEntryList");
        log("categoryUserEntryList : ${categoryUserEntryList.length}");

      } else {
        log("getCategoryUserPointRecordFunction Else Else");
      }

    }catch(e) {
      log("getCategoryUserPointRecordFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }

  @override
  void onInit() {
    getCategoryUserPointRecordFunction();
    super.onInit();
  }


}