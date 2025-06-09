class ChatMessage {
  final String message;
  final String time;
  final bool isSentByMe;
  final bool? isSeen;
  final bool isFile;
  final String? fileName;
  final String? fileSize;

  ChatMessage({
    required this.message,
    required this.time,
    this.isSeen,
    required this.isSentByMe,
    this.isFile = false,
    this.fileName,
    this.fileSize,
  });
}
