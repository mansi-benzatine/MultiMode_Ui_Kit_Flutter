import 'package:dotted_border/dotted_border.dart';
import 'package:flowly_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:flowly_screens_app/localization/language/languages.dart';
import 'package:flowly_screens_app/utils/app_color.dart';
import 'package:flowly_screens_app/utils/constant.dart';
import 'package:flowly_screens_app/utils/sizer_utils.dart';
import 'package:flowly_screens_app/widgets/button/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

import '../../../widgets/text/common_text.dart' show CommonText;
import '../../../widgets/top_bar/topbar.dart';

class EditPeriodDateScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditPeriodDateScreen());
  }

  const EditPeriodDateScreen({super.key});

  @override
  State<EditPeriodDateScreen> createState() => _EditPeriodDateScreenState();
}

class _EditPeriodDateScreenState extends State<EditPeriodDateScreen> implements TopBarClickListener {
  final currentWeekIndex = ValueNotifier<int>(0);
  DateTime? selectedDate = DateTime(2025, 08, 15);
  DateTime? periodStart;
  int cycleLength = 28;
  int periodLength = 4;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    periodStart = selectedDate ?? DateTime.now();
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
            title: Languages.of(context).txtEditPeriod,
          ),
          Expanded(
            child: Column(
              children: [
                _calenderView(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: IgnorePointer(
              ignoring: true,
              child: Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      text: Languages.of(context).txtCancel,
                      buttonColor: CustomAppColor.of(context).btnGrey,
                      borderColor: CustomAppColor.of(context).btnGrey,
                      buttonTextColor: CustomAppColor.of(context).primary,
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: 12.setWidth),
                  Expanded(
                    child: CommonButton(
                      text: Languages.of(context).txtSave,
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
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
    DateTime month1 = DateTime(2025, 8);
    DateTime month2 = DateTime(2025, 9);
    DateTime month3 = DateTime(2025, 10);

    List<DateTime> augustDays = getPeriodDaysInMonth(
      month: month1,
      periodStart: periodStart!,
      cycleLength: cycleLength,
      periodLength: periodLength,
    );

    List<DateTime> septemberDays = getPeriodDaysInMonth(
      month: month2,
      periodStart: periodStart!,
      cycleLength: cycleLength,
      periodLength: periodLength,
    );
    List<DateTime> octoberDays = getPeriodDaysInMonth(
      month: month3,
      periodStart: periodStart!,
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
          package: 'flowly_screens_app',
        ),
        selectedDayButtonColor: CustomAppColor.of(context).primary.withValues(alpha: 0.2),
        headerTextStyle: TextStyle(
          color: CustomAppColor.of(context).secondary,
          fontFamily: Constant.fontFamilyMulishBold700,
          fontSize: 16.setFontSize,
          package: 'flowly_screens_app',
        ),
        weekdayTextStyle: TextStyle(
          color: CustomAppColor.of(context).txtBlack,
          fontFamily: Constant.fontFamilyMulishBold700,
          package: 'flowly_screens_app',
        ),
        weekendTextStyle: TextStyle(
          color: CustomAppColor.of(context).txtBlack,
          fontFamily: Constant.fontFamilyMulishSemiBold600,
          package: 'flowly_screens_app',
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

          if (isPeriodDay) {
            return DottedBorder(
              options: CircularDottedBorderOptions(
                color: CustomAppColor.of(context).primary,
                strokeWidth: 1,
                dashPattern: const [4, 4],
              ),
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: CommonText(
                  text: '${day.day}',
                  textColor: CustomAppColor.of(context).primary,
                  fontFamily: Constant.fontFamilyMulishMedium500,
                ),
              ),
            );
          }

          return Container(
            alignment: Alignment.center,
            child: CommonText(
              text: '${day.day}',
              textColor: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.5),
              fontFamily: Constant.fontFamilyMulishMedium500,
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
        todayButtonColor: const Color(0xFFFFFFFF),
        todayBorderColor: const Color(0xFFFFFFFF),
        prevMonthDayBorderColor: CustomAppColor.of(context).grey,
        nextMonthDayBorderColor: CustomAppColor.of(context).grey,
        onDayPressed: (DateTime date, List events) {
          setState(() {
            selectedDate = date;
            periodStart = date; // <— update cycle automatically
          });
        },
        showOnlyCurrentMonthDate: true,
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
