import 'package:dating_screens_app_package/ui/chat/views/chat_screen.dart';
import 'package:dating_screens_app_package/ui/chats_search/views/chats_search_screen.dart';
import 'package:dating_screens_app_package/ui/community_guidelines/views/community_guidelines_screen.dart';
import 'package:dating_screens_app_package/ui/create_account/views/create_account_screen.dart';
import 'package:dating_screens_app_package/ui/dashboard/views/dashboard_screen.dart';
import 'package:dating_screens_app_package/ui/edit_basic_details/views/edit_basic_details_screen.dart';
import 'package:dating_screens_app_package/ui/edit_gender_and_sexual/views/edit_gender_and_sexual_screen.dart';
import 'package:dating_screens_app_package/ui/edit_job_and_school/views/edit_job_and_school_screen.dart';
import 'package:dating_screens_app_package/ui/edit_language/views/edit_langauges_screen.dart';
import 'package:dating_screens_app_package/ui/edit_passion/views/edit_passion_screen.dart';
import 'package:dating_screens_app_package/ui/edit_profile/views/edit_profile_screen.dart';
import 'package:dating_screens_app_package/ui/edit_social_links/views/edit_social_links_screen.dart';
import 'package:dating_screens_app_package/ui/edit_system/views/edit_system_screen.dart';
import 'package:dating_screens_app_package/ui/fill_up_information/views/fill_up_information_screen.dart';
import 'package:dating_screens_app_package/ui/forgot_password/views/forgot_password_screen.dart';
import 'package:dating_screens_app_package/ui/help_and_support/views/help_and_support_screen.dart';
import 'package:dating_screens_app_package/ui/login/views/login_screen.dart';
import 'package:dating_screens_app_package/ui/login_with/views/login_with_screen.dart';
import 'package:dating_screens_app_package/ui/mobile_verification/views/mobile_verification_screen.dart';
import 'package:dating_screens_app_package/ui/phone_call/views/phone_call_screen.dart';
import 'package:dating_screens_app_package/ui/privacy_policy/views/privacy_policy_screen.dart';
import 'package:dating_screens_app_package/ui/profile_details/views/profile_details_screen.dart';
import 'package:dating_screens_app_package/ui/report/views/report_screen.dart';
import 'package:dating_screens_app_package/ui/rules/views/rules_screen.dart';
import 'package:dating_screens_app_package/ui/safety_tips/views/safety_tips_screen.dart';
import 'package:dating_screens_app_package/ui/settings/views/settings_screen.dart';
import 'package:dating_screens_app_package/ui/subscription/views/subscription_screen.dart';
import 'package:dating_screens_app_package/ui/terms_and_conditions/views/terms_and_conditions_screen.dart';
import 'package:dating_screens_app_package/ui/verify_your_number/views/verify_your_number_screen.dart';
import 'package:dating_screens_app_package/ui/video_call/views/video_call_screen.dart';
import 'package:dating_screens_app_package/utils/app_assets.dart';
import 'package:dating_screens_app_package/utils/constant.dart';
import 'package:dating_screens_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../splash/views/splash_screen.dart';
import '../datamodels/screens_list_data.dart';

class DatingAppScreenListScreen extends StatefulWidget {
  final String title;
  final Function()? onBack;

  const DatingAppScreenListScreen({super.key, required this.title, this.onBack});

  static Route<void> route({required String title}) {
    return MaterialPageRoute<void>(builder: (_) => DatingAppScreenListScreen(title: title));
  }

  @override
  State<DatingAppScreenListScreen> createState() => _DatingAppScreenListScreen();
}

class _DatingAppScreenListScreen extends State<DatingAppScreenListScreen> {
  List<ScreenListDataModel> screenList = [];

