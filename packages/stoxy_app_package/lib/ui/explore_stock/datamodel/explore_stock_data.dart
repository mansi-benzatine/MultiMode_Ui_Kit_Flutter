class NFLXMarketData {
  final String iconPath;
  final String details;
  String data;

  NFLXMarketData({
    required this.iconPath,
    required this.details,
    this.data = "N/A",
  });
}

class NewsData {
  final String iconPath;
  final String details;
  String data;

  NewsData({
    required this.iconPath,
    required this.details,
    this.data = "N/A",
  });
}
