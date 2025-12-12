class MusicModel {
  final String title;
  final String artist;
  final String image;
  bool isPlaying;
  bool isFavorite;

  MusicModel({
    required this.title,
    required this.artist,
    required this.image,
    this.isPlaying = false,
    this.isFavorite = false,
  });
}
