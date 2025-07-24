import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:run_tracker_step_counter_water_reminder_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_step_counter_water_reminder_app/localization/language/languages.dart';
import 'package:run_tracker_step_counter_water_reminder_app/ui/history/views/history_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_app/ui/setting/views/setting_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_app/ui/subscription/views/subscription_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/app_assets.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/app_color.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/constant.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_app/widgets/button/common_button.dart';
import 'package:run_tracker_step_counter_water_reminder_app/widgets/text/common_text.dart';
import 'package:run_tracker_step_counter_water_reminder_app/widgets/top_bar/topbar.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../home/datamodels/home_data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    implements TopBarClickListener {
  List<BestRecords> bestRecordList = [];

  void fillData() {
    bestRecordList = [
      BestRecords(
        icon: AppAssets.icRoad,
        title: Languages.of(context).txtLongestDistance,
        description: "0:0",
        trailingString: "km",
        date: "Apr 15,2023",
      ),
      BestRecords(
        icon: AppAssets.icBlackStar,
        title: Languages.of(context).txtBestPace,
        description: "44:32",
        trailingString: "min/km",
      ),
      BestRecords(
        icon: AppAssets.icClock,
        title: Languages.of(context).txtLongestDuration,
        description: "15:12:30",
        trailingString: "",
        date: "Apr 16,2023",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: CustomAppColor.of(context).lightPurple,
      ),
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              TopBar(
                this,
                isShowTitle: true,
                title: Languages.of(context).txtRunTracker.toUpperCase(),
                shortHeading: Languages.of(
                  context,
                ).txtGoFasterAndSmarter.toUpperCase(),
                isShowProBudge: true,
                isShowSetting: true,
                appbarColor: CustomAppColor.of(context).containerBgPurple,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SubscriptionView(),
                      SizedBox(height: 10.setHeight),
                      MyProgressView(),
                      SizedBox(height: 10.setHeight),
                      HeartHealthChart(),
                      SizedBox(height: 10.setHeight),
                      WeightChartView(),
                      SizedBox(height: 10.setHeight),
                      DrinkWaterChartView(),
                      SizedBox(height: 10.setHeight),
                      BestRecordsListView(bestRecordList: bestRecordList),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strSetting) {
      Navigator.push(context, SettingScreen.route());
    }
  }
}

class SubscriptionView extends StatelessWidget {
  const SubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).containerBgPurple,
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.setHeight),

          Row(
            children: [
              Image.asset(
                AppAssets.icGreenTick,
                width: 24.setWidth,
                height: 24.setHeight,
              ),
              SizedBox(width: 16.setWidth),
              CommonText(
                text: Languages.of(context).txtRemoveAdsForever.toUpperCase(),
              ),
            ],
          ),
          SizedBox(height: 10.setHeight),
          Row(
            children: [
              Image.asset(
                AppAssets.icGreenTick,
                width: 24.setWidth,
                height: 24.setHeight,
              ),
              SizedBox(width: 16.setWidth),
              CommonText(
                text: Languages.of(context).txtRemoveAdsForever.toUpperCase(),
              ),
            ],
          ),
          SizedBox(height: 10.setHeight),
          Row(
            children: [
              Image.asset(
                AppAssets.icGreenTick,
                width: 24.setWidth,
                height: 24.setHeight,
              ),
              SizedBox(width: 16.setWidth),
              CommonText(
                text: Languages.of(context).txtRemoveAdsForever.toUpperCase(),
              ),
            ],
          ),
          SizedBox(height: 20.setHeight),
          CommonButton(
            onTap: () => Navigator.push(context, SubscriptionScreen.route()),
            text: Languages.of(context).txtSubscription,
            height: 50.setHeight,
          ),
          SizedBox(height: 20.setHeight),
        ],
      ),
    );
  }
}

