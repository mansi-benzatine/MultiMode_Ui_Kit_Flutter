import 'package:flutter/material.dart';
import 'package:run_tracker_step_counter_water_reminder_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_step_counter_water_reminder_app/localization/language/languages.dart';
import 'package:run_tracker_step_counter_water_reminder_app/ui/subscription/datamodels/subscription_data.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/app_assets.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/app_color.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/constant.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_app/widgets/button/common_button.dart';
import 'package:run_tracker_step_counter_water_reminder_app/widgets/text/common_text.dart';
import 'package:run_tracker_step_counter_water_reminder_app/widgets/top_bar/topbar.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => SubscriptionScreen());
  }

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen>
    implements TopBarClickListener {
  List<SubscriptionData> detailsList = [];
  List<SubscriptionPlan> plans = [];
  int selectedIndex = 1;
  void fillData() {
    detailsList = [
      SubscriptionData(
        icon: AppAssets.icAllLocation,
        description: Languages.of(context).txtAllLocationDesc,
        title: Languages.of(context).txtAllLocation.toUpperCase(),
      ),
      SubscriptionData(
        icon: AppAssets.icTopSpeed,
        description: Languages.of(context).txtTopSpeedDesc,
        title: Languages.of(context).txtTopSpeed.toUpperCase(),
      ),
      SubscriptionData(
        icon: AppAssets.icNoads,
        description: Languages.of(context).txtNoAdsDesc,
        title: Languages.of(context).txtNoAds.toUpperCase(),
      ),
    ];

    plans = [
      SubscriptionPlan(
        title: Languages.of(context).txtFree,
        duration: "7 Days Trial",
        price: "After Trial, Pay\$50 Per Week",
      ),
      SubscriptionPlan(
        title: Languages.of(context).txtPlus,
        duration: "1 Year",
        price: "Pay \$500.00 Per Month",
      ),
      SubscriptionPlan(
        title: Languages.of(context).txtGoPro,
        duration: "5 Year",
        price: "Pay \$1000.00 Per Year",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              simpleTitle: Languages.of(context).txtSubscription,
              isShowSimpleTitle: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SubscriptionDetailsView(detailsList: detailsList),
                      SizedBox(height: 25.setHeight),
                      PlanSelectionView(
                        plans: plans,
                        selectedIndex: selectedIndex,
                      ),
                      SizedBox(height: 30.setHeight),

                      CommonText(
                        text: Languages.of(context).txtTryOutTheFreeTrial,
                        fontStyle: FontStyle.italic,
                        textColor: CustomAppColor.of(context).txtGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.setFontSize,
                      ),
                      SizedBox(height: 25.setHeight),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.setWidth),
                        child: CommonButton(
                          text: Languages.of(context).txtGetStarted,
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ),
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

class SubscriptionDetailsView extends StatelessWidget {
  final List<SubscriptionData> detailsList;

  const SubscriptionDetailsView({super.key, required this.detailsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: detailsList.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = detailsList[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.setHeight),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(item.icon, height: 40.setHeight, width: 40.setWidth),
              SizedBox(width: 16.setWidth),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: item.title,
                      fontSize: 16.setFontSize,
                      fontWeight: FontWeight.w700,
                      textColor: CustomAppColor.of(context).txtPurple,
                    ),
                    SizedBox(height: 4.setHeight),
                    CommonText(
                      text: item.description,
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PlanSelectionView extends StatefulWidget {
  final int selectedIndex;
  final List<SubscriptionPlan> plans;

  const PlanSelectionView({
    super.key,
    required this.selectedIndex,
    required this.plans,
  });

  @override
  State<PlanSelectionView> createState() => _PlanSelectionViewState();
}

class _PlanSelectionViewState extends State<PlanSelectionView> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.plans.length, (index) {
        final plan = widget.plans[index];
        final isSelected = index == selectedIndex;

        Color backgroundColor;
        if (index == 0) {
          backgroundColor = Colors.lime;
        } else if (index == 1) {
          backgroundColor = Colors.lightBlueAccent;
        } else {
          backgroundColor = Colors.red;
        }

        return GestureDetector(
          onTap: () => setState(() => selectedIndex = index),
          child: Container(
            margin: EdgeInsets.only(bottom: 14.setHeight),
            padding: EdgeInsets.symmetric(
              horizontal: 18.setWidth,
              vertical: 12.setHeight,
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      text: plan.title,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.setFontSize,
                      textColor: Colors.white,
                    ),
                    Icon(
                      isSelected
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: Colors.white,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    SizedBox(
                      width: 90.setWidth,
                      child: CommonText(
                        textAlign: TextAlign.start,
                        text: plan.duration,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.setFontSize,
                        textColor: Colors.white,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    CommonText(
                      text: plan.price,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.setFontSize,
                      textColor: Colors.white,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
