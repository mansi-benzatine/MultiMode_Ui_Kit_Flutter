class Trip {
  final String userName;
  final String userImageUrl;
  final String paymentMethod;
  final double distanceKm;
  final String duration;
  final String pickupAddress;
  final String dropOffAddress;
  final double fare;
  final TripStatus status;

  Trip({
    required this.userName,
    required this.userImageUrl,
    required this.paymentMethod,
    required this.distanceKm,
    required this.duration,
    required this.pickupAddress,
    required this.dropOffAddress,
    required this.fare,
    required this.status,
  });
}

enum TripStatus { confirm, completed, cancelled }
