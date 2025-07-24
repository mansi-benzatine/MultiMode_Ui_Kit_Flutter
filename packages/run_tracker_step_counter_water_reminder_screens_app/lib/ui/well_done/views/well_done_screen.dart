import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/localization/language/languages.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/share_run_history/views/share_run_history_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_assets.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_color.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/constant.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/button/common_button.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/text/common_text.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/top_bar/topbar.dart';

import '../../../widgets/bottom_sheet/rating_bottom_sheet.dart';

class WellDoneScreen extends StatefulWidget {
  const WellDoneScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => WellDoneScreen());
  }

  @override
  State<WellDoneScreen> createState() => _WellDoneScreenState();
}

class _WellDoneScreenState extends State<WellDoneScreen>
    implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(this, isShowDustbin: true, isShowCancle: true),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ImageView(),
                    SizedBox(height: 15.setHeight),
                    MapViews(),
                    SizedBox(height: 30.setHeight),
                    DistanceCalculateView(),
                    IgnorePointer(
                      ignoring: true,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 22.setWidth,
                          vertical: 24.setHeight,
                        ),
                        child: CommonButton(
                          onTap: () => Navigator.push(
                            context,
                            ShareRunHistoryScreen.route(),
                          ),
                          radius: 12,
                          text: Languages.of(context).txtShare,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.setHeight),

                    PopUpView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strCancle) {
      Navigator.pop(context);
    }
  }
}

class ImageView extends StatelessWidget {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Image.asset(
              AppAssets.imgThumpsUp,
              width: double.infinity,
              height: 191.setHeight,
            ),
            CommonText(
              text: Languages.of(context).txtWellDone.toUpperCase(),
              fontSize: 28.setFontSize,
              fontWeight: FontWeight.w900,
              textColor: CustomAppColor.of(context).txtPurple,
            ),
          ],
        ),

        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            width: double.infinity,
            height: 300.setHeight,
            child: Lottie.asset(
              AppAssets.jsSuccess,
              fit: BoxFit.cover,
              repeat: true,
            ),
          ),
        ),
      ],
    );
  }
}

class MapViews extends StatelessWidget {
  const MapViews({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Image.asset(
        AppAssets.imgMapView,
        height: 191.setHeight,
        width: 327.setWidth,
        fit: BoxFit.fill,
      ),
    );
  }
}

class DistanceCalculateView extends StatelessWidget {
  const DistanceCalculateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: Languages.of(context).txtDuration,
                    textColor: CustomAppColor.of(context).txtGrey,
                    fontSize: 14.setFontSize,
                  ),
                  CommonText(
                    text: "00:10:40",
                    textColor: CustomAppColor.of(context).txtPurple,
                    fontSize: 28.setFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CommonText(
                    text: Languages.of(context).txtDistanceKm,
                    textColor: CustomAppColor.of(context).txtGrey,
                    fontSize: 14.setFontSize,
                  ),
                  CommonText(
                    text: "10:05",
                    textColor: CustomAppColor.of(context).txtPurple,
                    fontSize: 28.setFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: Languages.of(context).txtPaceMinKm,
                    textColor: CustomAppColor.of(context).txtGrey,
                    fontSize: 14.setFontSize,
                  ),
                  CommonText(
                    text: "00:90",
                    textColor: CustomAppColor.of(context).txtPurple,
                    fontSize: 20.setFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: Languages.of(context).txtKcal,
                    textColor: CustomAppColor.of(context).txtGrey,
                    fontSize: 14.setFontSize,
                  ),
                  CommonText(
                    text: "5.0",
                    textColor: CustomAppColor.of(context).txtPurple,
                    fontSize: 20.setFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.setHeight),

          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.icBlueWalk,
                        height: 26.setHeight,
                        width: 26.setWidth,
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: Languages.of(
                          context,
                        ).txtLowIntensity.toUpperCase(),
                        fontSize: 16.setFontSize,
                        textColor: CustomAppColor.of(context).txtPurpleWhite,
                      ),
                    ],
                  ),
                  CommonText(
                    text: "00:05:52 Min",
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtWhitePurple,
                  ),
                ],
              ),
              SizedBox(height: 10.setHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.icGreenWalk,
                        height: 26.setHeight,
                        width: 26.setWidth,
                      ),
                      SizedBox(width: 10.setWidth),

                      CommonText(
                        text: Languages.of(
                          context,
                        ).txtModerateIntensity.toUpperCase(),
                        fontSize: 16.setFontSize,
                        textColor: CustomAppColor.of(context).txtPurpleWhite,
                      ),
                    ],
                  ),
                  CommonText(
                    text: "00:00:20 Min",
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtWhitePurple,
                  ),
                ],
              ),
              SizedBox(height: 10.setHeight),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.icRedWalk,
                        height: 26.setHeight,
                        width: 26.setWidth,
                      ),
                      SizedBox(width: 10.setWidth),

                      CommonText(
                        text: Languages.of(
                          context,
                        ).txtHighIntensity.toUpperCase(),
                        fontSize: 16.setFontSize,
                        textColor: CustomAppColor.of(context).txtPurpleWhite,
                      ),
                    ],
                  ),
                  CommonText(
                    text: "00:00:00 Min",
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtWhitePurple,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PopUpView extends StatelessWidget {
  const PopUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.setWidth,
        vertical: 40.setHeight,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 50.setWidth,
              left: 18.setWidth,
              right: 18.setWidth,
              bottom: 20.setHeight,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFD0F24A),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                CommonText(
                  text: Languages.of(
                    context,
                  ).txtAreYouSatisfiedWithTheTrackingResults,
                  fontSize: 18.setFontSize,
                  fontWeight: FontWeight.w700,
                  textColor: CustomAppColor.of(context).black,
                ),
                SizedBox(height: 15.setHeight),
                Row(
                  children: [
                    Expanded(
                      child: CommonButton(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) => RatingBottomSheet(),
                          );
                        },
                        text: Languages.of(context).txtNotReally,
                        radius: 6,
                        buttonTextWeight: FontWeight.w600,
                        height: 46.setHeight,
                        buttonColor: CustomAppColor.of(context).white,
                        buttonTextColor: CustomAppColor.of(context).black,
                      ),
                    ),
                    SizedBox(width: 15.setWidth),
                    Expanded(
                      child: CommonButton(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) => RatingBottomSheet(),
                          );
                        },

                        buttonTextWeight: FontWeight.w600,
                        text: Languages.of(context).txtGood,
                        radius: 6,
                        height: 46.setHeight,
                        buttonColor: CustomAppColor.of(context).white,
                        buttonTextColor: CustomAppColor.of(context).black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: -50.setHeight,
            right: 0.setWidth,
            left: 0.setWidth,
            child: CircleAvatar(
              radius: 50,
              child: Image.asset(AppAssets.imgProfile, fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }
}
