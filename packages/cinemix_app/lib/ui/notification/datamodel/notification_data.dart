class NotificationItem {
  final String title;
  final String subtitle;
  final String date;
  final String? image;
  final String? icon;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.date,
    this.image,
    this.icon,
  });
}
