class ChatMessage {
  final String message;
  final DateTime? time;
  final bool isUser;
  final String? dateLabel;

  ChatMessage({
    required this.message,
    this.time,
    required this.isUser,
    this.dateLabel,
  });
}
