import 'package:flutter/material.dart';
import 'package:run_tracker_screens_app/localization/language/languages.dart';
import 'package:run_tracker_screens_app/utils/app_assets.dart';
import 'package:run_tracker_screens_app/utils/app_color.dart';
import 'package:run_tracker_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_screens_app/widgets/button/common_button.dart';
import 'package:run_tracker_screens_app/widgets/text/common_text.dart';

class SubscriptionScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => SubscriptionScreen());
  }

  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> plans = [
    {
      'title': '1 Month',
      'price': '₹599.99',
      'color': Color(0xFF2EA3C0), // Blue
    },
    {
      'title': '6 Month',
      'price': '₹8999.99',
      'color': Color(0xFFC1E241), // Green
    },
    {
      'title': '12 Month',
      'price': '₹9999.99',
      'color': Color(0xFFE3A337), // Orange
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Image.asset(AppAssets.imgSubscriptionBg, fit: BoxFit.cover),
            Positioned(
              top: 50.setHeight,
              right: 30.setWidth,
              child: IgnorePointer(
                ignoring: true,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).bgScaffold,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.close,
                      color: CustomAppColor.of(context).primary,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              top: 160.setHeight,
              child: Image.asset(
                AppAssets.imgItIsTimeToRun,
                height: 123.setHeight,
                width: 186.setWidth,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgScaffold,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 15.setHeight),
                    Container(
                      height: 4.setHeight,
                      width: 50.setWidth,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    SizedBox(height: 10.setHeight),
                    CommonText(
                      text: Languages.of(
                        context,
                      ).txtSubscriptionPlan.toUpperCase(),
                      fontWeight: FontWeight.w800,
                      fontSize: 20.setFontSize,
                    ),
                    SizedBox(height: 8.setHeight),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.setWidth),
                      child: CommonText(
                        text: Languages.of(context).txtSubscriptionPlanDesc,
                        textAlign: TextAlign.center,
                        textColor: CustomAppColor.of(context).txtDarkGrey,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 10.setHeight),
                    ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                      itemCount: plans.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final isSelected = selectedIndex == index;
                        final plan = plans[index];
                        return GestureDetector(
                          onTap: () => setState(() => selectedIndex = index),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 1.setHeight,
                                horizontal: 1.setWidth,
                              ),
                              decoration: BoxDecoration(
                                color: plan['color'],
                                border: Border.all(
                                  color: plan['color'],
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 14.setHeight,
                                  horizontal: 16.setWidth,
                                ),
                                decoration: BoxDecoration(
                                  color: plan['color'],
                                  border: Border.all(
                                    color: CustomAppColor.of(
                                      context,
                                    ).bgScaffold,
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 20.setHeight,
                                      width: 20.setWidth,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isSelected
                                            ? CustomAppColor.of(
                                                context,
                                              ).bgScaffold
                                            : Colors.transparent,
                                        border: Border.all(
                                          color: CustomAppColor.of(
                                            context,
                                          ).bgScaffold,
                                          width: 2,
                                        ),
                                      ),
                                      child: isSelected
                                          ? Icon(
                                              Icons.check,
                                              color: plan['color'],
                                              size: 16,
                                            )
                                          : null,
                                    ),
                                    SizedBox(width: 12.setWidth),
                                    Expanded(
                                      child: CommonText(
                                        text: plan['title'],
                                        textColor: CustomAppColor.of(
                                          context,
                                        ).bgScaffold,
                                        fontSize: 18.setFontSize,
                                        fontWeight: FontWeight.w700,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    CommonText(
                                      text: plan['price'],
                                      textColor: CustomAppColor.of(
                                        context,
                                      ).bgScaffold,
                                      fontSize: 18.setFontSize,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 15.setHeight),
                    Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).bgScaffold,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(22),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: CustomAppColor.of(
                              context,
                            ).grey.withValues(alpha: 0.1),
                            offset: const Offset(0, -3),
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(
                        top: 20.setHeight,
                        right: 22.setWidth,
                        left: 22.setWidth,
                      ),
                      child: CommonButton(
                        buttonColor: CustomAppColor.of(context).txtBlack,
                        text: Languages.of(context).txtSubscribe,
                        buttonTextColor: CustomAppColor.of(context).txtWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
