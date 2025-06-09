import 'package:chat_ai_screens_app_package/ui/add_new_card/view/add_new_card_screen.dart';
import 'package:chat_ai_screens_app_package/ui/create_new_pin/view/create_new_pin_screen.dart';
import 'package:chat_ai_screens_app_package/ui/create_profile/view/create_profile_screen.dart';
import 'package:chat_ai_screens_app_package/ui/edit_profile/view/edit_profile_screen.dart';
import 'package:chat_ai_screens_app_package/ui/forgot_password/view/forgot_password_screen.dart';
import 'package:chat_ai_screens_app_package/ui/help_center/view/help_center_screen.dart';
import 'package:chat_ai_screens_app_package/ui/languages/view/languages_screen.dart';
import 'package:chat_ai_screens_app_package/ui/notification/view/notification_screen.dart';
import 'package:chat_ai_screens_app_package/ui/notification_settings/view/notification_settings_screen.dart';
import 'package:chat_ai_screens_app_package/ui/payment_method/view/payment_method_screen.dart';
import 'package:chat_ai_screens_app_package/ui/privacy_policy/view/privacy_policy_screen.dart';
import 'package:chat_ai_screens_app_package/ui/reset_password/view/reset_password_screen.dart';
import 'package:chat_ai_screens_app_package/ui/review_summary/view/review_summary_screen.dart';
import 'package:chat_ai_screens_app_package/ui/search/view/search_screen.dart';
import 'package:chat_ai_screens_app_package/ui/security/view/security_screen.dart';
import 'package:chat_ai_screens_app_package/ui/sign_up/view/sign_up_screen.dart';
import 'package:chat_ai_screens_app_package/ui/upgrade_plan/view/upgrade_plan_screen.dart';
import 'package:chat_ai_screens_app_package/utils/sizer_utils.dart';
import 'package:chat_ai_screens_app_package/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../chat/view/chat_screen.dart';
import '../../dashboard/view/dashboard_screen.dart';
import '../../forgot_password_otp/view/forgot_password_otp_screen.dart';
import '../../on_boarding/view/on_boarding_screen.dart';
import '../../sign_in/view/sign_in_screen.dart';
import '../../splash/splash_screen.dart';
import '../../tools/model/tools_data_model.dart';
import '../../tools_list/view/tools_list_screen.dart';
import '../../welcome/view/welcome_screen.dart';
import '../datamodel/screens_list_data.dart';

class ChatAiScreenListScreen extends StatefulWidget {
  final String title;
  final Function()? onBack;

  const ChatAiScreenListScreen({super.key, required this.title, this.onBack});

  static Route<void> route({required String title}) {
    return MaterialPageRoute<void>(builder: (_) => ChatAiScreenListScreen(title: title));
  }

  @override
  State<ChatAiScreenListScreen> createState() => _ChatAiScreenListScreen();
}

class _ChatAiScreenListScreen extends State<ChatAiScreenListScreen> {
  List<ScreenListDataModel> screenList = [];

