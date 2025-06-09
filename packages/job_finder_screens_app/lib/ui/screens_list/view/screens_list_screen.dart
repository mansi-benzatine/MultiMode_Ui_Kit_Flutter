import 'package:flutter/material.dart';
import 'package:job_finder_screens_app_package/ui/applied_job_details/view/applied_job_details_screen.dart';
import 'package:job_finder_screens_app_package/ui/apply_job/view/apply_job_screen.dart';
import 'package:job_finder_screens_app_package/ui/chat/view/chat_screen.dart';
import 'package:job_finder_screens_app_package/ui/confirm_new_account/view/confirm_new_account_screen.dart';
import 'package:job_finder_screens_app_package/ui/dashboard/view/dashboard_screen.dart';
import 'package:job_finder_screens_app_package/ui/enter_4_digit_code/view/enter_4_digit_code_screen.dart';
import 'package:job_finder_screens_app_package/ui/filter_options/view/filter_options_screen.dart';
import 'package:job_finder_screens_app_package/ui/forgot_password/view/forgot_password_screen.dart';
import 'package:job_finder_screens_app_package/ui/job_details/view/job_details_screen.dart';
import 'package:job_finder_screens_app_package/ui/notifications/view/notifications_screen.dart';
import 'package:job_finder_screens_app_package/ui/on_boarding/view/on_boarding_screen.dart';
import 'package:job_finder_screens_app_package/ui/privacy_and_policy/view/privacy_and_policy_screen.dart';
import 'package:job_finder_screens_app_package/ui/reset_password/view/reset_password_screen.dart';
import 'package:job_finder_screens_app_package/ui/search_job/view/search_job_screen.dart';
import 'package:job_finder_screens_app_package/ui/select_your_option/view/select_your_option_screen.dart';
import 'package:job_finder_screens_app_package/ui/set_up_profile/view/set_up_profile_screen.dart';
import 'package:job_finder_screens_app_package/ui/settings/view/settings_screen.dart';
import 'package:job_finder_screens_app_package/ui/sign_in/view/sign_in_screen.dart';
import 'package:job_finder_screens_app_package/ui/sign_up/view/sign_up_screen.dart';
import 'package:job_finder_screens_app_package/ui/successfully_job_applied/view/successfully_job_applied_screen.dart';
import 'package:job_finder_screens_app_package/ui/terms_and_conditions/view/terms_and_conditions_screen.dart';
import 'package:job_finder_screens_app_package/ui/types_of_job_roles/view/type_of_job_roles_screen.dart';
import 'package:job_finder_screens_app_package/ui/types_of_job_type/view/types_of_job_type_screen.dart';
import 'package:job_finder_screens_app_package/ui/update_password/view/update_password_screen.dart';
import 'package:job_finder_screens_app_package/ui/video_call/view/video_call_screen.dart';
import 'package:job_finder_screens_app_package/ui/voice_call/view/voice_call_screen.dart';
import 'package:job_finder_screens_app_package/utils/sizer_utils.dart';
import 'package:job_finder_screens_app_package/utils/utils.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../splash/view/splash_screen.dart';
import '../datamodel/screens_list_data.dart';

class ScreenListScreen extends StatefulWidget {
  final String title;
  final Function()? onBack;
  const ScreenListScreen({super.key, required this.title, this.onBack});

  static Route<void> route({required String title}) {
    return MaterialPageRoute<void>(builder: (_) => ScreenListScreen(title: title));
  }

  @override
  State<ScreenListScreen> createState() => _ScreenListScreenState();
}

class _ScreenListScreenState extends State<ScreenListScreen> {
  List<ScreenListDataModel> screenList = [];

