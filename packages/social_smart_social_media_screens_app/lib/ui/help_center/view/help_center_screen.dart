import 'package:flutter/material.dart';
import 'package:social_smart_social_media_screens_app_package/utils/utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/string_constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/textfield/common_textformfield.dart';
import '../../edit_profile/datamodel/edit_profile_data.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const HelpCenterScreen(),
    );
  }

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> with TickerProviderStateMixin {
  List<String> tabList = [];
  late TabController _controller;
  bool? isSelectedCategory;
  List<Map<String, String>> privacyPolicyContent = List.generate(
    5,
    (index) => {
      "title": AppStrings.faqTitle,
      "description": AppStrings.faqDescription,
    },
  );
  List<String> faqCategories = [];
  List<EditProfileData> helpCenterList = [];
  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabList = [
      Languages.of(context).faq,
      Languages.of(context).contactUs,
    ];
    faqCategories = [
      Languages.of(context).general,
      Languages.of(context).account,
      Languages.of(context).service,
      Languages.of(context).video,
    ];
  }

  void fillData() {
    helpCenterList = [
      EditProfileData(label: Languages.of(context).customerService, icon: AppAssets.icCustomerService),
      EditProfileData(label: Languages.of(context).whatsapp, icon: AppAssets.icWhatAppFilled),
      EditProfileData(label: Languages.of(context).website, icon: AppAssets.icWebsite),
      EditProfileData(label: Languages.of(context).facebook, icon: AppAssets.icFacebookColored),
      EditProfileData(label: Languages.of(context).twitter, icon: AppAssets.icTwitterFilled),
      EditProfileData(label: Languages.of(context).instagram, icon: AppAssets.icInstagramFill),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomAppColor.of(context).bgScaffold,
          leading: IgnorePointer(
              ignoring: true,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              )),
          centerTitle: false,
          titleSpacing: 0,
          title: CommonText(
            text: Languages.of(context).helpCenter,
            fontWeight: FontWeight.w700,
            fontSize: AppSizes.setFontSize(20),
          ),
        ),
        body: Column(
          children: [
            tabBar(),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  faqTabView(),
                  contactTabView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabBar() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(15), horizontal: AppSizes.setWidth(22)),
      child: TabBar(
        controller: _controller,
        indicatorSize: TabBarIndicatorSize.tab,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        unselectedLabelColor: CustomAppColor.of(context).icGrey,
        labelStyle: TextStyle(
          fontFamily: Constant.fontFamilyUrbanist,
          fontSize: AppSizes.setFontSize(16),
          fontWeight: FontWeight.w600,
        ),
        labelColor: AppColor.txtPurple,
        indicator: UnderlineTabIndicator(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(width: AppSizes.setWidth(3), color: AppColor.txtPurple),
        ),
        tabs: tabList.map((tab) {
          return SizedBox(
            width: AppSizes.setWidth(140),
            child: Tab(text: tab),
          );
        }).toList(),
      ),
    );
  }

  Widget faqTabView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        faqCategoryList(),
        Expanded(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12), horizontal: AppSizes.setWidth(24)),
              child: CommonTextFormField(
                fillColor: CustomAppColor.of(context).bgShadowTextFormField,
                leadingIcon: Image.asset(
                  AppAssets.icSearchFilled,
                  color: CustomAppColor.of(context).txtGrey,
                  scale: 5.5,
                ),
                hintText: Languages.of(context).search,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: privacyPolicyContent.length,
                itemBuilder: (context, index) {
                  final item = privacyPolicyContent[index];
                  return _itemFAQs(item["title"] ?? "", item["description"] ?? "");
                },
              ),
            )
          ],
        )),
      ],
    );
  }

  Widget faqCategoryList() {
    return Container(
      padding: EdgeInsets.only(left: AppSizes.setWidth(12)),
      height: AppSizes.setHeight(35),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: faqCategories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(8)),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(14), vertical: AppSizes.setHeight(2)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: AppColor.btnGradiant2, width: 1.6),
                color: index == 0 ? AppColor.btnGradiant2 : CustomAppColor.of(context).txtWhite,
              ),
              child: Center(
                child: CommonText(
                  text: faqCategories[index],
                  fontWeight: FontWeight.w700,
                  fontSize: AppSizes.setFontSize(14),
                  textAlign: TextAlign.center,
                  textColor: index == 0 ? AppColor.txtWhite : AppColor.txtPurple,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget contactTabView() {
    final contact = helpCenterList;
    return ListView.builder(
      itemCount: contact.length,
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10), horizontal: AppSizes.setWidth(16)),
      itemBuilder: (context, index) {
        final contacts = contact[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(4)),
          child: Container(
            height: AppSizes.setHeight(60),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgBottomSheet,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacityPercent(0.05),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            margin: const EdgeInsets.only(bottom: 10),
            child: Center(
              child: ListTile(
                leading: Image.asset(
                  contacts.icon ?? '',
                  height: AppSizes.setHeight(20),
                  width: AppSizes.setWidth(20),
                  fit: BoxFit.fill,
                ),
                title: CommonText(
                  text: contacts.label ?? '',
                  fontWeight: FontWeight.w700,
                  fontSize: AppSizes.setFontSize(16),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _itemFAQs(String title, String description) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(24), vertical: AppSizes.setHeight(6)),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgBottomSheet,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: CustomAppColor.of(context).black.withOpacityPercent(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        showTrailingIcon: true,
        trailing: Image.asset(
          AppAssets.icArrowDown,
          scale: 4,
        ),
        iconColor: AppColor.primary,
        childrenPadding: EdgeInsets.only(
          left: AppSizes.setWidth(20),
          right: AppSizes.setWidth(20),
          bottom: AppSizes.setHeight(20),
        ),
        tilePadding: EdgeInsets.only(
          left: AppSizes.setWidth(20),
          right: AppSizes.setWidth(20),
          top: AppSizes.setHeight(2),
          bottom: AppSizes.setHeight(2),
        ),
        title: CommonText(
          text: title,
          fontSize: AppSizes.setFontSize(16),
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.start,
        ),
        children: [
          Divider(color: CustomAppColor.of(context).bgDivider, height: 0.2),
          SizedBox(height: AppSizes.setWidth(15)),
          CommonText(
            text: description,
            textAlign: TextAlign.start,
            fontSize: AppSizes.setFontSize(14),
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
