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
import 'package:run_tracker_screens_app/utils/constant.dart';
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
    return MaterialPageRoute<void>(builder: (_) => ScreenListScreen(title: title));
  }

  @override
  State<ScreenListScreen> createState() => _ScreenListScreen();
}

class _ScreenListScreen extends State<ScreenListScreen> {
  List<ScreenListDataModel> screenList = [];
  _fillData() {
    screenList = [
      ScreenListDataModel(title: "Splash", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, SplashScreen.route())),
      ScreenListDataModel(title: "Onboarding 1", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, OnboardingScreen.route(currentIndex: 0))),
      ScreenListDataModel(title: "Onboarding 2", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, OnboardingScreen.route(currentIndex: 1))),
      ScreenListDataModel(title: "Onboarding 3", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, OnboardingScreen.route(currentIndex: 2))),
      ScreenListDataModel(title: "What's Your Gender?", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, FillInformationScreen.route(currentIndex: 0))),
      ScreenListDataModel(title: "What's Your Daily Goal?", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, FillInformationScreen.route(currentIndex: 1))),
      ScreenListDataModel(title: "Home", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0, isFromEmptyHistoryScreen: false))),
      ScreenListDataModel(title: "Recent History", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 1, isFromEmptyHistoryScreen: false))),
      ScreenListDataModel(title: "Empty Recent History", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 1, isFromEmptyHistoryScreen: true))),
      ScreenListDataModel(title: "Result Run Tracking", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, ResultShareScreen.route())),
      ScreenListDataModel(title: "Allow Location Permission", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, AllowLocationsPermissionScreen.route())),
      ScreenListDataModel(title: "Start Running", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, StartRunningScreen.route())),
      ScreenListDataModel(title: "Count Down", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, CountdownScreen.route())),
      ScreenListDataModel(title: "Daily Run Tracking", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, StartRunningDetailsScreen.route())),
      ScreenListDataModel(title: "Expanded View", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, ExpandMapScreen.route())),
      ScreenListDataModel(title: "Reports", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2, isFromEmptyHistoryScreen: false))),
      ScreenListDataModel(title: "Setting", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 3, isFromEmptyHistoryScreen: false))),
      ScreenListDataModel(title: "Reminder", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, ReminderScreen.route())),
      ScreenListDataModel(title: "Achievement List", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, AchievementsScreen.route())),
      ScreenListDataModel(
        title: "Achievement Share View",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, AchievementShareScreen.route(km: "5")),
      ),
      ScreenListDataModel(title: "Subscription", icon: AppAssets.icScreens, onClick: () => Navigator.push(context, SubscriptionScreen.route())),
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
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_back, color: CustomAppColor.of(context).white),
            ),
            onPressed: () {
              widget.onBack?.call();
            },
          ),
          leadingWidth: 38.setWidth,
          title: CommonText(text: "Run Tracker App", fontSize: 22.setFontSize, fontFamily: Constant.fontFamilyMontserratSemiBold, fontWeight: FontWeight.w700, textColor: CustomAppColor.of(context).white),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: 20.setHeight),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppAssets.imgBgHomeScreen), fit: BoxFit.cover),
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
              decoration: BoxDecoration(color: CustomAppColor.of(context).greyHandle, borderRadius: BorderRadius.circular(100)),
            ),
            SizedBox(height: 5.setHeight),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Wrap(
                      spacing: 10.setWidth,
                      runSpacing: 10.setHeight,
                      alignment: WrapAlignment.start,
                      children: List.generate(screenList.length, (index) {
                        return _itemList(context: context, item: screenList[index], index: index + 1);
                      }),
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

  Widget _itemList({required BuildContext context, required ScreenListDataModel item, required int index}) {
    return InkWell(
      onTap: () {
        item.onClick?.call();
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 3.setHeight),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 18.setHeight),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: CustomAppColor.of(context).listTileColorScreenList,
            boxShadow: [BoxShadow(color: CustomAppColor.of(context).listTileShadow.withValues(alpha: .10), offset: const Offset(0, 4), blurRadius: 10, spreadRadius: 1)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CommonText(text: "${index.toString()}.  ", fontSize: 15.setFontSize, fontFamily: Constant.fontFamilyMontserratSemiBold, fontWeight: FontWeight.w600, textColor: CustomAppColor.of(context).txtBlack),
                    Expanded(
                      child: CommonText(
                        text: item.title,
                        fontSize: 14.setFontSize,
                        fontFamily: Constant.fontFamilyMontserratSemiBold,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.setWidth),
                child: Image.asset(item.icon, height: 20.setHeight, width: 20.setHeight, gaplessPlayback: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
