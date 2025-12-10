import 'package:baby_bloom_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_app/localization/language/languages.dart';
import 'package:baby_bloom_app/utils/app_color.dart';
import 'package:baby_bloom_app/utils/sizer_utils.dart';
import 'package:baby_bloom_app/widgets/text/common_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/top_bar/topbar.dart';

class DateOfConceptionScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const DateOfConceptionScreen());
  }

  const DateOfConceptionScreen({super.key});

  @override
  State<DateOfConceptionScreen> createState() => _DateOfConceptionScreenState();
}

class _DateOfConceptionScreenState extends State<DateOfConceptionScreen> implements TopBarClickListener {
  final DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.asset(
              AppAssets.imgProfileSetupBackground,
            ),
            Column(
              children: [
                TopBar(
                  this,
                  title: Languages.of(context).txtDateOfConception,
                  isShowBack: true,
                  appBarColor: CustomAppColor.of(context).transparent,
                ),
                Expanded(child: _calenderView()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                  child: CommonButton(
                    text: Languages.of(context).txtContinue,
                    onTap: () => Navigator.pop(context, true),
                  ),
                )
              ],
            )
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
  }

  _calenderView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtDateOfConceptionDesc,
            textColor: CustomAppColor.of(context).txtLightGrey,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 24.setHeight),
          Flexible(
            child: Container(
              height: 350.setHeight,
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).white.withValues(alpha: 0.5),
                border: Border.all(
                  color: CustomAppColor.of(context).white,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              padding: EdgeInsets.only(left: 16.setWidth, bottom: 20.setHeight, right: 16.setWidth),
              child: CalendarCarousel(
                daysTextStyle: TextStyle(
                  color: CustomAppColor.of(context).txtBlack,
                  fontFamily: Constant.fontFamilySemiBold600,
                  package: 'baby_bloom_app',
                ),
                leftButtonIcon: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFFE5EE),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.navigate_before_rounded,
                    size: 26,
                  ),
                ),
                rightButtonIcon: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFFE5EE),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.navigate_next_rounded,
                    size: 26,
                  ),
                ),
                selectedDayButtonColor: CustomAppColor.of(context).secondary,
                headerTextStyle: TextStyle(
                  color: CustomAppColor.of(context).txtBlack,
                  fontFamily: Constant.fontFamilyBold700,
                  fontSize: 17.setFontSize,
                  package: 'baby_bloom_app',
                ),
                dayButtonColor: const Color(0xFFFFE5EE),
                weekdayTextStyle: TextStyle(
                  color: CustomAppColor.of(context).txtBlack,
                  fontFamily: Constant.fontFamilySemiBold600,
                  package: 'baby_bloom_app',
                ),
                weekendTextStyle: TextStyle(
                  color: CustomAppColor.of(context).txtBlack,
                  fontFamily: Constant.fontFamilySemiBold600,
                  package: 'baby_bloom_app',
                ),
                thisMonthDayBorderColor: Colors.grey,
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

                  if (isPrevMonthDay || isNextMonthDay) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.50),
                        shape: BoxShape.circle,
                      ),
                      child: DottedBorder(
                        options: const RoundedRectDottedBorderOptions(
                          radius: Radius.circular(24),
                          color: Color(0xffCFCFCF),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${day.day}',
                            style: TextStyle(
                              color: textColor.withValues(alpha: 0.5),
                              fontFamily: Constant.fontFamilySemiBold600,
                              package: 'baby_bloom_app',
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return null;
                },
                weekFormat: false,
                selectedDateTime: _currentDate2,
                showIconBehindDayText: true,
                headerTitleTouchable: false,
                customGridViewPhysics: const AlwaysScrollableScrollPhysics(),
                markedDateShowIcon: true,
                markedDateIconMaxShown: 2,
                selectedDayTextStyle: TextStyle(
                  color: CustomAppColor.of(context).white,
                ),
                todayTextStyle: TextStyle(
                  color: CustomAppColor.of(context).txtBlack,
                  fontFamily: Constant.fontFamilySemiBold600,
                  package: 'baby_bloom_app',
                ),
                minSelectedDate: _currentDate.subtract(const Duration(days: 360)),
                maxSelectedDate: _currentDate.add(const Duration(days: 360)),
                todayButtonColor: const Color(0xFFFFE5EE),
                todayBorderColor: const Color(0xFFFFE5EE),
                prevMonthDayBorderColor: CustomAppColor.of(context).grey,
                nextMonthDayBorderColor: CustomAppColor.of(context).grey,
                onDayPressed: (DateTime date, List events) {
                  setState(() {
                    if (_currentDate2 == date) {
                      _currentDate2 = DateTime(1900);
                    } else {
                      _currentDate2 = date;
                    }
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
