class ShareData {
  final String? userProfileUrl;
  final String? socialPlatformUrl;
  final String? username;
  final String? socialPlatformName;

  ShareData({
    this.userProfileUrl,
    this.username,
    this.socialPlatformName,
    this.socialPlatformUrl,
  });
}

enum ChatSender { user, bot }

class ChatMessage {
  final String message;
  final ChatSender sender;

  ChatMessage({
    required this.message,
    required this.sender,
  });
}
