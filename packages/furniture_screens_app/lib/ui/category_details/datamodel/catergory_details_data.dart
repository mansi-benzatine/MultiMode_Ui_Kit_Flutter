class CategoryItem {
  final String name;
  final String icon; // asset path
  bool isSelected;

  CategoryItem({
    required this.name,
    required this.icon,
    this.isSelected = false,
  });
}

class ProductItem {
  final String name;
  final String description;
  final String image;
  final double rating;
  final double price;
  bool isSelected;
  final String category;
  String? color;
  int? quantity;

  ProductItem({
    required this.name,
    required this.description,
    required this.image,
    required this.rating,
    required this.price,
    required this.category,
    this.isSelected = false,
    this.color,
    this.quantity,
  });
}
