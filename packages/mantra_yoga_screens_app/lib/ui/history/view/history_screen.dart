import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../meditation_details/view/meditation_details_screen.dart';
import '../../yoga_details/view/yoga_details_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  ValueNotifier<DateTime> selectedDate = ValueNotifier(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _topBarView(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _calendarView(),
                _historyList(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _topBarView() {
    return Container(
      padding: EdgeInsets.only(
        left: 15.setWidth,
        right: 15.setWidth,
        top: 10.setHeight,
      ),
      child: CommonText(
        text: Languages.of(context).txtHistory,
        fontSize: 18.setFontSize,
        fontWeight: FontWeight.w700,
        fontFamily: Constant.fontFamilyBold700,
        textColor: CustomAppColor.of(context).txtBlack,
        height: 1,
      ),
    );
  }

  _calendarView() {
    TextStyle defaultTextStyle = TextStyle(
      fontSize: 12.setFontSize,
      fontWeight: FontWeight.w500,
      fontFamily: Constant.fontFamilyMedium500,
      color: CustomAppColor.of(context).txtBlack,
    );

    BoxDecoration defaultDecoration = BoxDecoration(
      color: CustomAppColor.of(context).containerFillBorderAndBlack,
      border: Border.all(color: CustomAppColor.of(context).primary),
      shape: BoxShape.circle,
    );

    return ValueListenableBuilder(
      valueListenable: selectedDate,
      builder: (context, value, child) {
        return TableCalendar(
          firstDay: DateTime.utc(2025, 1, 1),
          lastDay: DateTime.now(),
          focusedDay: selectedDate.value,
          selectedDayPredicate: (day) => isSameDay(day, selectedDate.value),
          onDaySelected: (DateTime date, DateTime focusedDay) {
            selectedDate.value = date;
          },
          calendarStyle: CalendarStyle(
            cellMargin: EdgeInsets.zero,
            cellPadding: EdgeInsets.zero,
            defaultTextStyle: defaultTextStyle,
            holidayTextStyle: defaultTextStyle,
            todayTextStyle: defaultTextStyle,
            isTodayHighlighted: false,
            disabledTextStyle: defaultTextStyle.copyWith(
              color: CustomAppColor.of(context).txtLightGray,
            ),
            outsideTextStyle: defaultTextStyle,
            withinRangeTextStyle: defaultTextStyle,
            weekendTextStyle: defaultTextStyle,
            rangeStartTextStyle: defaultTextStyle,
            rangeEndTextStyle: defaultTextStyle,
            selectedTextStyle: defaultTextStyle.copyWith(
              fontWeight: FontWeight.w700,
              fontFamily: Constant.fontFamilyBold700,
              fontSize: 16.setFontSize,
            ),
            selectedDecoration: defaultDecoration,
          ),
          daysOfWeekHeight: 30.setHeight,
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w600,
              fontFamily: Constant.fontFamilySemiBold600,
              color: CustomAppColor.of(context).txtBlack,
            ),
            weekendStyle: TextStyle(
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w600,
              fontFamily: Constant.fontFamilySemiBold600,
              color: CustomAppColor.of(context).txtBlack,
            ),
          ),
          headerStyle: HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
            rightChevronMargin: EdgeInsets.only(right: 0.screenWidth / 6),
            leftChevronMargin: EdgeInsets.only(left: 0.screenWidth / 6),
            rightChevronIcon: Image.asset(
              AppAssets.icArrowRight,
              width: 18.setHeight,
              height: 18.setHeight,
              color: CustomAppColor.of(context).txtBlack,
            ),
            leftChevronIcon: RotatedBox(
              quarterTurns: 2,
              child: Image.asset(
                AppAssets.icArrowRight,
                width: 18.setHeight,
                height: 18.setHeight,
                color: CustomAppColor.of(context).txtBlack,
              ),
            ),
            titleTextStyle: TextStyle(
              fontSize: 16.setFontSize,
              fontWeight: FontWeight.w600,
              fontFamily: Constant.fontFamilySemiBold600,
              color: CustomAppColor.of(context).txtBlack,
            ),
          ),
        );
      },
    );
  }

  _historyList() {
    return Container(
      padding: EdgeInsets.only(top: 20.setHeight, bottom: 30.setHeight, left: 15.setWidth, right: 15.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtTodayWorkout,
            textAlign: TextAlign.start,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w700,
            fontFamily: Constant.fontFamilyBold700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 18.setHeight),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.setHeight),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).bgScreen,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: CustomAppColor.of(context).primary),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        AppAssets.icClock,
                        width: 20.setHeight,
                        height: 20.setHeight,
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: Languages.of(context).txtTotalTime,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w600,
                        fontFamily: Constant.fontFamilySemiBold600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 3.setHeight),
                      CommonText(
                        text: "48 ${Languages.of(context).txtMin}",
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                        fontFamily: Constant.fontFamilyRegular400,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.setWidth),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.setHeight),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).bgScreen,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: CustomAppColor.of(context).primary),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        AppAssets.icMeditation,
                        width: 20.setHeight,
                        height: 20.setHeight,
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: Languages.of(context).txtTotalYoga,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w600,
                        fontFamily: Constant.fontFamilySemiBold600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 3.setHeight),
                      CommonText(
                        text: "2 ${Languages.of(context).txtYoga}",
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                        fontFamily: Constant.fontFamilyRegular400,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.setWidth),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.setHeight),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).bgScreen,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: CustomAppColor.of(context).primary),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        AppAssets.icKcalBurned,
                        width: 20.setHeight,
                        height: 20.setHeight,
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: Languages.of(context).txtKcalBurned,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w600,
                        fontFamily: Constant.fontFamilySemiBold600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 3.setHeight),
                      CommonText(
                        text: "200 ${Languages.of(context).txtKcal}",
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                        fontFamily: Constant.fontFamilyRegular400,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25.setHeight),
          Column(
            children: List.generate(
              50,
              (index) => IgnorePointer(
                ignoring: true,
                child: InkWell(
                  splashColor: CustomAppColor.of(context).transparent,
                  highlightColor: CustomAppColor.of(context).transparent,
                  onTap: () {
                    if (index % 2 == 0) {
                      Navigator.push(context, MeditationDetailsScreen.route());
                    } else {
                      Navigator.push(context, YogaDetailsScreen.route());
                    }
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.asset(
                              index % 2 == 0 ? AppAssets.imgMeditationDummy1 : AppAssets.imgYogaDummy1,
                              width: 70.setWidth,
                              height: 70.setHeight,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(width: 10.setWidth),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: index % 2 == 0 ? "Meditation" : "Full Body Yoga",
                                  fontSize: 16.setFontSize,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: Constant.fontFamilySemiBold600,
                                  textColor: CustomAppColor.of(context).txtBlack,
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(height: 2.setHeight),
                                IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      CommonText(
                                        text: "10 ${Languages.of(context).txtPoses}",
                                        fontSize: 11.setFontSize,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: Constant.fontFamilyRegular400,
                                        textColor: CustomAppColor.of(context).txtDarkGray,
                                      ),
                                      VerticalDivider(
                                        color: CustomAppColor.of(context).txtLightGray,
                                        thickness: 1,
                                        width: 15.setWidth,
                                        indent: 2.5.setHeight,
                                        endIndent: 2.5.setHeight,
                                      ),
                                      CommonText(
                                        text: "25 ${Languages.of(context).txtMin}",
                                        fontSize: 11.setFontSize,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: Constant.fontFamilyRegular400,
                                        textColor: CustomAppColor.of(context).txtDarkGray,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            AppAssets.icArrowRight,
                            width: 18.setHeight,
                            height: 18.setHeight,
                            color: CustomAppColor.of(context).txtBlackAndGray,
                          ),
                        ],
                      ),
                      if (index != 50 - 1)
                        Divider(
                          color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                          thickness: 1,
                          height: 25.setHeight,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
