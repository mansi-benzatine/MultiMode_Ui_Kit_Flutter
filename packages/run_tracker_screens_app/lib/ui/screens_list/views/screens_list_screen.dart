import 'package:flutter/material.dart';
import 'package:run_tracker_screens_app/ui/achievement_share/views/achievement_share_screen.dart';
import 'package:run_tracker_screens_app/ui/achievements/views/achievements_screen.dart';
import 'package:run_tracker_screens_app/ui/allow_locations_permission/views/allow_locations_permission_screen.dart';
import 'package:run_tracker_screens_app/ui/counter/views/counter_screen.dart';
import 'package:run_tracker_screens_app/ui/dashboard/views/dashboard_screen.dart';
import 'package:run_tracker_screens_app/ui/expanded_map/views/expand_map_screen.dart';
import 'package:run_tracker_screens_app/ui/fill_information/views/fill_information_screen.dart';
import 'package:run_tracker_screens_app/ui/onboarding/views/on_boarding_screen.dart';
import 'package:run_tracker_screens_app/ui/reminder/views/reminder_screen.dart';
import 'package:run_tracker_screens_app/ui/result_share/views/result_share_screen.dart';
import 'package:run_tracker_screens_app/ui/start_running/views/start_running_screen.dart';
import 'package:run_tracker_screens_app/ui/start_running_details/views/start_running_details_screen.dart';
import 'package:run_tracker_screens_app/ui/subscription/views/subscription_screen.dart';
import 'package:run_tracker_screens_app/utils/sizer_utils.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../splash/views/splash_screen.dart';
import '../datamodels/screens_list_data.dart';

class ScreenListScreen extends StatefulWidget {
  final String title;
  final Function()? onBack;

  const ScreenListScreen({super.key, required this.title, this.onBack});

  static Route<void> route({required String title}) {
    return MaterialPageRoute<void>(
      builder: (_) => ScreenListScreen(title: title),
    );
  }

  @override
  State<ScreenListScreen> createState() => _ScreenListScreen();
}

class _ScreenListScreen extends State<ScreenListScreen> {
  List<ScreenListDataModel> screenList = [];
  _fillData() {
    screenList = [
      ScreenListDataModel(
        title: "Splash".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, SplashScreen.route()),
      ),
      ScreenListDataModel(
        title: "Onboarding 1".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () =>
            Navigator.push(context, OnboardingScreen.route(currentIndex: 0)),
      ),
      ScreenListDataModel(
        title: "Onboarding 2".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () =>
            Navigator.push(context, OnboardingScreen.route(currentIndex: 1)),
      ),
      ScreenListDataModel(
        title: "Onboarding 3".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () =>
            Navigator.push(context, OnboardingScreen.route(currentIndex: 2)),
      ),
      ScreenListDataModel(
        title: "What's your Gender?".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
          context,
          FillInformationScreen.route(currentIndex: 0),
        ),
      ),
      ScreenListDataModel(
        title: "What's your Daily goal?".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
          context,
          FillInformationScreen.route(currentIndex: 1),
        ),
      ),
      ScreenListDataModel(
        title: "Home".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
          context,
          DashboardScreen.route(
            currentIndex: 0,
            isFromEmptyHistoryScreen: false,
          ),
        ),
      ),
      ScreenListDataModel(
        title: "Recent History".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
          context,
          DashboardScreen.route(
            currentIndex: 1,
            isFromEmptyHistoryScreen: false,
          ),
        ),
      ),
      ScreenListDataModel(
        title: "Empty Recent History".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
          context,
          DashboardScreen.route(
            currentIndex: 1,
            isFromEmptyHistoryScreen: true,
          ),
        ),
      ),
      ScreenListDataModel(
        title: "Result Run Tracking".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ResultShareScreen.route()),
      ),
      ScreenListDataModel(
        title: "Allow Location permission".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () =>
            Navigator.push(context, AllowLocationsPermissionScreen.route()),
      ),
      ScreenListDataModel(
        title: "Start Running".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, StartRunningScreen.route()),
      ),
      ScreenListDataModel(
        title: "Count down".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, CountdownScreen.route()),
      ),
      ScreenListDataModel(
        title: "Daily Run Tracking".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () =>
            Navigator.push(context, StartRunningDetailsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Expanded view".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ExpandMapScreen.route()),
      ),
      ScreenListDataModel(
        title: "Reports screen".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
          context,
          DashboardScreen.route(
            currentIndex: 2,
            isFromEmptyHistoryScreen: false,
          ),
        ),
      ),
      ScreenListDataModel(
        title: "Setting Screen".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
          context,
          DashboardScreen.route(
            currentIndex: 3,
            isFromEmptyHistoryScreen: false,
          ),
        ),
      ),
      ScreenListDataModel(
        title: "Reminder screen".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ReminderScreen.route()),
      ),
      ScreenListDataModel(
        title: "Achievement List".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, AchievementsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Achievement Share View".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () =>
            Navigator.push(context, AchievementShareScreen.route(km: "5")),
      ),
      ScreenListDataModel(
        title: "Subscription screen".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, SubscriptionScreen.route()),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _fillData();
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: CustomAppColor.of(context).white,
            ),
            onPressed: () {
              widget.onBack?.call();
            },
          ),
          title: CommonText(
            text: "Run Tracker App",
            fontSize: 22.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).white,
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: 20.setHeight),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.imgBgHomeScreen),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: kToolbarHeight + 26),
              _ModeGridView(screenList: screenList),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModeGridView extends StatelessWidget {
  final List<ScreenListDataModel> screenList;

  const _ModeGridView({required this.screenList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 0.screenWidth,
        margin: EdgeInsets.only(top: 10.setHeight),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).txtWhite,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        ),
        child: Column(
          children: [
            Container(
              height: 6.setHeight,
              width: 50.setWidth,
              margin: EdgeInsets.symmetric(vertical: 15.setHeight),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).greyHandle,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Wrap(
                      spacing: 10.setWidth,
                      runSpacing: 10.setHeight,
                      alignment: WrapAlignment.start,
                      children: screenList.map((item) {
                        return _itemList(context: context, item: item);
                      }).toList(),
                    ),
                    SizedBox(height: 20.setHeight),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemList({
    required BuildContext context,
    required ScreenListDataModel item,
  }) {
    return InkWell(
      onTap: () {
        item.onClick?.call();
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 4.setWidth,
          vertical: 4.setHeight,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 14.setWidth,
          vertical: 14.setHeight,
        ),
        width:
            (MediaQuery.of(context).size.width -
                16.setWidth * 2 -
                14.setWidth * 2) /
            3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: CustomAppColor.of(context).listTileColorScreenList,
          boxShadow: [
            BoxShadow(
              color: CustomAppColor.of(
                context,
              ).listTileShadow.withValues(alpha: .10),
              offset: const Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 6.setHeight),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.setWidth,
                vertical: 15.setHeight,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    CustomAppColor.of(context).bgSkyBlue,
                    CustomAppColor.of(context).bgDarkBlue,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                item.icon,
                height: 32.setHeight,
                width: 32.setHeight,
                gaplessPlayback: true,
              ),
            ),
            SizedBox(height: 10.setHeight),
            Container(
              constraints: BoxConstraints(minHeight: 37.setHeight),
              alignment: Alignment.center,
              child: CommonText(
                text: item.title.toUpperCase(),
                fontSize: 13.setFontSize,
                fontWeight: FontWeight.w700,
                textColor: CustomAppColor.of(context).txtBlack,
                textAlign: TextAlign.center,
                isAutoSize: true,
                maxLines: 2,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
