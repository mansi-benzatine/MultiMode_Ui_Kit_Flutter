import 'package:bitx_app/utils/app_assets.dart';
import 'package:bitx_app/utils/app_color.dart';
import 'package:bitx_app/utils/sizer_utils.dart';
import 'package:bitx_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

class ShareBottomSheet extends StatefulWidget {
  const ShareBottomSheet({super.key});

  @override
  State<ShareBottomSheet> createState() => _ShareBottomSheetState();
}

class _ShareBottomSheetState extends State<ShareBottomSheet> {
  final List<Map<String, dynamic>> recentPeople = [
    {
      "name": "Stilla Sulevan",
      "image": AppAssets.imgDummyGirl,
      "icon": AppAssets.imgWhatsapp,
    },
    {
      "name": "Rony Marsun",
      "image": AppAssets.imgDummyGirl,
      "icon": AppAssets.imgFacebook,
    },
    {
      "name": "Zoya Nick",
      "image": AppAssets.imgDummyGirl,
      "icon": AppAssets.imgInstagram,
    },
    {
      "name": "Anish Stive",
      "image": AppAssets.imgDummyGirl,
      "icon": AppAssets.imgWhatsapp,
    },
    {
      "name": "Orray Jackson",
      "image": AppAssets.imgDummyGirl,
      "icon": AppAssets.imgTwitter,
    },
  ];

  final List<Map<String, dynamic>> socialMedia = [
    {"name": "Whatsapp", "icon": AppAssets.imgWhatsapp},
    {"name": "Facebook", "icon": AppAssets.imgFacebook},
    {"name": "Instagram", "icon": AppAssets.imgInstagram},
    {"name": "Twitter", "icon": AppAssets.imgTwitter},
    {"name": "Telegram", "icon": AppAssets.imgTelegram},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.setHeight),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgScreen,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
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
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Divider(height: 24.setHeight),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: CommonText(
                text: "Recent People",
                fontSize: 16.setFontSize,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 12.setHeight),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 14.setWidth,
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
                          fontSize: 13.setFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 24.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: CommonText(
                text: "Social Media",
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: 6.setHeight),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 14.setWidth,
                runSpacing: 12.setHeight,
                children: socialMedia.map((item) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 5 - 19,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          item["icon"],
                          height: 48.setHeight,
                          width: 48.setHeight,
                        ),
                        SizedBox(height: 4.setHeight),
                        SizedBox(
                          width: 72.setWidth,
                          child: CommonText(
                            text: item["name"],
                            fontSize: 12.setFontSize,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