  _fillData() {
    screenList = [
      ScreenListDataModel(
        title: "Splash".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SplashScreen.route()),
      ),
      ScreenListDataModel(
        title: "OnBoarding 1".toUpperCase(),
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
        title: "Welcome".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, WelcomeScreen.route()),
      ),
      ScreenListDataModel(
        title: "Sign In".toUpperCase(),
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
        title: "Enter otp".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ForgotPasswordOtpScreen.route()),
      ),
      ScreenListDataModel(
        title: "Reset Password".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ResetPasswordScreen.route()),
      ),
      ScreenListDataModel(
        title: "Create Profile".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, CreateProfileScreen.route()),
      ),
      ScreenListDataModel(
        title: "Create New Pin".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, CreateNewPinScreen.route()),
      ),
      ScreenListDataModel(
        title: "Home".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            ChatAiDashboardScreen.route(
                isFromHomeScreen: true, isFromHistory: false, isFromExplore: false, isFromProfile: false, isFromEmptyHistoryScreen: false)),
      ),
      ScreenListDataModel(
        title: "Notification".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, NotificationScreen.route()),
      ),
      ScreenListDataModel(
        title: "Chat".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            ChatScreen.route(
              isFromEmptyChatScreen: false,
              isNewChat: false,
              chatTitle: "How can i help you today?",
            )),
      ),
      ScreenListDataModel(
        title: "Empty Chat".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            ChatScreen.route(
              isFromEmptyChatScreen: true,
              chatTitle: "New Chat",
              isNewChat: true,
            )),
      ),
      ScreenListDataModel(
        title: "Explore".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            ChatAiDashboardScreen.route(
                isFromHomeScreen: false, isFromHistory: false, isFromExplore: true, isFromProfile: false, isFromEmptyHistoryScreen: false)),
      ),
      ScreenListDataModel(
        title: "Writing".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            ToolsListScreen.route(
              item: ToolsDataModel(
                title: Languages.of(context).txtWriting,
                description: Languages.of(context).txtLoremIpsumDesc,
                image: AppAssets.icToolWriting,
                type: Constant.toolWriting,
              ),
            )),
      ),
      ScreenListDataModel(
        title: "Entertainment".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            ToolsListScreen.route(
              item: ToolsDataModel(
                title: Languages.of(context).txtEntertainment,
                description: Languages.of(context).txtLoremIpsumDesc,
                image: AppAssets.icToolEntertainment,
                type: Constant.toolEntertainment,
              ),
            )),
      ),
      ScreenListDataModel(
        title: "code".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
          context,
          ToolsListScreen.route(
            item: ToolsDataModel(
              title: Languages.of(context).txtCode,
              description: Languages.of(context).txtLoremIpsumDesc,
              image: AppAssets.icToolCode,
              type: Constant.toolCode,
            ),
          ),
        ),
      ),
      ScreenListDataModel(
        title: "Business".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            ToolsListScreen.route(
              item: ToolsDataModel(
                title: Languages.of(context).txtBusiness,
                description: Languages.of(context).txtLoremIpsumDesc,
                image: AppAssets.icToolBusiness,
                type: Constant.toolBusiness,
              ),
            )),
      ),
      ScreenListDataModel(
        title: "Social media".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            ToolsListScreen.route(
              item: ToolsDataModel(
                title: Languages.of(context).txtSocialMedia,
                description: Languages.of(context).txtLoremIpsumDesc,
                image: AppAssets.icToolSocialMedia,
                type: Constant.toolSocialMedia,
              ),
            )),
      ),
      ScreenListDataModel(
        title: "Personal".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            ToolsListScreen.route(
              item: ToolsDataModel(
                title: Languages.of(context).txtPersonal,
                description: Languages.of(context).txtLoremIpsumDesc,
                image: AppAssets.icToolPersonal,
                type: Constant.toolPersonal,
              ),
            )),
      ),
      ScreenListDataModel(
        title: "Recipes".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            ToolsListScreen.route(
              item: ToolsDataModel(
                title: Languages.of(context).txtRecipes,
                description: Languages.of(context).txtLoremIpsumDesc,
                image: AppAssets.icToolRecipes,
                type: Constant.toolRecipes,
              ),
            )),
      ),
      ScreenListDataModel(
        title: "Translator".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            ToolsListScreen.route(
              item: ToolsDataModel(
                title: Languages.of(context).txtTranslator,
                description: Languages.of(context).txtLoremIpsumDesc,
                image: AppAssets.icToolTranslator,
                type: Constant.toolTranslator,
              ),
            )),
      ),
      ScreenListDataModel(
        title: "History".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            ChatAiDashboardScreen.route(
                isFromHomeScreen: false, isFromHistory: true, isFromExplore: false, isFromProfile: false, isFromEmptyHistoryScreen: false)),
      ),
      ScreenListDataModel(
        title: "Search".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SearchScreen.route()),
      ),
      ScreenListDataModel(
        title: "Profile".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(
            context,
            ChatAiDashboardScreen.route(
                isFromHomeScreen: false, isFromHistory: false, isFromExplore: false, isFromProfile: true, isFromEmptyHistoryScreen: false)),
      ),
      ScreenListDataModel(
        title: "Upgrade plan".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, UpgradePlanScreen.route()),
      ),
      ScreenListDataModel(
        title: "Payment Method".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, PaymentMethodScreen.route()),
      ),
      ScreenListDataModel(
        title: "Add New Card".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, AddNewCardScreen.route()),
      ),
      ScreenListDataModel(
        title: "Review Summary".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ReviewSummaryScreen.route()),
      ),
      ScreenListDataModel(
        title: "Edit Profile".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditProfileScreen.route()),
      ),
      ScreenListDataModel(
        title: "Notification setting".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, NotificationSettingsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Security".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SecurityScreen.route()),
      ),
      ScreenListDataModel(
        title: "Languages".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, LanguagesScreen.route()),
      ),
      ScreenListDataModel(
        title: "Privacy Policy".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, PrivacyPolicyScreen.route()),
      ),
      ScreenListDataModel(
        title: "Help center".toUpperCase(),
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, HelpCenterScreen.route()),
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
          text: "Chat Ai App",
          fontSize: 22.setFontSize,
          fontWeight: FontWeight.w700,
          textColor: CustomAppColor.of(context).white,
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
              color: CustomAppColor.of(context).listTileShadow.withOpacityPercent(.10),
              offset: const Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 1,
            )
          ],
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
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
                fontSize: 13.setFontSize,
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
