class MovementModel {
  int movementId;
  String movementName;
  String movementImage;
  int movementPoint;

  MovementModel({
    required this.movementId,
    required this.movementName,
    required this.movementImage,
    required this.movementPoint,
  });

  static MovementModel fromJson(Map<String, dynamic> json) => MovementModel(
    movementId: json['movement_id'] ?? 0,
    movementName: json['movement_name'] ?? "",
    movementImage: json['movement_image'] ?? "",
    movementPoint: json['movement_point'] ?? 0,
  );

}
