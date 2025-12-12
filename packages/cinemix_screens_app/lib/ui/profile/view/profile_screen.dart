import 'package:cinemix_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:cinemix_screens_app/ui/app/my_app.dart';
import 'package:cinemix_screens_app/ui/edit_profile/view/edit_profile_screen.dart';
import 'package:cinemix_screens_app/ui/help_and_support/view/help_and_support_screen.dart';
import 'package:cinemix_screens_app/ui/languages/view/languages_screen.dart';
import 'package:cinemix_screens_app/ui/my_list/view/my_list_screen.dart';
import 'package:cinemix_screens_app/ui/notification/view/notification_screen.dart';
import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:cinemix_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../utils/utils.dart';
import '../../../widgets/alert_dialog/logout_aleart_dialog.dart';
import '../../upgrade_plan/view/upgrade_plan_screen.dart';
import '../datamodel/profile_data.dart';

class ProfileScreen extends StatefulWidget {
  final bool isShowLogoutAlert;

  static Route<void> route({bool isShowLogoutAlert = false}) {
    return MaterialPageRoute(
      builder: (_) => ProfileScreen(isShowLogoutAlert: isShowLogoutAlert),
    );
  }

  const ProfileScreen({super.key, this.isShowLogoutAlert = false});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> implements TopBarClickListener {
  List<ProfileOption> personalizationList(BuildContext context) {
    return [
      ProfileOption(
        title: Languages.of(context).txtMyList,
        icon: AppAssets.icAddList,
        onTap: () {
          Navigator.push(context, MyListScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtLanguage,
        icon: AppAssets.icLanguage,
        onTap: () {
          Navigator.push(context, LanguagesScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtDarkMode,
        icon: AppAssets.icMoon,
        hasToggle: true,
        toggleValue: false,
      ),
      ProfileOption(
        title: Languages.of(context).txtNotification,
        icon: AppAssets.icNotification,
        onTap: () {
          Navigator.push(context, NotificationScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtHelpAndSupport,
        icon: AppAssets.icHelpCenter,
        onTap: () {
          Navigator.push(context, HelpCenterScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtLogout,
        icon: AppAssets.icLogout,
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return const LogoutDialog();
            },
          );
        },
      ),
    ];
  }

  ValueNotifier<bool> isDarkMode = ValueNotifier(false);

  _fillData() {
    bool isDarkModePref = !Utils.isLightTheme();
    isDarkMode.value = isDarkModePref;
  }

  @override
  void initState() {
    super.initState();
    _fillData();

    if (widget.isShowLogoutAlert) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (dialogContext) {
            return PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                if (!didPop) {
                  Navigator.pop(dialogContext);
                  Navigator.pop(context);
                }
              },
              child: const LogoutDialog(),
            );
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtProfile,
            isShowBack: false,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    profileInformationView(),
                    SizedBox(height: 18.setHeight),
                    IgnorePointer(
                      ignoring: true,
                      child: GestureDetector(
                        onTap: () => Navigator.push(context, UpgradePlanScreen.route()),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 8.setHeight),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            gradient: RadialGradient(
                              colors: [
                                const Color(0xFFFFE8BD),
                                const Color(0xFFF29F09).withValues(alpha: 0.9),
                              ],
                              radius: 0.9,
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                AppAssets.icCrown,
                                height: 75.setHeight,
                                width: 75.setWidth,
                              ),
                              SizedBox(height: 8.setHeight),
                              CommonText(
                                text: Languages.of(context).txtGetPremium,
                                fontFamily: Constant.fontFamilyClashGroteskSemiBold600,
                                fontSize: 18.setFontSize,
                              ),
                              CommonText(
                                text: Languages.of(context).txtGetPremiumDesc,
                                fontSize: 12.setFontSize,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.setHeight),
                    CommonText(
                      fontSize: 15.setFontSize,
                      text: Languages.of(context).txtSettings,
                      fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
                    ),
                    SizedBox(height: 15.setHeight),
                    myProfileSettingsView(personalizationList(context)),
                    SizedBox(height: 60.setHeight),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget profileInformationView() {
    return Row(
      children: [
        CircleAvatar(
          radius: 32,
          child: Image.asset(
            AppAssets.imgDummyImage,
          ),
        ),
        SizedBox(width: 10.setWidth),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: "Sana David",
              fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
              fontSize: 15.setFontSize,
            ),
            SizedBox(height: 3.setHeight),
            CommonText(
              text: "+1 12345 67890",
              fontFamily: Constant.fontFamilyClashDisplayMedium500,
              fontSize: 12.setFontSize,
            ),
            SizedBox(height: 6.setHeight),
            IgnorePointer(
              ignoring: true,
              child: GestureDetector(
                onTap: () => Navigator.push(context, EditProfileScreen.route()),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: CustomAppColor.of(context).dividerColor,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 4.setHeight),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AppAssets.icEdit,
                        height: 12.setHeight,
                        width: 12.setWidth,
                        color: CustomAppColor.of(context).icBlackWhite,
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: Languages.of(context).txtEditProfile,
                        fontSize: 11.setFontSize,
                        fontFamily: Constant.fontFamilyClashDisplayMedium500,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget myProfileSettingsView(List<ProfileOption> optionsList) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: optionsList.length,
      itemBuilder: (context, index) {
        final item = optionsList[index];
        return IgnorePointer(
          ignoring: true,
          child: InkWell(
            onTap: item.onTap,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.setHeight, horizontal: 8.setWidth),
              margin: EdgeInsets.only(bottom: 12.setHeight),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    CustomAppColor.of(context).bgSelectedShadow,
                    CustomAppColor.of(context).bgTextFormFieldShadowLight,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      item.icon,
                      width: 16.setWidth,
                      height: 16.setHeight,
                      color: item.title == Languages.of(context).txtLogout ? Colors.red : CustomAppColor.of(context).icBlackWhite,
                    ),
                  ),
                  SizedBox(width: 12.setWidth),
                  Expanded(
                    child: CommonText(
                      text: item.title,
                      textColor: item.title == Languages.of(context).txtLogout ? Colors.red : CustomAppColor.of(context).txtBlack,
                      fontSize: 14.setFontSize,
                      textAlign: TextAlign.start,
                      fontFamily: Constant.fontFamilyClashDisplayMedium500,
                    ),
                  ),
                  if (item.hasToggle && item.title == Languages.of(context).txtDarkMode)
                    ValueListenableBuilder<bool>(
                      valueListenable: isDarkMode,
                      builder: (context, value, child) {
                        return IgnorePointer(
                          ignoring: true,
                          child: FlutterSwitch(
                            value: value,
                            onToggle: (bool newValue) {
                              isDarkMode.value = newValue;
                              getIt.get<LocalStorageService>().setBool(
                                    LocalStorageService.isLightTheme,
                                    !newValue,
                                  );
                              final newTheme = newValue ? ThemeData.dark() : ThemeData.light();
                              CinemixScreensApp.changeTheme(context, newTheme);
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
                          ),
                        );
                      },
                    )
                  else if (item.trailString.isNotEmpty)
                    CommonText(
                      text: item.trailString,
                      textColor: CustomAppColor.of(context).txtRed,
                      fontFamily: Constant.fontFamilyClashDisplayMedium500,
                    )
                  else
                    const Icon(Icons.arrow_right_rounded, size: 32),
                ],
              ),
            ),
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
