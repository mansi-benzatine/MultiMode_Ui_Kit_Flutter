import 'package:flutter/material.dart';
import 'package:musify_screens_app_package/ui/add_new_card/view/add_new_card_screen.dart';
import 'package:musify_screens_app_package/ui/dashboard/view/dashboard_screen.dart';
import 'package:musify_screens_app_package/ui/edit_profile/view/edit_profile_screen.dart';
import 'package:musify_screens_app_package/ui/faq/view/faq_screen.dart';
import 'package:musify_screens_app_package/ui/forgot_password/view/forgot_password_screen.dart';
import 'package:musify_screens_app_package/ui/home/view/home_all_page.dart';
import 'package:musify_screens_app_package/ui/language_setting/view/language_setting_screen.dart';
import 'package:musify_screens_app_package/ui/login/view/login_screen.dart';
import 'package:musify_screens_app_package/ui/notification/view/notification_screen.dart';
import 'package:musify_screens_app_package/ui/onboarding/on_boarding_screen.dart';
import 'package:musify_screens_app_package/ui/play_music_full_screen/view/play_music_full_screen.dart';
import 'package:musify_screens_app_package/ui/play_now/view/play_now_screen.dart';
import 'package:musify_screens_app_package/ui/popular_music/view/popular_music_screen.dart';
import 'package:musify_screens_app_package/ui/privacy_policy/view/privacy_policy_screen.dart';
import 'package:musify_screens_app_package/ui/reset_password/view/reset_password_screen.dart';
import 'package:musify_screens_app_package/ui/search/view/search_screen.dart';
import 'package:musify_screens_app_package/ui/sign_in_phone_number/view/sign_in_phone_number_screen.dart';
import 'package:musify_screens_app_package/ui/sign_up/view/sign_up_screen.dart';
import 'package:musify_screens_app_package/ui/welcome/view/welcome_screen.dart';
import 'package:musify_screens_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../check_out/view/check_out_screen.dart';
import '../../notification_setting/view/notification_setting_screen.dart';
import '../../payment_method/view/payment_method_screen.dart';
import '../../premium_plan_list/view/premium_plan_list_screen.dart';
import '../../profile_setup/view/profile_setup_screen.dart';
import '../../select_payment_method/view/select_payment_method_screen.dart';
import '../../splash/view/splash_screen.dart';
import '../../verify_otp/view/verify_otp_screen.dart';
import '../datamodels/screens_list_data.dart';

class ScreenListScreen extends StatefulWidget {
  final String title;
  final Function()? onBack;

  const ScreenListScreen({super.key, required this.title, this.onBack});

  static Route<void> route({required String title}) {
    return MaterialPageRoute<void>(
      builder: (_) => ScreenListScreen(title: title),
    );
  }

  @override
  State<ScreenListScreen> createState() => _ScreenListScreen();
}

