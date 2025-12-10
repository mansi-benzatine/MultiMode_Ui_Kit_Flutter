class BabyNameData {
  final String name;
  final String gender;
  final String meaning;
  bool isFavourite;

  BabyNameData({
    required this.name,
    required this.gender,
    required this.meaning,
    this.isFavourite = false,
  });
}
