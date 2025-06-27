import 'package:flutter/material.dart';
import 'package:food_delivery_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_app_package/ui/faqs/datamodels/faqs_data.dart';
import 'package:food_delivery_app_package/utils/app_color.dart';
import 'package:food_delivery_app_package/utils/constant.dart';
import 'package:food_delivery_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const FaqsScreen());
  }

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> implements TopBarClickListener {
  List<FaqsData> sections = [];

  void fillData() {
    sections = [
      FaqsData(
          title: 'Lorem Ipsum is simply dummy text?',
          description:
              "All donations related queries are being handled by our donations partner. All donations related queries are being handledby our donations partner."),
      FaqsData(
          title: 'Lorem Ipsum is simply dummy text?',
          description:
              "All donations related queries are being handled by our donations partner. All donations related queries are being handledby our donations partner."),
      FaqsData(
          title: 'Lorem Ipsum is simply dummy text?',
          description:
              "All donations related queries are being handled by our donations partner. All donations related queries are being handledby our donations partner."),
      FaqsData(
          title: 'Lorem Ipsum is simply dummy text?',
          description:
              "All donations related queries are being handled by our donations partner. All donations related queries are being handledby our donations partner."),
      FaqsData(
          title: 'Lorem Ipsum is simply dummy text?',
          description:
              "All donations related queries are being handled by our donations partner. All donations related queries are being handledby our donations partner."),
      FaqsData(
          title: 'Lorem Ipsum is simply dummy text?',
          description:
              "All donations related queries are being handled by our donations partner. All donations related queries are being handledby our donations partner."),
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
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtFAQs,
              isShowBack: true,
            ),
            Expanded(
              child: FaqsListVIew(
                faqsList: sections,
                onToggle: (index) {
                  setState(() {
                    sections[index].isExpanded = !sections[index].isExpanded;
                  });
                },
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

class FaqsListVIew extends StatelessWidget {
  final List<FaqsData> faqsList;
  final Function(int index) onToggle;

  const FaqsListVIew({
    super.key,
    required this.faqsList,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: faqsList.length,
      itemBuilder: (context, index) {
        final issue = faqsList[index];
        return Container(
          color: CustomAppColor.of(context).bgScaffold,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => onToggle(index),
                child: Padding(
                  padding: EdgeInsets.only(top: 12.setHeight, left: 24.setWidth, right: 24.setWidth, bottom: 12.setHeight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CommonText(
                          text: issue.title,
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
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
                  child: CommonText(
                    text: issue.description,
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
              if (index != faqsList.length - 1)
                Divider(
                  color: CustomAppColor.of(context).containerBorder,
                  thickness: 2,
                ),
            ],
          ),
        );
      },
    );
  }
}
