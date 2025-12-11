import 'package:cinemix_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

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
  final List<Map<String, dynamic>> socialMedia = [
    {"name": "Whatsapp", "icon": AppAssets.icWhatsapp},
    {"name": "Instagram", "icon": AppAssets.icInstagram},
    {"name": "WhatsApp", "icon": AppAssets.icWhatsapp},
    {"name": "Twitter", "icon": AppAssets.icTwitter},
    {"name": "X", "icon": AppAssets.icX},
    {"name": "Telegram", "icon": AppAssets.icTelegram},
    {"name": "Tik Tok", "icon": AppAssets.icTiktok},
    {"name": "Twitch", "icon": AppAssets.icTwitch},
  ];

  @override
  Widget build(BuildContext context) {
    int itemsPerRow = 4;
    int maxRows = 2;
    int maxItems = itemsPerRow * maxRows;

    final List<Map<String, dynamic>> visibleItems = socialMedia.take(maxItems).toList();
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16.setWidth),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          gradient: LinearGradient(
            colors: [
              CustomAppColor.of(context).bgLinearShadow,
              CustomAppColor.of(context).bgTextFormFieldShadowLight,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
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
                text: "Send to",
                fontSize: 20.setFontSize,
                fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
              ),
            ),
            Divider(height: 24.setHeight),
            SizedBox(height: 5.setHeight),
            Wrap(
              spacing: 12.setWidth,
              runSpacing: 18.setHeight,
              children: visibleItems.map((item) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 4 - 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        item["icon"],
                        height: 45.setHeight,
                        width: 45.setHeight,
                      ),
                      SizedBox(height: 4.setHeight),
                      CommonText(
                        text: item["name"],
                        fontSize: 13.setFontSize,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        fontFamily: Constant.fontFamilyClashGroteskMedium500,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
