import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/common_widgets.dart';
import '../../controllers/category_screen_controller/category_screen_controller.dart';
import 'category_screen_widgets.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
  final categoryScreenController = Get.put(CategoryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=> categoryScreenController.isLoading.value
          ? const CustomCircularProgressIndicator()
        : SafeArea(
          child: Column(
            children: [
              const CategoryScreenAppBarModule(),
              Expanded(
                child: CategoryListModule(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
