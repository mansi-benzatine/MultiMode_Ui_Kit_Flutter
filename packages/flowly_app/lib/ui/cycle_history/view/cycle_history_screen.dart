import 'package:flowly_app/interfaces/top_bar_click_listener.dart';
import 'package:flowly_app/localization/language/languages.dart';
import 'package:flowly_app/utils/app_color.dart';
import 'package:flowly_app/utils/constant.dart';
import 'package:flowly_app/utils/sizer_utils.dart';
import 'package:flowly_app/widgets/text/common_text.dart';
import 'package:flowly_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class CycleHistoryScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CycleHistoryScreen());
  }

  const CycleHistoryScreen({super.key});

  @override
  State<CycleHistoryScreen> createState() => _CycleHistoryScreenState();
}

class _CycleHistoryScreenState extends State<CycleHistoryScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtCycleHistory,
            isShowBack: true,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: cycleHistoryView(),
          )
        ],
      ),
    );
  }

  Widget cycleHistoryView() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).cardBg,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              legendDot(color: Colors.pinkAccent, text: Languages.of(context).txtPeriod),
              SizedBox(width: 16.setWidth),
              legendDot(color: Colors.amber, text: Languages.of(context).txtFertileWindow),
              SizedBox(width: 16.setWidth),
              legendDot(color: Colors.green, text: Languages.of(context).txtOvulation),
            ],
          ),
          SizedBox(height: 15.setHeight),
          buildCycleItem(
            date: "Aug 15 - Now",
            periodDays: 2,
            cycleDays: 2,
            fertileStartPercent: 0.70,
            fertileEndPercent: 0.90,
            ovulationPercent: 0.4,
          ),
          Divider(color: Colors.grey.shade300),
          buildCycleItem(
            date: "Jul 12 - Jul 15",
            periodDays: 4,
            cycleDays: 28,
            fertileStartPercent: 0.30,
            fertileEndPercent: 0.62,
            ovulationPercent: 0.60,
          ),
          Divider(color: Colors.grey.shade300),
          buildCycleItem(
            date: "Jun 10 - Jun 15",
            periodDays: 5,
            cycleDays: 30,
            fertileStartPercent: 0.35,
            fertileEndPercent: 0.65,
            ovulationPercent: 0.60,
          ),
          Divider(color: Colors.grey.shade300),
          buildCycleItem(
            date: "May 10 - May 15",
            periodDays: 5,
            cycleDays: 30,
            fertileStartPercent: 0.35,
            fertileEndPercent: 0.65,
            ovulationPercent: 0.60,
          ),
          Divider(color: Colors.grey.shade300),
          buildCycleItem(
            date: "Apr 10 - Apr 15",
            periodDays: 5,
            cycleDays: 30,
            fertileStartPercent: 0.35,
            fertileEndPercent: 0.65,
            ovulationPercent: 0.60,
          ),
        ],
      ),
    );
  }

  Widget legendDot({required Color color, required String text}) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 6.setWidth),
        CommonText(
          text: text,
        ),
      ],
    );
  }

  Widget buildCycleItem({
    required String date,
    required int periodDays,
    required int cycleDays,
    required double fertileStartPercent,
    required double fertileEndPercent,
    required double ovulationPercent,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: date,
            fontSize: 13.setFontSize,
            fontFamily: Constant.fontFamilyMulishBold700,
          ),
          SizedBox(height: 8.setHeight),
          Row(
            children: [
              Row(
                children: List.generate(
                  5,
                  (i) => Icon(
                    Icons.water_drop,
                    color: periodDays > i ? CustomAppColor.of(context).primary : CustomAppColor.of(context).primary.withValues(alpha: 0.2),
                    size: 22,
                  ),
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double totalWidth = constraints.maxWidth;

                    const int totalDays = 31;

                    int gapDays = 10;
                    int fertileStartDay = periodDays + gapDays;
                    int fertileEndDay = fertileStartDay + 8;
                    int ovulationDay = fertileStartDay + 6;

                    double fertileStartPercent = fertileStartDay / totalDays;
                    double fertileEndPercent = fertileEndDay / totalDays;
                    double ovulationPercent = ovulationDay / totalDays;

                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Row(
                          children: List.generate(
                            totalDays,
                            (i) => Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 4.setWidth),
                                child: Container(
                                  height: 10,
                                  width: 1,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: fertileStartPercent * totalWidth,
                          width: (fertileEndPercent - fertileStartPercent) * totalWidth,
                          child: Container(
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        Positioned(
                          left: ovulationPercent * totalWidth - 10,
                          top: -2.setHeight,
                          child: Container(
                            height: 12.setHeight,
                            width: 12.setWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.green, width: 1),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                )
                              ],
                            ),
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 8.setHeight),
          CommonText(
            text: "$periodDays days - period, $cycleDays days - cycle",
            fontSize: 13.setFontSize,
            textColor: CustomAppColor.of(context).txtGray,
          ),
        ],
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
