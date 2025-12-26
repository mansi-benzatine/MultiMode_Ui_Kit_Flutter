class OrderModel {
  final String bid;
  final String bidPrice;
  final String askPrice;
  final String qty;

  OrderModel(
    this.bid,
    this.bidPrice,
    this.askPrice,
    this.qty,
  );
}

class HistoryModel {
  final String time;
  final String price;
  final String qty;
  final bool isBuy;

  HistoryModel(this.time, this.price, this.qty, this.isBuy);
}

class ChartSampleData {
  final DateTime x;
  final double open;
  final double high;
  final double low;
  final double close;

  ChartSampleData({
    required this.x,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });
}

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
