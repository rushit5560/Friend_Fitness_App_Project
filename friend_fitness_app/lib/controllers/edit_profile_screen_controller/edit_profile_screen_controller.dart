import 'dart:io';

import 'package:get/get.dart';

class EditProfileScreenController extends GetxController{
  File? profileImage;
  File? beforeImageProfile;
  File? afterImageprofile;
  RxBool isLoading = false.obs;

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}