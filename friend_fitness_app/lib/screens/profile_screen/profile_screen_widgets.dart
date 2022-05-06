import 'dart:io';

import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/constants/app_colors.dart';
import 'package:friend_fitness_app/common/constants/app_images.dart';
import 'package:friend_fitness_app/common/sharedpreference_data/sharedpreference_data.dart';
import 'package:friend_fitness_app/controllers/profile_screen_controller/profile_screen_controller.dart';
import 'package:friend_fitness_app/screens/change_password_screen/change_password_screen.dart';
import 'package:friend_fitness_app/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:friend_fitness_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:get/get.dart';

class ProfileScreenAppBarModule extends StatelessWidget {
  ProfileScreenAppBarModule({Key? key}) : super(key: key);
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();


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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
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
                //Container(),
                const Text(
                  "Profile",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                GestureDetector(
                  onTap: (){
                    sharedPreferenceData.clearUserLoginDetailsFromPrefs();
                    Get.offAll(() => SignInScreen(), transition: Transition.zoom);
                    Get.snackbar('You Have Successfully Logout', '');
                  },
                    child: const SizedBox(
                        width: 42,
                        height: 42,
                        child: Icon(Icons.logout))),
                //SizedBox(width: 5),
              ],
            ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  ProfileImage({Key? key}) : super(key: key);
  final screenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.profile!.path.isNotEmpty ?
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.colorLightGrey,
            blurRadius: 6,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Image.file(screenController.profile!, scale: 40,)

      ),
    ) : Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.colorLightGrey,
            blurRadius: 6,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Image.asset(AppImages.profileImg),
    ),
    );
  }
}

class NameTextFieldModule extends StatelessWidget {
  NameTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Name:", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),)
        ),
        Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.colorLightGrey,
                        blurRadius: 2,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: screenController.nameFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none,
                    // suffix: IconButton(
                    //   onPressed: () {},
                    //   iconSize: 15,
                    //   icon: Icon(Icons.visibility_off_rounded),
                    // ),
                    // suffix: Container(
                    //   child: index == 0
                    //       ? null
                    //       : GestureDetector(
                    //     onTap: () {
                    //       signInScreenController.isPassVisible.value = !signInScreenController.isPassVisible.value;
                    //       print('isPassVisible : ${signInScreenController.isPassVisible.value}');
                    //     },
                    //     child: Obx(
                    //       ()=> Icon(signInScreenController.isPassVisible.value
                    //           ? Icons.visibility_rounded
                    //           : Icons.visibility_off_rounded),
                    //     ),
                    //   ),
                    // ),
                  ),
                  //validator: (value) => FieldValidator().validateEmail(value!),
                ),
              ],
            )
        )
      ],
    );
  }
}

class EmailTextFieldModule extends StatelessWidget {
  EmailTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Email:", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),)
        ),
        Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.colorLightGrey,
                        blurRadius: 2,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: screenController.emailFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none,
                    // suffix: IconButton(
                    //   onPressed: () {},
                    //   iconSize: 15,
                    //   icon: Icon(Icons.visibility_off_rounded),
                    // ),
                    // suffix: Container(
                    //   child: index == 0
                    //       ? null
                    //       : GestureDetector(
                    //     onTap: () {
                    //       signInScreenController.isPassVisible.value = !signInScreenController.isPassVisible.value;
                    //       print('isPassVisible : ${signInScreenController.isPassVisible.value}');
                    //     },
                    //     child: Obx(
                    //       ()=> Icon(signInScreenController.isPassVisible.value
                    //           ? Icons.visibility_rounded
                    //           : Icons.visibility_off_rounded),
                    //     ),
                    //   ),
                    // ),
                  ),
                  //validator: (value) => FieldValidator().validateEmail(value!),
                ),
              ],
            )
        )
      ],
    );
  }
}

class WeightTextFieldModule extends StatelessWidget {
  WeightTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Weight:", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),)
        ),
        Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.colorLightGrey,
                        blurRadius: 2,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: screenController.weightFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none,
                    // suffix: IconButton(
                    //   onPressed: () {},
                    //   iconSize: 15,
                    //   icon: Icon(Icons.visibility_off_rounded),
                    // ),
                    // suffix: Container(
                    //   child: index == 0
                    //       ? null
                    //       : GestureDetector(
                    //     onTap: () {
                    //       signInScreenController.isPassVisible.value = !signInScreenController.isPassVisible.value;
                    //       print('isPassVisible : ${signInScreenController.isPassVisible.value}');
                    //     },
                    //     child: Obx(
                    //       ()=> Icon(signInScreenController.isPassVisible.value
                    //           ? Icons.visibility_rounded
                    //           : Icons.visibility_off_rounded),
                    //     ),
                    //   ),
                    // ),
                  ),
                  //validator: (value) => FieldValidator().validateEmail(value!),
                ),
              ],
            )
        )
      ],
    );
  }
}

