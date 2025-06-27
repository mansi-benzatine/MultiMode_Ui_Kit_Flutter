import 'package:flutter/material.dart';
import 'package:food_delivery_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_app_package/localization/language/languages.dart';
import 'package:food_delivery_app_package/ui/chat/views/chat_screen.dart';
import 'package:food_delivery_app_package/ui/general_issues/datamodels/general_issues_data.dart';
import 'package:food_delivery_app_package/utils/app_color.dart';
import 'package:food_delivery_app_package/utils/constant.dart';
import 'package:food_delivery_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_app_package/widgets/button/common_button.dart';
import 'package:food_delivery_app_package/widgets/text/common_text.dart';

import '../../../widgets/top_bar/topbar.dart';

class GeneralIssuesScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const GeneralIssuesScreen());
  }

  const GeneralIssuesScreen({super.key});

  @override
  State<GeneralIssuesScreen> createState() => _GeneralIssuesScreenState();
}

class _GeneralIssuesScreenState extends State<GeneralIssuesScreen> implements TopBarClickListener {
  List<GeneralIssuesData> generalIssuesList = [];

  void fillData() {
    generalIssuesList = [
      GeneralIssuesData(
        issuesTitle: "What is customer care number?",
        solution: "All donations related queries are being handled by our donations partner.",
      ),
      GeneralIssuesData(
        issuesTitle: "I have query related to placing an order",
        solution: "All donations related queries are being handled by our donations partner.",
      ),
      GeneralIssuesData(
        issuesTitle: "I an unable to log in on",
        solution: "All donations related queries are being handled by our donations partner.",
      ),
      GeneralIssuesData(
        issuesTitle: "I have a payment or refund related query",
        solution: "All donations related queries are being handled by our donations partner.",
      ),
      GeneralIssuesData(
        issuesTitle: "I have a query related to donations",
        solution: "All donations related queries are being handled by our donations partner.",
      ),
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
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtGeneralIssues,
              isShowBack: true,
            ),
            Expanded(
              child: GeneralIssuesListView(
                generalIssuesList: generalIssuesList,
                onToggle: (index) {
                  setState(() {
                    generalIssuesList[index].isExpanded = !generalIssuesList[index].isExpanded;
                  });
                },
              ),
            ),
            Container(
              color: CustomAppColor.of(context).detailScreenBg,
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
              child: Column(
                children: [
                  CommonButton(
                    text: Languages.of(context).txtSendAMessage.toUpperCase(),
                    onTap: () => Navigator.push(context, ChatScreen.route(isFromPastThread: false)),
                  ),
                  SizedBox(height: 7.setHeight),
                  CommonText(
                    text: Languages.of(context).txtWeWillRevertWithin2448Hrs,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtGrey,
                  ),
                ],
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

class GeneralIssuesListView extends StatelessWidget {
  final List<GeneralIssuesData> generalIssuesList;
  final Function(int index) onToggle;

  const GeneralIssuesListView({
    super.key,
    required this.generalIssuesList,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).detailScreenBg,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: generalIssuesList.length,
        itemBuilder: (context, index) {
          final issue = generalIssuesList[index];
          return Container(
            color: CustomAppColor.of(context).bgScaffold,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => onToggle(index),
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.setHeight, left: 24.setWidth, right: 24.setWidth, bottom: 16.setHeight),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CommonText(
                            text: issue.issuesTitle,
                            fontSize: 16.setFontSize,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            letterSpacing: -0.3,
                          ),
                        ),
                        Icon(
                          issue.isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                          color: CustomAppColor.of(context).txtGrey,
                        )
                      ],
                    ),
                  ),
                ),
                AnimatedCrossFade(
                  firstChild: Container(),
                  secondChild: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 12.setHeight),
                    child: CommonText(
                      text: issue.solution,
                      fontSize: 16.setFontSize,
                      textColor: CustomAppColor.of(context).txtGrey,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.3,
                    ),
                  ),
                  crossFadeState: issue.isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                ),
                if (index != generalIssuesList.length - 1)
                  Divider(
                    color: CustomAppColor.of(context).containerBorder,
                    thickness: 1,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
