import 'package:chat_ai_screens_app_package/ui/chat/datamodel/chat_data.dart';
import 'package:flutter/material.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';
import '../../widgets/text/common_text.dart';

class ShareBottomSheet extends StatelessWidget {
  final Function? onLogout;
  final List<ShareData>? recentPeople;
  final List<ShareData>? socialMediaList;

  const ShareBottomSheet({
    super.key,
    this.onLogout,
    this.socialMediaList,
    this.recentPeople,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtRecentPeople,
            fontWeight: FontWeight.w600,
            fontSize: 18.setFontSize,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 15.setHeight),
          SizedBox(
            height: 113.setHeight,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: recentPeople?.length,
              itemBuilder: (context, index) {
                final chat = recentPeople?[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.setWidth),
                  child: SizedBox(
                    width: 60.setWidth,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 64.setHeight,
                          width: 60.setWidth,
                          child: Stack(
                            children: [
                              Image.asset(
                                chat?.userProfileUrl ?? '',
                                width: 60.setWidth,
                                height: 60.setHeight,
                              ),
                              Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Image.asset(
                                    chat?.socialPlatformUrl ?? '',
                                    height: 18.setHeight,
                                    width: 18.setWidth,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(height: 10.setHeight),
                        CommonText(
                          text: chat?.username ?? '',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.setFontSize,
                          height: 1,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          CommonText(
            text: Languages.of(context).txtSocialMedia,
            fontWeight: FontWeight.w600,
            fontSize: 18.setFontSize,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 15.setHeight),
          SizedBox(
            height: 90.setHeight,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: socialMediaList?.length,
              itemBuilder: (context, index) {
                final chat = socialMediaList?[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.setWidth),
                  child: SizedBox(
                    width: 70.setWidth,
                    child: Column(
                      children: [
                        Image.asset(
                          chat?.socialPlatformUrl ?? '',
                          width: 60.setWidth,
                          height: 60.setHeight,
                        ),
                        SizedBox(height: 10.setHeight),
                        CommonText(
                          text: chat?.socialPlatformName ?? '',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.setFontSize,
                          height: 1,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
