import 'package:flutter/material.dart';
import 'package:run_tracker_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_app/localization/language/languages.dart';
import 'package:run_tracker_app/ui/result_share/views/result_share_screen.dart';
import 'package:run_tracker_app/utils/constant.dart';
import 'package:run_tracker_app/utils/sizer_utils.dart';
import 'package:run_tracker_app/widgets/button/common_button.dart';
import 'package:run_tracker_app/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../home/datamodels/home_data.dart';

class HistoryScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => HistoryScreen());
  }

  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    implements TopBarClickListener {
  List<RecentActivity> activitiesList = [];
  Set<int> selectedIndices = {};
  bool isSelectionMode = false;

  @override
  void initState() {
    super.initState();
    _fillData();
  }

  void _fillData() {
    activitiesList = [
      RecentActivity(
        date: "June 09, 2022",
        distance: 20.67,
        duration: "01:10:38",
        pace: "12:23 min/km",
        calories: 10,
      ),
      RecentActivity(
        date: "June 08, 2022",
        distance: 12.66,
        duration: "00:00:38",
        pace: "25:28 min/km",
        calories: 20.00,
      ),
      RecentActivity(
        date: "June 07, 2022",
        distance: 35.00,
        duration: "02:10:38",
        pace: "10:20 min/km",
        calories: 20.00,
      ),
      RecentActivity(
        date: "May 30, 2022",
        distance: 20.67,
        duration: "01:10:38",
        pace: "12:23 min/km",
        calories: 10.00,
      ),
      RecentActivity(
        date: "May 28, 2022",
        distance: 12.66,
        duration: "00:00:38",
        pace: "25:28 min/km",
        calories: 20.00,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopBar(
          this,
          height: 75,
          isShowSimpleTitle: true,
          isShowSelected: isSelectionMode,
          isShowDustbin: isSelectionMode,
          simpleTitle: Languages.of(context).txtRecentHistory.toUpperCase(),
        ),
        Expanded(
          child: RecentActivitiesView(
            activitiesList: activitiesList,
            selectedIndices: selectedIndices,
            isSelectionMode: isSelectionMode,
            onSelectionChange: (Set<int> indices, bool selectionActive) {
              setState(() {
                selectedIndices = indices;
                isSelectionMode = selectionActive;
              });
            },
          ),
        ),
      ],
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strDustbin && selectedIndices.isNotEmpty) {
      _showDeleteBottomSheet();
    }
    if (name == Constant.strSelected) {
      setState(() {
        if (selectedIndices.length == activitiesList.length) {
          selectedIndices.clear();
          isSelectionMode = false;
        } else {
          selectedIndices = Set<int>.from(
            List.generate(activitiesList.length, (index) => index),
          );
          isSelectionMode = true;
        }
      });
    }
  }

  void _showDeleteBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      backgroundColor: CustomAppColor.of(context).bottomNavbar,
      builder: (context) {
        return SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 4.setHeight,
                      width: 50.setWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFBDBDBD),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.setHeight),
                CommonText(
                  text: Languages.of(context).txtDeleteHistory.toUpperCase(),
                  fontWeight: FontWeight.w600,
                  fontSize: 20.setFontSize,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 5.setHeight),

                Divider(),
                SizedBox(height: 16.setHeight),

                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomAppColor.of(context).bgScaffold,
                    boxShadow: [
                      BoxShadow(
                        color: CustomAppColor.of(
                          context,
                        ).black.withValues(alpha: 0.05),
                        offset: Offset(0, 0),
                        blurRadius: 2,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: Icon(Icons.delete, color: Colors.red, size: 40),
                ),
                SizedBox(height: 30.setHeight),
                Center(
                  child: CommonText(
                    text: Languages.of(context).txtDeleteHistoryDesc,
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).txtDarkGrey,
                  ),
                ),
                SizedBox(height: 40.setHeight),
                Row(
                  children: [
                    Expanded(
                      child: CommonButton(
                        height: 40.setHeight,
                        buttonColor: CustomAppColor.of(context).transparent,
                        borderColor: CustomAppColor.of(context).primary,
                        text: Languages.of(context).txtCancel,
                        buttonTextColor: CustomAppColor.of(context).txtPrimary,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CommonButton(
                        height: 40.setHeight,
                        onTap: () {
                          setState(() {
                            activitiesList = activitiesList
                                .asMap()
                                .entries
                                .where((e) => !selectedIndices.contains(e.key))
                                .map((e) => e.value)
                                .toList();
                            selectedIndices.clear();
                            isSelectionMode = false;
                          });
                          Navigator.pop(context);
                        },
                        buttonTextColor: CustomAppColor.of(context).txtWhite,
                        buttonColor: CustomAppColor.of(context).primary,
                        text: Languages.of(context).txtDelete,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class RecentActivitiesView extends StatefulWidget {
  final List<RecentActivity> activitiesList;
  final Set<int> selectedIndices;
  final bool isSelectionMode;
  final void Function(Set<int>, bool) onSelectionChange;

  const RecentActivitiesView({
    super.key,
    required this.activitiesList,
    required this.selectedIndices,
    required this.isSelectionMode,
    required this.onSelectionChange,
  });

  @override
  State<RecentActivitiesView> createState() => _RecentActivitiesViewState();
}

class _RecentActivitiesViewState extends State<RecentActivitiesView> {
  @override
  Widget build(BuildContext context) {
    if (widget.activitiesList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.imgEmptyHistory,
              width: 180.setWidth,
              height: 180.setHeight,
            ),
            SizedBox(height: 10.setHeight),
            CommonText(
              text: Languages.of(context).txtEmpty,
              fontWeight: FontWeight.w600,
              fontSize: 20.setFontSize,
            ),
            SizedBox(height: 5.setHeight),
            CommonText(
              text: Languages.of(context).txtEmptyDesc,
              fontWeight: FontWeight.w500,
              fontSize: 14.setFontSize,
              textColor: CustomAppColor.of(context).txtGrey,
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 60.setHeight),
        itemCount: widget.activitiesList.length,
        itemBuilder: (context, index) {
          final activity = widget.activitiesList[index];
          final isSelected = widget.selectedIndices.contains(index);

          return GestureDetector(
            onLongPress: () {
              final newSet = Set<int>.from(widget.selectedIndices)..add(index);
              widget.onSelectionChange(newSet, true);
            },
            onTap: () {
              if (widget.isSelectionMode) {
                final newSet = Set<int>.from(widget.selectedIndices);
                if (newSet.contains(index)) {
                  newSet.remove(index);
                } else {
                  newSet.add(index);
                }
                widget.onSelectionChange(newSet, newSet.isNotEmpty);
              } else {
                Navigator.push(context, ResultShareScreen.route());
              }
            },
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.setHeight),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.setWidth,
                      vertical: 14.setHeight,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomAppColor.of(context).border,
                        width: 0.7,
                      ),
                      color: CustomAppColor.of(context).containerBgColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            AppAssets.icMap,
                            height: 79.setHeight,
                            width: 79.setWidth,
                          ),
                        ),
                        SizedBox(width: 17.setWidth),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: activity.distance.toStringAsFixed(
                                        2,
                                      ),
                                      style: TextStyle(
                                        fontSize: 24.setFontSize,
                                        fontWeight: FontWeight.w600,
                                        color: CustomAppColor.of(
                                          context,
                                        ).txtBlack,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          " ${Languages.of(context).txtKm.toLowerCase()}",
                                      style: TextStyle(
                                        fontSize: 14.setFontSize,
                                        fontWeight: FontWeight.w600,
                                        color: CustomAppColor.of(
                                          context,
                                        ).txtBlack,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 4.setHeight),
                              CommonText(
                                text: activity.date,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.setFontSize,
                                textColor: CustomAppColor.of(
                                  context,
                                ).txtDarkGrey,
                              ),
                              SizedBox(height: 10.setHeight),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonText(
                                    text: activity.duration,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.setFontSize,
                                    textColor: CustomAppColor.of(
                                      context,
                                    ).txtDarkGrey,
                                  ),
                                  CommonText(
                                    text: activity.pace,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.setFontSize,
                                    textColor: CustomAppColor.of(
                                      context,
                                    ).txtDarkGrey,
                                  ),
                                  CommonText(
                                    text:
                                        "${activity.calories.toStringAsFixed(0)} Kcal",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.setFontSize,
                                    textColor: CustomAppColor.of(
                                      context,
                                    ).txtDarkGrey,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (widget.isSelectionMode)
                  Positioned(
                    top: 20.setHeight,
                    right: 10.setWidth,
                    child: Icon(
                      isSelected
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: Color(0xFFC1E241),
                      size: 26,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
