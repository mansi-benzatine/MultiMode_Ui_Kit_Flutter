import 'package:flutter/material.dart';
import 'package:mantra_yoga_app_package/utils/sizer_utils.dart';
import 'package:mantra_yoga_app_package/widgets/button/common_button.dart';

import '../../../dialogs/alerts/logout_dialog.dart';
import '../../../localization/language/languages.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/debug.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../widgets/text/common_text.dart';
import '../../app/my_app.dart';
import '../../help_center/view/help_center_screen.dart';
import '../../languages/view/languages_screen.dart';
import '../../notification_settings/view/notification_settings_screen.dart';
import '../../payment_method/view/payment_method_screen.dart';
import '../../personal_information/view/personal_information_screen.dart';
import '../../upgrade_plan/view/upgrade_plan_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ValueNotifier<bool> isDarkMode = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    isDarkMode.value = !getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _topBarView(),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 20.setHeight, bottom: 30.setHeight, left: 15.setWidth, right: 15.setWidth),
            child: Column(
              children: [
                _profileDetailsView(),
                SizedBox(height: 15.setHeight),
                _subscriptionCardView(),
                SizedBox(height: 25.setHeight),
                _listOfOptionsView(),
              ],
            ),
          ),
        )
      ],
    );
  }

  _topBarView() {
    return Container(
      padding: EdgeInsets.only(
        left: 15.setWidth,
        right: 15.setWidth,
        top: 10.setHeight,
      ),
      child: CommonText(
        text: Languages.of(context).txtProfile,
        fontSize: 18.setFontSize,
        fontWeight: FontWeight.w700,
        fontFamily: Constant.fontFamilyBold700,
        textColor: CustomAppColor.of(context).txtBlack,
        height: 1,
      ),
    );
  }

  _profileDetailsView() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 100.setWidth,
              height: 100.setHeight,
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgScreen,
                shape: BoxShape.circle,
                border: Border.all(color: CustomAppColor.of(context).borderColor),
              ),
              child: Icon(
                Icons.person_rounded,
                size: 80.setHeight,
                color: CustomAppColor.of(context).txtBlack,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                AppAssets.icEdit,
                width: 24.setHeight,
                height: 24.setHeight,
              ),
            ),
          ],
        ),
        SizedBox(height: 15.setHeight),
        CommonText(
          text: "John Doe",
          fontSize: 14.setFontSize,
          fontWeight: FontWeight.w700,
          fontFamily: Constant.fontFamilyBold700,
          textColor: CustomAppColor.of(context).txtBlack,
        ),
        CommonText(
          text: "john.doe@example.com",
          fontSize: 12.setFontSize,
          fontWeight: FontWeight.w400,
          fontFamily: Constant.fontFamilyRegular400,
          textColor: CustomAppColor.of(context).txtBlack,
        ),
      ],
    );
  }

  _subscriptionCardView() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, UpgradePlanScreen.route());
      },
      child: Container(
        width: 0.screenWidth,
        height: 110.setHeight,
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgScreen,
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
            image: AssetImage(AppAssets.imgBgSubscriptionCard),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(left: 15.setWidth, right: 15.setWidth),
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: Languages.of(context).txtPlanUpgradeForMore,
              fontSize: 16.setFontSize,
              fontWeight: FontWeight.w700,
              fontFamily: Constant.fontFamilyBold700,
              textColor: CustomAppColor.of(context).txtWhite,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 8.setHeight),
            CommonButton(
              text: Languages.of(context).txtGetPremium,
              width: 0.screenWidth / 2.8,
              height: 40.setHeight,
              onTap: () {},
              buttonColor: CustomAppColor.of(context).txtWhite,
              buttonTextColor: CustomAppColor.of(context).txtPrimary,
              radius: 12,
              borderColor: CustomAppColor.of(context).containerBorderAndBlack,
              borderWidth: 3,
              alignment: Alignment.centerLeft,
              buttonTextSize: 14.setFontSize,
            )
          ],
        ),
      ),
    );
  }

  _listOfOptionsView() {
    return Column(
      children: [
        _itemOfOptionsView(
          title: Languages.of(context).txtPersonalInformation,
          onTap: () {
            Navigator.push(context, PersonalInformationScreen.route());
          },
        ),
        _itemOfOptionsView(
          title: Languages.of(context).txtNotification,
          onTap: () {
            Navigator.push(context, NotificationSettingsScreen.route());
          },
        ),
        _itemOfOptionsView(
          title: Languages.of(context).txtPaymentMethod,
          onTap: () {
            Navigator.push(context, PaymentMethodScreen.route());
          },
        ),
        _itemOfOptionsView(
          title: Languages.of(context).txtLanguages,
          onTap: () {
            Navigator.push(context, LanguagesScreen.route());
          },
        ),
        _itemOfOptionsView(
          title: Languages.of(context).txtInviteFriends,
          onTap: () {},
        ),
        _itemOfOptionsView(
          title: Languages.of(context).txtDarkMode,
          onTap: () {},
          widget: ValueListenableBuilder(
            valueListenable: isDarkMode,
            builder: (context, value, child) {
              return SizedBox(
                width: 40.setWidth,
                height: 20.setHeight,
                child: Switch(
                  value: isDarkMode.value,
                  onChanged: (value) async {
                    isDarkMode.value = value;
                    getIt.get<LocalStorageService>().setBool(LocalStorageService.isLightTheme, !value);
                    await Future.delayed(const Duration(milliseconds: 100));
                    Debug.printLoge("isDarkMode.value", "${isDarkMode.value} ${getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: false)} ");
                    // ignore: use_build_context_synchronously
                    MantraYogaApp.changeTheme(context, AppTheme.getTheme(context));
                  },
                  activeColor: CustomAppColor.of(context).primary,
                  inactiveThumbColor: CustomAppColor.of(context).white,
                  inactiveTrackColor: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                  activeTrackColor: CustomAppColor.of(context).primary,
                  thumbColor: WidgetStateProperty.all(CustomAppColor.of(context).white),
                  trackOutlineWidth: WidgetStateProperty.all(0),
                  trackOutlineColor: WidgetStateProperty.all(CustomAppColor.of(context).transparent),
                ),
              );
            },
          ),
        ),
        _itemOfOptionsView(
          title: Languages.of(context).txtHelpCenter,
          onTap: () {
            Navigator.push(context, HelpCenterScreen.route());
          },
        ),
        InkWell(
          onTap: () {
            LogoutDialog.show(context);
          },
          child: CommonText(
            text: Languages.of(context).txtLogout,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w600,
            fontFamily: Constant.fontFamilySemiBold600,
            textColor: CustomAppColor.of(context).txtRed,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

  _itemOfOptionsView({required String title, required Function() onTap, Widget? widget, bool isShowDivider = true}) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Expanded(
                child: CommonText(
                  text: title,
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: Constant.fontFamilySemiBold600,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ),
              widget ??
                  Image.asset(
                    AppAssets.icArrowRight,
                    width: 20.setHeight,
                    height: 20.setHeight,
                    color: CustomAppColor.of(context).txtBlackAndGray,
                  ),
            ],
          ),
        ),
        if (isShowDivider)
          Divider(
            color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
            height: 30.setHeight,
          ),
      ],
    );
  }
}
