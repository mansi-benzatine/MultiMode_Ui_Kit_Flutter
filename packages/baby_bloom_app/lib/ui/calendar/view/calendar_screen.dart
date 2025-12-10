import 'package:baby_bloom_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_app/localization/language/languages.dart';
import 'package:baby_bloom_app/utils/app_assets.dart';
import 'package:baby_bloom_app/utils/app_color.dart';
import 'package:baby_bloom_app/utils/constant.dart';
import 'package:baby_bloom_app/utils/sizer_utils.dart';
import 'package:baby_bloom_app/utils/utils.dart';
import 'package:baby_bloom_app/widgets/bottom_sheet/add_event_bottom_sheet.dart';
import 'package:baby_bloom_app/widgets/text/common_text.dart';
import 'package:baby_bloom_app/widgets/top_bar/topbar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:gradient_progress_bar/gradient_progress_bar.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CalendarScreen());
  }

  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> implements TopBarClickListener {
  final DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  final List<Map<String, dynamic>> _eventCategories = [
    {
      'name': 'Visits',
      'color': Colors.blue,
      'icon': AppAssets.icVisit,
    },
    {
      'name': 'Logs',
      'color': Colors.red,
      'icon': AppAssets.icHeart,
    },
    {
      'name': 'Reminder',
      'color': Colors.green,
      'icon': AppAssets.icReminder,
    },
    {
      'name': 'Milestones',
      'color': Colors.orange,
      'icon': AppAssets.icMilestone,
    },
  ];

  final EventList<Event> _markedDateMap = EventList<Event>(
    events: {
      DateTime(2025, 10, 10): [
        Event(
          date: DateTime(2025, 10, 10),
          title: 'Logs',
          description: 'Doctor checkup at 4:00 PM',
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(59),
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(vertical: 6.setHeight, horizontal: 10.setWidth),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.icHeart,
                  width: 14.setWidth,
                  height: 14.setHeight,
                  color: const Color(0xFFFF584E),
                ),
                SizedBox(width: 4.setWidth),
                const CommonText(
                  text: 'Logs',
                  textColor: Color(0xFFFF584E),
                )
              ],
            ),
          ),
          dot: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1),
            height: 4.setHeight,
            width: 4.setWidth,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
        ),
        Event(
          date: DateTime(2025, 10, 10),
          title: 'Visits',
          description: 'Doctor checkup at 4:00 PM',
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(59),
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(vertical: 6.setHeight, horizontal: 10.setWidth),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.icVisit,
                  width: 14.setWidth,
                  height: 14.setHeight,
                  color: const Color(0xFF384DD3),
                ),
                SizedBox(width: 4.setWidth),
                const CommonText(
                  text: 'Visits',
                  textColor: Color(0xFF384DD3),
                )
              ],
            ),
          ),
          dot: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1),
            height: 4.setHeight,
            width: 4.setWidth,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
          ),
        ),
      ],
      DateTime(2025, 10, 6): [
        Event(
          date: DateTime(2025, 10, 6),
          title: 'Visits',
          description: 'Doctor checkup at 4:00 PM',
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(59),
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(vertical: 6.setHeight, horizontal: 10.setWidth),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.icVisit,
                  width: 14.setWidth,
                  height: 14.setHeight,
                  color: const Color(0xFF384DD3),
                ),
                SizedBox(width: 4.setWidth),
                const CommonText(
                  text: 'Visits',
                  textColor: Color(0xFF384DD3),
                )
              ],
            ),
          ),
          dot: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1),
            height: 4.setHeight,
            width: 4.setWidth,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
          ),
        )
      ],
      DateTime(2025, 10, 1): [
        Event(
          date: DateTime(2019, 2, 10),
          title: 'Milestones',
          description: 'Week 8: Baby can hear sounds',
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(59),
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(vertical: 6.setHeight, horizontal: 10.setWidth),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.icMilestone,
                  width: 14.setWidth,
                  height: 14.setHeight,
                  color: const Color(0xFFE89C1B),
                ),
                SizedBox(width: 4.setWidth),
                const CommonText(
                  text: 'Milestones',
                  textColor: Color(0xFFE89C1B),
                )
              ],
            ),
          ),
          dot: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1),
            height: 4.setHeight,
            width: 4.setWidth,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange,
            ),
          ),
        ),
      ],
      DateTime(2025, 10, 25): [
        Event(
          date: DateTime(2025, 10, 25),
          title: 'Reminder',
          description: 'Yoga and exercise at 7:00 AM',
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(59),
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(vertical: 6.setHeight, horizontal: 10.setWidth),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.icReminder,
                  width: 14.setWidth,
                  height: 14.setHeight,
                  color: const Color(0xFF0FA251),
                ),
                SizedBox(width: 4.setWidth),
                const CommonText(
                  text: 'Reminder',
                  textColor: Color(0xFF0FA251),
                )
              ],
            ),
          ),
          dot: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1),
            height: 4.setHeight,
            width: 4.setWidth,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
          ),
        ),
        Event(
          date: DateTime(2025, 10, 25),
          title: 'Logs',
          description: 'Yoga and exercise at 7:00 AM',
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(59),
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(vertical: 6.setHeight, horizontal: 10.setWidth),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.icHeart,
                  width: 14.setWidth,
                  height: 14.setHeight,
                  color: const Color(0xFFFF584E),
                ),
                SizedBox(width: 4.setWidth),
                const CommonText(
                  text: 'Logs',
                  textColor: Color(0xFFFF584E),
                )
              ],
            ),
          ),
          dot: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1),
            height: 4.setHeight,
            width: 4.setWidth,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
        ),
      ],
      DateTime(2025, 10, 20): [
        Event(
          date: DateTime(2025, 10, 20),
          title: 'Reminder',
          description: 'Yoga and exercise at 7:00 AM',
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(59),
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(vertical: 6.setHeight, horizontal: 10.setWidth),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.icReminder,
                  width: 14.setWidth,
                  height: 14.setHeight,
                  color: const Color(0xFF0FA251),
                ),
                SizedBox(width: 4.setWidth),
                const CommonText(
                  text: 'Reminder',
                  textColor: Color(0xFF0FA251),
                )
              ],
            ),
          ),
          dot: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1),
            height: 4.setHeight,
            width: 4.setWidth,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
          ),
        ),
        Event(
          date: DateTime(2025, 10, 20),
          title: 'Logs',
          description: 'Yoga and exercise at 7:00 AM',
          icon: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(59),
            ),
            padding: EdgeInsets.symmetric(vertical: 6.setHeight, horizontal: 10.setWidth),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.icHeart,
                  width: 14.setWidth,
                  height: 14.setHeight,
                  color: const Color(0xFFFF584E),
                ),
                SizedBox(width: 4.setWidth),
                const CommonText(
                  text: 'Logs',
                  textColor: Color(0xFfFF584E),
                )
              ],
            ),
          ),
          dot: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1),
            height: 4.setHeight,
            width: 4.setWidth,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
        ),
      ],
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imgProfileSetupBackground2,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              TopBar(
                this,
                title: Languages.of(context).txtCalendar,
                appBarColor: CustomAppColor.of(context).transparent,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: Column(
                  children: [
                    _yourJourneyView(),
                    SizedBox(height: 20.setHeight),
                    Wrap(
                      spacing: 8.setWidth,
                      runSpacing: 8.setHeight,
                      children: List.generate(_eventCategories.length, (index) {
                        final category = _eventCategories[index];

                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 6.setHeight),
                          decoration: BoxDecoration(
                            color: category['color'].withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                category['icon'],
                                height: 14.setHeight,
                                width: 14.setWidth,
                                color: category['color'],
                              ),
                              SizedBox(width: 6.setWidth),
                              CommonText(
                                text: category['name'],
                                fontSize: 12.setFontSize,
                                fontFamily: Constant.fontFamilyMedium500,
                                textColor: category['color'],
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    _calenderView(),
                    SizedBox(height: 0.setHeight),
                    Row(
                      children: [
                        Image.asset(
                          AppAssets.icAdd,
                          height: 24.setHeight,
                          width: 24.setWidth,
                        ),
                        SizedBox(width: 8.setWidth),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                              ),
                              builder: (BuildContext context) {
                                return SafeArea(
                                  child: Padding(
                                    padding: EdgeInsets.all(20.setHeight),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Container(
                                            width: 40.setWidth,
                                            height: 4.setHeight,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              borderRadius: BorderRadius.circular(2),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 16.setHeight),
                                        CommonText(
                                          text: DateFormat('EEEE, MMMM dd').format(DateTime.now()),
                                          fontFamily: Constant.fontFamilySemiBold600,
                                          fontSize: 16.setFontSize,
                                        ),
                                        SizedBox(height: 12.setHeight),
                                        Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 20.setHeight),
                                              Image.asset(
                                                AppAssets.icUnselectedCalendar,
                                                height: 40.setHeight,
                                                width: 40.setWidth,
                                              ),
                                              SizedBox(height: 10.setHeight),
                                              CommonText(
                                                text: Languages.of(context).txtNoEventsForThisDate,
                                                textColor: CustomAppColor.of(context).txtLightGrey,
                                              ),
                                              SizedBox(height: 30.setHeight),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  Utils.showBottomSheetDialog(context, widgets: const AddEventBottomSheet());
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: CustomAppColor.of(context).secondary,
                                                      width: 1.5,
                                                    ),
                                                    borderRadius: BorderRadius.circular(50),
                                                  ),
                                                  padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 7.setHeight),
                                                  child: CommonText(
                                                    text: Languages.of(context).txtAddSomething,
                                                    textColor: CustomAppColor.of(context).txtSecondary,
                                                    fontFamily: Constant.fontFamilyMedium500,
                                                    fontSize: 16.setFontSize,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: CommonText(
                            text: Languages.of(context).txtAddYourEvents,
                            fontFamily: Constant.fontFamilySemiBold600,
                            fontSize: 14.setFontSize,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {}

  _yourJourneyView() {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).setYourDueDateBtn.withValues(alpha: 0.5),
        border: Border.all(
          color: CustomAppColor.of(context).white,
          width: 0.2,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 16.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: Languages.of(context).txtYourJourney,
                    fontFamily: Constant.fontFamilySemiBold600,
                    fontSize: 18.setFontSize,
                  ),
                  CommonText(
                    text: "Week 8, Day 4",
                    textColor: CustomAppColor.of(context).txtLightGrey,
                    fontSize: 12.setFontSize,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CommonText(
                    text: Languages.of(context).txtDueDate,
                    textColor: CustomAppColor.of(context).txtLightGrey,
                    fontSize: 12.setFontSize,
                  ),
                  CommonText(
                    text: "15/04/2026",
                    fontFamily: Constant.fontFamilySemiBold600,
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).secondary,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 8.setHeight),
          SizedBox(
            height: 7.setHeight,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: 0.4),
              duration: const Duration(milliseconds: 600),
              builder: (context, value, child) {
                return GradientProgressIndicator(
                  const [
                    Color(0xffF68270),
                    Color(0xffE97EED),
                    Color(0xffe89dbf),
                    Color(0xffF1C358),
                    Color(0xffEFDE62),
                    Color(0xffE5F3BE),
                    Color(0xffCDE8F1),
                    Color(0xffF2E0F9),
                  ],
                  value,
                );
              },
            ),
          ),
          SizedBox(height: 8.setHeight),
          CommonText(
            text: "8 of 40 weeks",
            textColor: CustomAppColor.of(context).txtLightGrey,
            fontSize: 12.setFontSize,
          )
        ],
      ),
    );
  }

  _calenderView() {
    return SizedBox(
      height: 400.setHeight,
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
                  strokeWidth: 0.2,
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
                color: CustomAppColor.of(context).transparent,
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '${day.day}',
                  style: TextStyle(
                    color: CustomAppColor.of(context).txtBlack,
                    fontFamily: Constant.fontFamilyExtraBold800,
                    package: 'baby_bloom_app',
                  ),
                ),
              ),
            );
          }
        },
        markedDatesMap: _markedDateMap,
        weekFormat: false,
        selectedDateTime: _currentDate2,
        showIconBehindDayText: true,
        headerTitleTouchable: false,
        customGridViewPhysics: const NeverScrollableScrollPhysics(),
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
        /*  onDayPressed: (DateTime date, List events) {
          setState(() {
            if (_currentDate2 == date) {
              _currentDate2 = DateTime(1900);
            } else {
              _currentDate2 = date;
            }
          });
        },*/
        onDayPressed: (DateTime date, List<Event> events) {
          setState(() {
            if (_currentDate2 == date) {
              _currentDate2 = DateTime(1900);
            } else {
              _currentDate2 = date;
            }
          });

          if (events.isNotEmpty) {
            showModalBottomSheet(
              context: context,
              backgroundColor: CustomAppColor.of(context).bgScreen,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              builder: (BuildContext context) {
                return SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(20.setHeight),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 40.setWidth,
                            height: 4.setHeight,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.setHeight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                              text: DateFormat('EEEE, MMMM dd').format(date),
                              fontFamily: Constant.fontFamilySemiBold600,
                              fontSize: 16.setFontSize,
                            ),
                            if (date.isAfter(DateTime.now())) const Icon(Icons.add)
                          ],
                        ),
                        SizedBox(height: 12.setHeight),
                        ...events.map((event) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 15.setHeight),
                            padding: EdgeInsets.all(12.setHeight),
                            decoration: BoxDecoration(
                              color: event.title == "Visits"
                                  ? const Color(0xFF384DD3).withValues(alpha: 0.2)
                                  : event.title == "Reminder"
                                      ? const Color(0xFF0FA251).withValues(alpha: 0.2)
                                      : event.title == "Milestones"
                                          ? const Color(0xFFE89C1B).withValues(alpha: 0.2)
                                          : const Color(0xFFFF584E).withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: event.title == "Visits"
                                    ? const Color(0xFF384DD3)
                                    : event.title == "Reminder"
                                        ? const Color(0xFF0FA251)
                                        : event.title == "Milestones"
                                            ? const Color(0xFFE89C1B)
                                            : const Color(0xFFFF584E),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    event.icon ?? const Icon(Icons.event, color: Colors.pink),
                                    SizedBox(width: 12.setWidth),
                                    if (date.isAfter(DateTime.now()))
                                      Image.asset(
                                        AppAssets.icEdit,
                                        height: 16.setHeight,
                                        width: 16.setWidth,
                                        color: CustomAppColor.of(context).icBlackWhite,
                                      ),
                                  ],
                                ),
                                SizedBox(height: 8.setHeight),
                                CommonText(
                                  text: event.description ?? 'Untitled Event',
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          if (events.isEmpty) {
            showModalBottomSheet(
              context: context,
              backgroundColor: CustomAppColor.of(context).bgScreen,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              builder: (BuildContext context) {
                return SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(20.setHeight),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 40.setWidth,
                            height: 4.setHeight,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.setHeight),
                        CommonText(
                          text: DateFormat('EEEE, MMMM dd').format(date),
                          fontFamily: Constant.fontFamilySemiBold600,
                          fontSize: 16.setFontSize,
                        ),
                        SizedBox(height: 12.setHeight),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 20.setHeight),
                              Image.asset(
                                AppAssets.icUnselectedCalendar,
                                height: 40.setHeight,
                                width: 40.setWidth,
                              ),
                              SizedBox(height: 10.setHeight),
                              CommonText(
                                text: Languages.of(context).txtNoEventsForThisDate,
                                textColor: CustomAppColor.of(context).txtLightGrey,
                              ),
                              SizedBox(height: 30.setHeight),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  Utils.showBottomSheetDialog(context, widgets: const AddEventBottomSheet());
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: CustomAppColor.of(context).secondary,
                                        width: 1.5,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 7.setHeight),
                                    child: CommonText(
                                      text: Languages.of(context).txtAddSomething,
                                      textColor: CustomAppColor.of(context).secondary,
                                      fontFamily: Constant.fontFamilyMedium500,
                                      fontSize: 16.setFontSize,
                                      textAlign: TextAlign.center,
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
        markedDateCustomShapeBorder: CircleBorder(
            side: BorderSide(
          color: CustomAppColor.of(context).secondary,
        )),
      ),
    );
  }
}
