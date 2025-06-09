import 'package:flutter/material.dart';
import 'package:social_smart_social_media_screens_app_package/ui/add_media/view/add_media_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/add_sounds/view/add_sound_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/call/view/call_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/change_password/view/change_password_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/chat/view/chat_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/create_new_password/view/create_new_password_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/edit_about_you/view/edit_about_you_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/edit_profile/view/edit_profile_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/edit_social/view/edit_social_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/find_friends/view/find_friends_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/followers/view/followers_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/forgot_password/view/forgot_password_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/hashtag_details/view/hashtag_details_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/help_center/view/help_center_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/home/view/home_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/language/view/language_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/manage_account/view/manage_account_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/on_boarding/view/onboarding_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/privacy_policy/view/privacy_policy_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/profile_setup/view/profile_setup_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/report/view/report_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/search/view/search_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/see_live/view/see_live_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/setting/view/setting_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/sign_in/view/signin_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/sign_up/view/signup_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/trending_sound/view/trending_sound_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/verify_email/view/verify_email_screen.dart';
import 'package:social_smart_social_media_screens_app_package/ui/welcome/view/welcome_screen.dart';
import 'package:social_smart_social_media_screens_app_package/utils/utils.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../add_post_details/view/add_post_details_screen.dart';
import '../../create_posts/view/create_post_screen.dart';
import '../../edit_content/view/edit_content_screen.dart';
import '../../message/view/message_screen.dart';
import '../../profile/view/profile_screen.dart';
import '../../splash/splash_screen.dart';
import '../datamodel/screens_list_data.dart';

class SocialSmartSocialMediaScreenListScreen extends StatefulWidget {
  final String title;
  final Function()? onBack;

  const SocialSmartSocialMediaScreenListScreen({super.key, required this.title, this.onBack});

  static Route<void> route({required String title}) {
    return MaterialPageRoute<void>(builder: (_) => SocialSmartSocialMediaScreenListScreen(title: title));
  }

  @override
  State<SocialSmartSocialMediaScreenListScreen> createState() => _SocialSmartSocialMediaScreenListScreen();
}

