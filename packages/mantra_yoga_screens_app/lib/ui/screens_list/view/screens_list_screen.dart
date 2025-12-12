import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/ui/card_or_wallet_details/view/card_or_wallet_details_screen.dart';
import 'package:mantra_yoga_screens_app_package/ui/dashboard/view/dashboard_screen.dart';
import 'package:mantra_yoga_screens_app_package/ui/filter/view/filter_screen.dart';
import 'package:mantra_yoga_screens_app_package/ui/forgot_password/view/forgot_password_screen.dart';
import 'package:mantra_yoga_screens_app_package/ui/help_center/view/help_center_screen.dart';
import 'package:mantra_yoga_screens_app_package/ui/notification_settings/view/notification_settings_screen.dart';
import 'package:mantra_yoga_screens_app_package/ui/on_boarding/view/on_boarding_screen.dart';
import 'package:mantra_yoga_screens_app_package/ui/upgrade_plan/view/upgrade_plan_screen.dart';
import 'package:mantra_yoga_screens_app_package/ui/welcome/view/welcome_screen.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../do_meditation/view/do_meditation_screen.dart';
import '../../do_yoga/view/do_yoga_screen.dart';
import '../../enter_otp/view/enter_otp_screen.dart';
import '../../invite_friends/view/invite_friends_screen.dart';
import '../../languages/view/languages_screen.dart';
import '../../meditation_details/view/meditation_details_screen.dart';
import '../../notification/view/notification_screen.dart';
import '../../payment_method/view/payment_method_screen.dart';
import '../../personal_information/view/personal_information_screen.dart';
import '../../profile_setup/view/profile_setup_screen.dart';
import '../../reset_password/view/reset_password_screen.dart';
import '../../saved/view/saved_screen.dart';
import '../../sign_in_and_sign_up/view/sign_in_and_sign_up_screen.dart';
import '../../splash/view/splash_screen.dart';
import '../../yoga_details/view/yoga_details_screen.dart';
import '../datamodels/screens_list_data.dart';

class ScreenListScreen extends StatefulWidget {
  final String title;
  final Function()? onBack;

  const ScreenListScreen({super.key, required this.title, this.onBack});

  static Route<void> route({required String title}) {
    return MaterialPageRoute(
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
        onClick: () => Navigator.push(context, OnBoardingScreen.route(selectedIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Onboarding 2",
        onClick: () => Navigator.push(context, OnBoardingScreen.route(selectedIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Onboarding 3",
        onClick: () => Navigator.push(context, OnBoardingScreen.route(selectedIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Welcome",
        onClick: () => Navigator.push(context, WelcomeScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sign In",
        onClick: () => Navigator.push(context, SignInAndSignUpScreen.route(true, 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sign Up",
        onClick: () => Navigator.push(context, SignInAndSignUpScreen.route(true, 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Forgot Password",
        onClick: () => Navigator.push(context, ForgotPasswordScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Enter OTP",
        onClick: () => Navigator.push(context, EnterOTPScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Reset Password",
        onClick: () => Navigator.push(context, ResetPasswordScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Reset Password Successfully",
        onClick: () => Navigator.push(context, ResetPasswordScreen.route(isForAlert: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Choose Your Gender",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentPage: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Your Profile",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentPage: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Choose Your Yoga Level",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentPage: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Choose Your Goals",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentPage: 3)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Choose Your Age",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentPage: 4)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Choose Your Weight",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentPage: 5)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Choose Your Targeted Weight",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentPage: 6)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Choose Your Height",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentPage: 7)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Your Profile Set Successful",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(isForAlert: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Home",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Discover Yoga",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 1, discoverScreenIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Discover Meditation",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 1, discoverScreenIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Filters Yoga",
        onClick: () => Navigator.push(context, FilterScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Filters Meditation",
        onClick: () => Navigator.push(context, FilterScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Notification",
        onClick: () => Navigator.push(context, NotificationScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Saved Yoga",
        onClick: () => Navigator.push(context, SavedScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Saved Meditation",
        onClick: () => Navigator.push(context, SavedScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "History",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Analysis",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 3)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Yoga Details Video",
        onClick: () => Navigator.push(context, YogaDetailsScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Yoga Details Animation",
        onClick: () => Navigator.push(context, YogaDetailsScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Animation Play",
        onClick: () => Navigator.push(context, DoYogaScreen.route(isVideoSelected: 1, isAnimationPlay: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Animation Full Screen",
        onClick: () => Navigator.push(context, DoYogaScreen.route(isVideoSelected: 1, isAnimationFullScreen: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Animation Pause",
        onClick: () => Navigator.push(context, DoYogaScreen.route(isVideoSelected: 1, isAnimationPlay: false)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Animation Resume",
        onClick: () => Navigator.push(context, DoYogaScreen.route(isVideoSelected: 1, isAnimationWaiting: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Video Play",
        onClick: () => Navigator.push(context, DoYogaScreen.route(isVideoSelected: 0, isVideoPlay: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Video Full Screen",
        onClick: () => Navigator.push(context, DoYogaScreen.route(isVideoSelected: 0, isVideoFullScreen: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Video Pause",
        onClick: () => Navigator.push(context, DoYogaScreen.route(isVideoSelected: 0, isVideoPlay: false)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Video Resume",
        onClick: () => Navigator.push(context, DoYogaScreen.route(isVideoSelected: 0, isVideoWaiting: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Session Completed",
        onClick: () => Navigator.push(context, DoYogaScreen.route(isForSessionCompleteAlert: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Your Mood After Session?",
        onClick: () => Navigator.push(context, DoYogaScreen.route(isForYourMoodAfterSessionAlert: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Give Review & Rate",
        onClick: () => Navigator.push(context, DoYogaScreen.route(isForGiveReviewAndRateAlert: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Meditation Details",
        onClick: () => Navigator.push(context, MeditationDetailsScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Meditation Video",
        onClick: () => Navigator.push(context, DoMeditationScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Meditation Video Full Screen",
        onClick: () => Navigator.push(context, DoMeditationScreen.route(isForFullScreen: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "My Profile",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 4)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Update Profile",
        onClick: () => Navigator.push(context, PersonalInformationScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Notification Settings",
        onClick: () => Navigator.push(context, NotificationSettingsScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Payment Method",
        onClick: () => Navigator.push(context, PaymentMethodScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Add Card",
        onClick: () => Navigator.push(context, CardOrWalletDetailsScreen.route(isFromAddCard: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Card",
        onClick: () => Navigator.push(context, CardOrWalletDetailsScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Languages",
        onClick: () => Navigator.push(context, LanguagesScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Invite Friends",
        onClick: () => Navigator.push(context, InviteFriendsScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Upgrade Plan",
        onClick: () => Navigator.push(context, UpgradePlanScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Choose Payment Method",
        onClick: () => Navigator.push(context, PaymentMethodScreen.route(isFromSelection: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Upgrade Plan Successfully",
        onClick: () => Navigator.push(context, UpgradePlanScreen.route(isForAlert: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Help Center : FAQ",
        onClick: () => Navigator.push(context, HelpCenterScreen.route(currentInex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Help Center : Contact Us",
        onClick: () => Navigator.push(context, HelpCenterScreen.route(currentInex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Logout",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 4, isForLogoutAlert: true)),
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
            text: "Mantra Yoga App",
            fontSize: 18.setFontSize,
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
