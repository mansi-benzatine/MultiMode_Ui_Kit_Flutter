import 'package:flutter/material.dart';
import 'package:stoxy_screens_app_package/ui/add_new_card/view/add_new_card_screen.dart';
import 'package:stoxy_screens_app_package/ui/buy/view/buy_screen.dart';
import 'package:stoxy_screens_app_package/ui/buy_method/view/buy_method_screen.dart';
import 'package:stoxy_screens_app_package/ui/dashboard/view/dashboard_screen.dart';
import 'package:stoxy_screens_app_package/ui/edit_card/views/edit_card_screen.dart';
import 'package:stoxy_screens_app_package/ui/edit_profile/view/edit_profile_screen.dart';
import 'package:stoxy_screens_app_package/ui/explore_stock/view/explore_stock_screen.dart';
import 'package:stoxy_screens_app_package/ui/forgot_password/view/forgot_password_screen.dart';
import 'package:stoxy_screens_app_package/ui/help_center/view/help_center_screen.dart';
import 'package:stoxy_screens_app_package/ui/home/view/home_screen.dart';
import 'package:stoxy_screens_app_package/ui/language_setting/view/language_setting_screen.dart';
import 'package:stoxy_screens_app_package/ui/login/view/login_screen.dart';
import 'package:stoxy_screens_app_package/ui/my_portfolio/view/my_portfolio_screen.dart';
import 'package:stoxy_screens_app_package/ui/my_wishlist/view/my_wishlist_screen.dart';
import 'package:stoxy_screens_app_package/ui/notification/view/notification_screen.dart';
import 'package:stoxy_screens_app_package/ui/notification_setting/view/notification_setting_screen.dart';
import 'package:stoxy_screens_app_package/ui/payment_method/view/payment_method_screen.dart';
import 'package:stoxy_screens_app_package/ui/preview_buy/view/preview_buy_screen.dart';
import 'package:stoxy_screens_app_package/ui/preview_exchange/view/preview_exchange_screen.dart';
import 'package:stoxy_screens_app_package/ui/preview_sell/view/preview_sell_screen.dart';
import 'package:stoxy_screens_app_package/ui/privacy_policy/view/privacy_policy_screen.dart';
import 'package:stoxy_screens_app_package/ui/profile_setup/view/profile_setup_screen.dart';
import 'package:stoxy_screens_app_package/ui/reset_password/view/reset_password_screen.dart';
import 'package:stoxy_screens_app_package/ui/search/view/searh_screen.dart';
import 'package:stoxy_screens_app_package/ui/security/view/security_screen.dart';
import 'package:stoxy_screens_app_package/ui/select_exchange_stocks/views/select_exchange_stocks_screen.dart';
import 'package:stoxy_screens_app_package/ui/sell/view/sell_screen.dart';
import 'package:stoxy_screens_app_package/ui/sign_up/view/sign_up_screen.dart';
import 'package:stoxy_screens_app_package/ui/verify_otp/view/verify_otp_screen.dart';
import 'package:stoxy_screens_app_package/ui/welcome/view/welcome_screen.dart';
import 'package:stoxy_screens_app_package/utils/sizer_utils.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../click_photo/view/click_photo_screen.dart';
import '../../onboarding/on_boarding_screen.dart';
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
        onClick: () => Navigator.push(context, OnboardingScreen.route(currentIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Get Started",
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
        title: "Forgot Password",
        onClick: () => Navigator.push(context, ForgotPasswordScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Enter OTP",
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
        title: "Choose Gender",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Choose Country",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Fill Up Profile Details",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Upload National ID Card",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 3)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Upload Selfie With Your Id Card",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 4)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Click Photo Of Your Id Card",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ClickPhotoScreen(
              isSelfie: false,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Click Selfie With Your Id Card",
        onClick: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ClickPhotoScreen(
              isSelfie: true,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Create New Pin",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 5)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Profile SetUp Successfully",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 5, isForDialog: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Home",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Search",
        onClick: () => Navigator.push(context, SearchScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Empty Search",
        onClick: () => Navigator.push(context, SearchScreen.route(isForEmptyScreen: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Notification",
        onClick: () => Navigator.push(context, NotificationScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Empty Notification",
        onClick: () => Navigator.push(context, NotificationScreen.route(isForEmptyScreen: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "My Wishlist",
        onClick: () => Navigator.push(context, MyWishlistScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "My Portfolio",
        onClick: () => Navigator.push(context, MyPortfolioScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Explore Stock - Candle Graph Visual",
        onClick: () => Navigator.push(
          context,
          ExploreStockScreen.route(
            isCandleGraphVisualView: true,
            data: WishListItemData(
              symbol: "NFLX",
              company: "Netflix, Inc.",
              price: "\$206.20",
              percentage: "3.7%",
              isPositive: false,
              stockIcon: AppAssets.icStockNetflix,
              color: Colors.black,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Explore Stock - Line Graph Visual",
        onClick: () => Navigator.push(
          context,
          ExploreStockScreen.route(
            isCandleGraphVisualView: false,
            data: WishListItemData(
              symbol: "NFLX",
              company: "Netflix, Inc.",
              price: "\$206.20",
              percentage: "3.7%",
              isPositive: false,
              stockIcon: AppAssets.icStockNetflix,
              color: Colors.black,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Explore Stock - Overview",
        onClick: () => Navigator.push(
          context,
          ExploreStockScreen.route(
            currentIndex: 0,
            data: WishListItemData(
              symbol: "NFLX",
              company: "Netflix, Inc.",
              price: "\$206.20",
              percentage: "3.7%",
              isPositive: false,
              stockIcon: AppAssets.icStockNetflix,
              color: Colors.black,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Explore Stock - NFLX Market",
        onClick: () => Navigator.push(
          context,
          ExploreStockScreen.route(
            currentIndex: 1,
            data: WishListItemData(
              symbol: "NFLX",
              company: "Netflix, Inc.",
              price: "\$206.20",
              percentage: "3.7%",
              isPositive: false,
              stockIcon: AppAssets.icStockNetflix,
              color: Colors.black,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Explore Stock - News",
        onClick: () => Navigator.push(
          context,
          ExploreStockScreen.route(
            currentIndex: 2,
            data: WishListItemData(
              symbol: "NFLX",
              company: "Netflix, Inc.",
              price: "\$206.20",
              percentage: "3.7%",
              isPositive: false,
              stockIcon: AppAssets.icStockNetflix,
              color: Colors.black,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Buy Stock",
        onClick: () => Navigator.push(
          context,
          BuyScreen.route(
            data: WishListItemData(
              symbol: "NFLX",
              company: "Netflix, Inc.",
              price: "\$206.20",
              percentage: "3.7%",
              isPositive: false,
              stockIcon: AppAssets.icStockNetflix,
              color: Colors.black,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Buy Stock Method",
        onClick: () => Navigator.push(
          context,
          BuyMethodScreen.route(
            data: WishListItemData(
              symbol: "NFLX",
              company: "Netflix, Inc.",
              price: "\$206.20",
              percentage: "3.7%",
              isPositive: false,
              stockIcon: AppAssets.icStockNetflix,
              color: Colors.black,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Preview Buy Stock Detail",
        onClick: () => Navigator.push(
          context,
          PreviewBuyScreen.route(
            data: WishListItemData(
              symbol: "NFLX",
              company: "Netflix, Inc.",
              price: "\$206.20",
              percentage: "3.7%",
              isPositive: false,
              stockIcon: AppAssets.icStockNetflix,
              color: Colors.black,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Buy Order Received",
        onClick: () => Navigator.push(
          context,
          PreviewBuyScreen.route(
            isForDialog: true,
            data: WishListItemData(
              symbol: "NFLX",
              company: "Netflix, Inc.",
              price: "\$206.20",
              percentage: "3.7%",
              isPositive: false,
              stockIcon: AppAssets.icStockNetflix,
              color: Colors.black,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sell Stock",
        onClick: () => Navigator.push(
            context,
            SellScreen.route(
              data: WishListItemData(
                symbol: "NFLX",
                company: "Netflix, Inc.",
                price: "\$206.20",
                percentage: "3.7%",
                isPositive: false,
                stockIcon: AppAssets.icStockNetflix,
                color: Colors.black,
              ),
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Preview Sell Stock Detail",
        onClick: () => Navigator.push(
          context,
          PreviewSellScreen.route(
            data: WishListItemData(
              symbol: "NFLX",
              company: "Netflix, Inc.",
              price: "\$206.20",
              percentage: "3.7%",
              isPositive: false,
              stockIcon: AppAssets.icStockNetflix,
              color: Colors.black,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sell Order Received",
        onClick: () => Navigator.push(
          context,
          PreviewSellScreen.route(
            data: WishListItemData(
              symbol: "NFLX",
              company: "Netflix, Inc.",
              price: "\$206.20",
              percentage: "3.7%",
              isPositive: false,
              stockIcon: AppAssets.icStockNetflix,
              color: Colors.black,
            ),
            isShowDialog: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Portfolio",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "News",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 3)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Exchange Stock",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Select Exchange Stock",
        onClick: () => Navigator.push(context, SelectExchangeStocksScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Preview Exchange Stock Detail",
        onClick: () => Navigator.push(context, PreviewExchangeScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Order Exchange Received",
        onClick: () => Navigator.push(context, PreviewExchangeScreen.route(isForDialog: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Profile",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 4)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Profile",
        onClick: () => Navigator.push(context, EditProfileScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Notification",
        onClick: () => Navigator.push(context, NotificationSettingScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Security",
        onClick: () => Navigator.push(context, SecurityScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Payment Method",
        onClick: () => Navigator.push(context, PaymentMethodScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Add Card",
        onClick: () => Navigator.push(context, AddNewCardScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Card",
        onClick: () => Navigator.push(context, EditCardScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Languages",
        onClick: () => Navigator.push(context, LanguageSettingScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Help Center - FAQ",
        onClick: () => Navigator.push(context, HelpCenterScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Help Center - Contact Us",
        onClick: () => Navigator.push(context, HelpCenterScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Privacy Policy",
        onClick: () => Navigator.push(context, PrivacyPolicyScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Delete Account",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 4, isForDeleteAccount: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Logout",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 4, isForLogoutDialog: true)),
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
            text: "Stoxy - Stock Market App",
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
