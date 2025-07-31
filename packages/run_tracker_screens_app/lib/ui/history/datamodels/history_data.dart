class RecentActivity {
  final String date;
  final double distance;
  final String duration;
  final String pace;
  final double calories;
  final String? mapThumbnail;

  RecentActivity({
    required this.date,
    required this.distance,
    required this.duration,
    required this.pace,
    required this.calories,
    this.mapThumbnail,
  });
}
