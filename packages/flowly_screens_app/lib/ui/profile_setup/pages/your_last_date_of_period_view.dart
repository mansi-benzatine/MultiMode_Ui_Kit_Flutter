import 'package:dotted_border/dotted_border.dart';
import 'package:flowly_screens_app/localization/language/languages.dart';
import 'package:flowly_screens_app/utils/app_color.dart';
import 'package:flowly_screens_app/utils/constant.dart';
import 'package:flowly_screens_app/utils/sizer_utils.dart';
import 'package:flowly_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class YourLastDateOfPeriodView extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const YourLastDateOfPeriodView());
  }

  const YourLastDateOfPeriodView({super.key});

  @override
  State<YourLastDateOfPeriodView> createState() => _YourLastDateOfPeriodViewState();
}

class _YourLastDateOfPeriodViewState extends State<YourLastDateOfPeriodView> {
  final currentWeekIndex = ValueNotifier<int>(0);
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 25.setWidth,
        right: 25.setWidth,
        top: 30.setHeight,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
            child: CommonText(
              text: Languages.of(context).txtWhenYourFirstDateOfLastPeriod,
              fontFamily: Constant.fontFamilyMulishExtraBold800,
              fontSize: 24.setFontSize,
            ),
          ),
          SizedBox(height: 30.setHeight),
          _calenderView()
        ],
      ),
    );
  }

  _calenderView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 0.screenHeight / 2.4,
          decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgScreen,
              border: Border.all(
                color: CustomAppColor.of(context).white,
                width: 0.2,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                  blurRadius: 15,
                  spreadRadius: 2,
                  offset: const Offset(1, 1),
                )
              ]),
          padding: EdgeInsets.only(left: 16.setWidth, bottom: 16.setHeight, right: 16.setWidth),
          child: CalendarCarousel(
            daysTextStyle: TextStyle(
              color: CustomAppColor.of(context).txtBlack,
              fontFamily: Constant.fontFamilyMulishSemiBold600,
              package: 'flowly_screens_app',
            ),
            leftButtonIcon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomAppColor.of(context).roundBg,
              ),
              padding: const EdgeInsets.all(4),
              child: const Icon(
                Icons.navigate_before_rounded,
                size: 26,
              ),
            ),
            rightButtonIcon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomAppColor.of(context).roundBg,
              ),
              padding: const EdgeInsets.all(4),
              child: const Icon(
                Icons.navigate_next_rounded,
                size: 26,
              ),
            ),
            selectedDayButtonColor: CustomAppColor.of(context).secondary,
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
              final textColor = CustomAppColor.of(context).txtBlack;

              if (selectedDate != null && day.year == selectedDate!.year && day.month == selectedDate!.month && day.day == selectedDate!.day) {
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomAppColor.of(context).secondary,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${day.day}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }

              if (selectedDate != null) {
                final diff = day.difference(selectedDate!).inDays;

                if (diff > 0 && diff <= 4) {
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
              }
              return Container(
                alignment: Alignment.center,
                child: CommonText(
                  text: '${day.day}',
                  textColor: textColor.withValues(alpha: 0.5),
                  fontFamily: Constant.fontFamilyMulishMedium500,
                ),
              );
            },
            showIconBehindDayText: true,
            headerTitleTouchable: false,
            customGridViewPhysics: const AlwaysScrollableScrollPhysics(),
            markedDateShowIcon: true,
            markedDateIconMaxShown: 2,
            selectedDayTextStyle: TextStyle(
              color: CustomAppColor.of(context).white,
            ),
            todayButtonColor: CustomAppColor.of(context).transparent,
            todayBorderColor: const Color(0xFFFFFFFF),
            prevMonthDayBorderColor: CustomAppColor.of(context).grey,
            nextMonthDayBorderColor: CustomAppColor.of(context).grey,
            onDayPressed: (DateTime date, List events) {
              setState(() {
                selectedDate = date;
              });
            },
          ),
        ),
      ],
    );
  }
}
