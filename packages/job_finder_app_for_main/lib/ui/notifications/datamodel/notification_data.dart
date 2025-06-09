class NotificationData {
  final String notificationDetail;
  final String? date;
  final String? time;
  final bool isSeen;
  final String companyImagePath;

  final String companyName;

  NotificationData({
    this.time,
    required this.notificationDetail,
    this.date,
    required this.isSeen,
    required this.companyName,
    required this.companyImagePath,
  });
}
