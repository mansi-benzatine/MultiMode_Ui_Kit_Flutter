import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_screens_app_package/localization/language/languages.dart';
import 'package:food_delivery_screens_app_package/ui/all_conversations_threads/views/all_conversations_threads_screen.dart';
import 'package:food_delivery_screens_app_package/ui/faqs/views/faqs_screen.dart';
import 'package:food_delivery_screens_app_package/ui/general_issues/views/general_issues_screen.dart';
import 'package:food_delivery_screens_app_package/ui/term_and_condition/views/term_and_condition_screen.dart';
import 'package:food_delivery_screens_app_package/utils/app_color.dart';
import 'package:food_delivery_screens_app_package/utils/constant.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_screens_app_package/widgets/text/common_text.dart';
import 'package:food_delivery_screens_app_package/widgets/top_bar/topbar.dart';

class HelpsAndSupportScreen extends StatefulWidget {
  const HelpsAndSupportScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const HelpsAndSupportScreen());
  }

  @override
  State<HelpsAndSupportScreen> createState() => _HelpsAndSupportScreenState();
}

class _HelpsAndSupportScreenState extends State<HelpsAndSupportScreen> implements TopBarClickListener {
  @override
  void initState() {
    super.initState();
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
              title: Languages.of(context).txtHelpsAndSupport,
            ),
            const IgnorePointer(
              ignoring: true,
              child: Column(
                children: [
                  HelpWithOtherQueriesView(),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: CustomAppColor.of(context).detailScreenBg,
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

class HelpWithOtherQueriesView extends StatelessWidget {
  const HelpWithOtherQueriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: double.infinity,
          color: CustomAppColor.of(context).detailScreenBg,
          padding: EdgeInsets.only(left: 24.setWidth, top: 15.setHeight, right: 24.setWidth, bottom: 10.setHeight),
          child: CommonText(
            text: Languages.of(context).txtHelp.toUpperCase(),
            fontWeight: FontWeight.w600,
            fontSize: 18.setFontSize,
          ),
        ),
        InkWell(
          onTap: () => Navigator.push(context, GeneralIssuesScreen.route()),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
            color: CustomAppColor.of(context).bgScaffold,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: Languages.of(context).txtGeneralIssues,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.setFontSize,
                ),
                Icon(
                  Icons.navigate_next_rounded,
                  color: CustomAppColor.of(context).txtGrey,
                )
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          width: double.infinity,
          color: CustomAppColor.of(context).detailScreenBg,
          padding: EdgeInsets.only(left: 24.setWidth, top: 15.setHeight, right: 24.setWidth, bottom: 10.setHeight),
          child: CommonText(
            text: Languages.of(context).txtSupport.toUpperCase(),
            fontWeight: FontWeight.w600,
            fontSize: 18.setFontSize,
          ),
        ),
        Container(
          color: CustomAppColor.of(context).bgScaffold,
          child: Column(
            children: [
              InkWell(
                onTap: () => Navigator.push(context, TermAndConditionScreen.route()),
                child: Padding(
                  padding: EdgeInsets.only(left: 24.setWidth, right: 24.setWidth, bottom: 10.setHeight, top: 20.setHeight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: Languages.of(context).txtTermAndCondition,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.setFontSize,
                      ),
                      Icon(
                        Icons.navigate_next_rounded,
                        color: CustomAppColor.of(context).txtGrey,
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: CustomAppColor.of(context).containerBorder,
                thickness: 2,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.setWidth, right: 24.setWidth, bottom: 20.setHeight, top: 10.setHeight),
                child: InkWell(
                  onTap: () => Navigator.push(context, FaqsScreen.route()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: Languages.of(context).txtFAQs,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.setFontSize,
                      ),
                      Icon(
                        Icons.navigate_next_rounded,
                        color: CustomAppColor.of(context).txtGrey,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          width: double.infinity,
          color: CustomAppColor.of(context).detailScreenBg,
          padding: EdgeInsets.only(left: 24.setWidth, top: 15.setHeight, right: 24.setWidth, bottom: 10.setHeight),
          child: CommonText(
            text: Languages.of(context).txtConversationArchive.toUpperCase(),
            fontWeight: FontWeight.w600,
            fontSize: 18.setFontSize,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
          color: CustomAppColor.of(context).bgScaffold,
          child: InkWell(
            onTap: () => Navigator.push(context, AllConversationsThreadsScreen.route()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: Languages.of(context).txtAllConversationsThreads,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.setFontSize,
                ),
                Icon(
                  Icons.navigate_next_rounded,
                  color: CustomAppColor.of(context).txtGrey,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
