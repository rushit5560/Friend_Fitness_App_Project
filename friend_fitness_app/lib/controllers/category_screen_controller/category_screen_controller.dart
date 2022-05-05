import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:http/http.dart' as http;
import 'package:friend_fitness_app/model/category_model/category_model.dart';
import 'package:get/get.dart';



class CategoryScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt isSuccessStatusCode = 0.obs;
  List<CategoryModel> categoryList = [];

  RxInt dairyProductValue = 0.obs;
  RxInt alcoholValue = 0.obs;
  RxInt pastaValue = 0.obs;
  RxInt pizzaValue = 0.obs;
  RxInt candyValue = 0.obs;
  RxInt sodaValue = 0.obs;

  /// Get Category From Firebase Function
  getAllCategoryFromFirebaseFunction() async {
    isLoading(true);
    String url = "https://fitness-app-f51fa-default-rtdb.firebaseio.com/category.json";
    log("Category API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      isSuccessStatusCode = response.statusCode.obs;
      log('isStatus: $isSuccessStatusCode');

      if(isSuccessStatusCode.value == 200) {
        Map<String, dynamic> newMapResponse = jsonDecode(response.body);
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
        }

      }

    } catch(e) {
      log("getAllCategoryFromFirebaseFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Add Category Point Entry UserWise
  addCategoryPointEntryToFirebaseFunction({required String catId, required String catName, required double point}) async {
    Fluttertoast.showToast(msg: "Please wait!");
    String uniqueId = "${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}${DateTime.now().hour}${DateTime.now().minute}${DateTime.now().second}${DateTime.now().millisecond}";
    String date = "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
    // isLoading(true);
    String url = "https://fitness-app-f51fa-default-rtdb.firebaseio.com/category_user_entry.json";
    log("Add Category Point Entry API URL : $url");

    try {
      Map<String, dynamic> data = {
        "id" : uniqueId,
        "user_id" : UserDetails.userId,
        "category_id" : catId,
        "category_name" : catName,
        "date" : date,
        "point" : point.toDouble()
      };
      log("Category Entry Data : $data");

      http.Response response = await http.post(Uri.parse(url), body: jsonEncode(data));
      log("Response : ${response.statusCode}");

      if(response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Consume $catName");
      } else {
        log("addCategoryPointEntryToFirebaseFunction Else Else");
      }

    } catch(e) {
      log("addCategoryPointEntryToFirebaseFunction Error ::: $e");
    } finally {
      // isLoading(false);
    }

  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }


  @override
  void onInit() {
    getAllCategoryFromFirebaseFunction();
    super.onInit();
  }
}

/// Get Category From Firebase Function
// Stream<List<CategoryModel>> getAllCategoryFromFirebase() {
//   return FirebaseFirestore.instance.collection("category")
//       .snapshots()
//       .map((snapshot) =>
//       snapshot.docs.map((doc) => CategoryModel.fromJson(doc.data()))
//           .toList());
// }

// getCategoryFromFirebaseFunction() async {
//   isLoading(true);
//   await firebaseDatabaseMethods.getAllCategoryFromFirebase();
//   /*categoryListFirebase = await firebaseDatabaseMethods.getAllCategoryFromFirebase();*/
//   // log("categoryListFirebase :: $categoryListFirebase");
//   isLoading(true);
//
// }
