import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:furniture_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_screens_app_package/localization/language/languages.dart';
import 'package:furniture_screens_app_package/ui/edit_address_list/views/edit_address_list_screen.dart';
import 'package:furniture_screens_app_package/ui/edit_profile/views/edit_profile_screen.dart';
import 'package:furniture_screens_app_package/ui/help_center/views/help_center_screen.dart';
import 'package:furniture_screens_app_package/ui/languages/views/languages_screen.dart';
import 'package:furniture_screens_app_package/ui/notification_settings/views/notification_settings_screen.dart';
import 'package:furniture_screens_app_package/ui/payment_method_list/views/payment_method_list_screen.dart';
import 'package:furniture_screens_app_package/ui/privacy_policy/views/privacy_policy_screen.dart';
import 'package:furniture_screens_app_package/ui/search/view/search_screen.dart';
import 'package:furniture_screens_app_package/ui/special_offers/views/special_offers_screen.dart';
import 'package:furniture_screens_app_package/utils/app_assets.dart';
import 'package:furniture_screens_app_package/utils/app_color.dart';
import 'package:furniture_screens_app_package/utils/constant.dart';
import 'package:furniture_screens_app_package/utils/sizer_utils.dart';
import 'package:furniture_screens_app_package/widgets/text/common_text.dart';
import 'package:furniture_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../utils/utils.dart';
import '../../../widgets/alert_dialog/logout_aleart_dialog.dart';
import '../../app/my_app.dart';
import '../datamodel/profile_options_data.dart';

class MyProfileScreen extends StatefulWidget {
  final bool isShowLogoutDialog;
  const MyProfileScreen({super.key, this.isShowLogoutDialog = false});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> implements TopBarClickListener {
  List<ProfileOption> profileOptions(BuildContext context) {
    return [
      ProfileOption(
        title: Languages.of(context).txtEditProfile,
        icon: AppAssets.icUserEdit,
        onTap: () {
          Navigator.push(context, EditProfileScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtEditAddress,
        icon: AppAssets.icLocation,
        onTap: () {
          Navigator.push(context, EditAddressListScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtNotificationSettings,
        icon: AppAssets.icNotification,
        onTap: () {
          Navigator.push(context, NotificationSettingsScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtPaymentMethod,
        icon: AppAssets.icPaymentMethod,
        onTap: () {
          Navigator.push(context, PaymentMethodListScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtSpecialOffers,
        icon: AppAssets.icDiscount,
        onTap: () {
          Navigator.push(context, SpecialOffersScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtLanguages,
        icon: AppAssets.icLanguages,
        onTap: () {
          Navigator.push(context, LanguagesScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtPrivacyPolicy,
        icon: AppAssets.icPrivacyPolicy,
        onTap: () {
          Navigator.push(context, PrivacyPolicyScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtDarkMode,
        icon: AppAssets.icMoon,
        hasToggle: true,
        toggleValue: false,
      ),
      ProfileOption(
        title: Languages.of(context).txtHelpCenter,
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
    // TODO: implement initState
    super.initState();
    _fillData();
    if (widget.isShowLogoutDialog) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (dialogContext) {
            return PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, result) {
                  if (!didPop) {
                    Navigator.pop(dialogContext);
                    Navigator.pop(context);
                  }
                },
                child: const LogoutDialog());
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).primary,
      body: Column(
        children: [
          TopBar(
            this,
            alignment: Alignment.centerLeft,
            isShowSearch: true,
            title: Languages.of(context).txtMyProfile,
            textAlign: TextAlign.start,
            textColor: CustomAppColor.of(context).white,
            iconColor: CustomAppColor.of(context).white,
            appBarColor: CustomAppColor.of(context).primary,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  profileDetailsView(),
                  myProfileSettingsView(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strSearch) {
      Navigator.push(context, SearchScreen.route());
    }
  }

  Widget profileDetailsView() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 20.setWidth),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            child: Image.asset(AppAssets.imgDummyProfile),
          ),
          SizedBox(width: 16.setWidth),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: "Kelly Oliver",
                  textColor: CustomAppColor.of(context).white,
                  fontSize: 20.setFontSize,
                  fontFamily: Constant.fontFamilyBold700,
                ),
                CommonText(
                  text: "+1 12345 67890",
                  textColor: CustomAppColor.of(context).icGray,
                  fontSize: 14.setFontSize,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget myProfileSettingsView() {
    final options = profileOptions(context);

    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50)),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: options.length,
        padding: EdgeInsets.only(left: 24.setWidth, right: 24.setWidth, top: 20.setHeight, bottom: 110.setHeight),
        itemBuilder: (context, index) {
          final item = options[index];
          return DottedBorder(
            options: CustomPathDottedBorderOptions(
              padding: EdgeInsets.symmetric(vertical: 2.setHeight),
              color: index == options.length - 1 ? CustomAppColor.of(context).bgScreen : CustomAppColor.of(context).dividerColor,
              strokeWidth: 1,
              dashPattern: [6, 5],
              customPath: (size) => Path()
                ..moveTo(0, size.height)
                ..relativeLineTo(size.width, 0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 18.setHeight),
              child: IgnorePointer(
                ignoring: true,
                child: InkWell(
                  onTap: item.onTap,
                  child: Row(
                    children: [
                      Image.asset(
                        item.icon,
                        width: 22.setWidth,
                        height: 22.setHeight,
                        color: item.title == Languages.of(context).txtLogout ? Colors.red : CustomAppColor.of(context).primary,
                      ),
                      SizedBox(width: 16.setWidth),
                      Expanded(
                        child: CommonText(
                          text: item.title,
                          textColor: item.title == Languages.of(context).txtLogout ? Colors.red : CustomAppColor.of(context).txtBlack,
                          fontSize: 16.setFontSize,
                          textAlign: TextAlign.start,
                          fontFamily: Constant.fontFamilyMedium500,
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
                                FurnitureScreensApp.changeTheme(context, newTheme);
                              },
                              activeColor: CustomAppColor.of(context).primary,
                              inactiveColor: CustomAppColor.of(context).txtGray.withValues(alpha: 0.4),
                              activeToggleColor: CustomAppColor.of(context).white,
                              inactiveToggleColor: CustomAppColor.of(context).white,
                              width: 44.setWidth,
                              height: 22.setHeight,
                              toggleSize: 16.0,
                              borderRadius: 16.0,
                              padding: 2.5,
                            );
                          },
                        )
                      else
                        const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
