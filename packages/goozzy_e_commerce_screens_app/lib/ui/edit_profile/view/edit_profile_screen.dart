import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:goozzy_e_commerce_screens_app_package/utils/utils.dart';

import '../../../../../interfaces/top_bar_click_listener.dart';
import '../../../../../localization/language/languages.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/string_constant.dart';
import '../../../../../widgets/button/common_button.dart';
import '../../../../../widgets/text/common_text.dart';
import '../../../../../widgets/topbar/topbar.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/bottom_sheet/bottom_sheet.dart';
import '../../../widgets/textfield/common_textformfield.dart';
import '../../app/my_app.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const EditProfileScreen());
  }

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> with TickerProviderStateMixin implements TopBarClickListener {
  late TabController _tabController;
  List<String> tabList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabList = [
      Languages.of(context).primary,
      Languages.of(context).otherInfo,
      Languages.of(context).settings,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgTopBar,
        body: Column(
          children: [
            IgnorePointer(
              ignoring: true,
              child: TopBar(
                this,
                title: Languages.of(context).editProfile,
                isShowBack: true,
                isShowShadow: false,
                textColor: CustomAppColor.of(context).txtBlack,
                topBarColor: CustomAppColor.of(context).bgTopBar,
              ),
            ),
            Expanded(
                child: Column(
              children: [
                _tabBar(),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: tabList.map((tab) {
                      if (tab == Languages.of(context).primary) {
                        return SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(16), horizontal: AppSizes.setWidth(16)),
                            child: _primaryFields(),
                          ),
                        );
                      } else if (tab == Languages.of(context).otherInfo) {
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _informationFields(),
                              SizedBox(height: AppSizes.setHeight(12)),
                              InkWell(
                                onTap: () => addEducationBottomSheet(context),
                                child: Container(
                                  color: CustomAppColor.of(context).bgScaffold,
                                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(23), horizontal: AppSizes.setWidth(16)),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        AppAssets.icAdd,
                                        width: AppSizes.setWidth(24),
                                        height: AppSizes.setHeight(24),
                                      ),
                                      SizedBox(width: AppSizes.setWidth(30)),
                                      CommonText(
                                        text: Languages.of(context).addEducation,
                                        fontWeight: FontWeight.w600,
                                        fontSize: AppSizes.setFontSize(16),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: AppSizes.setHeight(12)),
                              Container(
                                color: CustomAppColor.of(context).bgScaffold,
                                padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(23), horizontal: AppSizes.setWidth(16)),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      AppAssets.icAdd,
                                      width: AppSizes.setWidth(24),
                                      height: AppSizes.setHeight(24),
                                    ),
                                    SizedBox(width: AppSizes.setWidth(30)),
                                    CommonText(
                                      text: Languages.of(context).addAWorkplace,
                                      fontWeight: FontWeight.w600,
                                      fontSize: AppSizes.setFontSize(16),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: AppSizes.setHeight(12)),
                              Container(
                                  color: CustomAppColor.of(context).bgScaffold,
                                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(23), horizontal: AppSizes.setWidth(16)),
                                  child: CommonButton(
                                    btnText: Languages.of(context).save,
                                  )),
                            ],
                          ),
                        );
                      } else {
                        return SingleChildScrollView(
                          child: Column(
                            children: [_settingsFields()],
                          ),
                        );
                      }
                    }).toList(),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  _addProfile() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(21)),
          child: Container(
            padding: EdgeInsets.only(top: AppSizes.setHeight(13)),
            height: AppSizes.setHeight(78),
            width: AppSizes.setWidth(78),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomAppColor.of(context).white,
              border: Border.all(color: CustomAppColor.of(context).borderGrey, width: 0.2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                AppAssets.icAvatar,
                height: AppSizes.setHeight(74),
                width: AppSizes.setWidth(74),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        CommonText(
          text: Languages.of(context).addPicture.toUpperCase(),
          textColor: CustomAppColor.of(context).txtPurple,
          fontWeight: FontWeight.w700,
          fontSize: AppSizes.setFontSize(15),
        )
      ],
    );
  }

  _primaryFields() {
    return Column(
      children: [
        _addProfile(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(16)),
          child: CommonTextFormField(
            fillColor: CustomAppColor.of(context).bgTopBar,
            labelText: Languages.of(context).fullName,
            radius: 8,
            isRequiredLabel: true,
          ),
        ),
        CommonTextFormField(
          fillColor: CustomAppColor.of(context).bgTopBar,
          labelText: Languages.of(context).phoneNumber,
          hintText: AppStrings.phoneNumber,
          radius: 8,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(16)),
          child: CommonTextFormField(
            fillColor: CustomAppColor.of(context).bgTopBar,
            labelText: Languages.of(context).eMail,
            radius: 8,
          ),
        ),
        CommonTextFormField(
          fillColor: CustomAppColor.of(context).bgTopBar,
          labelText: Languages.of(context).gender,
          radius: 8,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(16)),
          child: CommonTextFormField(
            fillColor: CustomAppColor.of(context).bgTopBar,
            radius: 8,
            hintText: Languages.of(context).languageSpoken,
            isRequiredHint: true,
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12)),
              child: Image.asset(
                AppAssets.icDownArrow,
                height: AppSizes.setHeight(7),
                width: AppSizes.setWidth(14),
              ),
            ),
          ),
        ),
        CommonTextFormField(
          hintText: Languages.of(context).occupation,
          isRequiredHint: true,
          fillColor: CustomAppColor.of(context).bgTopBar,
          radius: 8,
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12)),
            child: Image.asset(
              AppAssets.icDownArrow,
              height: AppSizes.setHeight(7),
              width: AppSizes.setWidth(14),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(16)),
          child: CommonTextFormField(
            fillColor: CustomAppColor.of(context).bgTopBar,
            hintText: Languages.of(context).aboutMe,
            isRequiredHint: true,
            radius: 8,
            maxLines: 3,
            maxLength: 500,
          ),
        ),
        CommonTextFormField(
          fillColor: CustomAppColor.of(context).bgTopBar,
          hintText: Languages.of(context).myBusinessName,
          isRequiredHint: true,
          radius: 8,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(16)),
          child: CommonTextFormField(
            fillColor: CustomAppColor.of(context).bgTopBar,
            hintText: Languages.of(context).pinCode,
            isRequiredHint: true,
            radius: 8,
          ),
        ),
        CommonTextFormField(
          fillColor: CustomAppColor.of(context).bgTopBar,
          hintText: Languages.of(context).city,
          isRequiredHint: true,
          radius: 8,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(16)),
          child: CommonTextFormField(
            fillColor: CustomAppColor.of(context).bgTopBar,
            hintText: Languages.of(context).state,
            isRequiredHint: true,
            radius: 8,
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12)),
              child: Image.asset(
                AppAssets.icDownArrow,
                height: AppSizes.setHeight(7),
                width: AppSizes.setWidth(14),
              ),
            ),
          ),
        ),
        CommonButton(
          btnText: Languages.of(context).save,
          radius: 4,
        )
      ],
    );
  }

  _settingsFields() {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(16), vertical: AppSizes.setHeight(20)),
        child: CommonText(
          text: Languages.of(context).chooseTheInformationYouWantToShowOnYourSocialProfile,
          fontWeight: FontWeight.w600,
          fontSize: AppSizes.setFontSize(15),
          textAlign: TextAlign.start,
          maxLines: 3,
        ),
      ),
      Container(
        color: CustomAppColor.of(context).bgScaffold,
        padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(20), horizontal: AppSizes.setWidth(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: Languages.of(context).showMyWishlist,
              fontWeight: FontWeight.w600,
              fontSize: AppSizes.setFontSize(16),
            ),
            FlutterSwitch(
              value: true,
              onToggle: (bool newValue) {},
              activeColor: CustomAppColor.of(context).icPurple.withOpacityPercent(0.2),
              inactiveColor: CustomAppColor.of(context).txtGrey,
              activeToggleColor: CustomAppColor.of(context).icPurple,
              inactiveToggleColor: CustomAppColor.of(context).white,
              width: AppSizes.setWidth(38),
              height: AppSizes.setHeight(20),
              toggleSize: 22.0,
              borderRadius: 16.0,
              padding: 0,
            )
          ],
        ),
      ),
      SizedBox(height: AppSizes.setHeight(3)),
      Container(
        color: CustomAppColor.of(context).bgScaffold,
        padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(20), horizontal: AppSizes.setWidth(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: Languages.of(context).showSharedCatalogs,
              fontWeight: FontWeight.w600,
              fontSize: AppSizes.setFontSize(16),
            ),
            FlutterSwitch(
              value: true,
              onToggle: (bool newValue) {},
              activeColor: CustomAppColor.of(context).icPurple.withOpacityPercent(0.2),
              inactiveColor: CustomAppColor.of(context).txtGrey,
              activeToggleColor: CustomAppColor.of(context).icPurple,
              inactiveToggleColor: CustomAppColor.of(context).white,
              width: AppSizes.setWidth(38),
              height: AppSizes.setHeight(20),
              toggleSize: 22.0,
              borderRadius: 16.0,
              padding: 0,
            )
          ],
        ),
      )
    ]);
  }

  _informationFields() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(16), horizontal: AppSizes.setWidth(16)),
      width: AppSizes.fullWidth,
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(22)),
            child: CommonTextFormField(
              radius: 8,
              hintText: Languages.of(context).dateOfBirth,
              isRequiredHint: true,
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12)),
                child: Image.asset(
                  AppAssets.icDownArrow,
                  height: AppSizes.setHeight(7),
                  width: AppSizes.setWidth(14),
                ),
              ),
            ),
          ),
          CommonTextFormField(
            hintText: Languages.of(context).maritalStatus,
            isRequiredHint: true,
            radius: 8,
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12)),
              child: Image.asset(
                AppAssets.icDownArrow,
                height: AppSizes.setHeight(7),
                width: AppSizes.setWidth(14),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(22)),
            child: CommonTextFormField(
              hintText: Languages.of(context).numberOfKids,
              isRequiredHint: true,
              radius: 8,
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12)),
                child: Image.asset(
                  AppAssets.icDownArrow,
                  height: AppSizes.setHeight(7),
                  width: AppSizes.setWidth(14),
                ),
              ),
            ),
          ),
          CommonTextFormField(
            hintText: Languages.of(context).education,
            isRequiredHint: true,
            radius: 8,
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12)),
              child: Image.asset(
                AppAssets.icDownArrow,
                height: AppSizes.setHeight(7),
                width: AppSizes.setWidth(14),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: AppSizes.setHeight(22), bottom: AppSizes.setHeight(2)),
            child: CommonTextFormField(
              hintText: Languages.of(context).monthlyIncome,
              isRequiredHint: true,
              radius: 8,
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12)),
                child: Image.asset(
                  AppAssets.icDownArrow,
                  height: AppSizes.setHeight(7),
                  width: AppSizes.setWidth(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _tabBar() {
    return TabBar(
      controller: _tabController,
      tabAlignment: TabAlignment.start,
      labelPadding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(14)),
      isScrollable: true,
      unselectedLabelColor: AppColor.txtGrey,
      labelStyle: TextStyle(
        fontFamily: Constant.fontFamilyUrbanist,
        fontSize: AppSizes.setFontSize(18),
        fontWeight: FontWeight.w600,
      ),
      labelColor: AppColor.txtPurple,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: AppSizes.setWidth(3), color: AppColor.txtPurple),
        insets: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
      ),
      tabs: tabList.map((tab) {
        return Tab(
          text: tab,
        );
      }).toList(),
    );
  }

  void addEducationBottomSheet(BuildContext context) {
    customBottomSheet(
      isPaddingRequired: false,
      isDone: false,
      maxHeightRatio: 0.48,
      context: context,
      title: Languages.of(context).addEducation,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(16), horizontal: AppSizes.setWidth(16)),
            child: CommonTextFormField(
              hintText: Languages.of(context).nameOfSchoolCollage,
              isRequiredHint: true,
              radius: 8,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(16)),
            child: CommonTextFormField(
              hintText: Languages.of(context).subject,
              isRequiredHint: true,
              radius: 8,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(16), horizontal: AppSizes.setWidth(16)),
            child: CommonTextFormField(
              hintText: Languages.of(context).endYear,
              isRequiredHint: true,
              radius: 8,
            ),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(6)),
            child: CommonButton(
                radius: 3,
                btnText: Languages.of(context).save,
                onTap: () {
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {String value = ""}) {
    if (name == AppStrings.back) {
      Navigator.pop(GoozzyECommerceScreensMyApp.navigatorKey.currentState!.context);
    }
  }
}
