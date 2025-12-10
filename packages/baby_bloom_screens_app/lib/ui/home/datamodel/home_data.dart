class ArticleData {
  final String articleImage;
  final String articleHeading;
  final String articleDescription;
  bool isArticle;
  bool isVideo;

  ArticleData({
    required this.articleHeading,
    required this.articleImage,
    required this.articleDescription,
    this.isArticle = false,
    this.isVideo = false,
  });
}
