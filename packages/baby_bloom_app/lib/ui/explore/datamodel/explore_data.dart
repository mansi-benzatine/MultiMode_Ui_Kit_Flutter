class ExploreData {
  final String exploreImage;
  final String exploreHeading;
  bool isVideo;
  bool isArticle;

  ExploreData({
    required this.exploreHeading,
    required this.exploreImage,
    this.isArticle = false,
    this.isVideo = false,
  });
}
