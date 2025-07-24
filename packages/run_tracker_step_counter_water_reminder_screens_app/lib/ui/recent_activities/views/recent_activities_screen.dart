import 'package:flutter/material.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/localization/language/languages.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_color.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/constant.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/text/common_text.dart';
import '../../home/datamodels/home_data.dart';

class RecentActivitiesScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => RecentActivitiesScreen());
  }

  const RecentActivitiesScreen({super.key});

  @override
  State<RecentActivitiesScreen> createState() => _RecentActivitiesScreenState();
}

class _RecentActivitiesScreenState extends State<RecentActivitiesScreen>
    implements TopBarClickListener {
  List<RecentActivity> activitiesList = [];
  Set<int> selectedIndexes = {};
  void fillData() {
    activitiesList = [
      RecentActivity(
        date: "March 25, 2023",
        distance: 15.25,
        duration: "00:10:38",
        pace: "05:25 min/km",
        calories: 50.80,
      ),
      RecentActivity(
        date: "March 24, 2023",
        distance: 20.18,
        duration: "15:12:38",
        pace: "35:20 min/km",
        calories: 80.75,
      ),
      RecentActivity(
        date: "March 23, 2023",
        distance: 50.10,
        duration: "15:12:38",
        pace: "35:20 min/km",
        calories: 125.00,
      ),
      RecentActivity(
        date: "March 22, 2023",
        distance: 28.14,
        duration: "15:12:38",
        pace: "35:20 min/km",
        calories: 125.00,
      ),
      RecentActivity(
        date: "March 21, 2023",
        distance: 25.73,
        duration: "15:12:38",
        pace: "35:20 min/km",
        calories: 125.00,
      ),
      RecentActivity(
        date: "March 20, 2023",
        distance: 87.25,
        duration: "15:12:38",
        pace: "35:20 min/km",
        calories: 125.00,
      ),
    ];
  }

  void toggleSelection(int index) {
    setState(() {
      if (selectedIndexes.contains(index)) {
        selectedIndexes.remove(index);
      } else {
        selectedIndexes.add(index);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              simpleTitle: Languages.of(context).txtRecentActivities,
              isShowSimpleTitle: true,

              isShowDustbin: selectedIndexes.isNotEmpty,
            ),
            Expanded(
              child: RecentActivitiesView(
                recentActivity: activitiesList,
                selectedIndexes: selectedIndexes,
                onItemLongPress: toggleSelection,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
    if (name == Constant.strDustbin && selectedIndexes.isNotEmpty) {
      setState(() {
        selectedIndexes.toList()
          ..sort((a, b) => b.compareTo(a))
          ..forEach((i) => activitiesList.removeAt(i));
        selectedIndexes.clear();
      });
    }
  }
}

class RecentActivitiesView extends StatelessWidget {
  final List<RecentActivity> recentActivity;
  final Set<int> selectedIndexes;
  final Function(int) onItemLongPress;

  const RecentActivitiesView({
    super.key,
    required this.recentActivity,
    required this.selectedIndexes,
    required this.onItemLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        vertical: 5.setHeight,
        horizontal: 24.setWidth,
      ),
      itemCount: recentActivity.length,
      itemBuilder: (context, index) {
        final activity = recentActivity[index];
        final isSelected = selectedIndexes.contains(index);

        return GestureDetector(
          onLongPress: () => onItemLongPress(index),
          onTap: () {
            if (selectedIndexes.isNotEmpty) {
              onItemLongPress(index);
            } else {
              // Navigator.push(context, RunningViewDetailsScreen.route());
            }
          },

          child: Padding(
            padding: EdgeInsets.only(bottom: 18.setHeight),
            child: Container(
              padding: EdgeInsets.all(12.setWidth),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).containerBgwhite,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      AppAssets.imgMapView,
                      height: 85.setHeight,
                      width: 79.setWidth,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 14.setWidth),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: activity.date,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.setFontSize,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),

                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "${activity.distance}",
                                style: TextStyle(
                                  fontSize: 24.setFontSize,
                                  fontWeight: FontWeight.w600,
                                  color: CustomAppColor.of(context).txtBlack,
                                ),
                              ),
                              TextSpan(
                                text: " Km",
                                style: TextStyle(
                                  fontSize: 14.setFontSize,
                                  fontWeight: FontWeight.w600,
                                  color: CustomAppColor.of(context).txtBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.setHeight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: CommonText(
                                text: activity.duration,
                                fontSize: 11.setFontSize,
                                textColor: CustomAppColor.of(context).txtGrey,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Flexible(
                              child: CommonText(
                                text: activity.pace,
                                fontSize: 11.setFontSize,
                                textColor: CustomAppColor.of(context).txtGrey,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Flexible(
                              child: CommonText(
                                text: "${activity.calories} kcal",
                                fontSize: 11.setFontSize,
                                textColor: CustomAppColor.of(context).txtGrey,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 8.setWidth),
                  if (selectedIndexes.isNotEmpty)
                    Icon(
                      isSelected
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: isSelected
                          ? CustomAppColor.of(context).primary
                          : Colors.grey,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
