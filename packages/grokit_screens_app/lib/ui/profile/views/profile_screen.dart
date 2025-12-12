import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:grokit_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_screens_app/localization/language/languages.dart';
import 'package:grokit_screens_app/ui/address/view/address_screen.dart';
import 'package:grokit_screens_app/ui/all_coupon/view/all_coupons_screen.dart';
import 'package:grokit_screens_app/ui/app/my_app.dart';
import 'package:grokit_screens_app/ui/edit_profile/view/edit_profile_screen.dart';
import 'package:grokit_screens_app/ui/favorite/view/favorite_screen.dart';
import 'package:grokit_screens_app/ui/help_center/view/help_center_screen.dart';
import 'package:grokit_screens_app/ui/languages/view/languages_screen.dart';
import 'package:grokit_screens_app/ui/payment/view/payment_screen.dart';
import 'package:grokit_screens_app/ui/privacy_policy/view/privacy_policy_screen.dart';
import 'package:grokit_screens_app/ui/terms_and_conditions/view/terms_and_conditions_screen.dart';
import 'package:grokit_screens_app/ui/your_order/view/your_order_screen.dart';
import 'package:grokit_screens_app/utils/app_assets.dart';
import 'package:grokit_screens_app/utils/app_color.dart';
import 'package:grokit_screens_app/utils/constant.dart';
import 'package:grokit_screens_app/utils/preference.dart';
import 'package:grokit_screens_app/utils/service_locator.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/widgets/alert_dialog/logout_aleart_dialog.dart';
import 'package:grokit_screens_app/widgets/text/common_text.dart';
import 'package:grokit_screens_app/widgets/top_bar/topbar.dart';

import '../../../utils/utils.dart';
import '../datamodel/profile_data.dart';

class ProfileScreen extends StatefulWidget {
  final bool isShowLogoutAlert;

  static Route<void> route({bool isShowLogoutAlert = false}) {
    return MaterialPageRoute(builder: (_) => ProfileScreen(isShowLogoutAlert: isShowLogoutAlert));
  }

  const ProfileScreen({super.key, this.isShowLogoutAlert = false});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> implements TopBarClickListener {
  List<ProfileOption> myInformationList(BuildContext context) {
    return [
      ProfileOption(
        title: Languages.of(context).txtEditProfile,
        icon: AppAssets.icUser,
        onTap: () {
          Navigator.push(context, EditProfileScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtAddress,
        icon: AppAssets.icLocation,
        onTap: () {
          Navigator.push(context, AddressScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtPayment,
        icon: AppAssets.icWallet,
        onTap: () {
          Navigator.push(context, PaymentScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtYourOrder,
        icon: AppAssets.icShoppingCart,
        onTap: () {
          Navigator.push(context, YourOrderScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtFavorite,
        icon: AppAssets.icHeart,
        onTap: () {
          Navigator.push(context, FavoriteScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtCoupons,
        icon: AppAssets.icTag,
        onTap: () {
          Navigator.push(context, AllCouponsScreen.route());
        },
      ),
    ];
  }

  List<ProfileOption> otherList(BuildContext context) {
    return [
      ProfileOption(
        title: Languages.of(context).txtPrivacyPolicy,
        icon: AppAssets.icShieldSecurity,
        onTap: () {
          Navigator.push(context, PrivacyPolicyScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtTermsAndConditions,
        icon: AppAssets.icInfoCircle,
        onTap: () {
          Navigator.push(context, TermsAndConditionsScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtHelpCenter,
        icon: AppAssets.icMessageQuestion,
        onTap: () {
          Navigator.push(context, HelpCenterScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtLogOut,
        icon: AppAssets.icLogout,
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => const LogoutDialog(),
          );
        },
      ),
    ];
  }

  List<ProfileOption> personalization(BuildContext context) {
    return [
      ProfileOption(
        title: Languages.of(context).txtDarkMode,
        icon: AppAssets.icMoon,
        hasToggle: true,
        toggleValue: false,
      ),
      ProfileOption(
        title: Languages.of(context).txtLanguages,
        icon: AppAssets.icLanguage,
        onTap: () {
          Navigator.push(context, LanguagesScreen.route());
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
            context: context,
            barrierDismissible: true,
            builder: (dialogContext) {
              return PopScope(
                  canPop: false,
                  onPopInvokedWithResult: (didPop, result) {
                    if (!didPop) {
                      Navigator.pop(dialogContext);
                      Navigator.pop(context);
                    }
                  },
                  child: LogoutDialog());
            });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Stack(
        children: [
          _topbar(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(
                appBarColor: CustomAppColor.of(context).transparent,
                this,
                title: Languages.of(context).txtMyProfile,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _profileContentView(),
                      SizedBox(height: 24.setHeight),
                      myProfileSettingsView(myInformationList(context), Languages.of(context).txtMyInformation),
                      myProfileSettingsView(personalization(context), Languages.of(context).txtPersonalization),
                      myProfileSettingsView(otherList(context), Languages.of(context).txtOther),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  _topbar() {
    return Container(
      height: 220.setHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [CustomAppColor.of(context).topbarGradiant, CustomAppColor.of(context).bgScreen],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  _profileContentView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: IgnorePointer(
        ignoring: true,
        child: GestureDetector(
          onTap: () => Navigator.push(context, EditProfileScreen.route()),
          child: Container(
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).unselectedCard,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: CustomAppColor.of(context).borderProfileView,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 10.setHeight),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.imgDummyProfile,
                  height: 60.setHeight,
                  width: 60.setWidth,
                ),
                SizedBox(width: 12.setWidth),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "Smith Edon",
                        fontFamily: Constant.fontFamilyBold700,
                        fontSize: 16.setFontSize,
                      ),
                      SizedBox(height: 2.setHeight),
                      CommonText(
                        text: "+1 12345 67890",
                        fontSize: 12.setFontSize,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).icBlackWhite,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(7),
                  child: Image.asset(
                    AppAssets.icEdit,
                    color: CustomAppColor.of(context).txtWhite,
                    height: 15.setHeight,
                    width: 15.setWidth,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myProfileSettingsView(List<ProfileOption> options, String heading) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: CommonText(
            text: heading,
            textColor: CustomAppColor.of(context).txtGray,
            fontFamily: Constant.fontFamilyMedium500,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgScreen,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: options.length,
            padding: EdgeInsets.only(left: 24.setWidth, right: 24.setWidth, top: 5.setHeight, bottom: 5.setHeight),
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
                  padding: EdgeInsets.symmetric(vertical: 8.setHeight),
                  child: IgnorePointer(
                    ignoring: true,
                    child: InkWell(
                      onTap: item.onTap,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).unselectedCard,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              item.icon,
                              width: 16.setWidth,
                              height: 16.setHeight,
                              color: item.title == Languages.of(context).txtLogOut ? Colors.red : CustomAppColor.of(context).icBlackWhite,
                            ),
                          ),
                          SizedBox(width: 12.setWidth),
                          Expanded(
                            child: CommonText(
                              text: item.title,
                              textColor: item.title == Languages.of(context).txtLogOut ? Colors.red : CustomAppColor.of(context).txtBlack,
                              fontSize: 14.setFontSize,
                              textAlign: TextAlign.start,
                              fontFamily: Constant.fontFamilySemiBold600,
                            ),
                          ),
                          if (item.hasToggle)
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
                                      GroKitScreensApp.changeTheme(context, newTheme);
                                    },
                                    activeColor: CustomAppColor.of(context).unselectedCard,
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
        ),
      ],
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {}
}
