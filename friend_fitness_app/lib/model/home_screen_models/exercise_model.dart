class ExerciseModel {
  int exerciseId;
  String exerciseName;
  String exerciseImage;
  int exercisePoint;

  ExerciseModel({
    required this.exerciseId,
    required this.exerciseName,
    required this.exerciseImage,
    required this.exercisePoint,
  });

  static ExerciseModel fromJson(Map<String, dynamic> json) => ExerciseModel(
    exerciseId: json['exercise_id'] ?? 0,
    exerciseName: json['exercise_name'] ?? "",
    exerciseImage: json['exercise_image'] ?? "",
    exercisePoint: json['exercise_point'] ?? 0,
  );


}
