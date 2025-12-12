class TemplateModel {
  final String title;
  final String image;
  final String category;
  final bool isVideo;

  TemplateModel({
    required this.title,
    required this.image,
    required this.category,
    this.isVideo = false,
  });
}
