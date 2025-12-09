import 'dart:io';

import 'package:flowly_screens_app/ui/home/view/home_screen.dart';
import 'package:flowly_screens_app/ui/my_profile/view/my_profile_screen.dart';
import 'package:flowly_screens_app/ui/my_report/view/my_report_screen.dart';
import 'package:flowly_screens_app/ui/self_care/view/self_care_screen.dart';
import 'package:flowly_screens_app/utils/app_assets.dart';
import 'package:flowly_screens_app/utils/app_color.dart';
import 'package:flowly_screens_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  final int currentIndex;
  final bool isShowDeleteAccountBs;
  DateTime? selectedDate;

  static Route<void> route({int currentIndex = 0, bool isShowDeleteAccountBs = false, DateTime? selectedDate}) {
    return MaterialPageRoute(
        builder: (_) => DashboardScreen(
              currentIndex: currentIndex,
              isShowDeleteAccountBs: isShowDeleteAccountBs,
              selectedDate: selectedDate,
            ));
  }

  DashboardScreen({super.key, this.currentIndex = 0, this.isShowDeleteAccountBs = false, this.selectedDate});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  List<Widget> screens = [];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    screens = [
      HomeScreen(selectedDate: widget.selectedDate),
      const SelfCareScreen(),
      const MyReportScreen(),
      MyProfileScreen(isShowDeleteAccountBs: widget.isShowDeleteAccountBs),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            IndexedStack(
              index: _currentIndex,
              children: screens,
            ),
            IgnorePointer(
              ignoring: true,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 0.screenWidth / 8),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CustomPaint(
                      size: Platform.isIOS ? Size(0.screenWidth / 1.6, 70.setHeight) : Size(0.screenWidth / 1.3, 70.setHeight),
                      painter: RPSCustomPainter(fillColor: CustomAppColor.of(context).navbarBg),
                    ),
                    Positioned(
                      bottom: 2.setHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          navItem(0, AppAssets.icSelectedHome),
                          navItem(1, AppAssets.icSelectedSelfCare),
                          navItem(2, AppAssets.icSelectedMyReport),
                          navItem(3, AppAssets.icSelectedProfile),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget navItem(int index, String icon) {
    bool isActive = _currentIndex == index;

    return Padding(
      padding: Platform.isIOS ? EdgeInsets.symmetric(horizontal: 5.setWidth, vertical: 10.setWidth) : EdgeInsets.symmetric(horizontal: 6.5.setWidth, vertical: 8.setWidth),
      child: GestureDetector(
        onTap: () {
          setState(() => _currentIndex = index);
        },
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: isActive ? CustomAppColor.of(context).primary : CustomAppColor.of(context).unselectedNavbar,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            icon,
            height: 20.setHeight,
            width: 20.setWidth,
            color: isActive ? CustomAppColor.of(context).white : CustomAppColor.of(context).icGray,
          ),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  final Color fillColor;

  RPSCustomPainter({required this.fillColor});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(246, 0);
    path_0.cubicTo(265.882, 0, 282, 16.1177, 282, 36);
    path_0.cubicTo(282, 55.8823, 265.882, 72, 246, 72);
    path_0.cubicTo(243.474, 72, 241.01, 71.7397, 238.631, 71.2446);
    path_0.cubicTo(232.374, 69.9424, 226.159, 68, 219.768, 68);
    path_0.lineTo(202.232, 68);
    path_0.cubicTo(195.841, 68, 189.626, 69.9424, 183.369, 71.2446);
    path_0.cubicTo(180.99, 71.7397, 178.526, 72, 176, 72);
    path_0.cubicTo(173.474, 72, 171.01, 71.7397, 168.631, 71.2446);
    path_0.cubicTo(162.374, 69.9424, 156.159, 68, 149.768, 68);
    path_0.lineTo(132.232, 68);
    path_0.cubicTo(125.841, 68, 119.626, 69.9424, 113.369, 71.2446);
    path_0.cubicTo(110.99, 71.7397, 108.526, 72, 106, 72);
    path_0.cubicTo(103.474, 72, 101.01, 71.7397, 98.6311, 71.2446);
    path_0.cubicTo(92.3743, 69.9424, 86.1591, 68, 79.7682, 68);
    path_0.lineTo(62.2318, 68);
    path_0.cubicTo(55.8409, 68, 49.6257, 69.9424, 43.3689, 71.2446);
    path_0.cubicTo(40.9903, 71.7397, 38.5256, 72, 36, 72);
    path_0.cubicTo(16.1177, 72, 0, 55.8823, 0, 36);
    path_0.cubicTo(0, 16.1177, 16.1177, 0, 36, 0);
    path_0.cubicTo(38.5256, 0, 40.9903, 0.260288, 43.3689, 0.755361);
    path_0.cubicTo(49.6257, 2.0576, 55.8409, 4, 62.2318, 4);
    path_0.lineTo(79.7682, 4);
    path_0.cubicTo(86.1591, 4, 92.3743, 2.0576, 98.6311, 0.755362);
    path_0.cubicTo(101.01, 0.260289, 103.474, 0, 106, 0);
    path_0.cubicTo(108.526, 0, 110.99, 0.260288, 113.369, 0.755361);
    path_0.cubicTo(119.626, 2.0576, 125.841, 4, 132.232, 4);
    path_0.lineTo(149.768, 4);
    path_0.cubicTo(156.159, 4, 162.374, 2.0576, 168.631, 0.755362);
    path_0.cubicTo(171.01, 0.260289, 173.474, 0, 176, 0);
    path_0.cubicTo(178.526, 0, 180.99, 0.260288, 183.369, 0.755361);
    path_0.cubicTo(189.626, 2.0576, 195.841, 4, 202.232, 4);
    path_0.lineTo(219.768, 4);
    path_0.cubicTo(226.159, 4, 232.374, 2.0576, 238.631, 0.755362);
    path_0.cubicTo(241.01, 0.260289, 243.474, 0, 246, 0);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = fillColor;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant RPSCustomPainter oldDelegate) {
    return oldDelegate.fillColor != fillColor;
  }
}
