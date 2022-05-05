import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/constants/app_colors.dart';
import 'package:friend_fitness_app/common/constants/app_images.dart';
import 'package:friend_fitness_app/common/sharedpreference_data/sharedpreference_data.dart';
import 'package:friend_fitness_app/controllers/profile_screen_controller/profile_screen_controller.dart';
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
      child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
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
                  child: const Icon(Icons.logout)),
            ],
          ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Image.asset(AppImages.profileImg, scale: 2,),
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
            child: Container(
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
            )
        )
      ],
    );
  }
}

class EmailTextFieldModule extends StatelessWidget {
  const EmailTextFieldModule({Key? key}) : super(key: key);

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
            child: Container(
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
            )
        )
      ],
    );
  }
}

class WeightTextFieldModule extends StatelessWidget {
  const WeightTextFieldModule({Key? key}) : super(key: key);

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
            child: Container(
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
            )
        )
      ],
    );
  }
}

class MeasurementTextFieldModule extends StatelessWidget {
  const MeasurementTextFieldModule({Key? key}) : super(key: key);

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
            child: Container(
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
            )
        )
      ],
    );
  }
}

class HeightTextFieldModule extends StatelessWidget {
  const HeightTextFieldModule({Key? key}) : super(key: key);

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
            child: Container(
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
            )
        )
      ],
    );
  }
}

class SaveButtonModule extends StatelessWidget {
  const SaveButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(()=> EditProfileScreen(), transition: Transition.zoom),
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
  const BeforeAfterImageModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text("Before", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),

            SizedBox(height: 10),
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
            )
          ],
        ),
        SizedBox(width: 20,),
        Column(
          children: [
            Text("After", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),

            SizedBox(height: 10),
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
            )
          ],
        )
      ],
    );
  }
}



