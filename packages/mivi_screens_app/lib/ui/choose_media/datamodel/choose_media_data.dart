class MediaModel {
  final String image;
  final String category;
  final bool isVideo;
  bool isSelected;

  MediaModel({
    required this.image,
    required this.category,
    this.isVideo = false,
    this.isSelected = false,
  });
}
