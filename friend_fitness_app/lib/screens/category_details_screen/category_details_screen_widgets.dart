import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/model/category_user_record_model/category_user_record_model.dart';
import 'package:get/get.dart';

import '../../common/constants/app_colors.dart';
import '../../controllers/category_details_screen_controller/category_details_screen_controller.dart';


/// AppBar
class CategoryDetailsScreenAppBarModule extends StatelessWidget {
  CategoryDetailsScreenAppBarModule({Key? key}) : super(key: key);
  final screenController = Get.find<CategoryDetailsScreenController>();

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
          GestureDetector(
            onTap: () => Get.back(),
            child: const SizedBox(
              width: 42,
              height: 42,
              child: Icon(
                Icons.arrow_back_ios_rounded
              ),
            ),
          ),
          Text(
            screenController.category.categoryName,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            width: 42,
            height: 42,
          ),
        ],
      ),
    );
  }
}



/// Product Wise Consume List
class UserConsumeCategoryListModule extends StatelessWidget {
  UserConsumeCategoryListModule({Key? key}) : super(key: key);
  final screenController = Get.find<CategoryDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeadingModule(),
        Expanded(
          child: ListView.builder(
            itemCount: screenController.categoryUserEntryList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              CategoryUserEntryModel singleItem = screenController.categoryUserEntryList[i];
              return _listTile(singleItem);
            },
          ).commonAllSidePadding(),
        ),
      ],
    );
  }

  Widget _listTile(CategoryUserEntryModel singleItem) {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(
            singleItem.date,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            singleItem.point.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ).commonAllSidePadding(),
    ).commonSymmetricPadding(vertical: 10);
  }

}


/// Heading Module
class HeadingModule extends StatelessWidget {
  const HeadingModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "Date",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        Text(
          "Points",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 10);
  }
}


