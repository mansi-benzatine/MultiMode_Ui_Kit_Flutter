import 'package:flutter/material.dart';
import 'package:step_counter_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:step_counter_screens_app_package/localization/language/languages.dart';
import 'package:step_counter_screens_app_package/ui/history/datamodel/history_data.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';
import 'package:step_counter_screens_app_package/widgets/text/common_text.dart';
import 'package:step_counter_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../dialogs/bottom_sheet/delete_history_bottom_sheet_dialog.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';

class HistoryScreen extends StatefulWidget {
  final bool isForDeleteBs;
  final bool isForEmptyHistory;

  const HistoryScreen({super.key, this.isForDeleteBs = false, this.isForEmptyHistory = false});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> implements TopBarClickListener {
  final List<WeekHistory> historyData = [
    WeekHistory(
      weekRange: "Apr-16 To Apr-22",
      totalSteps: 1887,
      days: [
        DayHistory(date: "16-04-2022", steps: 200, duration: "01:25", kcal: 150, km: 2.7),
        DayHistory(date: "17-04-2022", steps: 300, duration: "00:55", kcal: 120, km: 2.1),
        DayHistory(date: "18-04-2022", steps: 250, duration: "01:10", kcal: 140, km: 2.4),
        DayHistory(date: "19-04-2022", steps: 400, duration: "01:50", kcal: 180, km: 3.0),
        DayHistory(date: "20-04-2022", steps: 188, duration: "01:25", kcal: 150, km: 2.7),
      ],
    ),
    WeekHistory(
      weekRange: "Apr-10 To Apr-16",
      totalSteps: 1020,
      days: [
        DayHistory(date: "16-04-2022", steps: 500, duration: "01:40", kcal: 220, km: 3.4),
        DayHistory(date: "14-04-2022", steps: 400, duration: "01:20", kcal: 180, km: 2.8),
        DayHistory(date: "13-04-2022", steps: 120, duration: "00:45", kcal: 90, km: 1.2),
        DayHistory(date: "10-04-2022", steps: 0, duration: "00:00", kcal: 0, km: 0.0),
      ],
    ),
    WeekHistory(
      weekRange: "Apr-03 To Apr-09",
      totalSteps: 1020,
      days: [
        DayHistory(date: "09-04-2022", steps: 500, duration: "01:40", kcal: 220, km: 3.4),
        DayHistory(date: "08-04-2022", steps: 400, duration: "01:20", kcal: 180, km: 2.8),
        DayHistory(date: "07-04-2022", steps: 120, duration: "00:45", kcal: 90, km: 1.2),
        DayHistory(date: "06-04-2022", steps: 0, duration: "00:00", kcal: 0, km: 0.0),
        DayHistory(date: "05-04-2022", steps: 0, duration: "00:00", kcal: 0, km: 0.0),
      ],
    ),
  ];
  bool _isBottomSheetOpen = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.isForDeleteBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _isBottomSheetOpen = true;
        });
        Utils.showBottomSheetDialog(
          context,
          isScrollControlled: false,
          isDismissible: false,
          title: Languages.of(context).txtDeleteHistory,
          widgets: DeleteHistoryBottomSheetDialog(
            onDelete: () {},
          ),
        ).whenComplete(() {
          if (_isBottomSheetOpen) {
            setState(() {
              _isBottomSheetOpen = false;
            });
            Navigator.pop(context);
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_isBottomSheetOpen,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _isBottomSheetOpen) {
          Navigator.pop(context);
          setState(() {
            _isBottomSheetOpen = false;
          });
          Navigator.pop(context);
        }
      },
      child: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtHistory,
            isShowBack: false,
            isShowDelete: true,
            textAlign: Alignment.centerLeft,
          ),
          Expanded(
            child:widget.isForEmptyHistory? _emptyHistoryView()
            : SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 20.setWidth,
                right: 20.setWidth,
                bottom: 20.setHeight,
                top: 10.setHeight,
              ),
              child: Column(
                children: historyData.map((week) => _itemWeekView(week)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemWeekView(WeekHistory week) {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: CustomAppColor.of(context).borderColorPrimaryAndWhite, width: 1.2),
      ),
      margin: EdgeInsets.only(bottom: 18.setHeight),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgContainerLightAndDark,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 13.setWidth, vertical: 10.setHeight),
            child: Row(
              children: [
                Expanded(
                  child: CommonText(
                    text: week.weekRange,
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtPrimary,
                    textAlign: TextAlign.start,
                  ),
                ),
                Column(
                  children: [
                    CommonText(
                      text: week.totalSteps.toString(),
                      fontSize: 24.setFontSize,
                      fontWeight: FontWeight.w700,
                      textColor: CustomAppColor.of(context).txtPrimary,
                      height: 1,
                    ),
                    CommonText(
                      text: Languages.of(context).txtSteps,
                      fontSize: 11.setFontSize,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).txtPrimary,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15.setHeight),
          Column(
            children: week.days.map((day) => _itemDayView(day)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _itemDayView(DayHistory day) {
    return Padding(
      padding: EdgeInsets.only(bottom: 13.setHeight),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: CustomAppColor.of(context).borderColorPrimaryAndWhite,
                  thickness: 1,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.setHeight, horizontal: 18.setWidth),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                  borderRadius: BorderRadius.circular(1000),
                  border: Border.all(
                    color: CustomAppColor.of(context).borderColorPrimaryAndWhite,
                    width: 1,
                  ),
                ),
                child: CommonText(
                  text: day.date,
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtPrimary,
                ),
              ),
              Expanded(
                child: Divider(
                  color: CustomAppColor.of(context).borderColorPrimaryAndWhite,
                  thickness: 1,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 6.setWidth,
              right: 6.setWidth,
              top: 12.setHeight,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CommonText(
                        text: Languages.of(context).txtSteps,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                      SizedBox(height: 8.setHeight),
                      CommonText(
                        text: day.steps.toString(),
                        fontSize: 24.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.asset(
                        AppAssets.icHourMinDottedLine,
                        height: 35.setHeight,
                        width: 35.setWidth,
                      ),
                      SizedBox(height: 12.setHeight),
                      CommonText(
                        text: day.duration,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).txtBlack,
                        height: 1,
                      ),
                      SizedBox(height: 5.setHeight),
                      CommonText(
                        text: "${Languages.of(context).txtHour}/${Languages.of(context).txtMin}",
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtDoubleDarkGray,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.asset(AppAssets.icKcalDottedLine, height: 35.setHeight, width: 35.setWidth),
                      SizedBox(height: 12.setHeight),
                      CommonText(
                        text: day.kcal.toString(),
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).txtBlack,
                        height: 1,
                      ),
                      SizedBox(height: 5.setHeight),
                      CommonText(
                        text: Languages.of(context).txtKcal,
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtDoubleDarkGray,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.asset(AppAssets.icKmDottedLine, height: 35.setHeight, width: 35.setWidth),
                      SizedBox(height: 12.setHeight),
                      CommonText(
                        text: day.km.toStringAsFixed(1),
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).txtBlack,
                        height: 1,
                      ),
                      SizedBox(height: 5.setHeight),
                      CommonText(
                        text: Languages.of(context).txtKm,
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtDoubleDarkGray,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ignore: unused_element
  _emptyHistoryView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.imgNoDataFound,
          height: 227.setHeight,
          width: 0.screenWidth,
        ),
        SizedBox(height: 40.setHeight),
        CommonText(
          text: Languages.of(context).txtNoDataFound,
          fontSize: 20.setFontSize,
          fontWeight: FontWeight.w600,
          textColor: CustomAppColor.of(context).txtBlack,
        ),
      ],
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    } else if (name == Constant.strDelete) {
      Utils.showBottomSheetDialog(
        context,
        title: Languages.of(context).txtDeleteHistory,
        widgets: DeleteHistoryBottomSheetDialog(
          onDelete: () {},
        ),
      );
    }
  }
}
