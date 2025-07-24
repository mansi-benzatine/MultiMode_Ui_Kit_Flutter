import 'package:flutter/material.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/localization/language/languages.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_assets.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_color.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/constant.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/text/common_text.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/top_bar/topbar.dart';

import '../datamodels/history_data.dart';

class HistoryScreen extends StatefulWidget {
  static Route<void> route() =>
      MaterialPageRoute(builder: (_) => const HistoryScreen());

  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    implements TopBarClickListener {
  bool isSelecting = false;
  final List<HistoryItem> historyList = [
    HistoryItem(
      title: "Walk",
      distance: "0.00 mile",
      time: "00:00:38",
      kcal: "0 kcal",
      steps: "0 Steps",
      image: AppAssets.imgMapView,
    ),
    HistoryItem(
      title: "Run",
      distance: "0.00 mile",
      time: "00:00:38",
      kcal: "0 kcal",
      steps: "0 Steps",
      image: AppAssets.imgMapView,
    ),
    HistoryItem(
      title: "Run",
      distance: "0.00 mile",
      time: "00:00:38",
      kcal: "0 kcal",
      steps: "0 Steps",
      image: AppAssets.imgMapView,
    ),
    HistoryItem(
      title: "Walk",
      distance: "0.00 mile",
      time: "00:00:38",
      kcal: "0 kcal",
      steps: "0 Steps",
      image: AppAssets.imgMapView,
    ),
  ];

  final Set<int> selectedIndexes = {};

  void toggleSelect(int index) {
    setState(() {
      if (selectedIndexes.contains(index)) {
        selectedIndexes.remove(index);
      } else {
        selectedIndexes.add(index);
      }
    });
  }

  void toggleSelectionMode() {
    setState(() {
      isSelecting = !isSelecting;
      if (!isSelecting) selectedIndexes.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TopBar(
              this,
              simpleTitle: Languages.of(context).txtHistory,
              isShowBack: true,
              isShowSimpleTitle: true,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TotalDistanceView(),
                  SizedBox(height: 20.setHeight),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: Languages.of(context).txtToday,
                          fontSize: 22.setFontSize,
                          fontWeight: FontWeight.w600,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: CustomAppColor.of(context).txtBlack,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: IconButton(
                            icon: isSelecting
                                ? Icon(Icons.close, color: Colors.red)
                                : Icon(Icons.delete_outline, color: Colors.red),
                            onPressed: toggleSelectionMode,
                          ),
                        ),
                      ],
                    ),
                  ),

                  HistoryListView(
                    historyList: historyList,
                    isSelecting: isSelecting,
                    selectedIndexes: selectedIndexes,
                    toggleSelectionMode: toggleSelectionMode,
                    toggleSelect: toggleSelect,
                  ),
                ],
              ),
            ),
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
}

class TotalDistanceView extends StatelessWidget {
  const TotalDistanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CommonText(
            text: "0.01",
            fontSize: 32.setFontSize,
            fontWeight: FontWeight.w700,
          ),
          CommonText(
            text: Languages.of(context).txtTotalDistanceMile,
            fontSize: 18.setFontSize,
            textColor: CustomAppColor.of(context).txtGrey,
          ),
        ],
      ),
    );
  }
}

class HistoryListView extends StatefulWidget {
  final List<HistoryItem> historyList;
  final Set<int> selectedIndexes;
  final Function() toggleSelectionMode;
  final Function(int index) toggleSelect;
  final bool isSelecting;

  const HistoryListView({
    super.key,
    required this.historyList,
    required this.selectedIndexes,
    required this.toggleSelectionMode,
    required this.isSelecting,
    required this.toggleSelect,
  });

  @override
  State<HistoryListView> createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.historyList.length,
        padding: EdgeInsets.symmetric(
          vertical: 10.setHeight,
          horizontal: 24.setWidth,
        ),
        itemBuilder: (context, index) {
          final item = widget.historyList[index];
          final isSelected = widget.selectedIndexes.contains(index);

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4.setHeight),
            child: GestureDetector(
              onLongPress: widget.toggleSelectionMode,
              onTap: widget.isSelecting
                  ? () => widget.toggleSelect(index)
                  : null,
              child: Container(
                margin: EdgeInsets.only(bottom: 12.setHeight),
                padding: EdgeInsets.all(12.setWidth),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: CustomAppColor.of(context).containerBgwhite,
                  boxShadow: [
                    BoxShadow(
                      color: CustomAppColor.of(
                        context,
                      ).black.withValues(alpha: 0.05),
                      offset: Offset(1, 1),
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        item.image,
                        height: 79.setHeight,
                        width: 79.setWidth,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12.setWidth),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: item.title,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.setFontSize,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              '${item.distance.split(' ')[0]} ',
                                          style: TextStyle(
                                            fontSize: 24.setFontSize,
                                            fontWeight: FontWeight.w700,
                                            color: CustomAppColor.of(
                                              context,
                                            ).txtBlack,
                                          ),
                                        ),
                                        TextSpan(
                                          text: item.distance.split(' ')[1],
                                          style: TextStyle(
                                            fontSize: 16.setFontSize,
                                            fontWeight: FontWeight.w500,
                                            color: CustomAppColor.of(
                                              context,
                                            ).txtBlack,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              if (widget.isSelecting)
                                Icon(
                                  isSelected
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank,
                                  color: isSelected
                                      ? CustomAppColor.of(context).primary
                                      : CustomAppColor.of(context).txtGrey,
                                ),
                            ],
                          ),

                          SizedBox(height: 15.setHeight),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CommonText(
                                    text: item.time,
                                    fontSize: 12.setFontSize,
                                    textColor: CustomAppColor.of(
                                      context,
                                    ).txtGrey,
                                  ),
                                  SizedBox(width: 10.setWidth),
                                  CommonText(
                                    text: item.kcal,
                                    fontSize: 12.setFontSize,
                                    textColor: CustomAppColor.of(
                                      context,
                                    ).txtGrey,
                                  ),
                                ],
                              ),
                              CommonText(
                                text: item.steps,
                                fontSize: 12.setFontSize,
                                textColor: CustomAppColor.of(context).txtGrey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