  _fillData() {
    screenList = [
      ScreenListDataModel(
        title: "Splash",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SplashScreen.route()),
      ),
      ScreenListDataModel(
        title: "Login with google & facebook",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, LoginWithScreen.route()),
      ),
      ScreenListDataModel(
        title: "Create Account",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, CreateAccountScreen.route()),
      ),
      ScreenListDataModel(
        title: "Login",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, LoginScreen.route()),
      ),
      ScreenListDataModel(
        title: "Forgot Password",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ForgotPasswordScreen.route()),
      ),
      ScreenListDataModel(
        title: "Mobile Verification",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, MobileVerificationScreen.route()),
      ),
      ScreenListDataModel(
        title: "Verify your number",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, VerifyYourNumberScreen.route()),
      ),
      ScreenListDataModel(
        title: "Rules",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, RulesScreen.route()),
      ),
      ScreenListDataModel(
        title: "What's your first name?",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, FillUpInformationScreen.route(currentIndex: 0)),
      ),
      ScreenListDataModel(
        title: "What's your date of birth?",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, FillUpInformationScreen.route(currentIndex: 1)),
      ),
      ScreenListDataModel(
        title: "Choose your gender",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, FillUpInformationScreen.route(currentIndex: 2)),
      ),
      ScreenListDataModel(
        title: "Choose your passion",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, FillUpInformationScreen.route(currentIndex: 3)),
      ),
      ScreenListDataModel(
        title: "Add your best photos",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, FillUpInformationScreen.route(currentIndex: 4)),
      ),
      ScreenListDataModel(
        title: "Let's Start",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, FillUpInformationScreen.route(currentIndex: 5)),
      ),
      ScreenListDataModel(
        title: "Home Screen : Discover",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0, currentIndexHomeScreen: 0)),
      ),
      ScreenListDataModel(
        title: "Swipe Left For Like",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0, currentIndexHomeScreen: 0, isAutomaticSwipeLeft: true)),
      ),
      ScreenListDataModel(
        title: "Swipe Right For DisLike",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0, currentIndexHomeScreen: 0, isAutomaticSwipeRight: true)),
      ),
      ScreenListDataModel(
        title: "It's Match",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0, isShownMatchAlert: true)),
      ),
      ScreenListDataModel(
        title: "Home Screen : Nearby",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0, currentIndexHomeScreen: 1)),
      ),
      ScreenListDataModel(
        title: "Profile details",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ProfileDetailsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Match Profile",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ProfileDetailsScreen.route(isShownMatchAlert: true)),
      ),
      ScreenListDataModel(
        title: "Likes",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 1)),
      ),
      ScreenListDataModel(
        title: "Chats List",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2)),
      ),
      ScreenListDataModel(
        title: "Search",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ChatsSearchScreen.route()),
      ),
      ScreenListDataModel(
        title: "Search Not Found",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ChatsSearchScreen.route(isEmptySearch: true)),
      ),
      ScreenListDataModel(
        title: "Chat",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ChatScreen.route()),
      ),
      ScreenListDataModel(
        title: "Phone Call",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, PhoneCallScreen.route()),
      ),
      ScreenListDataModel(
        title: "Video Call",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, VideoCallScreen.route()),
      ),
      ScreenListDataModel(
        title: "Profile",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 3)),
      ),
      ScreenListDataModel(
        title: "Settings",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SettingsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Edit Profile",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditProfileScreen.route()),
      ),
      ScreenListDataModel(
        title: "Edit Basic Information",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditBasicDetailsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Edit Job & school",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditJobAndSchoolScreen.route()),
      ),
      ScreenListDataModel(
        title: "Edit gender & sexual",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditGenderAndSexualScreen.route()),
      ),
      ScreenListDataModel(
        title: "Edit Passion",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditPassionScreen.route()),
      ),
      ScreenListDataModel(
        title: "Add Passion",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditPassionScreen.route(isShowAddPassionDialog: true)),
      ),
      ScreenListDataModel(
        title: "Edit Language",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditLanguagesScreen.route()),
      ),
      ScreenListDataModel(
        title: "Add Language",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditLanguagesScreen.route(isShowEditAlert: true)),
      ),
      ScreenListDataModel(
        title: "Edit Social Media Links",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditSocialLinksScreen.route()),
      ),
      ScreenListDataModel(
        title: "Subscription",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SubscriptionPlanScreen.route()),
      ),
      ScreenListDataModel(
        title: "Edit System",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditSystemScreen.route()),
      ),
      ScreenListDataModel(
        title: "Privacy Policy",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, PrivacyPolicyScreen.route()),
      ),
      ScreenListDataModel(
        title: "Terms of service",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, TermsAndConditionsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Report",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ReportUserScreen.route()),
      ),
      ScreenListDataModel(
        title: "Community Guidelines",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, CommunityGuidelinesScreen.route()),
      ),
      ScreenListDataModel(
        title: "Safety Tips",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SafetyTipsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Help",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, HelpSupportScreen.route(currentIndex: 0)),
      ),
      ScreenListDataModel(
        title: "Support",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, HelpSupportScreen.route(currentIndex: 1)),
      ),
      ScreenListDataModel(
        title: "Logout",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SettingsScreen.route(isShowLogoutAlert: true)),
      ),
      ScreenListDataModel(
        title: "Delete Account",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SettingsScreen.route(isShowDeleteAccountAlert: true)),
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fillData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final isDark = Theme.of(context).brightness == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
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
          leadingWidth: 38.setWidth,
          title: CommonText(
            text: "Dating App",
            fontSize: 22.setFontSize,
            fontFamily: Constant.fontFamilyMontserratSemiBold,
            textColor: CustomAppColor.of(context).white,
          ),
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
