import 'package:cinemix_screens_app/ui/add_avatar/view/add_avatar_screen.dart';
import 'package:cinemix_screens_app/ui/add_new_card/view/add_new_card_screen.dart';
import 'package:cinemix_screens_app/ui/dashboard/view/dashboard_screen.dart';
import 'package:cinemix_screens_app/ui/edit_profile/view/edit_profile_screen.dart';
import 'package:cinemix_screens_app/ui/explore_movie/views/explore_movie_screen.dart';
import 'package:cinemix_screens_app/ui/forgot_password/view/forgot_password_screen.dart';
import 'package:cinemix_screens_app/ui/fullscreen/view/fullscreen_screen.dart';
import 'package:cinemix_screens_app/ui/get_started/view/get_started_screen.dart';
import 'package:cinemix_screens_app/ui/help_and_support/view/help_and_support_screen.dart';
import 'package:cinemix_screens_app/ui/languages/view/languages_screen.dart';
import 'package:cinemix_screens_app/ui/login/view/login_screen.dart';
import 'package:cinemix_screens_app/ui/my_list/view/my_list_screen.dart';
import 'package:cinemix_screens_app/ui/new_release/views/new_release_screen.dart';
import 'package:cinemix_screens_app/ui/notification/view/notification_screen.dart';
import 'package:cinemix_screens_app/ui/onboarding/view/onboarding_screen.dart';
import 'package:cinemix_screens_app/ui/otp_verification/view/otp_verification_screen.dart';
import 'package:cinemix_screens_app/ui/payment_method/view/payment_method_screen.dart';
import 'package:cinemix_screens_app/ui/profile_setup/view/profile_setup_screen.dart';
import 'package:cinemix_screens_app/ui/reset_password/view/reset_password_screen.dart';
import 'package:cinemix_screens_app/ui/upgrade_plan/view/upgrade_plan_screen.dart';
import 'package:cinemix_screens_app/ui/who_is_watching/view/who_is_watching_screen.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../edit_avatar/view/edit_avatar_screen.dart';
import '../../edit_avatars/view/edit_avatars_screen.dart';
import '../../home/datamodel/home_data.dart';
import '../../review_summary/view/review_summary_screen.dart';
import '../../sign_up/view/sign_up_screen.dart';
import '../../splash/view/splash_screen.dart';
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
        title: "Onboarding 3",
        onClick: () => Navigator.push(context, OnboardingScreen.route(currentIndex: 3)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Get Started",
        onClick: () => Navigator.push(context, GetStartedScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Login",
        onClick: () => Navigator.push(context, LoginScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sign Up",
        onClick: () => Navigator.push(context, SignUpScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Forgot Password",
        onClick: () => Navigator.push(context, ForgotPasswordScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "OTP Verification",
        onClick: () => Navigator.push(context, OtpVerificationScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Reset Password",
        onClick: () => Navigator.push(context, ResetPasswordScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Reset Password Successfully",
        onClick: () => Navigator.push(context, ResetPasswordScreen.route(isShowSuccessAlert: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Choose Your Interest",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Fill Up Profile Details",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Create New Pin",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Add Your Fingerprint",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 3)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Profile Setup Successfully",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 3, isShowSuccessAlert: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Choose Who Is Watching",
        onClick: () => Navigator.push(context, WhoIsWatchingScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Add Profile",
        onClick: () => Navigator.push(context, AddAvatarScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Profiles",
        onClick: () => Navigator.push(context, EditAvatarsScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Profile",
        onClick: () => Navigator.push(context, EditAvatarScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Home",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Switch Profile",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0, isShowSwitchProfileBs: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Profile",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0, isShowEditProfileBs: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Explore Movie",
        onClick: () => Navigator.push(
            context,
            ExploreMovieScreen.route(
              movie: Movie(
                title: "Miroo",
                image: AppAssets.imgGetStarted9,
                category: "Popular Movies",
                rank: 9.8,
              ),
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Download Movie",
        onClick: () => Navigator.push(
          context,
          ExploreMovieScreen.route(
            movie: Movie(
              title: "Miroo",
              image: AppAssets.imgGetStarted9,
              category: "Popular Movies",
              rank: 9.8,
            ),
            isShowDownloadAlert: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Explore Series",
        onClick: () => Navigator.push(
            context,
            ExploreMovieScreen.route(
              movie: Movie(
                title: "Miroo",
                image: AppAssets.imgGetStarted5,
                category: "Popular Movies",
                subCategory: "Series",
                rank: 9.8,
              ),
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Give Review",
        onClick: () => Navigator.push(
          context,
          ExploreMovieScreen.route(
            movie: Movie(
              title: "Miroo",
              image: AppAssets.imgGetStarted5,
              category: "Popular Movies",
              subCategory: "Series",
              rank: 9.8,
            ),
            isShowReviewAlert: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Send To",
        onClick: () => Navigator.push(
          context,
          ExploreMovieScreen.route(
            movie: Movie(
              title: "Miroo",
              image: AppAssets.imgGetStarted5,
              category: "Popular Movies",
              subCategory: "Series",
              rank: 9.8,
            ),
            isShowShareAlert: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "New Release",
        onClick: () => Navigator.push(context, NewReleaseScreen.route(allMovies: movies)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Play Movie - Zoom Out",
        onClick: () => Navigator.push(
          context,
          ExploreMovieScreen.route(
            movie: Movie(
              title: "Miroo",
              image: AppAssets.imgGetStarted5,
              category: "Popular Movies",
              subCategory: "Series",
              rank: 9.8,
            ),
            isFromContinueWatching: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Play Movie - Zoom In",
        onClick: () => Navigator.push(
            context,
            FullscreenScreen.route(
              movie: Movie(
                title: "Miroo",
                image: AppAssets.imgGetStarted5,
                category: "Popular Movies",
                rank: 9.8,
              ),
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Search",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Search Not Found",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 1, isForEmptySearchView: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sort & Filter",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 1, isShowFilterBs: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Downloads",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Delete Movie",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2, isShowDeleteMovieAlert: true)),
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
        title: "My List",
        onClick: () => Navigator.push(context, MyListScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Notification",
        onClick: () => Navigator.push(context, NotificationScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Languages",
        onClick: () => Navigator.push(context, LanguagesScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Help & Support : FAQ",
        onClick: () => Navigator.push(context, HelpCenterScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Help & Support : Contact Us",
        onClick: () => Navigator.push(context, HelpCenterScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Get Premium",
        onClick: () => Navigator.push(context, UpgradePlanScreen.route()),
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
        title: "Review Summary",
        onClick: () => Navigator.push(context, ReviewSummaryScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Subscription Successfully",
        onClick: () => Navigator.push(context, ReviewSummaryScreen.route(isShowSubscriptionDoneAlert: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Logout",
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              currentIndex: 3,
              isShowLogoutAlert: true,
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
          centerTitle: false,
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
            text: "Cinemix App",
            fontSize: 23.setFontSize,
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
              image: AssetImage(AppAssets.imgBgHOmeScreenPlain),
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