class _SocialSmartSocialMediaScreenListScreen extends State<SocialSmartSocialMediaScreenListScreen> {
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
        onClick: () => Navigator.push(context, OnboardingScreen.route(initialIndex: 0)),
      ),
      ScreenListDataModel(
        title: "Onboarding 2".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, OnboardingScreen.route(initialIndex: 1)),
      ),
      ScreenListDataModel(
        title: "Onboarding 3".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, OnboardingScreen.route(initialIndex: 2)),
      ),
      ScreenListDataModel(
        title: "Welcome".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, WelcomeScreen.route()),
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
        title: "Forgot Password".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ForgotPasswordScreen.route()),
      ),
      ScreenListDataModel(
        title: "Verify email".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, VerifyEmailScreen.route()),
      ),
      ScreenListDataModel(
        title: "Create new password".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, CreateNewPasswordScreen.route()),
      ),
      ScreenListDataModel(
        title: "Choose your interest".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ProfileSetUpScreen.route(initialIndex: 0)),
      ),
      ScreenListDataModel(
        title: "Tell us about yourself".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ProfileSetUpScreen.route(initialIndex: 1)),
      ),
      ScreenListDataModel(
        title: "When is your birthday".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ProfileSetUpScreen.route(initialIndex: 2)),
      ),
      ScreenListDataModel(
        title: "Fill your profile".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ProfileSetUpScreen.route(initialIndex: 3)),
      ),
      ScreenListDataModel(
        title: "Create new pin".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ProfileSetUpScreen.route(initialIndex: 4)),
      ),
      ScreenListDataModel(
        title: "Home".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            HomeScreen.route(
              isFromHome: true,
              isFromInbox: false,
              isFromDiscover: false,
              isFromProfile: false,
              isFromOptionsForPosts: false,
            )),
      ),
      ScreenListDataModel(
        title: "Report".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ReportScreen.route()),
      ),
      ScreenListDataModel(
        title: "User's Profile".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ProfileScreen.route(isFromPost: true)),
      ),
      ScreenListDataModel(
        title: "Followers".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, FollowersScreen.route()),
      ),
      ScreenListDataModel(
        title: "Send Message".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, MessageScreen.route(false)),
      ),
      ScreenListDataModel(
        title: "Search".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SearchScreen.route()),
      ),
      ScreenListDataModel(
        title: "Option for Create".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            HomeScreen.route(
              isFromHome: false,
              isFromInbox: false,
              isFromDiscover: false,
              isFromProfile: false,
              isFromOptionsForPosts: true,
            )),
      ),
      ScreenListDataModel(
        title: "Posts Quick photo".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            CreatePostScreen.route(
              isVideoSelected: false,
              isTemplateSelected: false,
              isPhotoSelected: true,
              isCameraSelected: false,
              currentIndex: 1,
            )),
      ),
      ScreenListDataModel(
        title: "Posts Quick Video".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            CreatePostScreen.route(
              isVideoSelected: true,
              isTemplateSelected: false,
              isPhotoSelected: false,
              isCameraSelected: false,
              currentIndex: 1,
            )),
      ),
      ScreenListDataModel(
        title: "Posts camera".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            CreatePostScreen.route(
              isVideoSelected: false,
              isTemplateSelected: false,
              isPhotoSelected: false,
              isCameraSelected: true,
              currentIndex: 1,
            )),
      ),
      ScreenListDataModel(
        title: "Posts Templates".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            CreatePostScreen.route(
              isVideoSelected: false,
              isTemplateSelected: true,
              isPhotoSelected: false,
              isCameraSelected: false,
              currentIndex: 1,
            )),
      ),
      ScreenListDataModel(
        title: "Posts add sounds".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, AddSoundScreen.route()),
      ),
      ScreenListDataModel(
        title: "Posts upload media".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, AddMediaScreen.route()),
      ),
      ScreenListDataModel(
        title: "Posts edit pages".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditContentScreen.route(isGoLiveScreen: false)),
      ),
      ScreenListDataModel(
        title: "Posts add details information".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, AddPostDetailsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Go Live".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditContentScreen.route(isGoLiveScreen: true)),
      ),
      ScreenListDataModel(
        title: "See Live".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SeeLiveScreen.route()),
      ),
      ScreenListDataModel(
        title: "Discover".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            HomeScreen.route(
              isFromHome: false,
              isFromInbox: false,
              isFromDiscover: true,
              isFromProfile: false,
              isFromOptionsForPosts: false,
            )),
      ),
      ScreenListDataModel(
        title: "Trending Sounds Details".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, TrendingSoundScreen.route()),
      ),
      ScreenListDataModel(
        title: "Trending Hashtags details".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, HashtagDetailsScreen.route()),
      ),
      ScreenListDataModel(
        title: "All Activity".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            HomeScreen.route(
              isFromHome: false,
              isFromInbox: true,
              isFromDiscover: false,
              isFromProfile: false,
              isFromOptionsForPosts: false,
            )),
      ),
      ScreenListDataModel(
        title: "Chat".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ChatScreen.route()),
      ),
      ScreenListDataModel(
        title: "Sent Message".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, MessageScreen.route(true)),
      ),
      ScreenListDataModel(
        title: "Call".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, CallScreen.route()),
      ),
      ScreenListDataModel(
        title: "Profile".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            HomeScreen.route(
              isFromHome: false,
              isFromInbox: false,
              isFromDiscover: false,
              isFromProfile: true,
              isFromOptionsForPosts: false,
            )),
      ),
      ScreenListDataModel(
        title: "Find Friends".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, FindFriendsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Edit Profile".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditProfileScreen.route()),
      ),
      ScreenListDataModel(
        title: "Edit About You".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditAboutYouScreen.route()),
      ),
      ScreenListDataModel(
        title: "Edit Social".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditSocialYouScreen.route()),
      ),
      ScreenListDataModel(
        title: "Settings".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SettingScreen.route()),
      ),
      ScreenListDataModel(
        title: "Manage Accounts".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ManageAccountScreen.route()),
      ),
      ScreenListDataModel(
        title: "Change Password".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ChangePasswordScreen.route()),
      ),
      ScreenListDataModel(
        title: "Language".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, LanguageScreen.route()),
      ),
      ScreenListDataModel(
        title: "Help center".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, HelpCenterScreen.route()),
      ),
      ScreenListDataModel(
        title: "Privacy Policy".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, PrivacyPolicyScreen.route()),
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
            text: "Social Media App",
            fontSize: AppSizes.setFontSize(20),
            textColor: CustomAppColor.of(context).white,
            fontWeight: FontWeight.w700,
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: AppSizes.setHeight(20)),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.imgBg),
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
        width: AppSizes.fullWidth,
        margin: EdgeInsets.only(top: AppSizes.setHeight(10)),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).txtWhite,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        ),
        child: Column(
          children: [
            Container(
              height: AppSizes.setHeight(6),
              width: AppSizes.setWidth(50),
              margin: EdgeInsets.symmetric(vertical: AppSizes.setHeight(15)),
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
                      spacing: AppSizes.setWidth(10),
                      runSpacing: AppSizes.setHeight(10),
                      alignment: WrapAlignment.start,
                      children: screenList.map((item) {
                        return _itemList(context: context, item: item);
                      }).toList(),
                    ),
                    SizedBox(height: AppSizes.setHeight(20)),
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
        margin: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(4), vertical: AppSizes.setHeight(4)),
        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(14), vertical: AppSizes.setHeight(14)),
        width: (MediaQuery.of(context).size.width - AppSizes.setWidth(16) * 2 - AppSizes.setWidth(14) * 2) / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: CustomAppColor.of(context).listTileColorScreenList,
          boxShadow: [
            BoxShadow(
              color: CustomAppColor.of(context).listTileShadow.withOpacityPercent(.10),
              offset: const Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 1,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: AppSizes.setHeight(4)),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.setWidth(20),
                vertical: AppSizes.setHeight(15),
              ),
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
                height: AppSizes.setHeight(29),
                width: AppSizes.setHeight(18),
                gaplessPlayback: true,
              ),
            ),
            SizedBox(height: AppSizes.setHeight(10)),
            Container(
              constraints: BoxConstraints(minHeight: AppSizes.setHeight(37)),
              alignment: Alignment.center,
              child: CommonText(
                text: item.title.toUpperCase(),
                fontSize: AppSizes.setFontSize(12),
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
