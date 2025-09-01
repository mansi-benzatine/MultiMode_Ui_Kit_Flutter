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
import 'package:social_smart_social_media_screens_app_package/utils/constant.dart';

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
        title: "Splash",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SplashScreen.route()),
      ),
      ScreenListDataModel(
        title: "Onboarding 1",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, OnboardingScreen.route(initialIndex: 0)),
      ),
      ScreenListDataModel(
        title: "Onboarding 2",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, OnboardingScreen.route(initialIndex: 1)),
      ),
      ScreenListDataModel(
        title: "Onboarding 3",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, OnboardingScreen.route(initialIndex: 2)),
      ),
      ScreenListDataModel(
        title: "Welcome",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, WelcomeScreen.route()),
      ),
      ScreenListDataModel(
        title: "Sign In",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SignInScreen.route()),
      ),
      ScreenListDataModel(
        title: "Sign Up",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SignUpScreen.route()),
      ),
      ScreenListDataModel(
        title: "Forgot Password",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ForgotPasswordScreen.route()),
      ),
      ScreenListDataModel(
        title: "Verify Email",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, VerifyEmailScreen.route()),
      ),
      ScreenListDataModel(
        title: "Create New Password",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, CreateNewPasswordScreen.route()),
      ),
      ScreenListDataModel(
        title: "Choose Your Interest",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ProfileSetUpScreen.route(initialIndex: 0)),
      ),
      ScreenListDataModel(
        title: "Tell Us About Yourself",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ProfileSetUpScreen.route(initialIndex: 1)),
      ),
      ScreenListDataModel(
        title: "When Is Your Birthday",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ProfileSetUpScreen.route(initialIndex: 2)),
      ),
      ScreenListDataModel(
        title: "Fill Your Profile",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ProfileSetUpScreen.route(initialIndex: 3)),
      ),
      ScreenListDataModel(
        title: "Create New Pin",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ProfileSetUpScreen.route(initialIndex: 4)),
      ),
      ScreenListDataModel(
        title: "Home",
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
        title: "Reels Share To",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            HomeScreen.route(
              isFromHome: true,
              isFromInbox: false,
              isFromDiscover: false,
              isFromProfile: false,
              isFromOptionsForPosts: false,
              isForShareTo: true,
            )),
      ),
      ScreenListDataModel(
        title: "Reel's Comments",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            HomeScreen.route(
              isFromHome: true,
              isFromInbox: false,
              isFromDiscover: false,
              isFromProfile: false,
              isFromOptionsForPosts: false,
              isForCommentBs: true,
            )),
      ),
      ScreenListDataModel(
        title: "Report",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ReportScreen.route()),
      ),
      ScreenListDataModel(
        title: "User's Profile : Reels",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ProfileScreen.route(isFromPost: true, currentIndex: 0)),
      ),
      ScreenListDataModel(
        title: "User's Profile : Saved Reels",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ProfileScreen.route(isFromPost: true, currentIndex: 1)),
      ),
      ScreenListDataModel(
        title: "User's Profile : Liked Reels",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ProfileScreen.route(isFromPost: true, currentIndex: 2)),
      ),
      ScreenListDataModel(
        title: "Followers",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, FollowersScreen.route()),
      ),
      ScreenListDataModel(
        title: "Send Message",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, MessageScreen.route(false)),
      ),
      ScreenListDataModel(
        title: "Search Type Keyword",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SearchScreen.route()),
      ),
      ScreenListDataModel(
        title: "Search Result : Top",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SearchScreen.route(currentIndex: 0, isSearched: true)),
      ),
      ScreenListDataModel(
        title: "Search Result : Users",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SearchScreen.route(isSearched: true, currentIndex: 1)),
      ),
      ScreenListDataModel(
        title: "Search Result : Videos",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SearchScreen.route(currentIndex: 2, isSearched: true)),
      ),
      ScreenListDataModel(
        title: "Search Result : Sounds",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SearchScreen.route(isSearched: true, currentIndex: 3)),
      ),
      ScreenListDataModel(
        title: "Search Result : Live",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SearchScreen.route(currentIndex: 4, isSearched: true)),
      ),
      ScreenListDataModel(
        title: "Search Result : Hashtag",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SearchScreen.route(isSearched: true, currentIndex: 5)),
      ),
      ScreenListDataModel(
        title: "Option For Create",
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
        title: "Posts Quick photo",
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
        title: "Posts Quick Video",
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
        title: "Posts Camera",
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
        title: "Posts Templates",
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
        title: "Add Sounds For Posts",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, AddSoundScreen.route()),
      ),
      ScreenListDataModel(
        title: "Add Trending Effect For Posts",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            CreatePostScreen.route(
              isVideoSelected: false,
              isTemplateSelected: false,
              isPhotoSelected: false,
              isCameraSelected: true,
              currentIndex: 0,
              isForEffectBs: true,
            )),
      ),
      ScreenListDataModel(
        title: "Add New Effect For Posts",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            CreatePostScreen.route(
              isVideoSelected: false,
              isTemplateSelected: false,
              isPhotoSelected: false,
              isCameraSelected: true,
              currentIndex: 1,
              isForEffectBs: true,
            )),
      ),
      ScreenListDataModel(
        title: "Posts Upload Media : All",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, AddMediaScreen.route(currentIndex: 0)),
      ),
      ScreenListDataModel(
        title: "Posts Upload Media : Videos",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, AddMediaScreen.route(currentIndex: 1)),
      ),
      ScreenListDataModel(
        title: "Posts Upload Media : Photos",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, AddMediaScreen.route(currentIndex: 2)),
      ),
      ScreenListDataModel(
        title: "Posts Edit Pages",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditContentScreen.route(isGoLiveScreen: false)),
      ),
      ScreenListDataModel(
        title: "Posts Add Details Information",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, AddPostDetailsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Go Live",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditContentScreen.route(isGoLiveScreen: true)),
      ),
      ScreenListDataModel(
        title: "See Live",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SeeLiveScreen.route()),
      ),
      ScreenListDataModel(
        title: "View Profile",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SeeLiveScreen.route(isForViewProfileBs: true)),
      ),
      ScreenListDataModel(
        title: "Viewers",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SeeLiveScreen.route(isForViewersBs: true)),
      ),
      ScreenListDataModel(
        title: "Weekly Ranking",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SeeLiveScreen.route(isForRisingStarBs: true, currentIndexBs: 0)),
      ),
      ScreenListDataModel(
        title: "Rising Star",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SeeLiveScreen.route(isForRisingStarBs: true, currentIndexBs: 1)),
      ),
      ScreenListDataModel(
        title: "Go Live Together",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SeeLiveScreen.route(isForGoLiveTogetherBs: true)),
      ),
      ScreenListDataModel(
        title: "Question & Answer",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SeeLiveScreen.route(isForQAndABs: true)),
      ),
      ScreenListDataModel(
        title: "Discover : Trending Sounds",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            HomeScreen.route(
              isFromHome: false,
              isFromInbox: false,
              isFromDiscover: true,
              isFromProfile: false,
              currentIndex: 0,
              isFromOptionsForPosts: false,
            )),
      ),
      ScreenListDataModel(
        title: "Discover : Hashtag",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            HomeScreen.route(
              isFromHome: false,
              isFromInbox: false,
              isFromDiscover: true,
              isFromProfile: false,
              currentIndex: 1,
              isFromOptionsForPosts: false,
            )),
      ),
      ScreenListDataModel(
        title: "Trending Sounds Details",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, TrendingSoundScreen.route()),
      ),
      ScreenListDataModel(
        title: "Trending Hashtags Details",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, HashtagDetailsScreen.route()),
      ),
      ScreenListDataModel(
        title: "All Activity",
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
        title: "Chat",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ChatScreen.route()),
      ),
      ScreenListDataModel(
        title: "Sent Message",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, MessageScreen.route(true)),
      ),
      ScreenListDataModel(
        title: "Call",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, CallScreen.route()),
      ),
      ScreenListDataModel(
        title: "Profile",
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
        title: "Switch Account",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, HomeScreen.route(isFromHome: false, isFromInbox: false, isFromDiscover: false, isFromProfile: true, isFromOptionsForPosts: false, isForSwitchAccountBs: true)),
      ),
      ScreenListDataModel(
        title: "Find Friends",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, FindFriendsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Edit Profile",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditProfileScreen.route()),
      ),
      ScreenListDataModel(
        title: "Edit About You",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditAboutYouScreen.route()),
      ),
      ScreenListDataModel(
        title: "Edit Social",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditSocialYouScreen.route()),
      ),
      ScreenListDataModel(
        title: "Settings",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SettingScreen.route()),
      ),
      ScreenListDataModel(
        title: "Manage Accounts",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ManageAccountScreen.route()),
      ),
      ScreenListDataModel(
        title: "Change Password",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ChangePasswordScreen.route()),
      ),
      ScreenListDataModel(
        title: "Language",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, LanguageScreen.route()),
      ),
      ScreenListDataModel(
        title: "Help Center : FAQ",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, HelpCenterScreen.route(currentIndex: 0)),
      ),
      ScreenListDataModel(
        title: "Help Center : Contact Us",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, HelpCenterScreen.route(currentIndex: 1)),
      ),
      ScreenListDataModel(
        title: "Privacy Policy",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, PrivacyPolicyScreen.route()),
      ),
      ScreenListDataModel(
        title: "Logout",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ManageAccountScreen.route(isForLogoutBs: true)),
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
                      children: List.generate(screenList.length, (index) {
                        return _itemList(
                          context: context,
                          item: screenList[index],
                          index: index + 1,
                        );
                      }),
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
        padding: EdgeInsets.only(left: AppSizes.setWidth(20), right: AppSizes.setWidth(20), top: AppSizes.setHeight(3)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(16), vertical: AppSizes.setHeight(18)),
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
                      fontSize: AppSizes.setFontSize(15),
                      fontFamily: Constant.fontFamilyMontserratSemiBold,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    Expanded(
                      child: CommonText(
                        text: item.title,
                        fontSize: AppSizes.setFontSize(14),
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
                padding: EdgeInsets.only(left: AppSizes.setWidth(20)),
                child: Image.asset(
                  item.icon,
                  height: AppSizes.setHeight(20),
                  width: AppSizes.setWidth(20),
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
