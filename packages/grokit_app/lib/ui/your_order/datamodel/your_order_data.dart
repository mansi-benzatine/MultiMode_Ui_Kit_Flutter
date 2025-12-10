class Order {
  final List<String> items;
  final double amount;
  final String time;
  final String deliveryTime;

  Order({
    required this.items,
    required this.amount,
    required this.time,
    required this.deliveryTime,
  });
}
