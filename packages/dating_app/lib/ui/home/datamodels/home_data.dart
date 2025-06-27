class NearbyData {
  final String imageUrl;
  final String name;
  final String howMuchAway;
  final String? activeAgo;
  final bool? isActive;

  NearbyData({
    required this.name,
    required this.imageUrl,
    required this.howMuchAway,
    this.isActive = false,
    this.activeAgo,
  });
}
