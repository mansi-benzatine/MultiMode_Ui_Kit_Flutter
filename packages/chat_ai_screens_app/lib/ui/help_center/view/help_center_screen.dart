import 'package:chat_ai_screens_app_package/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../datamodel/help_center_data.dart';

class HelpCenterScreen extends StatefulWidget {
  final int currentIndex;
  const HelpCenterScreen({super.key, this.currentIndex = 0});

  static Route<void> route({int currentIndex = 0}) {
    return MaterialPageRoute<void>(
        builder: (_) => HelpCenterScreen(
              currentIndex: currentIndex,
            ));
  }

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> with TickerProviderStateMixin implements TopBarClickListener {
  late TabController tabController;
  late ValueNotifier<int> _currentTabIndex;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this, initialIndex: widget.currentIndex);

    _currentTabIndex = ValueNotifier(widget.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            IgnorePointer(
              ignoring: true,
              child: TopBar(
                this,
                title: Languages.of(context).txtHelpCenter,
              ),
            ),
            _TabBarView(tabController: tabController, currentTabIndex: _currentTabIndex),
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

class _TabBarView extends StatelessWidget {
  final TabController tabController;
  final ValueNotifier<int> currentTabIndex;

  const _TabBarView({required this.tabController, required this.currentTabIndex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: currentTabIndex,
            builder: (context, int value, child) {
              return Container(
                margin: EdgeInsets.only(
                  left: 15.setHeight,
                  right: 15.setHeight,
                  top: 15.setHeight,
                ),
                child: IgnorePointer(
                  ignoring: true,
                  child: TabBar(
                    controller: tabController,
                    padding: EdgeInsets.zero,
                    dividerHeight: 0,
                    splashBorderRadius: BorderRadius.circular(500),
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: CustomAppColor.of(context).transparent,
                    physics: const NeverScrollableScrollPhysics(),
                    onTap: (int i) {
                      currentTabIndex.value = i;
                    },
                    tabs: [
                      Container(
                        height: 50.setHeight,
                        width: 0.screenWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          color: (value == 0) ? CustomAppColor.of(context).primary : CustomAppColor.of(context).unSelectedTabColor,
                        ),
                        margin: EdgeInsets.only(right: 8.setWidth),
                        child: Tab(
                          height: 50.setHeight,
                          child: CommonText(
                            text: Languages.of(context).txtFaq,
                            fontWeight: (value == 0) ? FontWeight.w600 : FontWeight.w700,
                            fontSize: 18.setFontSize,
                            textColor: (value == 0) ? CustomAppColor.of(context).black : CustomAppColor.of(context).txtBlack,
                          ),
                        ),
                      ),
                      Container(
                        height: 50.setHeight,
                        width: 0.screenWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          color: (value == 1) ? CustomAppColor.of(context).primary : CustomAppColor.of(context).unSelectedTabColor,
                        ),
                        margin: EdgeInsets.only(left: 8.setWidth),
                        child: Tab(
                          height: 50.setHeight,
                          child: CommonText(
                            text: Languages.of(context).txtContactUs,
                            fontWeight: (value == 1) ? FontWeight.w600 : FontWeight.w700,
                            fontSize: 18.setFontSize,
                            textColor: (value == 1) ? CustomAppColor.of(context).black : CustomAppColor.of(context).txtBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          ValueListenableBuilder(
              valueListenable: currentTabIndex,
              builder: (context, value, _) {
                return Visibility(
                  visible: value == 0,
                  child: SizedBox(height: 20.setHeight),
                );
              }),
          ValueListenableBuilder(
              valueListenable: currentTabIndex,
              builder: (context, value, _) {
                return Visibility(
                  visible: value == 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                    child: TextFormField(
                      style: TextStyle(
                        fontSize: 16.setFontSize,
                        color: CustomAppColor.of(context).txtBlack,
                        fontWeight: FontWeight.w500,
                        fontFamily: Constant.fontFamily,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CustomAppColor.of(context).bgScreen,
                        hintText: "Search...",
                        hintStyle: TextStyle(
                          fontSize: 16.setFontSize,
                          color: CustomAppColor.of(context).txtGray,
                          fontWeight: FontWeight.w500,
                          fontFamily: Constant.fontFamily,
                        ),
                        prefixIcon: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Image.asset(
                              AppAssets.icSearch,
                              height: 10.setHeight,
                              width: 10.setHeight,
                              color: CustomAppColor.of(context).txtGray,
                              gaplessPlayback: true,
                            ),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: CustomAppColor.of(context).primary, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: CustomAppColor.of(context).primary, width: 2),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: CustomAppColor.of(context).primary, width: 2),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: CustomAppColor.of(context).primary, width: 2),
                        ),
                      ),
                    ),
                  ),
                );
              }),
          Expanded(
            child: TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                _FAQView(),
                _ContactUsView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FAQView extends StatefulWidget {
  const _FAQView();

  @override
  State<_FAQView> createState() => _FAQViewState();
}

class _FAQViewState extends State<_FAQView> {
  List<FAQData> questionAnswerList = [];

  void fillData() {
    questionAnswerList = [
      FAQData(answer: Languages.of(context).txtLoremIpsumDesc, question: "What is ChatAI?"),
      FAQData(answer: Languages.of(context).txtLoremIpsumDesc, question: "How to use ChatAI?"),
      FAQData(answer: Languages.of(context).txtLoremIpsumDesc, question: "How can i use new Features?"),
      FAQData(answer: Languages.of(context).txtLoremIpsumDesc, question: "Why can’t i make a payment?"),
      FAQData(answer: Languages.of(context).txtLoremIpsumDesc, question: "How do i can delete my account?"),
      FAQData(answer: Languages.of(context).txtLoremIpsumDesc, question: "What are features in ChatAI?"),
      FAQData(answer: Languages.of(context).txtLoremIpsumDesc, question: "What is credit refund?"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
      itemCount: questionAnswerList.length,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return _itemFAQs(context: context, fnq: questionAnswerList[index]);
      },
    );
  }

  _itemFAQs({required BuildContext context, required FAQData fnq}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: CustomAppColor.of(context).listTileColor),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.1),
            blurRadius: 0,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: CustomAppColor.of(context).txtWhite,
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 15.setHeight),
      child: ExpansionTile(
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        collapsedBackgroundColor: CustomAppColor.of(context).transparent,
        backgroundColor: CustomAppColor.of(context).primary.withOpacityPercent(.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: CommonText(
          text: fnq.question,
          textColor: CustomAppColor.of(context).txtBlack,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.start,
          fontSize: 18.setFontSize,
        ),
        iconColor: CustomAppColor.of(context).txtBlack,
        collapsedIconColor: CustomAppColor.of(context).txtBlack,
        tilePadding: EdgeInsets.only(
          left: 20.setWidth,
          right: 20.setWidth,
          top: 5.setHeight,
          bottom: 5.setHeight,
        ),
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).txtWhite,
              border: Border.all(color: CustomAppColor.of(context).listTileColor),
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
            ),
            padding: EdgeInsets.only(
              left: 20.setWidth,
              right: 20.setWidth,
              bottom: 20.setHeight,
              top: 10.setHeight,
            ),
            child: CommonText(
              text: fnq.answer,
              textColor: CustomAppColor.of(context).txtBlack,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.start,
              fontSize: 14.setFontSize,
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactUsView extends StatelessWidget {
  const _ContactUsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          _itemOption(
            context: context,
            title: Languages.of(context).txtCustomerService,
            image: AppAssets.icContactUsCustomerService,
          ),
          _itemOption(
            context: context,
            title: Languages.of(context).txtWhatsApp,
            image: AppAssets.icContactUsWhatsApp,
          ),
          _itemOption(
            context: context,
            title: Languages.of(context).txtFacebook,
            image: AppAssets.icContactUsFacebook,
          ),
          _itemOption(
            context: context,
            title: Languages.of(context).txtWebsite,
            image: AppAssets.icContactUsWebsite,
          ),
          _itemOption(
            context: context,
            title: Languages.of(context).txtTwitter,
            image: AppAssets.icContactUsTwitter,
          ),
          _itemOption(
            context: context,
            title: Languages.of(context).txtInstagram,
            image: AppAssets.icContactUsInstagram,
          ),
          _itemOption(
            context: context,
            title: Languages.of(context).txtTelegram,
            image: AppAssets.icContactUsTelegram,
          ),
          SizedBox(height: 50.setHeight),
        ],
      ),
    );
  }

  _itemOption({
    required BuildContext context,
    required title,
    required String image,
    VoidCallback? onClick,
  }) {
    return InkWell(
      onTap: onClick,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                image,
                height: 38.setHeight,
                width: 38.setHeight,
                gaplessPlayback: true,
              ),
              SizedBox(width: 15.setWidth),
              Expanded(
                child: CommonText(
                  text: title,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.setFontSize,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.setHeight),
          Divider(color: CustomAppColor.of(context).lineColor, thickness: .5),
          SizedBox(height: 5.setHeight),
        ],
      ),
    );
  }
}
