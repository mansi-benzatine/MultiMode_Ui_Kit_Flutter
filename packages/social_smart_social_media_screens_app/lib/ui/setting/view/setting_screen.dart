import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../app/my_app.dart';
import '../../edit_profile/datamodel/edit_profile_data.dart';
import '../../help_center/view/help_center_screen.dart';
import '../../language/view/language_screen.dart';
import '../../manage_account/view/manage_account_screen.dart';
import '../../privacy_policy/view/privacy_policy_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});
  static Route route({bool? isFromPost}) {
    return MaterialPageRoute(
      builder: (context) => const SettingScreen(),
    );
  }

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Map<int, bool> switchState = {};
  ValueNotifier<bool> isDarkMode = ValueNotifier(false);
  List<EditProfileData> settingsList = [];

  _fillData() {
    bool isDarkModePref = Utils.isDarkTheme();

    isDarkMode.value = isDarkModePref;
    settingsList = [
      EditProfileData(
        icon: AppAssets.icProfileFilled,
        label: Languages.of(context).manageAccount,
        isTrailingIcon: true,
        isTrailingIconWithLabel: false,
        route: (context) => ManageAccountScreen.route(),
      ),
      EditProfileData(
        icon: AppAssets.icMoreCircle,
        label: Languages.of(context).language,
        isTrailingIcon: true,
        isTrailingIconWithLabel: true,
        route: (context) => LanguageScreen.route(),
      ),
      EditProfileData(
        icon: AppAssets.icShow,
        label: Languages.of(context).darkMode,
        isTrailingIcon: false,
        isTrailingIconWithLabel: false,
      ),
      EditProfileData(
        icon: AppAssets.icInfo,
        label: Languages.of(context).helpCenter,
        isTrailingIcon: true,
        isTrailingIconWithLabel: false,
        route: (context) => HelpCenterScreen.route(),
      ),
      EditProfileData(
        icon: AppAssets.icPrivacyPolicy,
        label: Languages.of(context).privacyPolicy,
        isTrailingIcon: true,
        isTrailingIconWithLabel: false,
        route: (context) => PrivacyPolicyScreen.route(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _fillData();
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomAppColor.of(context).bgScaffold,
          leading: IgnorePointer(ignoring: true, child: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back))),
          centerTitle: false,
          titleSpacing: 0,
          title: CommonText(
            text: Languages.of(context).settings,
            fontWeight: FontWeight.w700,
            fontSize: AppSizes.setFontSize(18),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(16)),
          child: Column(
            children: List.generate(
              settingsList.length,
              (index) {
                final socialData = settingsList[index];
                return IgnorePointer(
                  ignoring: true,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12)),
                    child: GestureDetector(
                      onTap: () {
                        if (socialData.route != null) {
                          Navigator.push(context, socialData.route!(context));
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            socialData.icon ?? '',
                            color: CustomAppColor.of(context).icBlack,
                            height: AppSizes.setHeight(23),
                            width: AppSizes.setWidth(23),
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(width: AppSizes.setWidth(25)),
                          CommonText(
                            text: socialData.label ?? '',
                            fontWeight: FontWeight.w600,
                            fontSize: AppSizes.setFontSize(16),
                          ),
                          const Spacer(),
                          CommonText(
                            text: socialData.detail ?? '',
                            fontWeight: FontWeight.w700,
                            fontSize: AppSizes.setFontSize(16),
                          ),
                          Visibility(
                            visible: socialData.isTrailingIcon ?? false,
                            child: Row(
                              children: [
                                Visibility(
                                  visible: socialData.isTrailingIconWithLabel ?? false,
                                  child: Row(
                                    children: [
                                      CommonText(
                                        text: Languages.of(context).englishUs,
                                        fontWeight: FontWeight.w600,
                                        fontSize: AppSizes.setFontSize(16),
                                      ),
                                      SizedBox(width: AppSizes.setWidth(20))
                                    ],
                                  ),
                                ),
                                Image.asset(
                                  AppAssets.icArrow,
                                  color: CustomAppColor.of(context).icBlack,
                                  height: AppSizes.setHeight(15),
                                  width: AppSizes.setWidth(15),
                                  fit: BoxFit.contain,
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: !(socialData.isTrailingIcon ?? true),
                            child: ValueListenableBuilder(
                              valueListenable: isDarkMode,
                              builder: (context, value, child) {
                                return FlutterSwitch(
                                  value: !isDarkMode.value,
                                  onToggle: (bool newValue) {
                                    isDarkMode.value = !newValue;

                                    getIt.get<LocalStorageService>().setBool(
                                          LocalStorageService.isLightTheme,
                                          isDarkMode.value,
                                        );

                                    SocialSmartSocialMediaScreensApp.changeTheme(context, ThemeData.light());
                                  },
                                  activeColor: AppColor.btnGradiant2,
                                  inactiveColor: Colors.grey.shade400,
                                  activeToggleColor: AppColor.white,
                                  inactiveToggleColor: AppColor.white,
                                  width: AppSizes.setWidth(42),
                                  height: AppSizes.setHeight(24),
                                  toggleSize: 19.0,
                                  borderRadius: 20.0,
                                  padding: 2,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
