import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:friend_fitness_app/model/category_model/category_model.dart';
import 'package:get/get.dart';
import '../../firebase/firebase_functions.dart';

class CategoryScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  FirebaseDatabaseMethods firebaseDatabaseMethods = FirebaseDatabaseMethods();
  Stream<List<CategoryModel>>? categoryListFirebase;


  /// Get Category From Firebase Function
  Stream<List<CategoryModel>> getAllCategoryFromFirebase() {
    return FirebaseFirestore.instance.collection("category")
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => CategoryModel.fromJson(doc.data()))
            .toList());
  }

  // getCategoryFromFirebaseFunction() async {
  //   isLoading(true);
  //   await firebaseDatabaseMethods.getAllCategoryFromFirebase();
  //   /*categoryListFirebase = await firebaseDatabaseMethods.getAllCategoryFromFirebase();*/
  //   // log("categoryListFirebase :: $categoryListFirebase");
  //   isLoading(true);
  //
  // }


  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
