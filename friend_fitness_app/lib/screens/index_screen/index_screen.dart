import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/constants/app_colors.dart';
import 'package:friend_fitness_app/screens/group_list_screen/group_list_screen.dart';
import 'package:get/get.dart';

import '../../common/constants/app_images.dart';
import '../../controllers/index_screen_controller/index_screen_controller.dart';
import '../category_screen/category_screen.dart';
import '../home_screen/home_screen.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({Key? key}) : super(key: key);
  final indexScreenController = Get.put(IndexScreenController());

  final widgetOptions = [
    HomeScreen(),
    CategoryScreen(),
    const GroupListScreen(),
  ];

  void onItemTapped(int index) {
    indexScreenController.selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: widgetOptions
              .elementAt(indexScreenController.selectedIndex.value),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: Obx(
          ()=> BottomNavigationBar(
            backgroundColor: AppColors.colorLightGrey,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(
                    AppImages.bottomHomeImg, scale: 2.5,
                    color: indexScreenController.selectedIndex.value == 0 ? AppColors.colorDarkGrey
                : Colors.grey,),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppImages.bottomCategoriesImg, scale: 2.5,
                  color: indexScreenController.selectedIndex.value == 1 ? AppColors.colorDarkGrey
                      : Colors.grey,),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppImages.bottomGroupImg, scale: 2.5,
                  color: indexScreenController.selectedIndex.value == 2 ? AppColors.colorDarkGrey
                      : Colors.grey,),
                label: "",
              ),
            ],
            // backgroundColor: AppColors.colorDarkPink,
            currentIndex: indexScreenController.selectedIndex.value,
            fixedColor: Colors.white,
            onTap: onItemTapped,
          ),
        ),
      ),
    );
  }
}
