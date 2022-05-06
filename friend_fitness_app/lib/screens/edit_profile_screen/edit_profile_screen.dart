import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/controllers/edit_profile_screen_controller/edit_profile_screen_controller.dart';
import 'package:friend_fitness_app/controllers/profile_screen_controller/profile_screen_controller.dart';
import 'package:friend_fitness_app/screens/edit_profile_screen/edit_profile_screen_widgets.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  //EditProfileScreen({Key? key}) : super(key: key);
  EditProfileScreen({Key? key}) : super(key: key);
  //final editScreenController = Get.put(EditProfileScreenController());
  final screenController = Get.find<ProfileScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ProfileScreenAppBarModule(),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Obx(()=>
                screenController.isLoading.value
                    ? Center(child: CircularProgressIndicator()):
                  Form(
                    key: screenController.editProfileFormKey,
                    child: Column(
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
                        BeforeAfterImageModule(),
                        const SizedBox(height: 20),
                      ],
                    ).commonAllSidePadding(),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
