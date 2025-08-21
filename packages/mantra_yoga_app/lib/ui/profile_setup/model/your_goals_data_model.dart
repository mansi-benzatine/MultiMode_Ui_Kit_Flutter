class YourGoalsDataModel {
  final String title;
  final String image;
  bool isSelected;

  YourGoalsDataModel({
    required this.title,
    required this.image,
    this.isSelected = false,
  });
}
