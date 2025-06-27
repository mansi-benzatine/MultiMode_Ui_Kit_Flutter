class PastOrder {
  final String restaurantName;
  final String location;
  final String imageUrl;
  final double totalAmount;
  final List<OrderItem> items;
  final String orderDateTime;
  final bool isDelivered;

  PastOrder({
    required this.restaurantName,
    required this.location,
    required this.imageUrl,
    required this.totalAmount,
    required this.items,
    required this.orderDateTime,
    required this.isDelivered,
  });
}

class OrderItem {
  final String name;
  final int quantity;

  OrderItem({
    required this.name,
    required this.quantity,
  });
}
