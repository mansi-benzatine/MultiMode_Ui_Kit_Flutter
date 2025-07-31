import 'package:flutter/material.dart';
import 'package:run_tracker_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_screens_app/localization/language/languages.dart';
import 'package:run_tracker_screens_app/ui/counter/views/counter_screen.dart';
import 'package:run_tracker_screens_app/utils/app_color.dart';
import 'package:run_tracker_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_screens_app/widgets/text/common_text.dart';
import 'package:run_tracker_screens_app/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';

class StartRunningScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => StartRunningScreen());
  }

  const StartRunningScreen({super.key});

  @override
  State<StartRunningScreen> createState() => _StartRunningScreenState();
}

class _StartRunningScreenState extends State<StartRunningScreen>
    implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: true,
            isShowSimpleTitle: true,
            simpleTitle: Languages.of(context).txtAppName.toUpperCase(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22.setWidth,
              vertical: 20.setHeight,
            ),
            child: SingleChildScrollView(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          AppAssets.imgMap1,
                          height: 395.setHeight,
                          width: 331.setWidth,
                          fit: BoxFit.fill,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 22.setWidth,
                            right: 22.setWidth,
                            bottom: 60.setHeight,
                          ),
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).lime,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                          ),
                          child: Column(
                            children: [
                              CommonText(
                                text: "00:00:00",
                                fontSize: 40.setFontSize,
                                letterSpacing: -2,
                                textColor: CustomAppColor.of(context).black,
                              ),
                              SizedBox(height: 10.setHeight),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      CommonText(
                                        text: "0:00",
                                        letterSpacing: -2,
                                        fontSize: 28.setFontSize,
                                        textColor: CustomAppColor.of(
                                          context,
                                        ).black,
                                      ),
                                      CommonText(
                                        text: Languages.of(context).txtKm,
                                        fontSize: 12.setFontSize,
                                        textColor: CustomAppColor.of(
                                          context,
                                        ).black,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CommonText(
                                        text: "00:00",
                                        letterSpacing: -2,
                                        fontSize: 28.setFontSize,
                                        textColor: CustomAppColor.of(
                                          context,
                                        ).black,
                                      ),
                                      CommonText(
                                        text: Languages.of(
                                          context,
                                        ).txtPaceMinKm.toUpperCase(),
                                        fontSize: 12.setFontSize,
                                        textColor: CustomAppColor.of(
                                          context,
                                        ).black,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CommonText(
                                        text: "0:0",
                                        letterSpacing: -2,
                                        fontSize: 28.setFontSize,
                                        textColor: CustomAppColor.of(
                                          context,
                                        ).black,
                                      ),
                                      CommonText(
                                        text: Languages.of(
                                          context,
                                        ).txtKcal.toUpperCase(),
                                        fontSize: 12.setFontSize,
                                        textColor: CustomAppColor.of(
                                          context,
                                        ).black,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 520.setHeight,
                    left: 0,
                    right: 0,
                    child: IgnorePointer(
                      ignoring: true,
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.push(context, CountdownScreen.route()),
                        child: Container(
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).bgScaffold,
                            border: Border.all(
                              color: CustomAppColor.of(context).bgScaffold,
                              width: 10,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            AppAssets.icPlay,
                            height: 100.setHeight,
                            width: 100.setWidth,
                            color: CustomAppColor.of(context).primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    // TODO: implement onTopBarClick
  }
}
