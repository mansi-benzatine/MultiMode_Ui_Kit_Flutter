class FaqsData {
  final String title;
  final String description;
  bool isExpanded;

  FaqsData({
    required this.title,
    required this.description,
    this.isExpanded = false,
  });
}
