import 'package:dating_screens_app_package/utils/sizer_utils.dart';
import 'package:dating_screens_app_package/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../datamodels/safety_tips_data.dart';

class SafetyTipsScreen extends StatefulWidget {
  const SafetyTipsScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SafetyTipsScreen());
  }

  @override
  State<SafetyTipsScreen> createState() => _SafetyTipsScreenState();
}

class _SafetyTipsScreenState extends State<SafetyTipsScreen> implements TopBarClickListener {
  final List<SafetyTip> safetyTips = [
    SafetyTip(
      title: "1. Protect Your Personal Information",
      description:
          "Don’t share your home address, financial info, work details, or contact number until you fully trust the person. Keep all communication within the app in the beginning.",
    ),
    SafetyTip(
      title: "2. Stay In The App For Chats",
      description:
          "Our messaging system is designed to protect your privacy. Avoid moving to text-based messaging platforms too quickly, as these are susceptible to scams.",
    ),
    SafetyTip(
      title: "3. Trust Your Instincts",
      description:
          "Listen to yourself. If a match is pressuring you, making you uncomfortable, or being overly secretive—end the chat or report them.",
    ),
    SafetyTip(
      title: "4. Watch Out For Scams",
      description:
          "Never send money or share bank details with anyone, no matter how convincing their story sounds. Romance scams are real—and it’s how they con people.",
    ),
    SafetyTip(
      title: "5. Meet In Public Places",
      description:
          "For the first few dates, always choose public, well-lit places. Avoid back alleys, quiet parks, or asking to be picked up or dropped off by someone you don’t know well.",
    ),
    SafetyTip(
      title: "6. Tell A Friend",
      description: "Before going on a date, inform a trusted friend or family member. Share your meeting place, date, and time with your friend.",
    ),
    SafetyTip(
      title: "7. Control Your Transportation",
      description: "Drive yourself or use a trusted ride service. Don’t rely on the date for transport. You can leave any time if you feel unsafe.",
    ),
  ];

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
              title: "Safety Tips",
              isShowBack: true,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
                child: ListView.separated(
                  itemCount: safetyTips.length,
                  separatorBuilder: (_, __) => SizedBox(height: 18.setHeight),
                  itemBuilder: (context, index) {
                    final tip = safetyTips[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: tip.title,
                          fontSize: 18.setFontSize,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 4.setHeight),
                        CommonText(
                          text: tip.description,
                          fontSize: 13.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtGrey,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
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
