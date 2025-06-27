class ChatModel {
  final String name;
  final String lastMessage;
  final String time;
  final String date;
  final int unreadCount;
  final String image;
  final bool isOnline;

  ChatModel({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.date,
    required this.unreadCount,
    required this.image,
    required this.isOnline,
  });
}
