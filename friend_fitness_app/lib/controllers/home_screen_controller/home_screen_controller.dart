import 'package:get/get.dart';

import '../../common/constants/app_images.dart';

class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt waterIntakeValue = 0.obs;

  List<TrackExerciseModel> trackExerciseList = [
    TrackExerciseModel(img: AppImages.runningImg, name: "Running"),
    TrackExerciseModel(img: AppImages.runningImg, name: "Weights"),
    TrackExerciseModel(img: AppImages.boxingImg, name: "Boxing"),
    TrackExerciseModel(img: AppImages.hikingImg, name: "Hiking"),
    TrackExerciseModel(img: AppImages.boxingImg, name: "Fitness Class"),
    TrackExerciseModel(img: AppImages.pilatesImg, name: "Pilates"),
    TrackExerciseModel(img: AppImages.yogaImg, name: "Hot Yoga"),
  ];

  List<TrackExerciseModel> trackMovementList = [
    TrackExerciseModel(img: AppImages.walkingImg, name: "Walking"),
    TrackExerciseModel(img: AppImages.coachingImg, name: "Coaching kids"),
    TrackExerciseModel(img: AppImages.weightsImg, name: "Stretching"),
  ];

  List<TrackExerciseModel> trackMindFullnessList = [
    TrackExerciseModel(img: AppImages.journalImg, name: "Journal"),
    TrackExerciseModel(img: AppImages.meditationImg, name: "Meditation"),
  ];


}



class TrackExerciseModel {
  String img;
  String name;

  TrackExerciseModel({required this.img, required this.name});


}