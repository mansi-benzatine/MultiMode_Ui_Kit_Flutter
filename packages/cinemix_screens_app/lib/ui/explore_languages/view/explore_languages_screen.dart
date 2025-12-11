import 'package:cinemix_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:cinemix_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../dashboard/view/dashboard_screen.dart';
import '../../home/datamodel/home_data.dart';

class ExploreLanguagesScreen extends StatefulWidget {
  final List<LanguagesList> language;
  final String title;

  static Route<void> route({List<LanguagesList> language = const [], String title = ""}) {
    return MaterialPageRoute(
        builder: (_) => ExploreLanguagesScreen(
              language: language,
              title: title,
            ));
  }

  const ExploreLanguagesScreen({super.key, required this.language, required this.title});

  @override
  State<ExploreLanguagesScreen> createState() => _ExploreLanguagesScreenState();
}

class _ExploreLanguagesScreenState extends State<ExploreLanguagesScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: widget.title,
            isShowSearch: true,
            isShowBack: true,
          ),
          Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.only(left: 0.setWidth, right: 0.setWidth, top: 20.setHeight),
              child: Wrap(
                spacing: 20.setWidth,
                runSpacing: 25.setHeight,
                children: List.generate(widget.language.length, (index) {
                  final item = widget.language[index];
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 100.setHeight,
                        width: 100.setWidth,
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
                        bottom: -12.setHeight,
                        child: Image.asset(
                          item.languageImage,
                          width: 65.setWidth,
                          height: 140.setHeight,
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
          ))
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
    if (name == Constant.strSearch) {
      Navigator.push(context, DashboardScreen.route(currentIndex: 1));
    }
  }
}
