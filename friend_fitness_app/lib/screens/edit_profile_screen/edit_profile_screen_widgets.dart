import 'dart:io';
import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/constants/app_colors.dart';
import 'package:friend_fitness_app/common/constants/app_images.dart';
import 'package:friend_fitness_app/controllers/edit_profile_screen_controller/edit_profile_screen_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreenAppBarModule extends StatelessWidget {
  const ProfileScreenAppBarModule({Key? key}) : super(key: key);

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
            "Edit Profile",
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

class ProfileImage extends StatelessWidget {
  ProfileImage({Key? key}) : super(key: key);
  final ImagePicker imagePicker = ImagePicker();
  final screenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
      screenController.profileImage != null ?
      Container(
        height: 150, width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            //border: Border.all(color: AppColors.colorLightGrey),
            boxShadow: [
              BoxShadow(
                  blurRadius: 1,
                  blurStyle: BlurStyle.outer,
                  color: Colors.grey.shade500
              )
            ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.file(screenController.profileImage!,
              height: 150, width: 150, fit: BoxFit.fill),
        ),
      ) :
      Container(
        height: 150, width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            //border: Border.all(color: AppColors.colorLightGrey),
            boxShadow: [
              BoxShadow(
                  blurRadius: 1,
                  blurStyle: BlurStyle.outer,
                color: Colors.grey.shade500
              )
            ]
        ),
        child: ClipRRect(
          child: Image.asset(AppImages.profileImg, scale: 2,),
        ),
      ),
        Positioned(
          top: 135,
          child: GestureDetector(
            onTap: (){
              gallery();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.colorDarkGrey
              ),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.camera_alt, color: Colors.white, size: 15),
              ),
            ),
          ),
        )
      ],
    );
  }

  void gallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if(image != null){
      screenController.profileImage = File(image.path);
      screenController.loadUI();
    } else{}
  }
}

class NameTextFieldModule extends StatelessWidget {
  NameTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<EditProfileScreenController>();


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

class WeightTextFieldModule extends StatelessWidget {
  WeightTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<EditProfileScreenController>();

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
  final screenController = Get.find<EditProfileScreenController>();

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
  final screenController = Get.find<EditProfileScreenController>();

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
  final screenController = Get.find<EditProfileScreenController>();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        screenController.updateProfileWithFirebaseAPI();
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.colorDarkGrey
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 13),
          child: Text("SAVE", style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}

class BeforeAfterImageModule extends StatelessWidget {
  BeforeAfterImageModule({Key? key}) : super(key: key);
  final ImagePicker imagePicker = ImagePicker();
  final screenController = Get.find<EditProfileScreenController>();


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const Text("Before", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),

            const SizedBox(height: 10),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                screenController.beforeImageProfile != null ?
                Container(
                  height: 130, width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      //border: Border.all(color: AppColors.colorLightGrey),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 1,
                            blurStyle: BlurStyle.outer,
                            color: Colors.grey.shade500
                        )
                      ]
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.file(screenController.beforeImageProfile!,
                        height: 150, width: 150, fit: BoxFit.fill),
                  ),
                ) :
                Container(
                  height: 130, width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      //border: Border.all(color: AppColors.colorLightGrey),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 1,
                            blurStyle: BlurStyle.outer,
                            color: Colors.grey.shade500
                        )
                      ]
                  ),
                  child: ClipRRect(
                    child: Image.asset(AppImages.profileImg, scale: 2,),
                  ),
                ),

                Positioned(
                  top: 115,
                  child: GestureDetector(
                    onTap: (){
                      beforeGallery();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.colorDarkGrey
                      ),
                      child: Container(
                          padding: const EdgeInsets.all(5.0),
                          child: const Icon(Icons.camera_alt, color: Colors.white, size: 15)),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            const Text("After", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),

            const SizedBox(height: 10),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                screenController.afterImageprofile != null ?
                Container(
                  height: 130, width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      //border: Border.all(color: AppColors.colorLightGrey),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 1,
                            blurStyle: BlurStyle.outer,
                            color: Colors.grey.shade500
                        )
                      ]
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.file(screenController.afterImageprofile!,
                        height: 150, width: 150, fit: BoxFit.fill),
                  ),
                ) :
                Container(
                  height: 130, width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      //border: Border.all(color: AppColors.colorLightGrey),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 1,
                            blurStyle: BlurStyle.outer,
                            color: Colors.grey.shade500
                        )
                      ]
                  ),
                  child: ClipRRect(
                    child: Image.asset(AppImages.profileImg, scale: 2,),
                  ),
                ),

                Positioned(
                  top: 115,
                  child: GestureDetector(
                    onTap: (){
                      afterGallery();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.colorDarkGrey
                      ),
                      child: Container(
                          padding: const EdgeInsets.all(5.0),
                          child: const Icon(Icons.camera_alt, color: Colors.white, size: 15)),
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }

  void beforeGallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if(image != null){
      screenController.beforeImageProfile = File(image.path);
      screenController.loadUI();
    } else{}
  }

  void afterGallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if(image != null){
      screenController.afterImageprofile = File(image.path);
      screenController.loadUI();
    } else{}
  }
}