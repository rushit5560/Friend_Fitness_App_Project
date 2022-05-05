import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/category_details_screen_controller/category_details_screen_controller.dart';
import 'category_details_screen_widgets.dart';

class CategoryDetailsScreen extends StatelessWidget {
  CategoryDetailsScreen({Key? key}) : super(key: key);
  final categoryDetailsScreenController = Get.put(CategoryDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CategoryDetailsScreenAppBarModule(),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