class _ScreenListScreen extends State<ScreenListScreen> {
  List<ScreenListDataModel> screenList = [];
  _fillData() {
    screenList = [
      ScreenListDataModel(
        title: "Splash",
        onClick: () => Navigator.push(context, SplashScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Onboarding 1",
        onClick: () => Navigator.push(context, OnboardingScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Onboarding 2",
        onClick: () => Navigator.push(context, OnboardingScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Onboarding 3 ",
        onClick: () => Navigator.push(context, OnboardingScreen.route(currentIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Get Start",
        onClick: () => Navigator.push(context, WelcomeScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sign In",
        onClick: () => Navigator.push(context, LoginScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sign Up",
        onClick: () => Navigator.push(context, SignUpScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Enter Phone Number",
        onClick: () => Navigator.push(context, SignInPhoneNumberScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Enter Otp For Login",
        onClick: () => Navigator.push(context, VerifyOtpScreen.route(isFromSignIn: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Forgot Password",
        onClick: () => Navigator.push(context, ForgotPasswordScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Enter Otp For Email Verify",
        onClick: () => Navigator.push(context, VerifyOtpScreen.route(isFromSignIn: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Reset Password",
        onClick: () => Navigator.push(context, ResetPasswordScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Reset Password Successfully",
        onClick: () => Navigator.push(context, ResetPasswordScreen.route(isForDialog: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Select Favourite Singer",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Select Date Of Birth",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Select Gender",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Select Favourite Language",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 3)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Select Music Category",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 4)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Profile Set Successfully",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 4, isForDialog: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Home : All",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0, currentIndexForHomeScreen: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Home : Songs",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0, currentIndexForHomeScreen: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Home : Podcast",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0, currentIndexForHomeScreen: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Home : Song Playing",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0, isShowPlayingMusic: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Search",
        onClick: () => Navigator.push(context, SearchScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Notification",
        onClick: () => Navigator.push(context, NotificationScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Popular Music",
        onClick: () => Navigator.push(context, PopularMusicScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Music List",
        onClick: () => Navigator.push(
            context,
            PlayNowScreen.route(
              musicItem: MusicItemData(
                image: AppAssets.imgMusic1,
                name: 'Baby',
                singer: 'Justin Bieber',
              ),
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Music Setting",
        onClick: () => Navigator.push(
            context,
            PlayNowScreen.route(
              isShowMoreBs: true,
              musicItem: MusicItemData(
                image: AppAssets.imgMusic1,
                name: 'Baby',
                singer: 'Justin Bieber',
              ),
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Full Screen",
        onClick: () => Navigator.push(
            context,
            PlayMusicFullScreen.route(
              musicItem: MusicItemData(
                image: AppAssets.imgMusic1,
                name: 'Baby',
                singer: 'Justin Bieber',
              ),
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Lyrics",
        onClick: () => Navigator.push(
            context,
            PlayMusicFullScreen.route(
              isForLyrics: true,
              musicItem: MusicItemData(
                image: AppAssets.imgMusic1,
                name: 'Baby',
                singer: 'Justin Bieber',
              ),
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "My Music : Songs",
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              currentIndex: 1,
              currentIndexForMyMusicScreen: 0,
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "My Music : Podcast",
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              currentIndex: 1,
              currentIndexForMyMusicScreen: 1,
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Create New Playlist",
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              currentIndex: 1,
              currentIndexForMyMusicScreen: 1,
              isShowCreatePlaylistBs: true,
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Favourite Song : Music",
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              currentIndex: 2,
              currentIndexForFavouriteScreen: 0,
              subCurrentIndexForFavouriteScreen: 0,
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Favourite Song : Album",
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              currentIndex: 2,
              currentIndexForFavouriteScreen: 0,
              subCurrentIndexForFavouriteScreen: 1,
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Favourite Podcast",
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              currentIndex: 2,
              currentIndexForFavouriteScreen: 1,
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Profile",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 3)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Profile",
        onClick: () => Navigator.push(context, EditProfileScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Notification Setting",
        onClick: () => Navigator.push(context, NotificationSettingScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Payment Method",
        onClick: () => Navigator.push(context, PaymentMethodScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Add New Card",
        onClick: () => Navigator.push(context, AddNewCardScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Upgrade Plan",
        onClick: () => Navigator.push(context, PremiumPlanListScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Payment Method",
        onClick: () => Navigator.push(
          context,
          SelectPaymentMethodScreen.route(
            plan: PremiumPlanData(
              price: "\$8.00",
              period: "/month",
              features: [
                "Listening With Better Audio Quality",
                "Listening Without Adds",
                "Unlimited Download Music",
              ],
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Review Upgrade Plan Summary",
        onClick: () => Navigator.push(
          context,
          CheckOutScreen.route(
              plan: PremiumPlanData(
                price: "\$8.00",
                period: "/month",
                features: [
                  "Listening With Better Audio Quality",
                  "Listening Without Adds",
                  "Unlimited Download Music",
                ],
              ),
              paymentMethod: PaymentMethodData(
                name: Languages.of(context).txtMyWallet,
                icon: AppAssets.icWallet,
                isSelected: true,
                iconColor: CustomAppColor.of(context).txtBlack,
              )),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Upgrade Plan Successfully",
        onClick: () => Navigator.push(
          context,
          CheckOutScreen.route(
              plan: PremiumPlanData(
                price: "\$8.00",
                period: "/month",
                features: [
                  "Listening With Better Audio Quality",
                  "Listening Without Adds",
                  "Unlimited Download Music",
                ],
              ),
              paymentMethod: PaymentMethodData(
                name: Languages.of(context).txtMyWallet,
                icon: AppAssets.icWallet,
                isSelected: true,
                iconColor: CustomAppColor.of(context).txtBlack,
              ),
              isShowDialog: true),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Language Setting",
        onClick: () => Navigator.push(context, LanguageSettingScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Privacy Policy",
        onClick: () => Navigator.push(context, PrivacyPolicyScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "FAQ",
        onClick: () => Navigator.push(context, FaqScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Logout",
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              currentIndex: 3,
              isForLogoutDialog: true,
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Delete Account",
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              currentIndex: 3,
              isForDeleteDialog: true,
            )),
        icon: AppAssets.icBlueNavigator,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _fillData();
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back,
                color: CustomAppColor.of(context).white,
              ),
            ),
            onPressed: () {
              widget.onBack?.call();
            },
          ),
          title: CommonText(
            text: "Musify : Music App",
            fontSize: 22.setFontSize,
            fontFamily: Constant.fontFamilyMontserratSemiBold,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).white,
          ),
          leadingWidth: 38,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: 20.setHeight),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.imgBgHomeScreenPlain),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: kToolbarHeight + 26),
              _ModeGridView(screenList: screenList),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModeGridView extends StatelessWidget {
  final List<ScreenListDataModel> screenList;

  const _ModeGridView({required this.screenList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 0.screenWidth,
        margin: EdgeInsets.only(top: 10.setHeight),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).txtWhite,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        ),
        child: Column(
          children: [
            Container(
              height: 6.setHeight,
              width: 50.setWidth,
              margin: EdgeInsets.symmetric(vertical: 15.setHeight),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).greyHandle,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            SizedBox(height: 5.setHeight),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Wrap(
                      spacing: 10.setWidth,
                      runSpacing: 10.setHeight,
                      alignment: WrapAlignment.start,
                      children: List.generate(screenList.length, (index) {
                        return _itemList(
                          context: context,
                          item: screenList[index],
                          index: index + 1,
                        );
                      }),
                    ),
                    SizedBox(height: 20.setHeight),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemList({
    required BuildContext context,
    required ScreenListDataModel item,
    required int index,
  }) {
    return InkWell(
      onTap: () {
        item.onClick?.call();
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 3.setHeight),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 18.setHeight),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: CustomAppColor.of(context).listTileColorScreenList,
            boxShadow: [
              BoxShadow(
                color: CustomAppColor.of(
                  context,
                ).listTileShadow.withValues(alpha: .10),
                offset: const Offset(0, 4),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "${index.toString()}.  ",
                      fontSize: 15.setFontSize,
                      fontFamily: Constant.fontFamilyMontserratSemiBold,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    Expanded(
                      child: CommonText(
                        text: item.title,
                        fontSize: 14.setFontSize,
                        fontFamily: Constant.fontFamilyMontserratSemiBold,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.setWidth),
                child: Image.asset(
                  item.icon,
                  height: 20.setHeight,
                  width: 20.setHeight,
                  gaplessPlayback: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
