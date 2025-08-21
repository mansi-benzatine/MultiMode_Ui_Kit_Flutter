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
        title: "Splash",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SplashScreen.route()),
      ),
      ScreenListDataModel(
        title: "Onboarding 1",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, OnBoardingScreen.route(index: 0)),
      ),
      ScreenListDataModel(
        title: "Onboarding 2",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, OnBoardingScreen.route(index: 1)),
      ),
      ScreenListDataModel(
        title: "Onboarding 3",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, OnBoardingScreen.route(index: 2)),
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
        title: "Sign up",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SignUpScreen.route()),
      ),
      ScreenListDataModel(
        title: "Forgot Password",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ForgotPasswordScreen.route()),
      ),
      ScreenListDataModel(
        title: "Enter otp",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ForgotPasswordOtpScreen.route()),
      ),
      ScreenListDataModel(
        title: "Reset Password",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ResetPasswordScreen.route()),
      ),
      ScreenListDataModel(
        title: "Create Profile",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, CreateProfileScreen.route()),
      ),
      ScreenListDataModel(
        title: "Create New Pin",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, CreateNewPinScreen.route()),
      ),
      ScreenListDataModel(
        title: "Home",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ChatAiDashboardScreen.route(isFromHomeScreen: true, isFromHistory: false, isFromExplore: false, isFromProfile: false, isFromEmptyHistoryScreen: false)),
      ),
      ScreenListDataModel(
        title: "Notification",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, NotificationScreen.route()),
      ),
      ScreenListDataModel(
        title: "Chat",
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
        title: "Empty Chat",
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
        title: "Explore",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ChatAiDashboardScreen.route(isFromHomeScreen: false, isFromHistory: false, isFromExplore: true, isFromProfile: false, isFromEmptyHistoryScreen: false)),
      ),
      ScreenListDataModel(
        title: "Writing",
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
        title: "Entertainment",
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
        title: "Code",
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
        title: "Business",
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
        title: "Social Media",
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
        title: "Personal",
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
        title: "Recipes",
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
        title: "Translator",
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
        title: "History",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ChatAiDashboardScreen.route(isFromHomeScreen: false, isFromHistory: true, isFromExplore: false, isFromProfile: false, isFromEmptyHistoryScreen: false)),
      ),
      ScreenListDataModel(
        title: "Search",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SearchScreen.route()),
      ),
      ScreenListDataModel(
        title: "Profile",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ChatAiDashboardScreen.route(isFromHomeScreen: false, isFromHistory: false, isFromExplore: false, isFromProfile: true, isFromEmptyHistoryScreen: false)),
      ),
      ScreenListDataModel(
        title: "Upgrade Plan",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, UpgradePlanScreen.route()),
      ),
      ScreenListDataModel(
        title: "Payment Method",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, PaymentMethodScreen.route()),
      ),
      ScreenListDataModel(
        title: "Add New Card",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, AddNewCardScreen.route()),
      ),
      ScreenListDataModel(
        title: "Review Summary",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, ReviewSummaryScreen.route()),
      ),
      ScreenListDataModel(
        title: "Edit Profile",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, EditProfileScreen.route()),
      ),
      ScreenListDataModel(
        title: "Notification Setting",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, NotificationSettingsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Security",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, SecurityScreen.route()),
      ),
      ScreenListDataModel(
        title: "Languages",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, LanguagesScreen.route()),
      ),
      ScreenListDataModel(
        title: "Privacy Policy",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, PrivacyPolicyScreen.route()),
      ),
      ScreenListDataModel(
        title: "Help Center",
        icon: AppAssets.icScreen,
        onClick: () => Navigator.push(context, HelpCenterScreen.route()),
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
          leadingWidth: 38.setWidth,
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
