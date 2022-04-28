import 'package:get/get.dart';

import '../../common/constants/app_images.dart';

class CategoryScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  List<CategoryModel> categoryList = [
    CategoryModel(img: AppImages.categoryDairyProductImg, name: "Dairy Product", value: 0),
    CategoryModel(img: AppImages.categoryAlcoholImg, name: "Alcohol", value: 0),
    CategoryModel(img: AppImages.categoryPastaImg, name: "Pasta", value: 0),
    CategoryModel(img: AppImages.categoryPizzaImg, name: "Pizza", value: 0),
    CategoryModel(img: AppImages.categoryCandyImg, name: "Candy", value: 0),
    CategoryModel(img: AppImages.categorySodaImg, name: "Soda", value: 0),
  ];

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}

class CategoryModel {
  String img;
  String name;
  int value;

  CategoryModel({required this.img, required this.name, required this.value});


}