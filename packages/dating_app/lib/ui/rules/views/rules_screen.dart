import 'package:dating_app_package/localization/language/languages.dart';
import 'package:dating_app_package/ui/fill_up_information/views/fill_up_information_screen.dart';
import 'package:dating_app_package/ui/rules/datamodels/rules_data.dart';
import 'package:dating_app_package/utils/app_assets.dart';
import 'package:dating_app_package/utils/app_color.dart';
import 'package:dating_app_package/utils/sizer_utils.dart';
import 'package:dating_app_package/widgets/button/common_button.dart';
import 'package:dating_app_package/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

class RulesScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const RulesScreen());
  }

  const RulesScreen({super.key});

  @override
  State<RulesScreen> createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen> {
  List<RulesData> rulesList = [];

  void fillData() {
    rulesList = [
      RulesData(title: "Be your best version", description: "Accuracy wings every time"),
      RulesData(title: "Keep it fresh", description: "Well let you know when update your profile"),
      RulesData(title: "Show respect always", description: "Meet me promote safe and respectful dating"),
      RulesData(title: "Safety and privacy first", description: "Well never share your personal information"),
      RulesData(title: "Bad apples", description: "Always report rotten apples"),
    ];
  }

  @override
  void initState() {
    super.initState();
    fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const LogoWithDescription(),
                    SizedBox(height: 18.setHeight),
                    Expanded(child: RuleListView(rulesList: rulesList)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.setHeight, bottom: 30.setHeight),
                child: CommonButton(
                  text: Languages.of(context).txtContinue.toUpperCase(),
                  onTap: () => Navigator.push(context, FillUpInformationScreen.route()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LogoWithDescription extends StatelessWidget {
  const LogoWithDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20.setHeight),
          Image.asset(
            AppAssets.icLogo,
            height: 100.setHeight,
            width: 100.setWidth,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtWelcomeToMeetMe,
            textColor: CustomAppColor.of(context).txtVelvet,
            fontWeight: FontWeight.w900,
            fontSize: 24.setFontSize,
          ),
          CommonText(
            text: Languages.of(context).txtPleaseFollowThisRules,
            textColor: CustomAppColor.of(context).txtVelvet,
            fontWeight: FontWeight.w400,
            fontSize: 16.setFontSize,
          )
        ],
      ),
    );
  }
}

class RuleListView extends StatelessWidget {
  final List<RulesData> rulesList;
  const RuleListView({super.key, required this.rulesList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: rulesList.length,
      padding: EdgeInsets.zero,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = rulesList[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4.setHeight),
          child: Container(
            padding: EdgeInsets.only(left: 15.setWidth, top: 12.setHeight, bottom: 12.setHeight, right: 30.setWidth),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: CustomAppColor.of(context).bgRuleContainer,
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 9.setWidth, vertical: 9.setHeight),
                  decoration: BoxDecoration(color: CustomAppColor.of(context).bgScaffold, shape: BoxShape.circle),
                  child: Image.asset(
                    AppAssets.icCheck,
                    height: 23.setHeight,
                    width: 23.setWidth,
                  ),
                ),
                SizedBox(width: 8.setWidth),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: item.title,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.setFontSize,
                        textColor: CustomAppColor.of(context).txtVelvet,
                      ),
                      CommonText(
                        text: item.description,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.setFontSize,
                        textColor: CustomAppColor.of(context).txtVelvet,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
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
}
