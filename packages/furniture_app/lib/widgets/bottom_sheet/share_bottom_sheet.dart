import 'package:flutter/material.dart';
import 'package:furniture_app_package/utils/app_assets.dart';
import 'package:furniture_app_package/utils/app_color.dart';
import 'package:furniture_app_package/utils/constant.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:furniture_app_package/widgets/text/common_text.dart';

class ShareBottomSheet extends StatefulWidget {
  const ShareBottomSheet({super.key});

  @override
  State<ShareBottomSheet> createState() => _ShareBottomSheetState();
}

class _ShareBottomSheetState extends State<ShareBottomSheet> {
  final List<Map<String, dynamic>> recentPeople = [
    {
      "name": "Stilla Sulevan",
      "image": AppAssets.imgDummyProfile,
      "icon": AppAssets.imgWhatsapp,
    },
    {
      "name": "Rony Marsun",
      "image": AppAssets.imgDummyProfile,
      "icon": AppAssets.imgFacebook,
    },
    {
      "name": "Zoya Nick",
      "image": AppAssets.imgDummyProfile,
      "icon": AppAssets.imgInstagram,
    },
    {
      "name": "Anish Stive",
      "image": AppAssets.imgDummyProfile,
      "icon": AppAssets.imgWhatsapp,
    },
    {
      "name": "Orray Jackson",
      "image": AppAssets.imgDummyProfile,
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
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bottomSheetBg,
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
                fontSize: 26.setFontSize,
                fontFamily: Constant.fontFamilyBold700,
              ),
            ),
            Divider(height: 24.setHeight),
            CommonText(
              text: "Recent People",
              fontSize: 18.setFontSize,
              fontFamily: Constant.fontFamilySemiBold600,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 12.setHeight),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 22.setWidth,
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
                          fontFamily: Constant.fontFamilyMedium500,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16.setHeight),
            CommonText(
              text: "Social Media",
              fontSize: 18.setFontSize,
              fontFamily: Constant.fontFamilySemiBold600,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 6.setHeight),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 16.setWidth,
                runSpacing: 12.setHeight,
                children: socialMedia.map((item) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 5 - 19,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          item["icon"],
                          height: 60.setHeight,
                          width: 60.setHeight,
                        ),
                        SizedBox(height: 4.setHeight),
                        SizedBox(
                          width: 72.setWidth,
                          child: CommonText(
                            text: item["name"],
                            fontSize: 13.setFontSize,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            fontFamily: Constant.fontFamilyMedium500,
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
