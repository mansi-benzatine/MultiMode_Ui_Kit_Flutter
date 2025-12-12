import 'package:dotted_border/dotted_border.dart' show DottedBorder, CircularDottedBorderOptions;
import 'package:flowly_app/interfaces/top_bar_click_listener.dart';
import 'package:flowly_app/localization/language/languages.dart';
import 'package:flowly_app/ui/edit_period_date/view/edit_period_date_screen.dart';
import 'package:flowly_app/ui/log_symptoms/datamodel/log_symptoms_data.dart';
import 'package:flowly_app/utils/app_assets.dart';
import 'package:flowly_app/utils/app_color.dart';
import 'package:flowly_app/utils/constant.dart';
import 'package:flowly_app/utils/sizer_utils.dart';
import 'package:flowly_app/utils/utils.dart';
import 'package:flowly_app/widgets/bottom_sheet/log_symptoms_bs.dart';
import 'package:flowly_app/widgets/bottom_sheet/log_symptoms_details_bg.dart';
import 'package:flowly_app/widgets/button/common_button.dart';
import 'package:flowly_app/widgets/text/common_text.dart';
import 'package:flowly_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class DailyLog {
  final DateTime date;
  final List<String> mood;
  final List<String> symptoms;
  final List<PillLog> pills;
  final List<String> menstrualFlow;

  DailyLog({
    required this.date,
    required this.mood,
    required this.symptoms,
    required this.pills,
    required this.menstrualFlow,
  });
}

class CalendarScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CalendarScreen());
  }

  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> implements TopBarClickListener {
  final currentWeekIndex = ValueNotifier<int>(0);
  DateTime? selectedDate = DateTime(2025, 8, 15);
  final int _cycleLength = 28;
  final int _periodLength = 4;

  Map<String, DailyLog> logs = {
    "2025-8-15": DailyLog(
      date: DateTime(2025, 8, 15),
      mood: [AppAssets.icClamEmoji, AppAssets.icTiredEmoji],
      symptoms: [AppAssets.icNauseaSymptoms, AppAssets.icOverSleepSymptoms],
      menstrualFlow: [AppAssets.icHighMenstrualFlow],
      pills: [
        PillLog(
          id: "1",
          medicineName: "OC-1",
          time: DateTime(2025, 1, 1, 9, 0),
          numberOfIntakes: 1,
          shapeId: AppAssets.icMedicineRound,
          reminder: true,
        ),
        PillLog(
          id: "2",
          medicineName: "OC-2",
          time: DateTime(2025, 1, 1, 13, 0),
          numberOfIntakes: 1,
          shapeId: AppAssets.icMedicineRound,
          reminder: true,
        ),
      ],
    ),
    "2025-8-17": DailyLog(
      date: DateTime(2025, 8, 17),
      mood: [AppAssets.icClamEmoji, AppAssets.icTiredEmoji],
      menstrualFlow: [AppAssets.icHighMenstrualFlow],
      symptoms: [AppAssets.icNauseaSymptoms, AppAssets.icOverSleepSymptoms],
      pills: [
        PillLog(
          id: "1",
          medicineName: "OC-1",
          time: DateTime(2025, 1, 1, 9, 0),
          numberOfIntakes: 1,
          shapeId: AppAssets.icMedicineCapsule,
          reminder: true,
        ),
        PillLog(
          id: "2",
          medicineName: "OC-2",
          time: DateTime(2025, 1, 1, 13, 0),
          numberOfIntakes: 1,
          shapeId: AppAssets.icMedicineRound,
          reminder: true,
        ),
      ],
    ),
    "2025-9-19": DailyLog(
      date: DateTime(2025, 9, 19),
      mood: [AppAssets.icClamEmoji, AppAssets.icTiredEmoji],
      menstrualFlow: [AppAssets.icHighMenstrualFlow],
      symptoms: [AppAssets.icNauseaSymptoms, AppAssets.icOverSleepSymptoms],
      pills: [
        PillLog(
          id: "1",
          medicineName: "OC-1",
          time: DateTime(2025, 1, 1, 9, 0),
          numberOfIntakes: 1,
          shapeId: AppAssets.icMedicineCapsule,
          reminder: true,
        ),
      ],
    ),
  };

  bool hasLog(DateTime day) {
    String key = "${day.year}-${day.month}-${day.day}";
    return logs.containsKey(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: true,
            title: Languages.of(context).txtCalendar,
          ),
          Expanded(
            child: Column(
              children: [_calenderView()],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: CommonButton(
              text: Languages.of(context).txtEditPeriod,
              onTap: () => Navigator.push(context, EditPeriodDateScreen.route()),
            ),
          ),
          SizedBox(height: 50.setHeight)
        ],
      ),
    );
  }

  List<DateTime> getPeriodDaysInMonth({
    required DateTime month,
    required DateTime periodStart,
    required int cycleLength,
    required int periodLength,
  }) {
    List<DateTime> result = [];

    DateTime first = DateTime(month.year, month.month, 1);
    DateTime last = DateTime(month.year, month.month + 1, 0);

    for (int i = 0; i < 120; i++) {
      DateTime date = periodStart.add(Duration(days: i));
      int cycleDay = (i % cycleLength) + 1;

      if (cycleDay <= periodLength) {
        if (!date.isBefore(first) && !date.isAfter(last)) {
          result.add(date);
        }
      }
    }

    return result;
  }

  Widget _calenderView() {
    DateTime periodStart = DateTime(2025, 8, 15);
    int cycleLength = 28;
    int periodLength = 4;

    DateTime month1 = DateTime(2025, 8);
    DateTime month2 = DateTime(2025, 9);
    DateTime month3 = DateTime(2025, 10);

    List<DateTime> augustDays = getPeriodDaysInMonth(
      month: month1,
      periodStart: periodStart,
      cycleLength: cycleLength,
      periodLength: periodLength,
    );

    List<DateTime> septemberDays = getPeriodDaysInMonth(
      month: month2,
      periodStart: periodStart,
      cycleLength: cycleLength,
      periodLength: periodLength,
    );
    List<DateTime> octoberDays = getPeriodDaysInMonth(
      month: month3,
      periodStart: periodStart,
      cycleLength: cycleLength,
      periodLength: periodLength,
    );

    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 20.setHeight),
          child: Column(
            children: [
              buildMonth(month: month1, periodDays: augustDays),
              buildMonth(month: month2, periodDays: septemberDays),
              buildMonth(month: month3, periodDays: octoberDays),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMonth({
    required DateTime month,
    required List<DateTime> periodDays,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.setHeight),
      padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
      height: 0.screenHeight / 2.7,
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).cardBg,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 15,
            offset: const Offset(1, 1),
          )
        ],
      ),
      child: CalendarCarousel(
        isScrollable: false,
        showHeader: true,
        showHeaderButton: false,
        selectedDateTime: selectedDate,
        targetDateTime: month,
        daysTextStyle: TextStyle(
          color: CustomAppColor.of(context).txtBlack,
          fontFamily: Constant.fontFamilyMulishSemiBold600,
          package: 'flowly_app',
        ),
        selectedDayButtonColor: CustomAppColor.of(context).transparent,
        headerTextStyle: TextStyle(
          color: CustomAppColor.of(context).secondary,
          fontFamily: Constant.fontFamilyMulishBold700,
          fontSize: 16.setFontSize,
          package: 'flowly_app',
        ),
        weekdayTextStyle: TextStyle(
          color: CustomAppColor.of(context).txtBlack,
          fontFamily: Constant.fontFamilyMulishBold700,
          package: 'flowly_app',
        ),
        weekendTextStyle: TextStyle(
          color: CustomAppColor.of(context).txtBlack,
          fontFamily: Constant.fontFamilyMulishSemiBold600,
          package: 'flowly_app',
        ),
        customDayBuilder: (
          bool isSelectable,
          int index,
          bool isSelectedDay,
          bool isToday,
          bool isPrevMonthDay,
          TextStyle textStyle,
          bool isNextMonthDay,
          bool isThisMonthDay,
          DateTime day,
        ) {
          bool isPeriodDay = periodDays.any((d) => d.year == day.year && d.month == day.month && d.day == day.day);
          bool isLoggedDay = hasLog(day);

          if (isPeriodDay) {
            bool isLoggedDay = hasLog(day);
            return Container(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  if (isLoggedDay)
                    Positioned(
                      bottom: 10.setHeight,
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  Positioned(
                    bottom: 0,
                    child: DottedBorder(
                      options: CircularDottedBorderOptions(
                        color: CustomAppColor.of(context).primary,
                        strokeWidth: 1,
                        dashPattern: const [4, 4],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 7.setHeight),
                        child: Container(
                          width: 34.setWidth,
                          height: 34.setHeight,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(shape: BoxShape.circle),
                          child: CommonText(
                            text: '${day.day}',
                            textColor: CustomAppColor.of(context).primary,
                            fontFamily: Constant.fontFamilyMulishMedium500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                CommonText(
                  text: '${day.day}',
                  textColor: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.5),
                  fontFamily: Constant.fontFamilyMulishMedium500,
                ),
                if (isLoggedDay)
                  Container(
                    margin: EdgeInsets.only(top: 4.setHeight),
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).primary,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          );
        },
        showIconBehindDayText: true,
        headerTitleTouchable: false,
        markedDateShowIcon: true,
        markedDateIconMaxShown: 2,
        selectedDayTextStyle: TextStyle(
          color: CustomAppColor.of(context).white,
        ),
        todayButtonColor: CustomAppColor(context).transparent,
        todayBorderColor: CustomAppColor(context).transparent,
        prevMonthDayBorderColor: CustomAppColor.of(context).grey,
        nextMonthDayBorderColor: CustomAppColor.of(context).grey,
        onDayPressed: (DateTime date, List events) {
          setState(() {
            selectedDate = date;
          });

          String key = "${date.year}-${date.month}-${date.day}";

          String dayStatus = getDayStatusText(date);

          if (logs.containsKey(key)) {
            Utils.showBottomSheetDialog(
              context,
              widgets: LogDetailsBottomSheet(
                parentContext: context,
                log: logs[key]!,
                dayStatus: dayStatus,
              ),
            );
          } else {
            Utils.showBottomSheetDialog(
              context,
              widgets: LogSymptomsBs(
                date: date,
                parentContext: context,
              ),
            );
          }
        },
        showOnlyCurrentMonthDate: true,
      ),
    );
  }

  String getDayStatusText(DateTime date) {
    DateTime periodStart = DateTime(2025, 8, 15);

    int daysSinceStart = date.difference(periodStart).inDays;
    num cycleDay = ((daysSinceStart % _cycleLength) + 1).clamp(1, _cycleLength);

    if (cycleDay >= 1 && cycleDay <= _periodLength) {
      return "$cycleDay day of period";
    } else if (cycleDay >= 5 && cycleDay <= 14) {
      num day = cycleDay - 4;
      return "$day day of non-period";
    } else if (cycleDay >= 15 && cycleDay <= 17) {
      return "Prediction: Day of Ovulation";
    } else if (cycleDay >= 18 && cycleDay <= 22) {
      num day = cycleDay - 17;
      return "$day day of fertile";
    } else {
      num daysUntilPeriod = _cycleLength - cycleDay + 1;
      return "$daysUntilPeriod days until period";
    }
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
