class MessageData {
  final String username;
  final String userProfilePath;
  final String message;
  final String time;
  final int? messageCount;
  final bool isMessageSeen;

  MessageData({
    required this.userProfilePath,
    required this.time,
    required this.username,
    required this.message,
    required this.isMessageSeen,
    this.messageCount,
  });
}
