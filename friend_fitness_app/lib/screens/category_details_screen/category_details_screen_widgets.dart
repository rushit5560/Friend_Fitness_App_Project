import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/app_colors.dart';
import '../../controllers/category_details_screen_controller/category_details_screen_controller.dart';


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