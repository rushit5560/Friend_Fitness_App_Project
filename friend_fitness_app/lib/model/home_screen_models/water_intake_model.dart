class WaterIntakeModel {
  String waterIntakeId;
  String waterIntakeName;
  String waterIntakeDes;
  String waterIntakeImage;
  double waterIntakePoint;

  WaterIntakeModel({
    required this.waterIntakeId,
    required this.waterIntakeName,
    required this.waterIntakeDes,
    required this.waterIntakeImage,
    required this.waterIntakePoint,
  });

  static WaterIntakeModel fromJson(Map<String, dynamic> json) => WaterIntakeModel(
    waterIntakeId: json['water_intake_id'] ?? "",
    waterIntakeName: json['water_intake_name'] ?? "",
    waterIntakeDes: json['water_intake_description'] ?? "",
    waterIntakeImage: json['water_intake_image'] ?? "",
    waterIntakePoint: json['water_intake_point'] ?? 0.0,
  );


}
