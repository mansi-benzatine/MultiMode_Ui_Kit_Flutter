import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:run_tracker_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_app/localization/language/languages.dart';
import 'package:run_tracker_app/utils/app_assets.dart';
import 'package:run_tracker_app/utils/app_color.dart';
import 'package:run_tracker_app/utils/constant.dart';
import 'package:run_tracker_app/utils/sizer_utils.dart';
import 'package:run_tracker_app/widgets/text/common_text.dart';
import 'package:run_tracker_app/widgets/top_bar/topbar.dart';

class AchievementShareScreen extends StatefulWidget {
  final String km;
  static Route<void> route({required String km}) {
    return MaterialPageRoute(builder: (_) => AchievementShareScreen(km: km));
  }

  const AchievementShareScreen({super.key, required this.km});

  @override
  State<AchievementShareScreen> createState() => _AchievementShareScreenState();
}

class _AchievementShareScreenState extends State<AchievementShareScreen>
    implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: CustomAppColor.of(context).primary,
      ),
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              TopBar(
                this,
                isShowSimpleTitle: true,
                simpleTitle: Languages.of(
                  context,
                ).txtGetAchievements.toUpperCase(),
                appbarColor: CustomAppColor.of(context).primary,
                textColor: CustomAppColor.of(context).white,
                isShowBack: true,
                iconColor: CustomAppColor.of(context).white,
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        AppAssets.imgAchievementShareBg,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 140.setHeight,
                          color: CustomAppColor.of(context).primary,
                        ),
                        Positioned(
                          bottom: -100,
                          right: 0,
                          left: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).transparent,
                              border: Border.all(
                                color: CustomAppColor.of(context).transparent,
                                width: 10,
                              ),
                              shape: BoxShape.circle,
                            ),
                            height: 200,
                            child: Image.asset(
                              AppAssets.imgAchievementMedal,
                              width: 174.setWidth,
                              height: 174.setHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 200.setHeight,
                      left: 0.setWidth,
                      right: 0.setWidth,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35.setWidth),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.setWidth,
                            vertical: 10.setHeight,
                          ),
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(
                              context,
                            ).black.withValues(alpha: 0.4),
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CommonText(
                                text: Languages.of(
                                  context,
                                ).txtCongratulations.toUpperCase(),
                                fontWeight: FontWeight.w700,
                                fontSize: 24.setFontSize,
                                textColor: CustomAppColor.of(context).white,
                              ),
                              SizedBox(height: 5.setHeight),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: CustomAppColor.of(context).white,
                                    fontSize: 18.setFontSize,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: Languages.of(
                                        context,
                                      ).txtYouHaveAchieved,
                                    ),
                                    TextSpan(
                                      text: " ${widget.km} ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22.setFontSize,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "${Languages.of(context).txtKm.toLowerCase()}!",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30.setHeight,
                      left: 0.setWidth,
                      right: 0.setWidth,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.setWidth),
                        child: Column(
                          children: [
                            CommonText(
                              text: Languages.of(
                                context,
                              ).txtShareWithSocialMedia.toUpperCase(),
                              fontWeight: FontWeight.w700,
                              fontSize: 16.setFontSize,
                              textColor: CustomAppColor.of(context).white,
                            ),
                            SizedBox(height: 10.setHeight),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.setWidth,
                                vertical: 16.setHeight,
                              ),
                              decoration: BoxDecoration(
                                color: CustomAppColor.of(
                                  context,
                                ).white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(22),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    AppAssets.icFacebook,
                                    height: 50.setHeight,
                                    width: 50.setWidth,
                                  ),
                                  Image.asset(
                                    AppAssets.icWhatsapp,
                                    height: 50.setHeight,
                                    width: 50.setWidth,
                                  ),
                                  Image.asset(
                                    AppAssets.icInstagram,
                                    height: 50.setHeight,
                                    width: 50.setWidth,
                                  ),
                                  Image.asset(
                                    AppAssets.icMoreCircle,
                                    height: 50.setHeight,
                                    width: 50.setWidth,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
