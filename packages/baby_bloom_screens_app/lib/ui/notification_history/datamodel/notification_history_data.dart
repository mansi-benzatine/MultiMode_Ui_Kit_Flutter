class NotificationItem {
  final String title;
  final String time;
  final String dateLabel;
  final String description;
  final String status;
  final String? completedDate;

  NotificationItem({
    required this.title,
    required this.time,
    required this.dateLabel,
    required this.description,
    required this.status,
    this.completedDate,
  });
}
