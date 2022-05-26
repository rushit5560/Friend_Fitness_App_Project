import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/common_widgets.dart';
import 'package:friend_fitness_app/common/constants/app_colors.dart';
import 'package:friend_fitness_app/common/constants/app_images.dart';
import 'package:friend_fitness_app/controllers/edit_profile_screen_controller/edit_profile_screen_controller.dart';
import 'package:friend_fitness_app/controllers/profile_screen_controller/profile_screen_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/field_validation.dart';

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
          GestureDetector(
            onTap: () => Get.back(),
            child: const SizedBox(
              width: 42,
              height: 42,
              child: Icon(
                  Icons.arrow_back
              ),
            ),
          ),
          const Text(
            "Edit Profile",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(width: 42, height: 42,),
        ],
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  ProfileImage({Key? key}) : super(key: key);
  final ImagePicker imagePicker = ImagePicker();
  //final screenController = Get.find<EditProfileScreenController>();
  final screenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    log('screenController.isAddStarSuccessStatusCode.value: ${screenController.isAddStarSuccessStatusCode.value}');
    return Row(
      children: [

        Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                screenController.profile != null  ?
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
                   child: Image.file(screenController.profile!,
                       height: 150, width: 150, fit: BoxFit.cover),
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
                  child: Image.network(screenController.userProfile, height: 150, width: 150,fit: BoxFit.cover,),
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
        ),

        screenController.isAddStarSuccessStatusCode.value == "true" ?
        Icon(Icons.star) : Container()

      ],
    );
  }

  void gallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if(image != null){
      screenController.profile = File(image.path);
      screenController.loadUI();
    } else{
    }
  }
}

class NameTextFieldModule extends StatelessWidget {

  //final screenController = Get.find<EditProfileScreenController>();
  final screenController = Get.find<EditProfileScreenController>();
  NameTextFieldModule({Key? key}) : super(key: key);

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
                  ),
                  validator: (value) => FieldValidator().validateName(value!),
                ),
              ],
            )
        )
      ],
    );
  }
}

class AddressTextFieldModule extends StatelessWidget {
  AddressTextFieldModule({Key? key}) : super(key: key);
  //final screenController = Get.find<EditProfileScreenController>();
  final screenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Address:", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),)
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
                  controller: screenController.addressFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none,
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

class GenderTextFieldModule extends StatelessWidget {
  GenderTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Gender:", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),)
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
                  controller: screenController.genderFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none,
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
                  ),
                  validator: (value) => FieldValidator().validateWeight(value!),
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
                  ),
                  validator: (value) => FieldValidator().validateHeight(value!),
                ),
              ],
            )
        )
      ],
    );
  }
}

class ChestTextFieldModule extends StatelessWidget {
  ChestTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Chest:", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),)
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
                  controller: screenController.chestFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none,
                  ),
                  validator: (value) => FieldValidator().validateMeasurement(value!),
                ),
              ],
            )
        )
      ],
    );
  }
}

class LeftArmTextFieldModule extends StatelessWidget {
  LeftArmTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Left arm:", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),)
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
                  controller: screenController.leftArmFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none,
                  ),
                  validator: (value) => FieldValidator().validateMeasurement(value!),
                ),
              ],
            )
        )
      ],
    );
  }
}

class RightArmTextFieldModule extends StatelessWidget {
  RightArmTextFieldModule({Key? key}) : super(key: key);

  final screenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Right Arm:", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),)
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
                  controller: screenController.rightArmFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none,
                  ),
                  validator: (value) => FieldValidator().validateMeasurement(value!),
                  // onTap: (){
                  //   showAlertDialog(context);
                  // },
                ),
              ],
            )
        )
      ],
    );
  }
}

class WaistTextFieldModule extends StatelessWidget {
   WaistTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Waist:", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),)
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
                  controller: screenController.waistFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none,
                  ),
                  validator: (value) => FieldValidator().validateMeasurement(value!),
                  // onTap: (){
                  //   showAlertDialog(context);
                  // },
                ),
              ],
            )
        )
      ],
    );
  }
}

class HipsTextFieldModule extends StatelessWidget {
  HipsTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Hips:", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),)
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
                  controller: screenController.hipsFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none,
                  ),
                  validator: (value) => FieldValidator().validateMeasurement(value!),
                  // onTap: (){
                  //   showAlertDialog(context);
                  // },
                ),
              ],
            )
        )
      ],
    );
  }
}

class LeftThighTextFieldModule extends StatelessWidget {
  LeftThighTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Left Thigh:", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),)
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
                  controller: screenController.leftThighFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none,
                  ),
                  validator: (value) => FieldValidator().validateMeasurement(value!),
                  // onTap: (){
                  //   showAlertDialog(context);
                  // },
                ),
              ],
            )
        )
      ],
    );
  }
}

class RightThighTextFieldModule extends StatelessWidget {
  RightThighTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Right Thigh:", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),)
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
                  controller: screenController.rightThighFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none,
                  ),
                  validator: (value) => FieldValidator().validateMeasurement(value!),
                  // onTap: (){
                  //   showAlertDialog(context);
                  // },
                ),
              ],
            )
        )
      ],
    );
  }
}


class UpdateButtonModule extends StatelessWidget {
  UpdateButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<EditProfileScreenController>();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(screenController.editProfileFormKey.currentState!.validate()){
          if(screenController.profile == null){
            Fluttertoast.showToast(msg: "please Select Profile");
          } else if(screenController.beforeImageProfile == null){
            Fluttertoast.showToast(msg: "please Select Before Image Profile");
          } else if(screenController.afterImageProfile == null){
            Fluttertoast.showToast(msg: "please Select After Image Profile");
          } else{
            screenController.updateProfileAPI();
          }
        }
        },
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
            // Obx(()=>
            //   screenController.isLoading.value ?
            //       const CustomCircularProgressIndicator():
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
                          height: 150, width: 150, fit: BoxFit.cover),
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
                      child: Image.network(screenController.userBeforeImageProfile, height: 150, width: 150,fit: BoxFit.cover,),
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
              ),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            const Text("After", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),

            const SizedBox(height: 10),
            // Obx(()=>
            //   screenController.isLoading.value ?
            //       const CustomCircularProgressIndicator():
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  screenController.afterImageProfile != null ?
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
                      child: Image.file(screenController.afterImageProfile!,
                          height: 150, width: 150, fit: BoxFit.cover),
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
                      child: Image.network(screenController.userAfterImageProfile, height: 150, width: 150,fit: BoxFit.cover),
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
              ),
            //)
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
      screenController.afterImageProfile = File(image.path);
      screenController.loadUI();
    } else{}
  }
}