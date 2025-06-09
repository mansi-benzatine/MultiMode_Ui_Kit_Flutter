class OrderTrackingModel {
  final String orderId;
  final String deliveryDate;
  final String imageUrl;
  final List<TrackingStep> trackingSteps;

  OrderTrackingModel({
    required this.orderId,
    required this.deliveryDate,
    required this.imageUrl,
    required this.trackingSteps,
  });
}

class TrackingStep {
  final String time;
  final String status;
  final String description;
  final bool isCompleted;

  TrackingStep({
    required this.time,
    required this.status,
    required this.description,
    required this.isCompleted,
  });
}
