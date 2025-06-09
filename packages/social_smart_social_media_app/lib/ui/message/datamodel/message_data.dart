import '../../../../../../../../../utils/string_constant.dart';
import '../../../utils/app_assets.dart';

class ChatMessage {
  final String text;
  final bool isSender;
  final List<String>? imageUrls;
  final String? time;

  ChatMessage({
    required this.text,
    required this.isSender,
    this.imageUrls,
    this.time,
  });
}

final List<ChatMessage> messages = [
  ChatMessage(
    text: AppStrings.hiiELizaWoodsGoodMorning,
    isSender: true,
    time: "10:01",
  ),
  ChatMessage(
    text: AppStrings.imYourFanIReallyLikeAllYourSongsAndAmazingWorks,
    isSender: true,
    time: "10:01",
  ),
];

final List<ChatMessage> messagesList = [
  ChatMessage(
    text: AppStrings.msg7,
    isSender: false,
    time: "10:00",
  ),
  ChatMessage(
    text: AppStrings.msg8,
    isSender: false,
    time: "10:10",
  ),
  ChatMessage(
    text: AppStrings.msg9,
    isSender: true,
    time: "10:15",
  ),
  ChatMessage(
    text: AppStrings.msg10,
    isSender: true,
    imageUrls: [AppAssets.imgChatImage2, AppAssets.imgChatImage],
    time: "10:20",
  ),
  ChatMessage(
    text: AppStrings.msg11,
    isSender: false,
    time: "10:25",
  ),
];
