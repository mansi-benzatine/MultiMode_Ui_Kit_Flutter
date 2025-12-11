import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../datamodel/home_data.dart';

class LanguageListView extends StatelessWidget {
  final List<LanguagesList> language;
  final String title;
  final VoidCallback? onSeeAll;

  const LanguageListView({
    super.key,
    required this.language,
    required this.title,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: Row(
            children: [
              CommonText(
                text: title,
                fontSize: 18.setFontSize,
                fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
              ),
              const Spacer(),
              IgnorePointer(
                ignoring: true,
                child: GestureDetector(
                  onTap: onSeeAll,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: CustomAppColor.of(context).cardBorder,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.setHeight),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 20),
            child: Wrap(
              spacing: 14.setWidth,
              children: List.generate(language.length, (index) {
                final item = language[index];
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 115.setHeight,
                      width: 115.setWidth,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            const Color(0xFF3E4959),
                            const Color(0xFF425664).withValues(alpha: 0.9),
                            CustomAppColor.of(context).bgLanguageShadow,
                          ],
                          stops: const [0.0, 0.2, 0.5],
                          center: Alignment.center,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0.setWidth,
                      bottom: -24.setHeight,
                      child: Image.asset(
                        item.languageImage,
                        width: 75.setWidth,
                        height: 180.setHeight,
                      ),
                    ),
                    Positioned(
                      left: 15.setWidth,
                      top: 55.setHeight,
                      child: CommonText(
                        text: item.language,
                        textColor: CustomAppColor.of(context).white,
                        fontSize: 16.setFontSize,
                        fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
                      ),
                    )
                  ],
                );
              }),
            ),
          ),
        )
      ],
    );
  }
}
