import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/constants/app_images.dart';
import 'package:friend_fitness_app/common/constants/enums.dart';
import 'package:friend_fitness_app/common/custom_drawer/custom_drawer_widgets.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [

               CustomDrawerSingleItemModule(
                img: AppImages.profileImg,
                name: 'Profile',
                customDrawerOption: CustomDrawerOption.profile,
              ),
              const SizedBox(height: 20),

              CustomDrawerSingleItemModule(
                img: AppImages.profileImg,
                name: 'Change Password',
                customDrawerOption: CustomDrawerOption.changePassword,
              ),
              const SizedBox(height: 20),

              CustomDrawerSingleItemModule(
                img: AppImages.profileImg,
                name: 'Create Game',
                customDrawerOption: CustomDrawerOption.createGame,
              ),
              const SizedBox(height: 20),

              CustomDrawerSingleItemModule(
                img: AppImages.profileImg,
                name: 'Logout',
                customDrawerOption: CustomDrawerOption.logout,
              ),

            ],
          ).commonSymmetricPadding(horizontal: 10),
        ),
      ),
    );
  }
}
