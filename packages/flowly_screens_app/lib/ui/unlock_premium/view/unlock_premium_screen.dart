import 'package:flowly_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:flowly_screens_app/localization/language/languages.dart';
import 'package:flowly_screens_app/utils/app_color.dart';
import 'package:flowly_screens_app/utils/constant.dart';
import 'package:flowly_screens_app/utils/sizer_utils.dart';
import 'package:flowly_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../../widgets/button/common_button.dart';
import '../../../widgets/top_bar/topbar.dart';

class UnlockPremiumScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const UnlockPremiumScreen());
  }

  const UnlockPremiumScreen({super.key});

  @override
  State<UnlockPremiumScreen> createState() => _UnlockPremiumScreenState();
}

class _UnlockPremiumScreenState extends State<UnlockPremiumScreen> implements TopBarClickListener {
  int selectedPlan = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 10.setHeight, bottom: 20.setHeight),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xffFFCCD5),
                      const Color(0xffFEEDE1),
                      const Color(0xffFEEDE1).withValues(alpha: 0.1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    TopBar(
                      this,
                      title: "",
                      isShowBack: true,
                      iconColor: CustomAppColor.of(context).black,
                      appBarColor: CustomAppColor.of(context).transparent,
                    ),
                    SizedBox(height: 10.setHeight),
                    CommonText(
                      text: Languages.of(context).txtUnlockPremium,
                      fontSize: 24.setFontSize,
                      fontFamily: Constant.fontFamilyMulishExtraBold800,
                      textColor: CustomAppColor.of(context).primary,
                    ),
                    SizedBox(height: 6.setHeight),
                    CommonText(
                      text: Languages.of(context).txtUnlockPremiumDesc2,
                      textAlign: TextAlign.center,
                      fontSize: 12.setFontSize,
                      height: 1.4,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                    SizedBox(height: 20.setHeight),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          planTab("Monthly", 0),
                          planTab("Annual", 1),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.setHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 12,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CommonText(
                            text: selectedPlan == 0 ? "\$5.88" : "\$49.99",
                            fontSize: 32,
                            fontFamily: Constant.fontFamilyMulishExtraBold800,
                            textColor: CustomAppColor.of(context).primary,
                          ),
                          SizedBox(width: 4.setWidth),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.setHeight),
                            child: CommonText(
                              text: selectedPlan == 0 ? " /month" : " /year",
                              fontSize: 16.setFontSize,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 6.setHeight),
                      CommonText(
                        text: "7 days free trial, automatic renewal.",
                        fontSize: 13.setFontSize,
                        textColor: CustomAppColor.of(context).txtLightGrey,
                      ),
                      SizedBox(height: 15.setHeight),
                      ...featureList([
                        "Track Unlimited Cycles",
                        "Watch Ad-Free Self Care Videos",
                        "Full Data & Analysis",
                        "Mood & Symptom Trends",
                        "Premium Support",
                        "Try New Features Early",
                      ])
                    ],
                  ),
                ),
              ),
              Expanded(
                child: IgnorePointer(
                  ignoring: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CommonButton(
                      text: Languages.of(context).txtContinue,
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget planTab(String text, int index) {
    bool isSelected = selectedPlan == index;
    return GestureDetector(
      onTap: () => setState(() => selectedPlan = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? CustomAppColor.of(context).white : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: CommonText(
          text: text,
          textColor: isSelected ? CustomAppColor.of(context).primary : Colors.black.withValues(alpha: 0.6),
          fontFamily: Constant.fontFamilyMulishBold700,
        ),
      ),
    );
  }

  List<Widget> featureList(List<String> items) {
    return items
        .map(
          (e) => Padding(
            padding: EdgeInsets.symmetric(vertical: 6.setHeight),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: CustomAppColor.of(context).primary.withValues(alpha: 0.2),
                  size: 20,
                ),
                SizedBox(width: 12.setWidth),
                Expanded(
                  child: CommonText(
                    text: e,
                    fontSize: 14.setFontSize,
                    textAlign: TextAlign.start,
                    textColor: CustomAppColor.of(context).black,
                  ),
                )
              ],
            ),
          ),
        )
        .toList();
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
