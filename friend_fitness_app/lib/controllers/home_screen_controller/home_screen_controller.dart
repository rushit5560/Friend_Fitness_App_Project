import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:friend_fitness_app/model/home_screen_models/movement_model.dart';
import 'package:get/get.dart';

import '../../common/constants/app_images.dart';
import '../../model/home_screen_models/exercise_model.dart';
import '../../model/home_screen_models/mindfulness_model.dart';
import '../../model/home_screen_models/water_intake_model.dart';

class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt waterIntakeValue = 0.obs;

  // List<TrackExerciseModel> trackExerciseList = [
  //   TrackExerciseModel(img: AppImages.runningImg, name: "Running"),
  //   TrackExerciseModel(img: AppImages.runningImg, name: "Weights"),
  //   TrackExerciseModel(img: AppImages.boxingImg, name: "Boxing"),
  //   TrackExerciseModel(img: AppImages.hikingImg, name: "Hiking"),
  //   TrackExerciseModel(img: AppImages.boxingImg, name: "Fitness Class"),
  //   TrackExerciseModel(img: AppImages.pilatesImg, name: "Pilates"),
  //   TrackExerciseModel(img: AppImages.yogaImg, name: "Hot Yoga"),
  // ];

  /// Get Exercise From Firebase Function
  Stream<List<ExerciseModel>> getAllExerciseFromFirebase() {
    return FirebaseFirestore.instance.collection("exercise")
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => ExerciseModel.fromJson(doc.data()))
            .toList());
  }

  /// Get Movement From Firebase Function
  Stream<List<MovementModel>> getAllMovementFromFirebase() {
    return FirebaseFirestore.instance.collection("movement")
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => MovementModel.fromJson(doc.data()))
            .toList());
  }

  /// Get WaterIntake From Firebase Function
  Stream<List<WaterIntakeModel>> getWaterIntakeFromFirebase() {
    return FirebaseFirestore.instance.collection("water_intake")
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => WaterIntakeModel.fromJson(doc.data()))
            .toList());
  }

  /// Get WaterIntake From Firebase Function
  Stream<List<MindfulnessModel>> getAllMindfulnessFromFirebase() {
    return FirebaseFirestore.instance.collection("mindfulness")
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => MindfulnessModel.fromJson(doc.data()))
            .toList());
  }

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