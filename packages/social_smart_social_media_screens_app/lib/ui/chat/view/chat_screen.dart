import 'package:flutter/material.dart';
import 'package:social_smart_social_media_screens_app_package/utils/utils.dart';

import '../../../localization/language/languages.dart';
import '../../../ui/message/view/message_screen.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/textfield/common_textformfield.dart';
import '../datamodel/chat_data.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const ChatScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomAppColor.of(context).bgScaffold,
          centerTitle: false,
          leading: IgnorePointer(
            ignoring: true,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: CommonText(
            text: Languages.of(context).chat,
            fontSize: AppSizes.setFontSize(20),
            fontWeight: FontWeight.w700,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(16)),
              child: Image.asset(
                AppAssets.icAddToChat,
                color: CustomAppColor.of(context).icBlack,
                width: AppSizes.setWidth(22),
                height: AppSizes.setHeight(24),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              searchTextField(context),
              recentlyUsersList(context),
              messageList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchTextField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(18)),
      child: CommonTextFormField(
        fillColor: CustomAppColor.of(context).bgShadow,
        hintText: Languages.of(context).search,
        leadingIcon: Image.asset(
          AppAssets.icSearchFilled,
          color: CustomAppColor.of(context).txtGrey,
          scale: 5,
        ),
      ),
    );
  }

  Widget recentlyUsersList(BuildContext context) {
    final chatList = getChatList;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(18)),
            child: CommonText(
              text: Languages.of(context).recently,
              fontWeight: FontWeight.w700,
              fontSize: AppSizes.setFontSize(18),
            ),
          ),
          SizedBox(height: AppSizes.setHeight(10)),
          SizedBox(
            height: AppSizes.setHeight(113),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(8)),
              itemCount: chatList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final follower = chatList[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(8)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: AppSizes.setHeight(75),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 5,
                            color: follower.isFollowing ?? false
                                ? CustomAppColor.of(context).bgGradiant2
                                : CustomAppColor.of(context).grey.withOpacityPercent(0.5),
                          ),
                        ),
                        child: ClipOval(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.asset(
                              follower.followerProfile,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(height: AppSizes.setHeight(4)),
                      CommonText(
                        text: follower.followerName,
                        fontSize: AppSizes.setFontSize(13),
                        fontWeight: follower.isFollowing ?? false ? FontWeight.w800 : FontWeight.w400,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget messageList(BuildContext context) {
    final followers = getMessageList;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).message,
            fontWeight: FontWeight.w700,
            fontSize: AppSizes.setFontSize(18),
          ),
          SizedBox(height: AppSizes.setHeight(10)),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: followers.length,
            itemBuilder: (context, index) {
              final follower = followers[index];
              return IgnorePointer(
                ignoring: true,
                child: ListTile(
                  onTap: () => Navigator.push(context, MessageScreen.route(true)),
                  contentPadding: EdgeInsets.zero,
                  minVerticalPadding: 16,
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(follower.followerProfile),
                    radius: 30,
                  ),
                  title: CommonText(
                    text: follower.followerName,
                    fontSize: AppSizes.setFontSize(15),
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.start,
                  ),
                  subtitle: CommonText(
                    text: follower.message ?? '',
                    textAlign: TextAlign.start,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      follower.isFollowing ?? false
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: AppColor.btnGradiant2,
                              ),
                              height: AppSizes.setHeight(20),
                              width: AppSizes.setWidth(20),
                              padding: const EdgeInsets.all(2),
                              child: CommonText(
                                text: follower.likeCount ?? '',
                                textColor: AppColor.txtWhite,
                                fontSize: AppSizes.setFontSize(10),
                              ),
                            )
                          : SizedBox(
                              height: AppSizes.setHeight(20),
                              width: AppSizes.setWidth(20),
                            ),
                      SizedBox(height: AppSizes.setHeight(4)),
                      CommonText(
                        text: follower.messageTime ?? '',
                        fontSize: AppSizes.setFontSize(12),
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
