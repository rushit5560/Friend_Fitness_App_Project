import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/common_widgets.dart';
import 'package:get/get.dart';

import '../../controllers/category_details_screen_controller/category_details_screen_controller.dart';
import 'category_details_screen_widgets.dart';

class CategoryDetailsScreen extends StatelessWidget {
  CategoryDetailsScreen({Key? key}) : super(key: key);
  final categoryDetailsScreenController = Get.put(CategoryDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=> categoryDetailsScreenController.isLoading.value
          ? const CustomCircularProgressIndicator()
        : SafeArea(
          child: Column(
            children: [
              CategoryDetailsScreenAppBarModule(),
              const SizedBox(height: 10),
              Expanded(
                  child: categoryDetailsScreenController.categoryUserEntryList.isEmpty
                  ? const Center(child: Text("No User Data"))
                  : UserConsumeCategoryListModule(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