class MeasurementTextFieldModule extends StatelessWidget {
  MeasurementTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Measurement:", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),)
        ),
        Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.colorLightGrey,
                        blurRadius: 2,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: screenController.measurementFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none,
                    // suffix: IconButton(
                    //   onPressed: () {},
                    //   iconSize: 15,
                    //   icon: Icon(Icons.visibility_off_rounded),
                    // ),
                    // suffix: Container(
                    //   child: index == 0
                    //       ? null
                    //       : GestureDetector(
                    //     onTap: () {
                    //       signInScreenController.isPassVisible.value = !signInScreenController.isPassVisible.value;
                    //       print('isPassVisible : ${signInScreenController.isPassVisible.value}');
                    //     },
                    //     child: Obx(
                    //       ()=> Icon(signInScreenController.isPassVisible.value
                    //           ? Icons.visibility_rounded
                    //           : Icons.visibility_off_rounded),
                    //     ),
                    //   ),
                    // ),
                  ),
                  //validator: (value) => FieldValidator().validateEmail(value!),
                ),
              ],
            )
        )
      ],
    );
  }
}

class HeightTextFieldModule extends StatelessWidget {
  HeightTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Height:", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),)
        ),
        Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.colorLightGrey,
                        blurRadius: 2,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: screenController.heightFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none,
                    // suffix: IconButton(
                    //   onPressed: () {},
                    //   iconSize: 15,
                    //   icon: Icon(Icons.visibility_off_rounded),
                    // ),
                    // suffix: Container(
                    //   child: index == 0
                    //       ? null
                    //       : GestureDetector(
                    //     onTap: () {
                    //       signInScreenController.isPassVisible.value = !signInScreenController.isPassVisible.value;
                    //       print('isPassVisible : ${signInScreenController.isPassVisible.value}');
                    //     },
                    //     child: Obx(
                    //       ()=> Icon(signInScreenController.isPassVisible.value
                    //           ? Icons.visibility_rounded
                    //           : Icons.visibility_off_rounded),
                    //     ),
                    //   ),
                    // ),
                  ),
                  //validator: (value) => FieldValidator().validateEmail(value!),
                ),
              ],
            )
        )
      ],
    );
  }
}

class SaveButtonModule extends StatelessWidget {
  SaveButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => Get.to(()=> EditProfileScreen(), transition: Transition.zoom)/*!.then((value) async{
            await screenController.getProfileWithFirebaseAPI();
          })*/,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.colorDarkGrey
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 13),
              child: Text("UPDATE", style: TextStyle(color: Colors.white),),
            ),
          ),
        ),
        SizedBox(width: 20,),
        //Text("CHANGE PASSWORD", style: TextStyle(color: Colors.white),),
        GestureDetector(
          onTap: () => Get.to(()=> ChangePasswordScreen(), transition: Transition.zoom)/*!.then((value) async{
            await screenController.getProfileWithFirebaseAPI();
          })*/,
          child: Text("CHANGE PASSWORD ?",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }
}

class BeforeAfterImageModule extends StatelessWidget {
  BeforeAfterImageModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text("Before", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),

            SizedBox(height: 10),
            screenController.beforeImageProfile!.path.isNotEmpty ?
            Container(
              height: Get.height * 0.15,
              width: Get.width * 0.27,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.colorLightGrey,
                    blurRadius: 2,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Image.file(screenController.beforeImageProfile!),
            ):
            Container(
              height: Get.height * 0.15,
              width: Get.width * 0.27,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.colorLightGrey,
                    blurRadius: 2,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Image.asset(AppImages.profileImg),
            )
          ],
        ),
        SizedBox(width: 20,),
        Column(
          children: [
            Text("After", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),

            SizedBox(height: 10),
            screenController.afterImageProfile!.path.isNotEmpty ?
            Container(
              height: Get.height * 0.15,
              width: Get.width * 0.27,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.colorLightGrey,
                    blurRadius: 2,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Image.file(screenController.afterImageProfile!),
            ):
            Container(
              height: Get.height * 0.15,
              width: Get.width * 0.27,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.colorLightGrey,
                    blurRadius: 2,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Image.asset(AppImages.profileImg),
            )
          ],
        )
      ],
    );
  }
}



