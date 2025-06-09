import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/constant.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/top_bar/topbar.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../application/view/application_screen.dart';
import '../../home/view/home_screen.dart';
import '../../message/view/message_screen.dart';
import '../../notifications/view/notifications_screen.dart';
import '../../profile/view/profile_screen.dart';
import '../../saved_jobs/view/saved_jobs_screen.dart';
import '../../settings/view/settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  final bool isFromHome;
  final bool isFromMessage;
  final bool isFromApplication;
  final bool isFromSavedJobs;
  final bool isFromProfile;
  final bool isFromEmptyMessage;

  const DashboardScreen(
      {super.key,
      this.isFromHome = false,
      required this.isFromMessage,
      required this.isFromApplication,
      required this.isFromSavedJobs,
      required this.isFromProfile,
      this.isFromEmptyMessage = false});

  static Route<void> route(
      {required bool isFromHome,
      required bool isFromMessage,
      required bool isFromApplication,
      required bool isFromSavedJobs,
      required bool isFromProfile,
      required bool isFromEmptyMessage}) {
    return MaterialPageRoute(
        builder: (_) => DashboardScreen(
              isFromHome: isFromHome,
              isFromApplication: isFromApplication,
              isFromMessage: isFromMessage,
              isFromProfile: isFromProfile,
              isFromSavedJobs: isFromSavedJobs,
              isFromEmptyMessage: isFromEmptyMessage,
            ));
  }

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> implements TopBarClickListener {
  int _selectedIndex = 0;

  final List<String> _icons = [
    AppAssets.icHome,
    AppAssets.icApplication,
    AppAssets.icChat,
    AppAssets.icBookmark,
    AppAssets.icProfile,
  ];
  late List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens = [
      const HomeScreen(),
      const ApplicationScreen(),
      MessageScreen(isFromEmptyMessage: widget.isFromEmptyMessage),
      const SavedJobsScreen(),
      const ProfileScreen(),
    ];
    _setInitialTab();
  }

  void _setInitialTab() {
    if (widget.isFromApplication) {
      _selectedIndex = 1;
    } else if (widget.isFromMessage) {
      _selectedIndex = 2;
    } else if (widget.isFromSavedJobs) {
      _selectedIndex = 3;
    } else if (widget.isFromProfile) {
      _selectedIndex = 4;
    } else {
      _selectedIndex = 0;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLightStatus = _selectedIndex == 0 || _selectedIndex == 4 || _selectedIndex == 3 || _selectedIndex == 1 || _selectedIndex == 2;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: isLightStatus ? Brightness.light : Brightness.dark,
        statusBarBrightness: isLightStatus ? Brightness.light : Brightness.dark,
        statusBarColor: _selectedIndex == 0 ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).transparent,
      ),
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreenWhite,
        body: Column(
          children: [
            Container(
              color: CustomAppColor.of(context).bgSecondary,
              child: IgnorePointer(
                ignoring: true,
                child: TopBar(
                  this,
                  isShowTitle: _selectedIndex == 0 ? false : true,
                  title: _selectedIndex == 1
                      ? Languages.of(context).txtApplications
                      : _selectedIndex == 4
                          ? Languages.of(context).txtProfile
                          : _selectedIndex == 3
                              ? Languages.of(context).txtSavedJobs
                              : Languages.of(context).txtMessages,
                  textColor: CustomAppColor.of(context).white,
                  isShowBack: false,
                  isShowProfileDetails: _selectedIndex == 0 ? true : false,
                  userName: "Zack Stevens",
                  isShowNotification: _selectedIndex == 4 ? false : true,
                  height: _selectedIndex == 4 ? 55.setHeight : 80.setHeight,
                  profilePath: AppAssets.imgDummyProfile,
                  backgroundColor: _selectedIndex == 3 || _selectedIndex == 1 || _selectedIndex == 2
                      ? CustomAppColor.of(context).bgContainerPrimary
                      : _selectedIndex == 4
                          ? CustomAppColor.of(context).bgSecondary
                          : CustomAppColor.of(context).secondary,
                  isShowSetting: _selectedIndex == 4 ? true : false,
                ),
              ),
            ),
            Expanded(child: _screens[_selectedIndex]),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.hardEdge,
          height: 70.setHeight,
          color: CustomAppColor.of(context).bgNavBarWhiteSecondary,
          child: IgnorePointer(
            ignoring: true,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_icons.length, (index) {
                final isSelected = _selectedIndex == index;
                return GestureDetector(
                  onTap: () => _onItemTapped(index),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 30.setWidth,
                        height: 30.setHeight,
                        alignment: Alignment.center,
                        child: Image.asset(
                          _icons[index],
                          height: 24.setHeight,
                          width: 24.setWidth,
                          color: isSelected ? CustomAppColor.of(context).icPrimary : CustomAppColor.of(context).icNavBar,
                        ),
                      ),
                      Container(
                        width: 6.setWidth,
                        height: 6.setHeight,
                        decoration: BoxDecoration(
                          color: isSelected ? CustomAppColor.of(context).icPrimary : CustomAppColor.of(context).transparent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strNotification) {
      Navigator.push(context, NotificationsScreen.route(isFromEmptyNotification: false));
    }
    if (name == Constant.strSetting) {
      Navigator.push(context, SettingsScreen.route());
    }
  }
}
