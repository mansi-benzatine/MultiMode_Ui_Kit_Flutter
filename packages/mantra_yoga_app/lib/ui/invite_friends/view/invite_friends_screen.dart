import 'package:flutter/material.dart';
import 'package:mantra_yoga_app_package/interfaces/top_bar_click_listener.dart';
import 'package:mantra_yoga_app_package/utils/constant.dart';
import 'package:mantra_yoga_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../datamodels/friends_data.dart';

class InviteFriendsScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => InviteFriendsScreen());
  }

  const InviteFriendsScreen({super.key});

  @override
  State<InviteFriendsScreen> createState() => _InviteFriendsScreenState();
}

class _InviteFriendsScreenState extends State<InviteFriendsScreen> implements TopBarClickListener {
  final List<FriendModel> friends = [
    FriendModel(
      name: 'John Rios',
      username: '@johnrios',
      image: AppAssets.imgDummyProfile,
    ),
    FriendModel(
      name: 'Alfred Hodges',
      username: '@alfredhodges',
      image: AppAssets.imgDummyProfile,
    ),
    FriendModel(
      name: 'Samuel Hammond',
      username: '@samuelhammond',
      image: AppAssets.imgDummyProfile,
    ),
    FriendModel(
      name: 'Dora Hines',
      username: '@dorahines',
      image: AppAssets.imgDummyProfile,
    ),
    FriendModel(
      name: 'Caroyal Fracsios',
      username: '@caroyalfracsios',
      image: AppAssets.imgDummyProfile,
    ),
    FriendModel(
      name: 'Isaiah McGee',
      username: '@isaiahmcgee',
      image: AppAssets.imgDummyProfile,
    ),
    FriendModel(
      name: 'Mark Holmes',
      username: '@markholmes',
      image: AppAssets.imgDummyProfile,
    ),
    FriendModel(
      name: 'Caroyal Fracsios',
      username: '@caroyalfracsios',
      image: AppAssets.imgDummyProfile,
    ),
    FriendModel(
      name: 'Isaiah McGee',
      username: '@isaiahmcgee',
      image: AppAssets.imgDummyProfile,
    ),
    FriendModel(
      name: 'Mark Holmes',
      username: '@markholmes',
      image: AppAssets.imgDummyProfile,
    ),
  ];

  void toggleFriend(int index) {
    setState(() {
      friends[index].isSelected = !friends[index].isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtInviteFriends,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: friends.length,
                padding: EdgeInsets.zero,
                separatorBuilder: (_, __) => Divider(
                  color: CustomAppColor.of(context).dividerColor.withValues(alpha: 0.1),
                ),
                itemBuilder: (context, index) {
                  final friend = friends[index];
                  return ListTile(
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 0.setHeight),
                    leading: ClipRRect(
                      borderRadius: const BorderRadiusGeometry.all(
                        Radius.circular(14),
                      ),
                      child: Image.asset(
                        friend.image,
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: CommonText(
                      text: friend.name,
                      fontSize: 15.setFontSize,
                      fontFamily: Constant.fontFamilyBold700,
                      textColor: CustomAppColor.of(context).txtBlack,
                      textAlign: TextAlign.start,
                    ),
                    subtitle: CommonText(
                      text: friend.username,
                      textColor: CustomAppColor.of(context).txtBlack,
                      fontSize: 14.setFontSize,
                      fontFamily: Constant.fontFamilyRegular400,
                      textAlign: TextAlign.start,
                    ),
                    trailing: GestureDetector(
                      onTap: () => toggleFriend(index),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 2.setHeight),
                        decoration: BoxDecoration(
                          color: friend.isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).primary,
                          border: Border.all(color: CustomAppColor.of(context).primary.withValues(alpha: 0.1)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: CommonText(
                          text: "Invite",
                          fontSize: 14.setFontSize,
                          fontFamily: Constant.fontFamilyBold700,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
