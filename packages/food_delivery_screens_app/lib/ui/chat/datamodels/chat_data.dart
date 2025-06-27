enum MessageSender { user, bot }

enum MessageType { text, options }

class ChatMessage {
  final String message;
  final MessageSender sender;
  final DateTime time;
  final MessageType type;
  final List<String>? options;

  ChatMessage({
    required this.message,
    required this.sender,
    required this.time,
    this.type = MessageType.text,
    this.options,
  });
}
