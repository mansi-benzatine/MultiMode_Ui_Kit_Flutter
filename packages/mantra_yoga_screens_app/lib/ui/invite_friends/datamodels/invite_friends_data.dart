class FriendModel {
  final String name;
  final String username;
  final String image;
  bool isSelected;

  FriendModel({
    required this.name,
    required this.username,
    required this.image,
    this.isSelected = false,
  });
}
