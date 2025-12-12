import 'package:flutter/material.dart';
import 'package:mivi_app/utils/sizer_utils.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../text/common_text.dart';

class ShareBottomSheet extends StatefulWidget {
  const ShareBottomSheet({super.key});

  @override
  State<ShareBottomSheet> createState() => _ShareBottomSheetState();
}

class _ShareBottomSheetState extends State<ShareBottomSheet> {
  final List<Map<String, dynamic>> recentPeople = [
    {
      "name": "Stilla Sulevan",
      "image": AppAssets.imgDummy,
      "icon": AppAssets.icInstagram,
    },
    {
      "name": "Rony Marsun",
      "image": AppAssets.imgDummy,
      "icon": AppAssets.icInstagram,
    },
    {
      "name": "Zoya Nick",
      "image": AppAssets.imgDummy,
      "icon": AppAssets.icInstagram,
    },
    {
      "name": "Anish Stive",
      "image": AppAssets.imgDummy,
      "icon": AppAssets.icInstagram,
    },
    {
      "name": "Orray Jackson",
      "image": AppAssets.imgDummy,
      "icon": AppAssets.icInstagram,
    },
  ];

  final List<Map<String, dynamic>> socialMedia = [
    {"name": "Whatsapp", "icon": AppAssets.icTelegram},
    {"name": "Facebook", "icon": AppAssets.icFacebook},
    {"name": "Instagram", "icon": AppAssets.icInstagram},
    {"name": "Twitter", "icon": AppAssets.icTwitter},
    {"name": "Telegram", "icon": AppAssets.icTelegram},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.setWidth),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bottomSheetBg,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 15.setHeight),
            Center(
              child: Container(
                width: 40.setWidth,
                height: 3.setHeight,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Center(
              child: CommonText(
                text: "Share",
                fontSize: 20.setFontSize,
                fontFamily: Constant.fontFamilyBold700,
              ),
            ),
            Divider(height: 24.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
              child: CommonText(
                text: "Recent People",
                fontSize: 14.setFontSize,
                fontFamily: Constant.fontFamilyBold700,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: 12.setHeight),
            Padding(
              padding: EdgeInsets.only(left: 12.setWidth),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 12.setWidth,
                  runSpacing: 8.setHeight,
                  children: recentPeople.map((person) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 26,
                              backgroundImage: AssetImage(person["image"]),
                            ),
                            if (person["icon"] != null)
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Image.asset(
                                  person["icon"],
                                  height: 16.setHeight,
                                  width: 16.setWidth,
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 4.setHeight),
                        SizedBox(
                          width: 55.setWidth,
                          child: CommonText(
                            text: person["name"],
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            fontSize: 10.setFontSize,
                            fontFamily: Constant.fontFamilySemiBold600,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 16.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
              child: CommonText(
                text: "Social Media",
                fontSize: 14.setFontSize,
                fontFamily: Constant.fontFamilyBold700,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: 6.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.setWidth),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 12.setWidth,
                  runSpacing: 12.setHeight,
                  children: socialMedia.map((item) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width / 5 - 19,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            item["icon"],
                            height: 45.setHeight,
                            width: 45.setHeight,
                          ),
                          SizedBox(height: 4.setHeight),
                          SizedBox(
                            width: 72.setWidth,
                            child: CommonText(
                              text: item["name"],
                              fontSize: 10.setFontSize,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              fontFamily: Constant.fontFamilySemiBold600,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 15.setHeight),
          ],
        ),
      ),
    );
  }
}
