import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:mivi_app/localization/language/languages.dart';
import 'package:mivi_app/ui/about_mivi/view/about_mivi_screen.dart';
import 'package:mivi_app/ui/app/my_app.dart';
import 'package:mivi_app/ui/edit_profile/view/edit_profile_screen.dart';
import 'package:mivi_app/ui/mivi_pro/view/mivi_pro_screen.dart';
import 'package:mivi_app/ui/security/view/security_screen.dart';
import 'package:mivi_app/ui/setting/datamodel/setting_data.dart';
import 'package:mivi_app/utils/app_assets.dart';
import 'package:mivi_app/utils/app_color.dart';
import 'package:mivi_app/utils/preference.dart';
import 'package:mivi_app/utils/sizer_utils.dart';
import 'package:mivi_app/widgets/alert_dialog/logout_aleart_dialog.dart';

import '../../../utils/constant.dart';
import '../../../utils/service_locator.dart';
import '../../../utils/utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../languages/view/langugage_screen.dart';

class SettingScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SettingScreen());
  }

  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<SettingData> myInformationList(BuildContext context) {
    return [
      SettingData(
        title: Languages.of(context).txtAboutMivi,
        icon: AppAssets.icAboutMivi,
        onTap: () {
          Navigator.push(context, AboutMiviScreen.route());
        },
      ),
      SettingData(
        title: Languages.of(context).txtEditProfile,
        icon: AppAssets.icUser,
        onTap: () {
          Navigator.push(context, EditProfileScreen.route());
        },
      ),
      SettingData(
        title: Languages.of(context).txtSecurity,
        icon: AppAssets.icSecurity,
        onTap: () {
          Navigator.push(context, SecurityScreen.route());
        },
      ),
      SettingData(
        title: Languages.of(context).txtDarkTheme,
        icon: AppAssets.icDark,
        hasToggle: true,
        toggleValue: false,
      ),
      SettingData(
        title: Languages.of(context).txtLanguages,
        icon: AppAssets.icLanguage,
        onTap: () {
          Navigator.push(context, LanguagesScreen.route());
        },
      ),
      SettingData(
        title: Languages.of(context).txtLogout,
        icon: AppAssets.icLogout,
        onTap: () {
          showDialog(
            context: context,
            builder: (dialogContext) {
              return const LogoutDialog();
            },
          );
        },
      ),
    ];
  }

  ValueNotifier<bool> isDarkMode = ValueNotifier(false);
  ValueNotifier<bool> isPregnancyLoss = ValueNotifier(false);

  _fillData() {
    bool isDarkModePref = !Utils.isLightTheme();
    isDarkMode.value = isDarkModePref;
  }

  @override
  void initState() {
    super.initState();
    _fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 65.setHeight),
            profileInformationView(),
            SizedBox(height: 24.setHeight),
            proCardView(),
            SizedBox(height: 24.setHeight),
            CommonText(
              text: Languages.of(context).txtSettings,
              fontFamily: Constant.fontFamilyBold700,
              fontSize: 16.setFontSize,
            ),
            SizedBox(height: 12.setHeight),
            myProfileSettingsView(myInformationList(context)),
          ],
        ),
      ),
    );
  }

  Widget proCardView() {
    return GestureDetector(
      onTap: () => Navigator.push(context, MiviProScreen.route()),
      child: Container(
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).subscriptionContainerBg,
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.all(13),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).subscriptionBg,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(13),
              child: Image.asset(
                AppAssets.icMiviPro,
                height: 32.setWidth,
                width: 32.setWidth,
              ),
            ),
            SizedBox(width: 15.setWidth),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: Languages.of(context).txtMiviPro,
                    fontSize: 18.setFontSize,
                    fontFamily: Constant.fontFamilyBold700,
                  ),
                  SizedBox(height: 2.setHeight),
                  CommonText(
                    text: Languages.of(context).txtMiviProDesc,
                    fontSize: 12.setFontSize,
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget profileInformationView() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 50,
                child: Image.asset(
                  AppAssets.imgDummy,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomAppColor.of(context).secondary,
                    border: Border.all(
                      color: CustomAppColor.of(context).white,
                    ),
                  ),
                  padding: const EdgeInsets.all(3),
                  child: Image.asset(
                    AppAssets.icCamera,
                    width: 14.setWidth,
                    height: 14.setHeight,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10.setHeight),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonText(
                text: "Elvina Jack",
                fontFamily: Constant.fontFamilySemiBold600,
                fontSize: 16.setFontSize,
              ),
              CommonText(
                text: "elvina@yourdomain.com",
                fontSize: 12.setFontSize,
                textColor: CustomAppColor.of(context).txtLightGrey,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget myProfileSettingsView(List<SettingData> optionsList) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 12.setHeight),
          child: Row(
            children: List.generate(50, (index) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 3.setFontSize),
                  child: Container(
                    height: 1.setHeight,
                    width: 1.setWidth,
                    color: CustomAppColor.of(context).border,
                  ),
                ),
              );
            }),
          ),
        );
      },
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: optionsList.length,
      itemBuilder: (context, index) {
        final item = optionsList[index];
        return InkWell(
          onTap: item.onTap,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomAppColor.of(context).socialMediaCard,
                ),
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  item.icon,
                  width: 16.setWidth,
                  height: 16.setHeight,
                  color: item.title == Languages.of(context).txtLogout ? Colors.red : CustomAppColor.of(context).icBlackWhite,
                ),
              ),
              SizedBox(width: 16.setWidth),
              Expanded(
                child: CommonText(
                  text: item.title,
                  textColor: item.title == Languages.of(context).txtLogout ? Colors.red : CustomAppColor.of(context).txtBlack,
                  fontSize: 15.setFontSize,
                  textAlign: TextAlign.start,
                  fontFamily: Constant.fontFamilySemiBold600,
                ),
              ),
              if (item.hasToggle)
                ValueListenableBuilder<bool>(
                  valueListenable: isDarkMode,
                  builder: (context, value, child) {
                    return FlutterSwitch(
                      value: value,
                      onToggle: (bool newValue) {
                        isDarkMode.value = newValue;
                        getIt.get<LocalStorageService>().setBool(
                              LocalStorageService.isLightTheme,
                              !newValue,
                            );
                        final newTheme = newValue ? ThemeData.dark() : ThemeData.light();
                        MiviApp.changeTheme(context, newTheme);
                      },
                      activeColor: CustomAppColor.of(context).roundBg,
                      inactiveColor: CustomAppColor.of(context).txtGray.withValues(alpha: 0.4),
                      activeToggleColor: CustomAppColor.of(context).white,
                      inactiveToggleColor: CustomAppColor.of(context).white,
                      width: 40.setWidth,
                      height: 22.setHeight,
                      toggleSize: 16.0,
                      borderRadius: 16.0,
                      padding: 2.5,
                    );
                  },
                )
              else if (item.trailString.isNotEmpty)
                CommonText(
                  text: item.trailString,
                  textColor: CustomAppColor.of(context).txtRed,
                  fontFamily: Constant.fontFamilyMedium500,
                )
              else
                const Icon(Icons.arrow_forward_ios_rounded, size: 18),
            ],
          ),
        );
      },
    );
  }
}
