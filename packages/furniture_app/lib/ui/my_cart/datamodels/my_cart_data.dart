class CartItem {
  final String name;
  final double price;
  final String color;
  final String image;
  int qty;
  bool isSelected;

  CartItem({
    required this.name,
    required this.price,
    required this.color,
    required this.image,
    this.qty = 1,
    this.isSelected = false,
  });
}
