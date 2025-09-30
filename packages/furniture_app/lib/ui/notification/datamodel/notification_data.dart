class NotificationItem {
  final String title;
  final String message;
  final String time;
  final DateTime date;
  final String icon; // asset path or icon name

  NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    required this.date,
    required this.icon,
  });
}
