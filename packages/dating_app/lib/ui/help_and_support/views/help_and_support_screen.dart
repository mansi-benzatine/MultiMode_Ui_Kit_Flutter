import 'package:dating_app_package/interfaces/top_bar_click_listener.dart';
import 'package:dating_app_package/localization/language/languages.dart';
import 'package:dating_app_package/utils/app_assets.dart';
import 'package:dating_app_package/utils/app_color.dart';
import 'package:dating_app_package/utils/constant.dart';
import 'package:dating_app_package/utils/sizer_utils.dart';
import 'package:dating_app_package/widgets/text/common_text.dart';
import 'package:dating_app_package/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../datamodels/help_and_support_data.dart';

class HelpSupportScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const HelpSupportScreen());
  }

  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> with TickerProviderStateMixin implements TopBarClickListener {
  late TabController _tabController;
  int _selectedCategory = 0;
  List<String> faqTabs = [];
  List<FaqCategory> faqCategories = [];
  List<ContactItem> contacts = [];
  List<bool> isExpandedList = [];

  void fillData() {
    faqTabs = ['General', 'Account', 'Service', 'Fraud', 'Support'];
    faqCategories = [
      FaqCategory(title: 'General', items: [
        FaqItem(question: "Lorem Ipsum Is Simply Dummy Text?", answer: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
        FaqItem(
            question: "Lorem Ipsum Is Simply Dummy Text?",
            answer:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
        FaqItem(question: "Lorem Ipsum Is Simply Dummy Text?", answer: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
        FaqItem(
            question: "Lorem Ipsum Is Simply Dummy Text?",
            answer:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
        FaqItem(question: "Lorem Ipsum Is Simply Dummy Text?", answer: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
        FaqItem(question: "Lorem Ipsum Is Simply Dummy Text?", answer: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
      ]),
      FaqCategory(title: 'Account', items: [
        FaqItem(
            question: "Lorem Ipsum Is Simply Dummy Text?",
            answer:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
      ]),
      FaqCategory(title: 'Service', items: [
        FaqItem(
            question: "Lorem Ipsum Is Simply Dummy Text?",
            answer:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
        FaqItem(
            question: "Lorem Ipsum Is Simply Dummy Text?",
            answer:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
      ]),
      FaqCategory(title: 'Support', items: [
        FaqItem(
            question: "Lorem Ipsum Is Simply Dummy Text?",
            answer:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
      ]),
      FaqCategory(title: 'Fraud', items: [
        FaqItem(
            question: "Lorem Ipsum Is Simply Dummy Text?",
            answer:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
        FaqItem(
            question: "Lorem Ipsum Is Simply Dummy Text?",
            answer:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
      ]),
    ];
    contacts = [
      ContactItem(title: "Customer Service", iconPath: AppAssets.icHeadPhone),
      ContactItem(title: "WhatsApp", iconPath: AppAssets.icWhatsapp),
      ContactItem(title: "Facebook", iconPath: AppAssets.icFacebook),
      ContactItem(title: "Website", iconPath: AppAssets.icWebsite),
      ContactItem(title: "Twitter", iconPath: AppAssets.icTwitter),
      ContactItem(title: "Instagram", iconPath: AppAssets.icInstagram),
      ContactItem(title: "Telegram", iconPath: AppAssets.icTelegram),
    ];
    isExpandedList = List.generate(faqCategories[_selectedCategory].items.length, (_) => false);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {});
      }
    });
    fillData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              TopBar(
                this,
                title: Languages.of(context).txtHelpAndSupport,
                isShowBack: true,
              ),
              TabBar(
                controller: _tabController,
                indicatorColor: CustomAppColor.of(context).txtVelvet,
                unselectedLabelColor: CustomAppColor.of(context).txtGrey,
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.setFontSize,
                  fontFamily: Constant.fontFamily,
                  color: CustomAppColor.of(context).txtGrey,
                ),
                labelColor: CustomAppColor.of(context).txtVelvetPink,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.setFontSize,
                  fontFamily: Constant.fontFamily,
                  color: CustomAppColor.of(context).txtVelvetPink,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                indicatorWeight: 2.0, // Fixed invalid value
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 2.0,
                    color: CustomAppColor.of(context).txtVelvetPink,
                  ),
                ),
                tabs: [
                  Tab(
                    child: CommonText(
                      text: Languages.of(context).txtFAQ,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.setFontSize,
                      fontFamily: Constant.fontFamily,
                      textColor: _tabController.index == 0 ? CustomAppColor.of(context).txtVelvetPink : CustomAppColor.of(context).txtGrey,
                    ),
                  ),
                  Tab(
                    child: CommonText(
                      text: Languages.of(context).txtContactUs,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.setFontSize,
                      fontFamily: Constant.fontFamily,
                      textColor: _tabController.index == 1 ? CustomAppColor.of(context).txtVelvetPink : CustomAppColor.of(context).txtGrey,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildFaqTab(),
                    _buildContactTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFaqTab() {
    final selectedFaq = faqCategories[_selectedCategory].items;

    return Column(
      children: [
        SizedBox(height: 16.setHeight),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: List.generate(faqTabs.length, (index) {
              final isSelected = _selectedCategory == index;
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: ChoiceChip(
                  showCheckmark: false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(25),
                    side: BorderSide(
                      color: isSelected ? CustomAppColor.of(context).txtVelvetPink : CustomAppColor.of(context).txtVelvetPink,
                    ),
                  ),
                  label: CommonText(
                    text: faqTabs[index],
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                    textColor: isSelected ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtVelvetPink,
                  ),
                  backgroundColor: CustomAppColor.of(context).bgScaffold,
                  padding: EdgeInsetsGeometry.symmetric(vertical: 10.setHeight, horizontal: 15.setWidth),
                  selected: isSelected,
                  selectedColor: CustomAppColor.of(context).txtVelvetPink,
                  onSelected: (_) {
                    setState(() {
                      _selectedCategory = index;
                      isExpandedList = List.generate(faqCategories[_selectedCategory].items.length, (_) => false);
                    });
                  },
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 12.setHeight),
        Expanded(
          child: ListView.builder(
            itemCount: selectedFaq.length,
            itemBuilder: (context, index) {
              final item = selectedFaq[index];
              return _itemFAQs(index, item.question, item.answer);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildContactTab() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 27.setHeight),
      itemCount: contacts.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = contacts[index];
        return Container(
          padding: EdgeInsets.symmetric(vertical: 16.setHeight, horizontal: 20.setWidth),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgTextFormField,
            border: Border.all(color: CustomAppColor.of(context).textFormFieldBorder),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Image.asset(item.iconPath, width: 22.setWidth, height: 22.setHeight),
              SizedBox(width: 12.setWidth),
              CommonText(
                text: item.title,
                fontWeight: FontWeight.w400,
                fontSize: 16.setFontSize,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _itemFAQs(int index, String title, String description) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 6.setHeight),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgFAQ,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: CustomAppColor.of(context).black.withValues(alpha: 0.01),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ExpansionTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: CustomAppColor.of(context).greyDivider, width: 1),
            ),
            showTrailingIcon: true,
            trailing: Icon(
              isExpandedList[index] ? Icons.arrow_drop_up_rounded : Icons.arrow_drop_down_rounded,
              color: CustomAppColor.of(context).txtVelvet,
              size: 30,
            ),
            onExpansionChanged: (bool expanded) {
              setState(() {
                isExpandedList[index] = expanded;
              });
            },
            iconColor: CustomAppColor.of(context).txtVelvet,
            childrenPadding: EdgeInsets.zero,
            title: CommonText(
              text: title,
              textAlign: TextAlign.start,
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w700,
              textColor: CustomAppColor.of(context).txtVelvetPink,
            ),
            tilePadding: EdgeInsets.symmetric(horizontal: 10.setWidth),
            children: [
              Container(
                color: CustomAppColor.of(context).bgScaffold,
                width: double.infinity,
                child: Column(
                  children: [
                    Divider(color: CustomAppColor.of(context).greyDivider, height: 1),
                    SizedBox(height: 15.setHeight),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
                      child: CommonText(
                        text: description,
                        textAlign: TextAlign.start,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w500,
                        textColor: CustomAppColor.of(context).txtGrey,
                      ),
                    ),
                    SizedBox(height: 15.setHeight),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