class MyProgressView extends StatelessWidget {
  const MyProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).containerBgPurple,

      padding: EdgeInsets.symmetric(
        horizontal: 24.setWidth,
        vertical: 20.setHeight,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtMyProgress,
                fontSize: 18.setFontSize,
                fontWeight: FontWeight.w700,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              GestureDetector(
                onTap: () => Navigator.push(context, HistoryScreen.route()),
                child: CommonText(
                  text: Languages.of(context).txtViewHistory.toUpperCase(),
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).txtPurple,
                ),
              ),
            ],
          ),
          SizedBox(height: 14.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              CommonText(
                text: "22.25",
                fontSize: 48.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              SizedBox(width: 8.setWidth),
              CommonText(
                text: Languages.of(context).txtTotalKm.toUpperCase(),
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
            ],
          ),
          SizedBox(height: 5.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CommonText(
                    text: "10.20",
                    fontSize: 36.setFontSize,
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  CommonText(
                    text: Languages.of(context).txtTotalHours.toUpperCase(),
                    fontSize: 12.setFontSize,
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColor.of(context).txtGrey,
                  ),
                ],
              ),
              Column(
                children: [
                  CommonText(
                    text: "88.90",
                    fontSize: 36.setFontSize,
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  CommonText(
                    text: Languages.of(context).txtTotalKcal.toUpperCase(),
                    fontSize: 12.setFontSize,
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColor.of(context).txtGrey,
                  ),
                ],
              ),
              Column(
                children: [
                  CommonText(
                    text: "10.66",
                    fontSize: 36.setFontSize,
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  CommonText(
                    text: Languages.of(context).txtAvgPace.toUpperCase(),
                    fontSize: 12.setFontSize,
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColor.of(context).txtGrey,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeartHealthChart extends StatefulWidget {
  const HeartHealthChart({super.key});

  @override
  State<HeartHealthChart> createState() => _HeartHealthChartState();
}

class _HeartHealthChartState extends State<HeartHealthChart>
    with TickerProviderStateMixin {
  final double maxGoal = 500;
  late TabController _tabController;

  final List<double> weekData = [500, 400, 350, 250, 210, 160, 110];
  final List<double> monthData = [300, 450, 150, 500, 320, 220, 420];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  List<double> get currentData =>
      _tabController.index == 0 ? weekData : monthData;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).containerBgPurple,
      padding: EdgeInsets.only(
        left: 24.setWidth,
        top: 20.setHeight,
        right: 24.setWidth,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          CommonText(
            text: Languages.of(context).txtHeartHealth,
            fontSize: 18.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 16.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.chevron_left,
                size: 20.setWidth,
                color: CustomAppColor.of(context).txtPurple,
              ),
              CommonText(
                text: "Jul 4 - Jul 10",
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
            ],
          ),
          SizedBox(height: 16.setHeight),
          SizedBox(
            height: 200.setHeight,
            child: BarChart(
              BarChartData(
                barGroups: currentData.asMap().entries.map((entry) {
                  int index = entry.key;
                  double value = entry.value;
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: maxGoal,
                        rodStackItems: [
                          BarChartRodStackItem(
                            0,
                            maxGoal,
                            CustomAppColor.of(context).bgScaffold,
                          ),
                          BarChartRodStackItem(0, value, Color(0xFFFD86C9)),
                        ],
                        width: 27,
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ],
                  );
                }).toList(),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true, reservedSize: 35),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final days = [
                          'Today',
                          'Tue',
                          'Wed',
                          'Thu',
                          'Fri',
                          'Sat',
                          'Sun',
                        ];
                        String label = days[value.toInt()];
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: CommonText(
                            text: label,
                            fontSize: 12,
                            fontWeight: label == "Today"
                                ? FontWeight.w600
                                : FontWeight.w500,
                            textColor: label == "Today"
                                ? CustomAppColor.of(context).txtBlack
                                : CustomAppColor.of(context).txtGrey,
                          ),
                        );
                      },
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: CustomAppColor.of(context).grey,
                    ),
                  ),
                ),
                gridData: FlGridData(show: false),
                barTouchData: BarTouchData(enabled: false),
              ),
            ),
          ),
          SizedBox(height: 20.setHeight),
          TabBar(
            controller: _tabController,
            labelColor: CustomAppColor.of(context).txtPurple,
            unselectedLabelColor: CustomAppColor.of(context).txtGrey,
            indicatorColor: CustomAppColor.of(context).txtPurple,
            dividerColor: Colors.transparent,
            indicatorWeight: 3,
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            onTap: (_) => setState(() {}),
            tabs: [
              Tab(
                child: Text(
                  "Week",
                  style: TextStyle(
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Month",
                  style: TextStyle(
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DrinkWaterChartView extends StatefulWidget {
  const DrinkWaterChartView({super.key});

  @override
  State<DrinkWaterChartView> createState() => _DrinkWaterChartViewState();
}

class _DrinkWaterChartViewState extends State<DrinkWaterChartView>
    with TickerProviderStateMixin {
  final double maxGoal = 500;
  late TabController _tabController;

  final List<double> weekData = [500, 400, 350, 250, 210, 160, 110];
  final List<double> monthData = [300, 450, 150, 500, 320, 220, 420];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  List<double> get currentData =>
      _tabController.index == 0 ? weekData : monthData;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).containerBgPurple,
      padding: EdgeInsets.only(
        left: 24.setWidth,
        top: 20.setHeight,
        right: 24.setWidth,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtDrinkWater,
            fontSize: 18.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 16.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonText(
                text: "Jul 4 - Jul 10",
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
            ],
          ),
          SizedBox(height: 16.setHeight),
          SizedBox(
            height: 150.setHeight,
            child: BarChart(
              BarChartData(
                barGroups: currentData.asMap().entries.map((entry) {
                  int index = entry.key;
                  double value = entry.value;
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: maxGoal,
                        rodStackItems: [
                          BarChartRodStackItem(
                            0,
                            maxGoal,
                            CustomAppColor.of(context).bgScaffold,
                          ),
                          BarChartRodStackItem(0, value, Color(0xFF37E1FF)),
                        ],
                        width: 35,
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ],
                  );
                }).toList(),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false, reservedSize: 35),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final days = [
                          'Today',
                          'Tue',
                          'Wed',
                          'Thu',
                          'Fri',
                          'Sat',
                          'Sun',
                        ];
                        String label = days[value.toInt()];
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: CommonText(
                            text: label,
                            fontSize: 12,
                            fontWeight: label == "Today"
                                ? FontWeight.w600
                                : FontWeight.w500,
                            textColor: label == "Today"
                                ? CustomAppColor.of(context).txtBlack
                                : CustomAppColor.of(context).txtGrey,
                          ),
                        );
                      },
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: CustomAppColor.of(context).grey,
                    ),
                  ),
                ),
                gridData: FlGridData(show: false),
                barTouchData: BarTouchData(enabled: false),
              ),
            ),
          ),
          SizedBox(height: 20.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonText(
                text: "${Languages.of(context).txtWeeklyAverage}:2,000 Ml",
                textColor: CustomAppColor.of(context).txtPurple,
                fontSize: 14.setFontSize,
              ),
            ],
          ),
          SizedBox(height: 15.setHeight),

          TabBar(
            controller: _tabController,
            labelColor: CustomAppColor.of(context).txtPurple,
            unselectedLabelColor: CustomAppColor.of(context).txtGrey,
            indicatorColor: CustomAppColor.of(context).txtPurple,
            dividerColor: Colors.transparent,
            indicatorWeight: 3,
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            onTap: (_) => setState(() {}),
            tabs: [
              Tab(
                child: Text(
                  "Week",
                  style: TextStyle(
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Month",
                  style: TextStyle(
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WeightChartView extends StatefulWidget {
  const WeightChartView({super.key});

  @override
  State<WeightChartView> createState() => _WeightChartViewState();
}

class _WeightChartViewState extends State<WeightChartView>
    with TickerProviderStateMixin {
  final double maxGoal = 500;
  late TabController _tabController;
  double currentWeight = 80.0;
  final List<double> weekData = [500, 400, 350, 250, 210, 160, 110];
  final List<double> monthData = [300, 450, 150, 500, 320, 220, 420];
  bool isKg = true;
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  List<double> get currentData =>
      _tabController.index == 0 ? weekData : monthData;

  @override
  Widget build(BuildContext context) {
    final double currentWeight = 80.0;

    return Container(
      color: CustomAppColor.of(context).containerBgPurple,
      padding: EdgeInsets.only(
        left: 24.setWidth,
        top: 20.setHeight,
        right: 24.setWidth,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtWeight,
                fontSize: 18.setFontSize,
                fontWeight: FontWeight.w700,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              InkWell(
                onTap: () => showWeightBottomSheet(),
                child: CommonText(
                  text: Languages.of(context).txtAdd.toUpperCase(),
                  fontSize: 18.setFontSize,
                  fontWeight: FontWeight.w700,
                  textColor: CustomAppColor.of(context).txtPurple,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.setHeight),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonText(
                  text: "80.00 Kg",
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
                CommonText(
                  text: "Last 30 Days",
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.setHeight),
          SizedBox(
            height: 200.setHeight,
            child: LineChart(
              LineChartData(
                minY: 76,
                maxY: 84,
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 35,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        );
                      },
                      interval: 2,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    axisNameSize: 32,
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        final labels = [
                          '09/05',
                          '10',
                          '11',
                          '12',
                          '13',
                          '14',
                          '15',
                        ];
                        if (value.toInt() >= 0 &&
                            value.toInt() < labels.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              labels[value.toInt()],
                              style: TextStyle(fontSize: 12),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),

                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  horizontalInterval: 2,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.withValues(alpha: 0.3),
                    strokeWidth: 1,
                  ),
                  drawVerticalLine: true,
                  getDrawingVerticalLine: (value) {
                    if (value == 0) {
                      return FlLine(
                        color: Colors.grey.withValues(alpha: 0.3),
                        strokeWidth: 1,
                        dashArray: [5, 4], // dotted line
                      );
                    } else {
                      return FlLine(
                        color: Colors.transparent, // hide others
                        strokeWidth: 0,
                      );
                    }
                  },
                ),

                lineBarsData: [
                  LineChartBarData(
                    isCurved: false,
                    color: Colors.transparent,
                    barWidth: 2,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 6,
                          color: CustomAppColor.of(context).primary, // purple
                        );
                      },
                    ),
                    spots: [
                      FlSpot(0, currentWeight),
                      FlSpot(1, 0),
                      FlSpot(2, 0),
                      FlSpot(3, 0),
                      FlSpot(4, 0),
                      FlSpot(5, 0),
                      FlSpot(6, 0),
                    ],
                  ),
                ],

                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: CustomAppColor.of(context).grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.setHeight),
        ],
      ),
    );
  }

  void showWeightBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SafeArea(
          bottom: true,
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                padding: EdgeInsets.symmetric(
                  vertical: 16.setHeight,
                  horizontal: 21.setWidth,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: Languages.of(context).txtAddWeight,
                          fontSize: 24.setFontSize,
                          fontWeight: FontWeight.w700,
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    TableCalendar(
                      firstDay: DateTime.utc(2023, 5, 7),
                      lastDay: DateTime.now(),
                      focusedDay: _focusedDay,
                      calendarFormat: _calendarFormat,
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay; // Update focused day
                        });
                      },
                      onFormatChanged: (format) {
                        if (_calendarFormat != format) {
                          setState(() {
                            _calendarFormat = format;
                          });
                        }
                      },
                      onPageChanged: (focusedDay) {
                        _focusedDay = focusedDay;
                      },
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: CustomAppColor.of(context).primary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        leftChevronMargin: EdgeInsets.only(left: 80.setWidth),
                        rightChevronMargin: EdgeInsets.only(right: 80.setWidth),
                      ),
                    ),
                    SizedBox(height: 16.setHeight),
                    Divider(),
                    SizedBox(height: 10.setHeight),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              child: Icon(
                                Icons.arrow_drop_up_sharp,
                                size: 60,
                                color: CustomAppColor.of(context).grey,
                              ),
                              onTap: () {
                                setState(() {
                                  currentWeight += isKg
                                      ? 0.1
                                      : 0.1 * 2.20462; // Increase by 0.1 unit
                                });
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10.setHeight),
                              height: 1.setHeight,
                              width: 80.setWidth,
                              color: CustomAppColor.of(context).primary,
                            ),
                            CommonText(
                              text: currentWeight.toStringAsFixed(2),
                              fontSize: 24.setFontSize,
                              fontWeight: FontWeight.bold,
                              textColor: CustomAppColor.of(context).txtPurple,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.setHeight),
                              height: 1.setHeight,
                              width: 80.setWidth,
                              color: CustomAppColor.of(context).primary,
                            ),
                            InkWell(
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 60,
                                color: CustomAppColor.of(context).grey,
                              ),
                              onTap: () {
                                setState(() {
                                  currentWeight -= isKg
                                      ? 0.1
                                      : 0.1 * 2.20462; // Decrease by 0.1 unit
                                  if (currentWeight < 0) {
                                    currentWeight =
                                        0; // Prevent negative weight
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(width: 25.setWidth),
                        Padding(
                          padding: EdgeInsets.only(top: 57.setHeight),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (!isKg) {
                                      currentWeight =
                                          currentWeight /
                                          2.20462; // Convert lbs to kg
                                      isKg = true;
                                    }
                                  });
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 1.setHeight,
                                      width: 70.setWidth,
                                      margin: EdgeInsets.only(
                                        bottom: 10.setHeight,
                                      ),
                                      color: isKg
                                          ? CustomAppColor.of(context).primary
                                          : Colors.transparent,
                                    ),
                                    CommonText(
                                      text: "KG",
                                      fontSize: 24.setFontSize,
                                      fontWeight: FontWeight.bold,
                                      textColor: isKg
                                          ? CustomAppColor.of(context).txtPurple
                                          : CustomAppColor.of(context).txtGrey,
                                    ),
                                    Container(
                                      height: 1.setHeight,
                                      width: 70.setWidth,
                                      margin: EdgeInsets.only(
                                        top: 10.setHeight,
                                      ),
                                      color: isKg
                                          ? CustomAppColor.of(context).primary
                                          : Colors.transparent,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 25.setWidth),
                              // LBS Option
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (isKg) {
                                      currentWeight =
                                          currentWeight *
                                          2.20462; // Convert kg to lbs
                                      isKg = false;
                                    }
                                  });
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 1.setHeight,
                                      width: 70.setWidth,
                                      margin: EdgeInsets.only(
                                        bottom: 10.setHeight,
                                      ),
                                      color: !isKg
                                          ? CustomAppColor.of(context).primary
                                          : Colors.transparent,
                                    ),
                                    CommonText(
                                      text: "LBS",
                                      fontSize: 24.setFontSize,
                                      fontWeight: FontWeight.bold,
                                      textColor: !isKg
                                          ? CustomAppColor.of(context).txtPurple
                                          : CustomAppColor.of(context).txtGrey,
                                    ),
                                    Container(
                                      height: 1.setHeight,
                                      width: 70.setWidth,
                                      margin: EdgeInsets.only(
                                        top: 10.setHeight,
                                      ),
                                      color: !isKg
                                          ? CustomAppColor.of(context).primary
                                          : Colors.transparent,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.setHeight),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: CommonButton(
                            text: Languages.of(context).txtCancel,
                            buttonTextColor: CustomAppColor.of(
                              context,
                            ).txtPurpleWhite,
                            buttonColor: CustomAppColor.of(
                              context,
                            ).containerBgPurple,
                          ),
                        ),
                        SizedBox(width: 15.setWidth),
                        Expanded(
                          child: CommonButton(
                            text: Languages.of(context).txtSave,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class BestRecordsListView extends StatelessWidget {
  final List<BestRecords> bestRecordList;

  const BestRecordsListView({super.key, required this.bestRecordList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).containerBgPurple,
      padding: EdgeInsets.symmetric(
        horizontal: 24.setWidth,
        vertical: 20.setHeight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtBestRecords,
            fontSize: 20.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 5.setHeight),
            itemCount: bestRecordList.length,
            itemBuilder: (context, index) {
              final activity = bestRecordList[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.setWidth,
                    vertical: 10.setHeight,
                  ),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).bgScaffold,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).containerBgPurple,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          activity.icon,
                          height: 24.setHeight,
                          width: 24.setWidth,
                          color: CustomAppColor.of(context).icBlack,
                        ),
                      ),
                      SizedBox(width: 17.setWidth),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: activity.title.toUpperCase(),
                              fontWeight: FontWeight.w700,
                              fontSize: 15.setFontSize,
                              textColor: CustomAppColor.of(context).txtBlack,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    CommonText(
                                      text: activity.description.toString(),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24.setFontSize,
                                      textColor: CustomAppColor.of(
                                        context,
                                      ).txtPurple,
                                    ),
                                    CommonText(
                                      text: activity.trailingString.toString(),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.setFontSize,
                                      textColor: CustomAppColor.of(
                                        context,
                                      ).txtPurple,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 15.setHeight),
                                  child: CommonText(
                                    text: activity.date ?? "",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.setFontSize,
                                    textColor: CustomAppColor.of(
                                      context,
                                    ).txtBlack,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
