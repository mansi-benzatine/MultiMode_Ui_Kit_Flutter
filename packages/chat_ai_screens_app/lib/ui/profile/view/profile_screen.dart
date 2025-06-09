import 'package:flutter/material.dart';

import '../../../dialogs/bottom_sheet/logout_bottom_sheet.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/view/dotted_divider_view.dart';
import '../../app/my_app.dart';
import '../../edit_profile/view/edit_profile_screen.dart';
import '../../help_center/view/help_center_screen.dart';
import '../../languages/view/languages_screen.dart';
import '../../notification_settings/view/notification_settings_screen.dart';
import '../../privacy_policy/view/privacy_policy_screen.dart';
import '../../security/view/security_screen.dart';
import '../../upgrade_plan/view/upgrade_plan_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ValueNotifier<bool> isDarkMode = ValueNotifier(false);

  _fillData() {
    bool isDarkModePref = Utils.isDarkTheme();

    isDarkMode.value = isDarkModePref;
  }

  @override
  Widget build(BuildContext context) {
    _fillData();

    return Column(
      children: [
        SizedBox(height: 10.setHeight),
        const _TopBarView(),
        Expanded(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
            child: Column(
              children: [
                SizedBox(height: 15.setHeight),
                const _ProfileDetailsView(),
                SizedBox(height: 25.setHeight),
                const _PurchaseCardView(),
                _OptionView(isDarkMode),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TopBarView extends StatelessWidget {
  const _TopBarView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.setHeight),
      child: Row(
        children: [
          IgnorePointer(
            ignoring: true,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Image.asset(
                AppAssets.icBack,
                width: 24.setWidth,
                height: 24.setHeight,
              ),
            ),
          ),
          Expanded(
            child: CommonText(
              text: Languages.of(context).txtProfile,
              fontWeight: FontWeight.w700,
              fontSize: 24.setFontSize,
              textColor: CustomAppColor.of(context).txtBlack,
              height: 1,
              textAlign: TextAlign.center,
            ),
          ),
          IgnorePointer(
            ignoring: true,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Image.asset(
                AppAssets.icSearch,
                width: 24.setWidth,
                height: 24.setHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileDetailsView extends StatelessWidget {
  const _ProfileDetailsView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            height: 100.setHeight,
            width: 100.setWidth,
            child: Stack(
              children: [
                Image.asset(
                  AppAssets.imgDummyProfile,
                  height: 100.setHeight,
                  width: 100.setWidth,
                ),
                Positioned(
                    bottom: 0.setHeight,
                    right: 0.setWidth,
                    child: Image.asset(
                      AppAssets.icEdit,
                      height: 27.setHeight,
                      width: 27.setWidth,
                    ))
              ],
            ),
          ),
        ),
        SizedBox(height: 20.setHeight),
        CommonText(
          text: "Sharon F. Hart",
          fontWeight: FontWeight.w700,
          fontSize: 20.setFontSize,
          textColor: CustomAppColor.of(context).txtBlack,
          height: 1,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 5.setHeight),
        CommonText(
          text: "SharonFHart@yourdomain.com",
          fontWeight: FontWeight.w400,
          fontSize: 15.setFontSize,
          textColor: CustomAppColor.of(context).txtBlack,
          height: 1,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

class _PurchaseCardView extends StatelessWidget {
  const _PurchaseCardView();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 0.screenWidth,
        height: 165.setHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage(AppAssets.imgBgPurchaseCard),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20.setHeight,
          vertical: 20.setHeight,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
              text: Languages.of(context).txtUpgradePlan,
              fontWeight: FontWeight.w800,
              fontSize: 24.setFontSize,
              textColor: CustomAppColor.of(context).white,
              height: 1,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 15.setHeight),
            CommonText(
              text: Languages.of(context).txtUpgradePlanDesc,
              fontWeight: FontWeight.w600,
              fontSize: 14.setFontSize,
              textColor: CustomAppColor.of(context).white,
              height: 1,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 15.setHeight),
            IgnorePointer(
              ignoring: true,
              child: CommonButton(
                text: Languages.of(context).txtGetPremium,
                alignment: Alignment.centerLeft,
                buttonTextSize: 14.setFontSize,
                height: 38.setHeight,
                width: 150.setWidth,
                buttonColor: CustomAppColor.of(context).white,
                onTap: () {
                  Navigator.push(context, UpgradePlanScreen.route());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionView extends StatelessWidget {
  final ValueNotifier<bool> switchValue;

  const _OptionView(this.switchValue);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25.setHeight),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.icTheme,
              height: 38.setHeight,
              width: 38.setHeight,
              gaplessPlayback: true,
            ),
            SizedBox(width: 15.setWidth),
            Expanded(
              child: CommonText(
                text: Languages.of(context).txtDarkMode,
                fontWeight: FontWeight.w700,
                fontSize: 18.setFontSize,
                textColor: CustomAppColor.of(context).txtBlack,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(width: 10.setWidth),
            IgnorePointer(
              ignoring: true,
              child: ValueListenableBuilder(
                valueListenable: switchValue,
                builder: (context, value, widget) {
                  return Switch(
                    value: value,
                    onChanged: (bool value) {
                      switchValue.value = value;

                      getIt.get<LocalStorageService>().setBool(LocalStorageService.isLightTheme, switchValue.value);

                      ChatAiScreensApp.changeTheme(context, ThemeData.light());
                    },
                    activeColor: CustomAppColor.of(context).black,
                    activeTrackColor: CustomAppColor.of(context).primary,
                    inactiveThumbColor: CustomAppColor.of(context).white,
                    inactiveTrackColor: CustomAppColor.of(context).lineColor,
                    trackOutlineWidth: WidgetStateProperty.all(0),
                    trackOutlineColor: WidgetStateProperty.all(CustomAppColor.of(context).transparent),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 5.setHeight),
        DottedDividerView(
          height: 1.setHeight,
          dashWidth: 5.setWidth,
          dashSpace: 3.setWidth,
        ),
        SizedBox(height: 10.setHeight),
        _itemOption(
          context: context,
          image: AppAssets.icProfile,
          title: Languages.of(context).txtEditProfile,
          onClick: () {
            Navigator.push(context, EditProfileScreen.route());
          },
        ),
        IgnorePointer(
          ignoring: true,
          child: _itemOption(
            context: context,
            image: AppAssets.icNotificationRound,
            title: Languages.of(context).txtNotificationSettings,
            onClick: () {
              Navigator.push(context, NotificationSettingsScreen.route());
            },
          ),
        ),
        _itemOption(
          context: context,
          image: AppAssets.icSecurity,
          title: Languages.of(context).txtSecurity,
          onClick: () {
            Navigator.push(context, SecurityScreen.route());
          },
        ),
        _itemOption(
          context: context,
          image: AppAssets.icLanguage,
          title: Languages.of(context).txtLanguage,
          onClick: () {
            Navigator.push(context, LanguagesScreen.route());
          },
        ),
        IgnorePointer(
          ignoring: true,
          child: _itemOption(
            context: context,
            image: AppAssets.icHelpCenter,
            title: Languages.of(context).txtHelpCenter,
            onClick: () {
              Navigator.push(context, HelpCenterScreen.route());
            },
          ),
        ),
        IgnorePointer(
          ignoring: true,
          child: _itemOption(
            context: context,
            image: AppAssets.icPrivacyPolicy,
            title: Languages.of(context).txtPrivacyPolicy,
            onClick: () {
              Navigator.push(context, PrivacyPolicyScreen.route());
            },
          ),
        ),
        _itemOption(
          context: context,
          image: AppAssets.icLogout,
          title: Languages.of(context).txtLogout,
          textColor: CustomAppColor.of(context).txtRed,
          onClick: () {
            Utils.showBottomSheetDialog(
              context,
              title: Languages.of(context).txtLogout,
              titleColor: CustomAppColor.of(context).txtRed,
              widgets: LogoutBottomDataSheet(
                onLogout: () {
                  Navigator.pop(context);
                },
              ),
            );
          },
        ),
      ],
    );
  }

  _itemOption({
    required BuildContext context,
    required title,
    required String image,
    Color? textColor,
    required VoidCallback onClick,
  }) {
    return IgnorePointer(
      ignoring: title == Languages.of(context).txtLogout ? false : true,
      child: InkWell(
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
                    textColor: textColor ?? CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.start,
                  ),
                ),
                Image.asset(
                  AppAssets.icArrowRight,
                  height: 18.setHeight,
                  width: 18.setHeight,
                  gaplessPlayback: true,
                ),
              ],
            ),
            SizedBox(height: 10.setHeight),
            title == Languages.of(context).txtLogout
                ? const SizedBox()
                : DottedDividerView(
                    height: 1.setHeight,
                    dashWidth: 5.setWidth,
                    dashSpace: 3.setWidth,
                  ),
            SizedBox(height: 10.setHeight),
          ],
        ),
      ),
    );
  }
}
