import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/screens/category_details_screen/category_details_screen.dart';
import 'package:get/get.dart';
import '../../common/constants/app_colors.dart';
import '../../controllers/category_screen_controller/category_screen_controller.dart';
import '../../model/category_model/category_model.dart';


/// AppBar
class CategoryScreenAppBarModule extends StatelessWidget {
  const CategoryScreenAppBarModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          color: AppColors.colorLightGrey
          //color: Colors.grey
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          const Text(
            "Categories",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(),
        ],
      ),
    );
  }
}

class CategoryListModule extends StatelessWidget {
  CategoryListModule({Key? key}) : super(key: key);
  final screenController = Get.find<CategoryScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.categoryList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        CategoryModel singleCategory = screenController.categoryList[i];
        return categoryListTile(singleCategory)
            .commonSymmetricPadding(vertical: 8);
      },
    ).commonAllSidePadding(padding: 15);
    // return StreamBuilder<List<CategoryModel>>(
    //   stream: screenController.getAllCategoryFromFirebase(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasError) {
    //       return Text("Something went wrong! ${snapshot.error}");
    //     } else if (snapshot.hasData) {
    //       final categories = snapshot.data;
    //
    //       return ;
    //
    //       // return ListView(
    //       //   physics: const BouncingScrollPhysics(),
    //       //   children: categories!.map((val) {
    //       //     return categoryListTile(val).commonSymmetricPadding(horizontal: 8, vertical: 6);
    //       //   }).toList(),
    //       // ).commonAllSidePadding(padding: 15);
    //
    //     } else {
    //       return const CustomCircularProgressIndicator();
    //     }
    //   },
    // );
  }

  Widget categoryListTile(CategoryModel singleCategory) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => CategoryDetailsScreen(),
          transition: Transition.zoom,
          arguments: singleCategory,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              blurStyle: BlurStyle.outer,
              color: AppColors.colorLightGrey,
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              height: 55,
              width: 55,
              child: Image.network(singleCategory.categoryImg),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                singleCategory.categoryName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                screenController.addCategoryPointEntryToFirebaseFunction(
                  catId: singleCategory.categoryId,
                  catName: singleCategory.categoryName,
                  point: singleCategory.categoryPoint.toDouble(),
                );

                // screenController.loadUI();
              },
              child: Container(
                // height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.colorDarkGrey,
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.add_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                    Text(
                      "Add",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ).commonSymmetricPadding(horizontal: 16, vertical: 10),
              ),
            ),
            /*Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // if (singleCategory.categoryId == "cat_id_1") {
                    //   screenController.dairyProductValue++;
                    //   log("${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}${DateTime.now().hour}${DateTime.now().minute}${DateTime.now().second}${DateTime.now().millisecond}");
                    // } else if (singleCategory.categoryId == "cat_id_2") {
                    //   screenController.alcoholValue++;
                    // } else if (singleCategory.categoryId == "cat_id_3") {
                    //   screenController.pastaValue++;
                    // } else if (singleCategory.categoryId == "cat_id_4") {
                    //   screenController.pizzaValue++;
                    // } else if (singleCategory.categoryId == "cat_id_5") {
                    //   screenController.candyValue++;
                    // } else if (singleCategory.categoryId == "cat_id_6") {
                    //   screenController.sodaValue++;
                    // }

                    screenController.addCategoryPointEntryToFirebaseFunction(
                      catId: singleCategory.categoryId,
                      catName: singleCategory.categoryName,
                      point: singleCategory.categoryPoint.toDouble(),
                    );

                    screenController.loadUI();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.colorDarkGrey,
                    ),
                    child: Center(
                      child: const Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                        size: 18,
                      ).commonAllSidePadding(padding: 8),
                    ),
                  ),
                ),
                Text(
                  singleCategory.categoryId == "cat_id_1"
                      ? "${screenController.dairyProductValue.value}"
                      : singleCategory.categoryId == "cat_id_2"
                          ? "${screenController.alcoholValue.value}"
                          : singleCategory.categoryId == "cat_id_3"
                              ? "${screenController.pastaValue.value}"
                              : singleCategory.categoryId == "cat_id_4"
                                  ? "${screenController.pizzaValue.value}"
                                  : singleCategory.categoryId == "cat_id_5"
                                      ? "${screenController.candyValue.value}"
                                      : "${screenController.sodaValue.value}",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ).commonSymmetricPadding(horizontal: 10),
                GestureDetector(
                  onTap: () {
                    if (singleCategory.categoryId == "cat_id_1") {
                      if (screenController.dairyProductValue < 1) {
                        log("dairyProductValue : ${screenController.dairyProductValue}");
                      } else {
                        screenController.dairyProductValue--;
                      }
                    } else if (singleCategory.categoryId == "cat_id_2") {
                      if (screenController.alcoholValue < 1) {
                        log("alcoholValue : ${screenController.alcoholValue}");
                      } else {
                        screenController.alcoholValue--;
                      }
                    } else if (singleCategory.categoryId == "cat_id_3") {
                      if (screenController.pastaValue < 1) {
                        log("pastaValue : ${screenController.pastaValue}");
                      } else {
                        screenController.pastaValue--;
                      }
                    } else if (singleCategory.categoryId == "cat_id_4") {
                      if (screenController.pizzaValue < 1) {
                        log("pizzaValue : ${screenController.pizzaValue}");
                      } else {
                        screenController.pizzaValue--;
                      }
                    } else if (singleCategory.categoryId == "cat_id_5") {
                      if (screenController.candyValue < 1) {
                        log("candyValue : ${screenController.candyValue}");
                      } else {
                        screenController.candyValue--;
                      }
                    } else if (singleCategory.categoryId == "cat_id_6") {
                      if (screenController.sodaValue < 1) {
                        log("sodaValue : ${screenController.sodaValue}");
                      } else {
                        screenController.sodaValue--;
                      }
                    }

                    screenController.loadUI();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.colorDarkGrey,
                    ),
                    child: Center(
                      child: const Icon(
                        Icons.remove_rounded,
                        color: Colors.white,
                        size: 18,
                      ).commonAllSidePadding(padding: 8),
                    ),
                  ),
                ),
              ],
            ),*/
          ],
        ).commonAllSidePadding(padding: 15),
      ),
    );
  }
}

// ListView.builder(
// itemCount: screenController.categoryList.length,
// shrinkWrap: true,
// physics: const BouncingScrollPhysics(),
// itemBuilder: (context, i) {
// CategoryModelOld singleCategory = screenController.categoryList[i];
// return _categoryListTile(singleCategory).commonSymmetricPadding(vertical: 8);
// },
// ).commonAllSidePadding(padding: 15)
