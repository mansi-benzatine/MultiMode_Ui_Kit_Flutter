import 'package:dotted_border/dotted_border.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flowly_screens_app/localization/language/languages.dart';
import 'package:flowly_screens_app/ui/calendar/view/calendar_screen.dart';
import 'package:flowly_screens_app/ui/edit_period_date/view/edit_period_date_screen.dart';
import 'package:flowly_screens_app/ui/explore_self_care/view/explore_self_care_screen.dart';
import 'package:flowly_screens_app/ui/home/datamodel/home_data.dart';
import 'package:flowly_screens_app/ui/log_symptoms/view/log_symptoms_screen.dart';
import 'package:flowly_screens_app/utils/app_assets.dart';
import 'package:flowly_screens_app/utils/app_color.dart';
import 'package:flowly_screens_app/utils/constant.dart';
import 'package:flowly_screens_app/utils/sizer_utils.dart';
import 'package:flowly_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  DateTime? selectedDate;
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => HomeScreen());
  }

  HomeScreen({super.key, this.selectedDate});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime _selectedDate;
  final DateTime _today = DateTime(2025, 8, 15);
  final DateTime _periodStart = DateTime(2025, 8, 14);
  final int _periodLength = 4;
  final int _cycleLength = 28;
  String _currentBgAsset = AppAssets.imgHomeDefaultBg;

  List<SymptomModel> symptoms = [
    SymptomModel(type: SymptomType.emoji, value: "😢"),
    SymptomModel(type: SymptomType.asset, value: AppAssets.icHeadacheSymptoms),
    SymptomModel(type: SymptomType.asset, value: AppAssets.icMedicineRound),
    SymptomModel(type: SymptomType.counter, value: "+4"),
  ];
  List<SuggestedForYouModel> suggestedList = [
    SuggestedForYouModel(
      title: "DIY period product",
      imageName: AppAssets.imgSelfCare1,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
      isVideo: true,
      duration: "5:48",
    ),
    SuggestedForYouModel(
      title: "Early signs of pregnancy's",
      imageName: AppAssets.imgSelfCare2,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
    ),
    SuggestedForYouModel(
      title: "Period pain relief",
      imageName: AppAssets.imgSelfCare3,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
      isVideo: true,
      duration: "5:48",
    ),
    SuggestedForYouModel(
      title: "What is the deal with HPV?",
      imageName: AppAssets.imgSelfCare4,
      subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
    ),
  ];
  List<CyclePhaseModel> cyclePhaseList = [
    CyclePhaseModel(
      iconName: AppAssets.icNextFertile,
      date: "Aug 24",
      phase: "Next Fertile",
      color: const Color(0xFFFDFBD9),
      borderColor: const Color(0xFFF3D71A),
    ),
    CyclePhaseModel(
      iconName: AppAssets.icOvulation,
      date: "Aug 29",
      phase: "Ovulation",
      color: const Color(0xFFECF8E5),
      borderColor: const Color(0xFF42DF5B),
    ),
    CyclePhaseModel(
      iconName: AppAssets.icWaterDropPrimary,
      date: "Sept 11",
      phase: "Next Period",
      color: const Color(0xFFFFF4F4),
      borderColor: const Color(0xFFFD8599),
    ),
    CyclePhaseModel(
      iconName: AppAssets.icWaterDropPrimary,
      date: "Sept 15",
      phase: "Last Day",
      color: const Color(0xFFFFF4F4),
      borderColor: const Color(0xFFFD8599),
    ),
  ];
  List<ReminderNoteModel> reminderNotesList = [
    ReminderNoteModel(
      title: "OC-1",
      subTitle: "2 Pills",
      type: ReminderNotesType.reminder,
      iconName: AppAssets.icMedicineCapsule,
      time: "09:00 AM",
    ),
    ReminderNoteModel(
      title: "Aug 15",
      subTitle: "lorem Ipsum is simple",
      type: ReminderNotesType.notes,
      iconName: AppAssets.icNote,
    ),
    ReminderNoteModel(
      title: "OC-1",
      subTitle: "2 Pills",
      type: ReminderNotesType.notes,
      iconName: AppAssets.icNote,
    ),
  ];

  @override
  void initState() {
    super.initState();
    AppAssets.refreshAssets(context);
    _selectedDate = widget.selectedDate ?? DateTime(2025, 8, 14);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _currentBgAsset = _computeBgAsset(_selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(_currentBgAsset),
            Column(
              children: [
                topbar(),
                _calenderView(),
                SizedBox(height: 75.setHeight),
                getDayStatusText(_selectedDate),
                SizedBox(height: 20.setHeight),
                editPeriodButton(_selectedDate),
                SizedBox(height: 60.setHeight),
                pregnancyStatusText(_selectedDate),
                SizedBox(height: 60.setHeight),
                mySymptomsRow(),
                SizedBox(height: 10.setHeight),
                cyclePhaseListView(),
                SizedBox(height: 10.setHeight),
                reminderNotesListView(),
                SizedBox(height: 10.setHeight),
                suggestedForYouListView(),
                SizedBox(height: 150.setHeight),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget topbar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        children: [
          SizedBox(height: 54.setHeight),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    CommonText(
                      text: "Hello,",
                      fontSize: 22.setFontSize,
                      textColor: CustomAppColor.of(context).txtGrayWhite,
                    ),
                    CommonText(
                      text: " Lissa",
                      fontSize: 22.setFontSize,
                      fontFamily: Constant.fontFamilyMulishBold700,
                    ),
                  ],
                ),
              ),
              IgnorePointer(
                ignoring: true,
                child: GestureDetector(
                  onTap: () => Navigator.push(context, CalendarScreen.route()),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomAppColor.of(context).cardBg,
                      border: Border.all(
                        color: CustomAppColor.of(context).dividerColor,
                        width: 0.5,
                      ),
                    ),
                    child: Image.asset(
                      AppAssets.icCalendar,
                      height: 20.setHeight,
                      width: 20.setWidth,
                      color: CustomAppColor.of(context).icBlackWhite,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  String _computeBgAsset(DateTime date) {
    // Calculate days since period start
    int daysSinceStart = date.difference(_periodStart).inDays;
    // Cycle day (1-28)
    int cycleDay = ((daysSinceStart % _cycleLength) + 1).clamp(1, _cycleLength);

    // Period days (1-4): default bg
    if (cycleDay >= 1 && cycleDay <= _periodLength) {
      return AppAssets.imgHomeDefaultBg;
    }
    // After period, 10 days non-period (5-14): non-period bg
    else if (cycleDay >= 5 && cycleDay <= 14) {
      return AppAssets.imgNonPeriodBg;
    }
    // Ovulation 2-3 days (e.g., 15-17): ovulation bg (adjust range as needed)
    else if (cycleDay >= 15 && cycleDay <= 17) {
      return AppAssets.imgOvulationBg;
    }
    // After 10 days, 5 days fertile (18-22): fertile bg
    else if (cycleDay >= 18 && cycleDay <= 22) {
      return AppAssets.imgFertileBg;
    }
    // Near next period (23-28): home util bg
    else {
      return AppAssets.imgHomeDefaultBg;
    }
  }

  Widget getDayStatusText(DateTime date) {
    int daysSinceStart = date.difference(_periodStart).inDays;
    int cycleDay = ((daysSinceStart % _cycleLength) + 1).clamp(1, _cycleLength);

    if (cycleDay >= 1 && cycleDay <= _periodLength) {
      return Column(
        children: [
          SizedBox(height: 10.setHeight),
          ordinalText(cycleDay),
          CommonText(
            text: "day of period",
            fontSize: 18.setFontSize,
            fontFamily: Constant.fontFamilyMulishMedium500,
            textColor: CustomAppColor.of(context).black,
          ),
        ],
      );
    } else if (cycleDay >= 5 && cycleDay <= 14) {
      int day = cycleDay - 4;
      return Column(
        children: [
          SizedBox(height: 10.setHeight),
          ordinalText(day),
          CommonText(
            text: "day of non-period",
            fontSize: 18.setFontSize,
            fontFamily: Constant.fontFamilyMulishMedium500,
            textColor: CustomAppColor.of(context).black,
          ),
        ],
      );
    } else if (cycleDay >= 15 && cycleDay <= 17) {
      return Column(
        children: [
          SizedBox(height: 50.setHeight),
          CommonText(
            text: "Prediction:",
            fontSize: 32.setFontSize,
            fontFamily: Constant.fontFamilyMulishExtraBold800,
            textColor: CustomAppColor.of(context).black,
          ),
          CommonText(
            text: "Day of Ovulation",
            fontSize: 18.setFontSize,
            fontFamily: Constant.fontFamilyMulishMedium500,
            textColor: CustomAppColor.of(context).black,
          ),
        ],
      );
    } else if (cycleDay >= 18 && cycleDay <= 22) {
      int day = cycleDay - 17;
      return Column(
        children: [
          SizedBox(height: 10.setHeight),
          ordinalText(day),
          CommonText(
            text: "day of fertile",
            fontSize: 18.setFontSize,
            fontFamily: Constant.fontFamilyMulishMedium500,
            textColor: CustomAppColor.of(context).black,
          ),
        ],
      );
    } else {
      int daysUntilPeriod = _cycleLength - cycleDay + 1;
      return Column(
        children: [
          SizedBox(height: 10.setHeight),
          ordinalText(daysUntilPeriod),
          CommonText(
            text: "days until period",
            fontSize: 18.setFontSize,
            fontFamily: Constant.fontFamilyMulishMedium500,
            textColor: CustomAppColor.of(context).black,
          ),
        ],
      );
    }
  }

  Color getColorForCycle(DateTime date) {
    int daysSinceStart = date.difference(_periodStart).inDays;
    int cycleDay = ((daysSinceStart % _cycleLength) + 1).clamp(1, _cycleLength);

    if (cycleDay >= 15 && cycleDay <= 17) {
      return const Color(0xFF21C43B);
    } else if (cycleDay >= 18 && cycleDay <= 22) {
      return const Color(0xFFF3D71A);
    } else {
      return const Color(0xFFFD8599);
    }
  }

  Color getLightColorForCycle(DateTime date) {
    int daysSinceStart = date.difference(_periodStart).inDays;
    int cycleDay = ((daysSinceStart % _cycleLength) + 1).clamp(1, _cycleLength);

    if (cycleDay >= 15 && cycleDay <= 17) {
      return const Color(0xFFC0EDBB);
    } else if (cycleDay >= 18 && cycleDay <= 22) {
      return const Color(0xFFFFF7A9);
    } else {
      return const Color(0xFFFED0D1);
    }
  }

  Widget editPeriodButton(DateTime date) {
    Color btnColor = getColorForCycle(date);

    return IgnorePointer(
      ignoring: true,
      child: GestureDetector(
        onTap: () => Navigator.push(context, EditPeriodDateScreen.route()),
        child: Container(
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: btnColor,
              width: 0.8,
            ),
            boxShadow: [
              BoxShadow(
                color: btnColor.withValues(alpha: 0.4),
                offset: const Offset(0, 0),
                blurRadius: 3,
                spreadRadius: 1,
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 23.setWidth, vertical: 5.setHeight),
          child: CommonText(
            text: Languages.of(context).txtEditPeriod,
            fontFamily: Constant.fontFamilyMulishBold700,
            textColor: btnColor,
          ),
        ),
      ),
    );
  }

  Widget pregnancyStatusText(DateTime date) {
    int daysSinceStart = date.difference(_periodStart).inDays;
    int cycleDay = ((daysSinceStart % _cycleLength) + 1).clamp(1, _cycleLength);

    if (cycleDay >= 1 && cycleDay <= _periodLength) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 8.setHeight,
            width: 8.setWidth,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFD8599),
            ),
          ),
          SizedBox(width: 10.setWidth),
          CommonText(
            text: "Low Chances of getting pregnant",
            fontSize: 12.setFontSize,
            fontFamily: Constant.fontFamilyMulishMedium500,
            textColor: CustomAppColor.of(context).black,
          ),
        ],
      );
    } else if (cycleDay >= 5 && cycleDay <= 14) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 8.setHeight,
            width: 8.setWidth,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFD8599),
            ),
          ),
          SizedBox(width: 10.setWidth),
          CommonText(
            text: "Low Chances of getting pregnant",
            fontSize: 12.setFontSize,
            fontFamily: Constant.fontFamilyMulishMedium500,
            textColor: CustomAppColor.of(context).black,
          ),
        ],
      );
    } else if (cycleDay >= 15 && cycleDay <= 17) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 8.setHeight,
            width: 8.setWidth,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF21C43B),
            ),
          ),
          SizedBox(width: 10.setWidth),
          CommonText(
            text: "High chances of getting pregnant",
            fontSize: 12.setFontSize,
            fontFamily: Constant.fontFamilyMulishMedium500,
            textColor: CustomAppColor.of(context).black,
          ),
        ],
      );
    } else if (cycleDay >= 18 && cycleDay <= 22) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 8.setHeight,
            width: 8.setWidth,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF3D71A),
            ),
          ),
          SizedBox(width: 10.setWidth),
          CommonText(
            text: "High chances of getting pregnant",
            fontSize: 12.setFontSize,
            fontFamily: Constant.fontFamilyMulishMedium500,
            textColor: CustomAppColor.of(context).black,
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 8.setHeight,
            width: 8.setWidth,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFD8599),
            ),
          ),
          SizedBox(width: 10.setWidth),
          CommonText(
            text: "Low chances of getting pregnant",
            fontSize: 12.setFontSize,
            fontFamily: Constant.fontFamilyMulishMedium500,
          ),
        ],
      );
    }
  }

  Map<String, String> ordinalParts(int number) {
    String suffix;

    if (number % 100 >= 11 && number % 100 <= 13) {
      suffix = "th";
    } else {
      switch (number % 10) {
        case 1:
          suffix = "st";
          break;
        case 2:
          suffix = "nd";
          break;
        case 3:
          suffix = "rd";
          break;
        default:
          suffix = "th";
      }
    }

    return {
      "number": number.toString(),
      "suffix": suffix,
    };
  }

  Widget ordinalText(int number) {
    final parts = ordinalParts(number);

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: parts["number"],
            style: TextStyle(
              fontSize: 68.setFontSize,
              fontWeight: FontWeight.w800,
              fontFamily: Constant.fontFamilyMulishBold700,
              package: "flowly_screens_app",
              color: CustomAppColor.of(context).black,
            ),
          ),
          TextSpan(
            text: parts["suffix"],
            style: TextStyle(
              fontSize: 23.setFontSize,
              fontWeight: FontWeight.w700,
              fontFamily: Constant.fontFamilyMulishRegular400,
              package: "flowly_screens_app",
              color: CustomAppColor.of(context).black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _calenderView() {
    return Stack(
      children: [
        EasyTheme(
          data: EasyTheme.of(context).copyWith(
            timelineOptions: const TimelineOptions(height: 30.0, padding: EdgeInsets.all(5)),
          ),
          child: EasyDateTimeLinePicker.itemBuilder(
            firstDate: DateTime(2025, 8, 1),
            lastDate: DateTime(2030, 3, 18),
            focusedDate: _selectedDate,
            timelineOptions: const TimelineOptions(height: 90.0, padding: EdgeInsets.all(10)),
            headerOptions: const HeaderOptions(headerType: HeaderType.picker),
            itemExtent: 50.0,
            itemBuilder: (context, date, isSelected, isDisabled, isToday, onTap) {
              final bool isPeriodDay = date.year == _periodStart.year && date.month == _periodStart.month && date.day >= _periodStart.day && date.day <= _periodStart.day + _periodLength - 1;

              Color? backgroundColor;
              bool showDottedBorder = false;
              Color borderColor = CustomAppColor.of(context).primary;
              int daysSinceStart = date.difference(_periodStart).inDays;
              int cycleDay = ((daysSinceStart % _cycleLength) + 1).clamp(1, _cycleLength);

              if (isPeriodDay) {
                if (date.isBefore(_today)) {
                  // Past period day: light pink background
                  backgroundColor = const Color(0xFFFED0D1);
                } else if (date.isAtSameMomentAs(_today)) {
                  // Current day (period): pink background
                  backgroundColor = const Color(0xFFFED0D1);
                } else {
                  // Future period days: dotted red border
                  showDottedBorder = true;
                }
              }

              // Apply selected style on top if not the current day
              if (isSelected && !isToday) {
                backgroundColor = CustomAppColor.of(context).primary.withValues(alpha: 0.3);
                showDottedBorder = false; // Override dotted if selected
              }

              // Build the inner column (weekday + day container)
              Widget innerColumn = Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                    text: _getShortWeekday(date),
                    fontSize: 13.setFontSize,
                    textColor: isSelected || cycleDay >= 18 && cycleDay <= 22 ? CustomAppColor.of(context).black : CustomAppColor.of(context).txtBlack,
                    fontFamily: isSelected ? Constant.fontFamilyMulishBold700 : Constant.fontFamilyMulishSemiBold600,
                  ),
                  SizedBox(height: 4.setHeight),
                  Container(
                    width: 55.setWidth,
                    height: 20.setHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: CommonText(
                        text: date.day.toString(),
                        fontSize: 13.setFontSize,
                        textColor: isSelected || cycleDay >= 18 && cycleDay <= 22 ? CustomAppColor.of(context).black : CustomAppColor.of(context).txtBlack,
                        fontFamily: Constant.fontFamilyMulishBold700,
                      ),
                    ),
                  ),
                ],
              );

              innerColumn = Container(
                padding: EdgeInsets.symmetric(vertical: 2.setHeight, horizontal: 3.setWidth),
                decoration: BoxDecoration(
                  color: !isSelected && cycleDay >= 18 && cycleDay <= 22
                      ? CustomAppColor.of(context).yellowLight
                      : isSelected
                          ? getLightColorForCycle(date)
                          : backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  border: !isSelected
                      ? null
                      : Border(
                          top: BorderSide(
                            color: getColorForCycle(date),
                            width: 3,
                          ),
                          left: BorderSide(
                            color: getColorForCycle(date),
                            width: 3,
                          ),
                        ),
                ),
                child: innerColumn,
              );

              if (showDottedBorder) {
                innerColumn = DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    radius: const Radius.circular(12),
                    dashPattern: const [4, 2],
                    color: borderColor,
                    strokeWidth: 2.0,
                  ),
                  child: innerColumn,
                );
              }
              return InkResponse(
                onTap: onTap,
                child: innerColumn,
              );
            },
            onDateChange: (selectedDate) {
              setState(() {
                _selectedDate = selectedDate;
                _currentBgAsset = _computeBgAsset(selectedDate);
              });
            },
          ),
        ),
      ],
    );
  }

  String _getShortWeekday(DateTime date) {
    switch (date.weekday) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
      default:
        return '';
    }
  }

  Widget mySymptomsRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtMySymptoms,
            fontSize: 16.setFontSize,
            fontFamily: Constant.fontFamilyMulishBold700,
          ),
          SizedBox(height: 16.setHeight),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 8.setHeight),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).cardBg,
              boxShadow: [
                BoxShadow(
                  color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                  blurRadius: 24,
                  offset: const Offset(1, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 140,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: List.generate(symptoms.length, (index) {
                      final symptom = symptoms[index];
                      final double leftPos = index * 28;

                      switch (symptom.type) {
                        case SymptomType.emoji:
                          return Positioned(left: leftPos, child: symptomCircle(symptom.value));
                        case SymptomType.asset:
                          return Positioned(left: leftPos, child: symptomIconCircle(symptom.value));
                        case SymptomType.counter:
                          return Positioned(left: leftPos, child: symptomCountCircle(symptom.value));
                      }
                    }),
                  ),
                ),
                const Spacer(),
                IgnorePointer(
                  ignoring: true,
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, LogSymptomsScreen.route(date: _selectedDate)),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomAppColor.of(context).primary,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: const Icon(Icons.add, color: Colors.white, size: 24),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget symptomCircle(String emoji) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).symptomsBg,
        shape: BoxShape.circle,
        border: Border.all(
          color: CustomAppColor.of(context).offWhiteCardBg,
          width: 3,
        ),
      ),
      child: Text(
        emoji,
        style: TextStyle(fontSize: 15.setFontSize),
      ),
    );
  }

  Widget symptomIconCircle(String name) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).symptomsBg,
        shape: BoxShape.circle,
        border: Border.all(
          color: CustomAppColor.of(context).offWhiteCardBg,
          width: 3,
        ),
      ),
      child: Image.asset(
        name,
        width: 19.setWidth,
        height: 19.setHeight,
      ),
    );
  }

  Widget symptomCountCircle(String text) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).symptomsBg,
        shape: BoxShape.circle,
        border: Border.all(
          color: CustomAppColor.of(context).offWhiteCardBg,
          width: 3,
        ),
      ),
      child: CommonText(
        text: text,
        fontSize: 15.setFontSize,
        fontFamily: Constant.fontFamilyMulishMedium500,
      ),
    );
  }

  Widget cyclePhaseListView() {
    return Padding(
      padding: EdgeInsets.only(top: 10.setHeight, left: 20.setWidth),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtCyclePhase,
            fontSize: 16.setFontSize,
            fontFamily: Constant.fontFamilyMulishBold700,
          ),
          SizedBox(height: 16.setHeight),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                cyclePhaseList.length,
                (index) {
                  final item = cyclePhaseList[index];
                  return Container(
                    width: 120.setWidth,
                    margin: EdgeInsets.only(right: 12.setWidth),
                    decoration: BoxDecoration(
                      color: item.color,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: item.borderColor),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 16.setHeight),
                    child: Column(
                      children: [
                        Image.asset(
                          item.iconName,
                          height: 42.setHeight,
                          width: 42.setHeight,
                        ),
                        SizedBox(height: 8.setHeight),
                        CommonText(
                          text: item.date,
                          fontFamily: Constant.fontFamilyMulishBold700,
                          fontSize: 16.setFontSize,
                          textColor: CustomAppColor.of(context).black,
                        ),
                        SizedBox(height: 2.setHeight),
                        CommonText(
                          text: item.phase,
                          fontSize: 12.setFontSize,
                          textColor: CustomAppColor.of(context).black,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget reminderNotesListView() {
    return Padding(
      padding: EdgeInsets.only(top: 10.setHeight, left: 20.setWidth),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtReminderAndNotes,
            fontSize: 16.setFontSize,
            fontFamily: Constant.fontFamilyMulishBold700,
          ),
          SizedBox(height: 16.setHeight),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                reminderNotesList.length,
                (index) {
                  final item = reminderNotesList[index];
                  return Container(
                    width: 160.setWidth,
                    height: 100.setHeight,
                    margin: EdgeInsets.only(right: 12.setWidth),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).offWhiteCardBg,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 12.setHeight),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: item.title,
                                fontFamily: Constant.fontFamilyMulishBold700,
                                fontSize: 18.setFontSize,
                              ),
                              SizedBox(height: 5.setHeight),
                              CommonText(
                                text: item.subTitle,
                                fontSize: 12.setFontSize,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              if (item.time != null)
                                CommonText(
                                  text: item.time ?? '',
                                  fontSize: 12.setFontSize,
                                )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).txtWhite,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(9),
                            child: Image.asset(
                              item.iconName,
                              height: 18.setHeight,
                              width: 18.setHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget suggestedForYouListView() {
    return Padding(
      padding: EdgeInsets.only(top: 10.setHeight, left: 20.setWidth, right: 20.setWidth),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtSuggestedForYou,
            fontSize: 16.setFontSize,
            fontFamily: Constant.fontFamilyMulishBold700,
          ),
          SizedBox(height: 16.setHeight),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              suggestedList.length,
              (index) {
                final item = suggestedList[index];
                return IgnorePointer(
                  ignoring: true,
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, ExploreSelfCareScreen.route(selfCare: item)),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20.setHeight),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).cardBg,
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: CustomAppColor.of(context).black.withValues(alpha: 0.15),
                                  blurRadius: 16,
                                  spreadRadius: 3,
                                  offset: const Offset(1, 1),
                                )
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        item.imageName,
                                        height: 160.setHeight,
                                        width: 0.screenWidth,
                                        fit: BoxFit.fill,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CommonText(
                                              text: item.title,
                                              fontFamily: Constant.fontFamilyMulishBold700,
                                              fontSize: 16.setFontSize,
                                            ),
                                            SizedBox(height: 2.setHeight),
                                            CommonText(
                                              text: item.subTitle,
                                              fontSize: 12.setFontSize,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              textAlign: TextAlign.start,
                                              textColor: CustomAppColor.of(context).txtGray,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (item.isVideo)
                            Positioned(
                              top: 18.setHeight,
                              left: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: CustomAppColor.of(context).black.withValues(alpha: 0.3),
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 4.setHeight),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      AppAssets.icVideoPlay,
                                      width: 12.setWidth,
                                      height: 12.setHeight,
                                    ),
                                    SizedBox(width: 2.setWidth),
                                    CommonText(
                                      text: item.duration ?? "",
                                      fontSize: 10.setFontSize,
                                      textColor: CustomAppColor.of(context).white,
                                    ),
                                  ],
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
