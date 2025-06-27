class TrackingStep {
  final String time;
  final String title;
  final String dateTime;
  final bool isCompleted;

  TrackingStep({
    required this.time,
    required this.title,
    required this.dateTime,
    this.isCompleted = false,
  });
}
