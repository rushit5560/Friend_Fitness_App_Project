import 'package:get/get.dart';

import '../../model/home_screen_models/fitness_model.dart';

class ExerciseDetailsScreenController extends GetxController {
  /// Get from Home Screen
  FitnessModel singleItem = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxBool isPlay = false.obs;
}