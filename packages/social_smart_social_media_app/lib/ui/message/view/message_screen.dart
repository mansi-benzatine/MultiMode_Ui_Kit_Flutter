import 'package:flutter/material.dart';
import 'package:social_smart_social_media_app_package/utils/utils.dart';

import '../../../ui/call/view/call_screen.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/string_constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/textfield/common_textformfield.dart';
import '../datamodel/message_data.dart';

class MessageScreen extends StatefulWidget {
  final bool? fromChatScreen;
  const MessageScreen({super.key, this.fromChatScreen});
  static Route route(bool? fromChat) {
    return MaterialPageRoute(
      builder: (context) => MessageScreen(fromChatScreen: fromChat ?? false),
    );
  }

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        appBar: AppBar(
          backgroundColor: CustomAppColor.of(context).bgScaffold,
          centerTitle: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          titleSpacing: 0,
          title: CommonText(
            text: AppStrings.tonyArmstrong,
            fontWeight: FontWeight.w700,
            fontSize: AppSizes.setFontSize(20),
          ),
          actions: [
            IconButton(
              onPressed: () => Navigator.push(context, CallScreen.route()),
              icon: Image.asset(
                AppAssets.icCall,
                color: CustomAppColor.of(context).icBlack,
                scale: 4.5,
              ),
            ),
            IconButton(
              onPressed: () => Navigator.push(context, CallScreen.route()),
              icon: Image.asset(
                AppAssets.icVideo,
                color: CustomAppColor.of(context).icBlack,
                scale: 4.5,
              ),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(18)),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (!(widget.fromChatScreen ?? false)) profileDetails(),
                      if (widget.fromChatScreen ?? false)
                        Padding(
                          padding: EdgeInsets.only(bottom: AppSizes.setHeight(16)),
                          child: Container(
                            width: AppSizes.setWidth(40),
                            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(2)),
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).containerBorder,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: CommonText(
                              text: "Today",
                              fontSize: AppSizes.setFontSize(10),
                            ),
                          ),
                        ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.fromChatScreen ?? false ? messagesList.length : messages.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final message = widget.fromChatScreen ?? false ? messagesList[index] : messages[index];
                          return chats(message: message);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              widget.fromChatScreen ?? false ? textFieldWithRecord() : textField(),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileDetails() {
    return Column(
      children: [
        const Center(
          child: CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(AppAssets.imgProfile5),
          ),
        ),
        CommonText(
          text: "@${AppStrings.elizaWoods.toLowerCase()}",
          fontWeight: FontWeight.w700,
          fontSize: AppSizes.setFontSize(20),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(8)),
          child: CommonText(
            text: AppStrings.fashionDesigner,
            fontWeight: FontWeight.w500,
            fontSize: AppSizes.setFontSize(14),
          ),
        )
      ],
    );
  }

  Widget chats({required ChatMessage message}) {
    return Align(
      alignment: message.isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: AppSizes.setHeight(6)),
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10), horizontal: AppSizes.setWidth(15)),
            constraints: BoxConstraints(maxWidth: AppSizes.setWidth(270)),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: message.isSender
                    ? [CustomAppColor.of(context).bgGradiant1, CustomAppColor.of(context).bgGradiant2]
                    : [CustomAppColor.of(context).bgShadowTextFormField, CustomAppColor.of(context).bgShadowTextFormField],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                topLeft: message.isSender ? const Radius.circular(16) : const Radius.circular(8),
                topRight: message.isSender ? const Radius.circular(8) : const Radius.circular(16),
                bottomLeft: const Radius.circular(16),
                bottomRight: const Radius.circular(12),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: CommonText(
                    text: message.text,
                    textColor: message.isSender ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtBlack,
                    maxLines: 100,
                    textAlign: TextAlign.start,
                  ),
                ),
                CommonText(
                  text: message.time ?? "",
                  textColor: message.isSender ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.end,
                  fontSize: AppSizes.setFontSize(12),
                ),
              ],
            ),
          ),
          if (message.imageUrls != null && message.imageUrls!.isNotEmpty && (widget.fromChatScreen ?? false))
            Padding(
              padding: EdgeInsets.only(bottom: AppSizes.setHeight(15)),
              child: Wrap(
                spacing: AppSizes.setWidth(10),
                alignment: WrapAlignment.end,
                children: message.imageUrls!
                    .map(
                      (imageUrl) => ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          imageUrl,
                          height: AppSizes.setHeight(120),
                          width: AppSizes.setWidth(120),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }

  Widget textField() {
    return Row(
      children: [
        Expanded(
          child: CommonTextFormField(
            hintText: "${AppStrings.message}...",
            hintStyle: TextStyle(color: CustomAppColor.of(context).grey.withOpacityPercent(0.3)),
            suffixIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(12)),
              width: AppSizes.setWidth(105),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppAssets.icVoice,
                    width: AppSizes.setWidth(24),
                    height: AppSizes.setHeight(24),
                  ),
                  Image.asset(
                    AppAssets.icImage,
                    width: AppSizes.setWidth(20),
                    height: AppSizes.setHeight(24),
                  ),
                  Image.asset(
                    AppAssets.icEmojiFilled,
                    width: AppSizes.setWidth(20),
                    height: AppSizes.setHeight(24),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: AppSizes.setWidth(20)),
        Image.asset(
          AppAssets.icSend,
          scale: 4.8,
        )
      ],
    );
  }

  Widget textFieldWithRecord() {
    return Row(
      children: [
        Expanded(
          child: CommonTextFormField(
            hintText: "${AppStrings.message}...",
            hintStyle: TextStyle(color: CustomAppColor.of(context).grey.withOpacityPercent(0.3)),
            leadingIcon: Image.asset(
              AppAssets.icEmoji,
              scale: 3.5,
            ),
            suffixIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(12)),
              width: AppSizes.setWidth(105),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppAssets.icImage,
                    width: AppSizes.setWidth(20),
                    height: AppSizes.setHeight(24),
                    color: CustomAppColor.of(context).txtGrey,
                  ),
                  Image.asset(
                    AppAssets.icCamera,
                    width: AppSizes.setWidth(23),
                    height: AppSizes.setHeight(23),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: AppSizes.setWidth(10)),
        Image.asset(
          AppAssets.icRecordFilled,
          width: AppSizes.setWidth(46),
          height: AppSizes.setHeight(46),
        )
      ],
    );
  }
}
