class MindfulnessModel {
  int mindfulnessId;
  String mindfulnessName;
  String mindfulnessImage;
  double mindfulnessPoint;

  MindfulnessModel({
    required this.mindfulnessId,
    required this.mindfulnessName,
    required this.mindfulnessImage,
    required this.mindfulnessPoint,
  });

  static MindfulnessModel fromJson(Map<String, dynamic> json) => MindfulnessModel(
    mindfulnessId: json['mindfulness_id'] ?? 0,
    mindfulnessName: json['mindfulness_name'] ?? "",
    mindfulnessImage: json['mindfulness_image'] ?? "",
    mindfulnessPoint: json['mindfulness_point'] ?? 0.0,
  );


}
