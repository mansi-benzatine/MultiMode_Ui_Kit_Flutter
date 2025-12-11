import 'package:cinemix_app/ui/downloads/view/downloads_screen.dart';
import 'package:cinemix_app/ui/home/view/home_screen.dart';
import 'package:cinemix_app/ui/profile/view/profile_screen.dart';
import 'package:cinemix_app/ui/search/view/search_screen.dart';
import 'package:cinemix_app/utils/app_assets.dart';
import 'package:cinemix_app/utils/app_color.dart';
import 'package:cinemix_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  final int currentIndex;
  static Route<void> route({int currentIndex = 0}) {
    return MaterialPageRoute(builder: (_) => DashboardScreen(currentIndex: currentIndex));
  }

  const DashboardScreen({super.key, this.currentIndex = 0});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final screens = const [
    HomeScreen(),
    SearchScreen(),
    DownloadsScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: screens,
        ),
        bottomNavigationBar: Container(
          height: 60.setHeight,
          padding: EdgeInsets.symmetric(horizontal: 30.setWidth),
          decoration: BoxDecoration(
            // color: CustomAppColor.of(context).bgScreen,
            border: Border(
              top: BorderSide(
                color: CustomAppColor.of(context).cardBorder.withValues(alpha: 0.1),
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: CustomAppColor.of(context).black.withValues(alpha: 0.15),
                blurRadius: 6,
                spreadRadius: 2,
              ),
            ],
            gradient: LinearGradient(
              colors: [
                CustomAppColor.of(context).bgTextFormFieldShadow,
                CustomAppColor.of(context).bgShadowDark,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              navItem(0, AppAssets.icHome),
              navItem(1, AppAssets.icSearch),
              navItem(2, AppAssets.icDownload),
              navItem(3, AppAssets.icProfile),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItem(int index, String icon) {
    bool isActive = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() => _currentIndex = index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            height: 22.setHeight,
            width: 22.setWidth,
            color: isActive ? const Color(0xFFFF3366) : CustomAppColor.of(context).icGray,
          ),
          SizedBox(height: 4.setHeight),
          if (isActive)
            Container(
              height: 6.setHeight,
              width: 6.setWidth,
              decoration: const BoxDecoration(
                color: Color(0xFFFF3366),
                shape: BoxShape.circle,
              ),
            )
          else
            SizedBox(height: 6.setHeight),
        ],
      ),
    );
  }
}
