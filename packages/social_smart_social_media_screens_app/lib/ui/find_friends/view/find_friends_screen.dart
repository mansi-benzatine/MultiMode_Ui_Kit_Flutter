import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/textfield/common_textformfield.dart';
import '../datamodel/find_friends_data.dart';

class FindFriendsScreen extends StatefulWidget {
  const FindFriendsScreen({super.key});
  static Route route({bool? isFromPost}) {
    return MaterialPageRoute(
      builder: (context) => const FindFriendsScreen(),
    );
  }

  @override
  State<FindFriendsScreen> createState() => _FindFriendsScreenState();
}

class _FindFriendsScreenState extends State<FindFriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        leading: IgnorePointer(ignoring: true, child: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back))),
        centerTitle: false,
        titleSpacing: 0,
        title: CommonText(
          text: Languages.of(context).findFriends,
          fontWeight: FontWeight.w700,
          fontSize: AppSizes.setFontSize(20),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
            child: CommonTextFormField(
              leadingIcon: Image.asset(
                AppAssets.icSearchFilled,
                color: CustomAppColor.of(context).txtGrey,
                scale: 5.2,
              ),
              hintText: Languages.of(context).search,
            ),
          ),
          SizedBox(height: AppSizes.setHeight(10)),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(16)),
              child: Column(
                children: [
                  socialList(context),
                  SizedBox(height: AppSizes.setHeight(20)),
                  suggestedFollowersList(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget socialList(BuildContext context) {
    return Column(
      children: List.generate(
        socialDataList(context).length,
        (index) {
          final socialData = socialDataList(context)[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: AppSizes.setHeight(50),
                  width: AppSizes.setWidth(50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColor.btnGradiant2.withOpacityPercent(0.1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(AppSizes.setWidth(13)),
                    child: Image.asset(
                      socialData.socialIcon ?? '',
                      color: AppColor.btnGradiant2,
                    ),
                  ),
                ),
                SizedBox(width: AppSizes.setWidth(25)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: socialData.socialPlatform ?? '',
                      fontWeight: FontWeight.w700,
                      fontSize: AppSizes.setFontSize(16),
                    ),
                    CommonText(
                      text: socialData.description ?? '',
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtDarkGrey,
                      fontSize: AppSizes.setFontSize(13),
                    ),
                  ],
                ),
                const Spacer(),
                CommonButton(
                  width: AppSizes.setWidth(60),
                  height: AppSizes.setHeight(30),
                  child: CommonText(
                    text: socialData.isInvite ?? false ? Languages.of(context).invite : Languages.of(context).find,
                    fontSize: AppSizes.setFontSize(12),
                    textColor: AppColor.txtWhite,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget suggestedFollowersList(BuildContext context) {
    final followers = getSuggestedAccounts;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).suggestedAccount,
          fontWeight: FontWeight.w700,
          fontSize: AppSizes.setFontSize(18),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(14)),
          child: Column(
            children: List.generate(
              followers.length,
              (index) {
                final follower = followers[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(8)),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(follower.followerProfile),
                        radius: 26,
                      ),
                      SizedBox(width: AppSizes.setWidth(10)),
                      SizedBox(
                        width: AppSizes.setWidth(167),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CommonText(
                              text: follower.followerName,
                              fontSize: AppSizes.setFontSize(15),
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: AppSizes.setHeight(4)),
                            CommonText(
                              text: follower.followerDetails ?? '',
                              fontSize: AppSizes.setFontSize(12),
                              fontWeight: FontWeight.w500,
                              textColor: CustomAppColor.of(context).txtDarkGrey,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          CommonButton(
                            isOutLinedButton: follower.isFollowing ?? false,
                            width: AppSizes.setWidth(68),
                            height: AppSizes.setHeight(30),
                            child: CommonText(
                              text: follower.isFollowing ?? false ? Languages.of(context).following : Languages.of(context).follow,
                              fontSize: AppSizes.setFontSize(12),
                              fontWeight: FontWeight.w700,
                              textColor: follower.isFollowing ?? false ? AppColor.txtPurple : AppColor.txtWhite,
                            ),
                            onTap: () {
                              setState(() {
                                follower.isFollowing = !(follower.isFollowing ?? false);
                              });
                              ToastUtils.showToast(
                                follower.isFollowing! ? "Followed !" : "Un Followed !",
                              );
                            },
                          ),
                          SizedBox(width: AppSizes.setWidth(24)),
                          Image.asset(
                            AppAssets.icWrong,
                            width: AppSizes.setWidth(11),
                            height: AppSizes.setHeight(11),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
