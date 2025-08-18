import 'package:flutter/material.dart';
import 'package:taxi_booking_rider_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/app_assets.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/constant.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_rider_screens_app_package/widgets/button/common_button.dart';
import 'package:taxi_booking_rider_screens_app_package/widgets/text/common_text.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../datamodel/invite_friends_data.dart';

class InviteFriendsScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const InviteFriendsScreen());
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
              isShowSearch: true,
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
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 0.setHeight),
                    leading: ClipRRect(
                      borderRadius: const BorderRadiusGeometry.all(
                        Radius.circular(12),
                      ),
                      child: Image.asset(
                        friend.image,
                        alignment: Alignment.center,
                        width: 55.setWidth,
                        height: 70.setHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: CommonText(
                      text: friend.name,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.setFontSize,
                      textAlign: TextAlign.start,
                    ),
                    subtitle: CommonText(
                      text: friend.username,
                      textColor: CustomAppColor.of(context).txtGray,
                      fontSize: 13.setFontSize,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.start,
                    ),
                    trailing: GestureDetector(
                      onTap: () => toggleFriend(index),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 2.setHeight),
                        decoration: BoxDecoration(
                          color: friend.isSelected ? CustomAppColor.of(context).btnPrimary : CustomAppColor.of(context).bgAlertDialog,
                          border: Border.all(color: CustomAppColor.of(context).btnBorder.withValues(alpha: 0.1)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          friend.isSelected ? Icons.check : Icons.add,
                          color: friend.isSelected ? Colors.white : CustomAppColor.of(context).icBlackWhite,
                          size: 20,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            IgnorePointer(
              ignoring: true,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 10.setHeight),
                child: CommonButton(
                  text: Languages.of(context).txtInviteFriends,
                  onTap: () => Navigator.pop(context),
                ),
              ),
            )
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
