import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/category_model/category_model.dart';


class FirebaseDatabaseMethods {

  Future<Stream<List<CategoryModel>>> getAllCategoryFromFirebase() async {
    return FirebaseFirestore.instance.collection("category")
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => CategoryModel.fromJson(doc.data()))
            .toList());
  }

}