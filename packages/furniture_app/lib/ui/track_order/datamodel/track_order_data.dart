enum DeliveryStage { pickup, shipped, delivered }

class DeliveryStatusModel {
  final DateTime dateTime;
  final String title;
  final String location;
  final DeliveryStage stage;

  DeliveryStatusModel({
    required this.dateTime,
    required this.title,
    required this.location,
    required this.stage,
  });
}
