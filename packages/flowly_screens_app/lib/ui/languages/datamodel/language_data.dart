class LanguagesDataModel {
  final String language;
  final String flagImage;
  final bool isSuggested;

  LanguagesDataModel({
    required this.language,
    required this.flagImage,
    this.isSuggested = false,
  });
}
