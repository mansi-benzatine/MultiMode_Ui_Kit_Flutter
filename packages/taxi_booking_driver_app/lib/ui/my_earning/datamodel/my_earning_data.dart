class TransactionItem {
  final String name;
  final String paymentMethod;
  final String amount;
  final String distance;
  final String imageUrl;

  TransactionItem({
    required this.name,
    required this.paymentMethod,
    required this.amount,
    required this.distance,
    required this.imageUrl,
  });
}

class TransactionSection {
  final String title;
  final List<TransactionItem> transactions;

  TransactionSection({
    required this.title,
    required this.transactions,
  });
}