  _fillData() {
    screenList = [
      ScreenListDataModel(
        title: "Splash".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SplashScreen.route()),
      ),
      ScreenListDataModel(
        title: "Onboarding 1".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, OnBoardingScreen.route(index: 0)),
      ),
      ScreenListDataModel(
        title: "Onboarding 2".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, OnBoardingScreen.route(index: 1)),
      ),
      ScreenListDataModel(
        title: "Onboarding 3".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, OnBoardingScreen.route(index: 2)),
      ),
      ScreenListDataModel(
        title: "Select options".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SelectYourOptionScreen.route()),
      ),
      ScreenListDataModel(
        title: "Sign in".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SignInScreen.route()),
      ),
      ScreenListDataModel(
        title: "Sign up".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SignUpScreen.route()),
      ),
      ScreenListDataModel(
        title: "Forgot password".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ForgotPasswordScreen.route()),
      ),
      ScreenListDataModel(
        title: "Verify code".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, Enter4DigitCodeScreen.route()),
      ),
      ScreenListDataModel(
        title: "Reset Password".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ResetPasswordScreen.route()),
      ),
      ScreenListDataModel(
        title: "Set up profile".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SetUpProfileScreen.route()),
      ),
      ScreenListDataModel(
        title: "What type of Job Role".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, TypeJobRolesScreen.route()),
      ),
      ScreenListDataModel(
        title: "What type of Job type".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, TypesOfJobTypeScreen.route()),
      ),
      ScreenListDataModel(
        title: "Confirm new account".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ConfirmNewAccountScreen.route()),
      ),
      ScreenListDataModel(
        title: "Home".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
                isFromEmptyMessage: false,
                isFromHome: true,
                isFromApplication: false,
                isFromMessage: false,
                isFromProfile: false,
                isFromSavedJobs: false)),
      ),
      ScreenListDataModel(
        title: "Job Description".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, JobDetailsScreen.route(isFromCompany: false, isFromDescription: true, isFromReview: false)),
      ),
      ScreenListDataModel(
        title: "Job Company".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, JobDetailsScreen.route(isFromCompany: true, isFromDescription: false, isFromReview: false)),
      ),
      ScreenListDataModel(
        title: "Job Company Review".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, JobDetailsScreen.route(isFromCompany: false, isFromDescription: false, isFromReview: true)),
      ),
      ScreenListDataModel(
        title: "Apply job".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ApplyJobScreen.route()),
      ),
      ScreenListDataModel(
        title: "Successfully Applied".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SuccessfullyJobAppliedScreen.route()),
      ),
      ScreenListDataModel(
        title: "Filter options".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, FilterOptionsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Search Job".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
          context,
          SearchJobScreen.route(
            isFromNoResultFound: false,
            isFromSearchJob: true,
            isFromSearchResult: false,
          ),
        ),
      ),
      ScreenListDataModel(
        title: "Search Result".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
          context,
          SearchJobScreen.route(
            isFromNoResultFound: false,
            isFromSearchJob: false,
            isFromSearchResult: true,
          ),
        ),
      ),
      ScreenListDataModel(
        title: "No Result Found".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
          context,
          SearchJobScreen.route(
            isFromNoResultFound: true,
            isFromSearchJob: false,
            isFromSearchResult: false,
          ),
        ),
      ),
      ScreenListDataModel(
        title: "Applications".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
                isFromEmptyMessage: false,
                isFromMessage: false,
                isFromApplication: true,
                isFromSavedJobs: false,
                isFromProfile: false,
                isFromHome: false)),
      ),
      ScreenListDataModel(
        title: "Job tracking application".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, AppliedJobDetailsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Notifications".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, NotificationsScreen.route(isFromEmptyNotification: false)),
      ),
      ScreenListDataModel(
        title: "Empty Notification".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, NotificationsScreen.route(isFromEmptyNotification: true)),
      ),
      ScreenListDataModel(
        title: "Message".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
                isFromEmptyMessage: false,
                isFromHome: false,
                isFromApplication: false,
                isFromMessage: true,
                isFromProfile: false,
                isFromSavedJobs: false)),
      ),
      ScreenListDataModel(
        title: "No message found".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
                isFromEmptyMessage: true,
                isFromHome: false,
                isFromApplication: false,
                isFromMessage: true,
                isFromProfile: false,
                isFromSavedJobs: false)),
      ),
      ScreenListDataModel(
        title: "Message chat".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ChatScreen.route()),
      ),
      ScreenListDataModel(
        title: "Video call".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, VideoCallScreen.route()),
      ),
      ScreenListDataModel(
        title: "Voice call".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, VoiceCallScreen.route()),
      ),
      ScreenListDataModel(
        title: "Saved Jobs".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
                isFromEmptyMessage: false,
                isFromHome: false,
                isFromApplication: false,
                isFromMessage: false,
                isFromProfile: false,
                isFromSavedJobs: true)),
      ),
      ScreenListDataModel(
        title: "Profile".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
                isFromEmptyMessage: false,
                isFromHome: false,
                isFromApplication: false,
                isFromMessage: false,
                isFromProfile: true,
                isFromSavedJobs: false)),
      ),
      ScreenListDataModel(
        title: "Settings".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SettingsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Privacy & Policy ".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, PrivacyAndPolicyScreen.route()),
      ),
      ScreenListDataModel(
        title: "Terms & Conditions ".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, TermsAndConditionsScreen.route()),
      ),
      ScreenListDataModel(
        title: "update password".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, UpdatePasswordScreen.route()),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _fillData();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: CustomAppColor.of(context).white),
          onPressed: () {
            widget.onBack?.call();
          },
        ),
        title: CommonText(
          text: "Job Finder App",
          fontSize: 22.setFontSize,
          textColor: CustomAppColor.of(context).white,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(top: 20.setHeight),
        decoration: const BoxDecoration(
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
          color: CustomAppColor.of(context).whiteBlackBg,
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Wrap(
                      spacing: 10.setWidth,
                      runSpacing: 10.setHeight,
                      alignment: WrapAlignment.start,
                      children: screenList.map((item) {
                        return _itemList(context: context, item: item);
                      }).toList(),
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

  Widget _itemList({required BuildContext context, required ScreenListDataModel item}) {
    return InkWell(
      onTap: () {
        item.onClick?.call();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.setWidth, vertical: 4.setHeight),
        padding: EdgeInsets.symmetric(horizontal: 14.setWidth, vertical: 14.setHeight),
        width: (MediaQuery.of(context).size.width - 16.setWidth * 2 - 14.setWidth * 2) / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: CustomAppColor.of(context).listTileColorScreenList,
          boxShadow: [
            BoxShadow(
              color: CustomAppColor.of(context).listTileShadow..withOpacityPercent(.10),
              offset: const Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 1,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 6.setHeight),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    CustomAppColor.of(context).bgSkyBlue,
                    CustomAppColor.of(context).bgDarkBlue,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                item.icon,
                height: 29.setHeight,
                width: 18.setHeight,
                gaplessPlayback: true,
              ),
            ),
            SizedBox(height: 10.setHeight),
            Container(
              constraints: BoxConstraints(minHeight: 37.setHeight),
              alignment: Alignment.center,
              child: CommonText(
                text: item.title.toUpperCase(),
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w700,
                textColor: CustomAppColor.of(context).txtBlack,
                textAlign: TextAlign.center,
                isAutoSize: true,
                maxLines: 2,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
