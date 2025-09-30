class OrderModel {
  final String orderId;
  final String productName;
  final double price;
  final int quantity;
  final String color;
  final String imageUrl; // Assuming image assets or network URLs
  late final String status; // e.g., "Active", "Completed", "Cancelled"
  final DateTime orderDate;
  final bool isCancellable; // To determine if "Cancel Order" is shown

  OrderModel({
    required this.orderId,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.color,
    required this.imageUrl,
    required this.status,
    required this.orderDate,
    this.isCancellable = false,
  });
}
