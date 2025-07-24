class RecentActivity {
  final String date;
  final double distance; // in kilometers
  final String duration; // e.g., "00:10:38"
  final String pace; // e.g., "05:25 min/km"
  final double calories; // in kcal
  final String? mapThumbnail; // Optional asset path or URL for the map image

  RecentActivity({required this.date, required this.distance, required this.duration, required this.pace, required this.calories, this.mapThumbnail});
}

class BestRecords {
  final String icon;
  final String title;
  final String description;
  final String? trailingString;
  final String? date;

  BestRecords({required this.icon, required this.description, required this.title, this.trailingString, this.date});
}
