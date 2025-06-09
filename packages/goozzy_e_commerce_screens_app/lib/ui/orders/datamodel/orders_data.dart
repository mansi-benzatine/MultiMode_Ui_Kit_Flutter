class OrderModel {
  final String status;
  final String date;
  final String orderId;
  final String productName;
  final double price;

  final String paymentMode;
  final String size;
  final int quantity;
  final String imageUrl;
  final String iconUrl;
  List<String>? actions = [];

  OrderModel({
    required this.status,
    required this.date,
    required this.orderId,
    required this.productName,
    required this.price,
    required this.paymentMode,
    required this.size,
    required this.quantity,
    required this.imageUrl,
    required this.iconUrl,
    this.actions,
  });
}

class ReasonOfCancellationData {
  final String reason;
  final bool? isSelected;

  ReasonOfCancellationData({
    required this.reason,
    this.isSelected,
  });
}
