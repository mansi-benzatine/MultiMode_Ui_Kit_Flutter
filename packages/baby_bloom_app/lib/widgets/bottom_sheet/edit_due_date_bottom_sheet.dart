import 'package:baby_bloom_app/utils/app_assets.dart';
import 'package:baby_bloom_app/utils/app_color.dart';
import 'package:baby_bloom_app/utils/constant.dart';
import 'package:baby_bloom_app/utils/sizer_utils.dart';
import 'package:baby_bloom_app/widgets/button/common_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

import '../text/common_text.dart';

class EditDueDateBottomSheet extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditDueDateBottomSheet());
  }

  const EditDueDateBottomSheet({super.key});

  @override
  State<EditDueDateBottomSheet> createState() => _EditDueDateBottomSheetState();
}

class _EditDueDateBottomSheetState extends State<EditDueDateBottomSheet> {
  final DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20.setWidth),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgScreen,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 15.setHeight),
            Center(
              child: Container(
                width: 40.setWidth,
                height: 3.setHeight,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            SizedBox(height: 5.setHeight),
            CommonText(
              text: "Edit Due Date",
              fontSize: 18.setFontSize,
              fontFamily: Constant.fontFamilySemiBold600,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10.setHeight),
            _calenderView(),
            SizedBox(height: 10.setHeight),
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    text: "Cancel",
                    height: 44.setHeight,
                    buttonTextColor: CustomAppColor.of(context).txtLightGrey,
                    borderColor: CustomAppColor.of(context).btnGrey,
                    buttonColor: CustomAppColor.of(context).btnGrey,
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                SizedBox(width: 15.setWidth),
                Expanded(
                  child: CommonButton(
                    text: "Set",
                    height: 44.setHeight,
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.setHeight),
          ],
        ),
      ),
    );
  }

  _calenderView() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 350.setHeight,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.imgProfileSetupBackground), fit: BoxFit.cover),
          border: Border.all(
            color: CustomAppColor.of(context).white,
            width: 0.2,
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
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomAppColor.of(context).setYourDueDateBtn,
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
              color: CustomAppColor.of(context).setYourDueDateBtn,
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
          /*  dayButtonColor: const Color(0xFFFFFFFF),*/
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
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: DottedBorder(
                  options: const RoundedRectDottedBorderOptions(
                    radius: Radius.circular(24),
                    color: Colors.grey,
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
            } else {
              return Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelectedDay ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).btnGrey,
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
              );
            }
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
    );
  }
}
