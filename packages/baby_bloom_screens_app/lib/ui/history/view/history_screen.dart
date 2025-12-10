import 'package:baby_bloom_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_screens_app/localization/language/languages.dart';
import 'package:baby_bloom_screens_app/ui/kick_counter/datamodel/kick_counter_data.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text/common_text.dart';

class HistoryScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const HistoryScreen());
  }

  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> implements TopBarClickListener {
  List<KickCounterData> kickCountList = [];

  _fillData() {
    kickCountList = [
      KickCounterData(
        date: DateTime.now(),
        time: DateTime.timestamp(),
        duration: "00:00:08",
        kicks: 08,
      ),
      KickCounterData(
        date: DateTime.now().subtract(const Duration(days: 1)),
        time: DateTime.timestamp(),
        duration: "00:00:08",
        kicks: 08,
      ),
      KickCounterData(
        date: DateTime.now().subtract(const Duration(days: 2)),
        time: DateTime.timestamp(),
        duration: "00:00:08",
        kicks: 15,
      ),
      KickCounterData(
        date: DateTime.now().subtract(const Duration(days: 3)),
        time: DateTime.timestamp(),
        duration: "00:00:08",
        kicks: 10,
      ),
      KickCounterData(
        date: DateTime.now().subtract(const Duration(days: 4)),
        time: DateTime.timestamp(),
        duration: "00:00:08",
        kicks: 08,
      ),
      KickCounterData(
        date: DateTime.now().subtract(const Duration(days: 5)),
        time: DateTime.timestamp(),
        duration: "00:00:08",
        kicks: 08,
      ),
      KickCounterData(
        date: DateTime.now().subtract(const Duration(days: 6)),
        time: DateTime.timestamp(),
        duration: "00:00:08",
        kicks: 08,
      ),
      KickCounterData(
        date: DateTime.now().subtract(const Duration(days: 7)),
        time: DateTime.timestamp(),
        duration: "00:00:08",
        kicks: 08,
      ),
      KickCounterData(
        date: DateTime.now().subtract(const Duration(days: 8)),
        time: DateTime.timestamp(),
        duration: "00:00:08",
        kicks: 08,
      ),
      KickCounterData(
        date: DateTime.now().subtract(const Duration(days: 9)),
        time: DateTime.timestamp(),
        duration: "00:00:08",
        kicks: 08,
      ),
      KickCounterData(
        date: DateTime.now().subtract(const Duration(days: 10)),
        time: DateTime.timestamp(),
        duration: "00:00:08",
        kicks: 15,
      ),
      KickCounterData(
        date: DateTime.now().subtract(const Duration(days: 11)),
        time: DateTime.timestamp(),
        duration: "00:00:08",
        kicks: 10,
      ),
      KickCounterData(
        date: DateTime.now().subtract(const Duration(days: 12)),
        time: DateTime.timestamp(),
        duration: "00:00:08",
        kicks: 08,
      ),
      KickCounterData(
        date: DateTime.now().subtract(const Duration(days: 13)),
        time: DateTime.timestamp(),
        duration: "00:00:08",
        kicks: 08,
      ),
      KickCounterData(
        date: DateTime.now().subtract(const Duration(days: 14)),
        time: DateTime.timestamp(),
        duration: "00:00:08",
        kicks: 08,
      ),
      KickCounterData(
        date: DateTime.now().subtract(const Duration(days: 15)),
        time: DateTime.timestamp(),
        duration: "00:00:08",
        kicks: 08,
      ),
      KickCounterData(
        date: DateTime.now().subtract(const Duration(days: 16)),
        time: DateTime.timestamp(),
        duration: "00:00:08",
        kicks: 08,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: true,
            title: Languages.of(context).txtHistory,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: historyList(),
            ),
          ),
          SizedBox(height: 40.setHeight),
        ],
      ),
    );
  }

  Widget historyList() {
    return Padding(
      padding: EdgeInsets.only(right: 20.setWidth, left: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 1,
                    child: CommonText(
                      text: "Date",
                      fontFamily: Constant.fontFamilySemiBold600,
                    ),
                  ),
                  SizedBox(width: 30.setWidth),
                  const Expanded(
                    flex: 2,
                    child: CommonText(
                      text: "Start",
                      fontFamily: Constant.fontFamilySemiBold600,
                    ),
                  ),
                  const Expanded(
                    flex: 4,
                    child: CommonText(
                      text: "Duration",
                      fontFamily: Constant.fontFamilySemiBold600,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: CommonText(
                      text: "Kicks",
                      fontFamily: Constant.fontFamilySemiBold600,
                      textColor: CustomAppColor.of(context).secondary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.setHeight),
              ...kickCountList.map((item) {
                String formattedDate = _formatDate(item.date);
                String formattedTime = _formatTime(item.time);

                return Padding(
                  padding: EdgeInsets.only(bottom: 10.setHeight),
                  child: Container(
                    padding: EdgeInsets.only(top: 8.setHeight, right: 8.setWidth, bottom: 8.setHeight, left: 2.setWidth),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      border: Border.all(color: CustomAppColor.of(context).border),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: CommonText(
                            text: formattedDate,
                            fontFamily: Constant.fontFamilyMedium500,
                            textColor: CustomAppColor.of(context).txtLightGrey,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: CommonText(
                            text: formattedTime,
                            fontFamily: Constant.fontFamilyMedium500,
                            textColor: CustomAppColor.of(context).txtLightGrey,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: CommonText(
                            text: item.duration,
                            fontFamily: Constant.fontFamilyMedium500,
                            textColor: CustomAppColor.of(context).txtLightGrey,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: CommonText(
                            text: item.kicks.toString().padLeft(2, '0'),
                            fontFamily: Constant.fontFamilySemiBold600,
                            textColor: CustomAppColor.of(context).secondary,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    DateTime today = DateTime.now();
    if (date.year == today.year && date.month == today.month && date.day == today.day) {
      return "Today";
    } else {
      return "${date.day.toString().padLeft(2, '0')} "
          "${_monthName(date.month)}";
    }
  }

  String _monthName(int month) {
    const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    return months[month - 1];
  }

  String _formatTime(DateTime date) {
    return TimeOfDay.fromDateTime(date).format(context);
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
