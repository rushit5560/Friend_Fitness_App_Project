import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/constants/app_images.dart';
import 'package:friend_fitness_app/common/constants/enums.dart';
import 'package:friend_fitness_app/common/custom_drawer/custom_drawer_controller.dart';
import 'package:friend_fitness_app/common/custom_drawer/custom_drawer_widgets.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);
  final customDrawerScreenController = Get.put(CustomDrawerController());

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
                img: AppImages.padlockImg,
                name: 'Change Password',
                customDrawerOption: CustomDrawerOption.changePassword,
              ),
              const SizedBox(height: 20),

              UserDetails.roleId == 3 ?
              CustomDrawerSingleItemModule(
                img: AppImages.gameLogoImg,
                name: 'Create Game',
                customDrawerOption: CustomDrawerOption.createGame,
              ) : Container(),
              UserDetails.roleId == 3 ? const SizedBox(height: 20) : Container(),

              UserDetails.roleId == 3 ?
              CustomDrawerSingleItemModule(
                img: AppImages.gameLogoImg,
                name: 'Start Game',
                customDrawerOption: CustomDrawerOption.startGame,
              ) :
              Container(),

              UserDetails.roleId == 3 ? const SizedBox(height: 20) : Container(),

              UserDetails.roleId == 3 ?
              CustomDrawerSingleItemModule(
                img: AppImages.gameLogoImg,
                name: 'End Game',
                customDrawerOption: CustomDrawerOption.endGame,
              ) : Container(),
              UserDetails.roleId == 3 ? const SizedBox(height: 20) : Container(),

              CustomDrawerSingleItemModule(
                img: AppImages.logoutImg,
                name: 'Logout',
                customDrawerOption: CustomDrawerOption.logout,
              ),

            ],
          ).commonSymmetricPadding(horizontal: 15, vertical: 10),
        ),
      ),
    );
  }
}
