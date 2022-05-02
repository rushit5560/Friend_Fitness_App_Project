import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/common_widgets.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:get/get.dart';
import '../../common/constants/app_colors.dart';
import '../../controllers/category_screen_controller/category_screen_controller.dart';
import '../../model/category_model/category_model.dart';


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
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20),
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
    return StreamBuilder<List<CategoryModel>>(
      stream: screenController.getAllCategoryFromFirebase(),
      builder: (context, snapshot) {
        if(snapshot.hasError) {
          return Text("Something went wrong! ${snapshot.error}");
        }
        else if(snapshot.hasData) {
          final categories = snapshot.data;

          return ListView(
            children: categories!.map((val) {
              return categoryListTile(val).commonSymmetricPadding(horizontal: 8, vertical: 6);
            }).toList(),
          ).commonAllSidePadding(padding: 15);
        } else {
          return const CustomCircularProgressIndicator();
        }
      },
    );
  }

  Widget categoryListTile(CategoryModel singleCategory) {
    return Container(
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
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  // singleCategory.value++;
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
                "0",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ).commonSymmetricPadding(horizontal: 10),

              GestureDetector(
                onTap: () {
                  // if(singleCategory.value < 1) {
                  //   log("Value ${singleCategory.value}");
                  // } else {
                  //   singleCategory.value--;
                  // }
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
          ),
        ],
      ).commonAllSidePadding(padding: 15),
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