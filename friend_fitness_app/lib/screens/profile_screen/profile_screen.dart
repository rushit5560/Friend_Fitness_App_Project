import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/controllers/profile_screen_controller/profile_screen_controller.dart';
import 'package:friend_fitness_app/screens/profile_screen/profile_screen_widgets.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final profileScreenController = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileScreenAppBarModule(),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Obx(()=>
                profileScreenController.isLoading.value ?
                    const CircularProgressIndicator():
                   Column(
                    children: [
                      ProfileImage(),
                      const SizedBox(height: 35),
                      NameTextFieldModule(),
                      const SizedBox(height: 20),
                      EmailTextFieldModule(),
                      const SizedBox(height: 20),
                       WeightTextFieldModule(),
                      const SizedBox(height: 20),
                       MeasurementTextFieldModule(),
                      const SizedBox(height: 20),
                       HeightTextFieldModule(),
                      const SizedBox(height: 30),
                       SaveButtonModule(),
                      const SizedBox(height: 30),
                      const BeforeAfterImageModule(),
                      const SizedBox(height: 20),
                    ],
                  ).commonAllSidePadding(),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
