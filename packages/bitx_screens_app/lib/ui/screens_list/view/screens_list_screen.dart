import 'package:bitx_screens_app/ui/add_new_card/view/add_new_card_screen.dart';
import 'package:bitx_screens_app/ui/buy/view/buy_screen.dart';
import 'package:bitx_screens_app/ui/click_photo/view/click_photo_screen.dart';
import 'package:bitx_screens_app/ui/dashboard/view/dashboard_screen.dart';
import 'package:bitx_screens_app/ui/deposite_coin/view/deposite_coin_screen.dart';
import 'package:bitx_screens_app/ui/edit_card/views/edit_card_screen.dart';
import 'package:bitx_screens_app/ui/edit_profile/view/edit_profile_screen.dart';
import 'package:bitx_screens_app/ui/enter_pin/view/enter_pin_screen.dart';
import 'package:bitx_screens_app/ui/explore_crypto/view/explore_crypto_screen.dart';
import 'package:bitx_screens_app/ui/forgot_password/view/forgot_password_screen.dart';
import 'package:bitx_screens_app/ui/help_center/view/help_center_screen.dart';
import 'package:bitx_screens_app/ui/history_about/view/history_about_screen.dart';
import 'package:bitx_screens_app/ui/home/view/home_screen.dart';
import 'package:bitx_screens_app/ui/language_setting/view/language_setting_screen.dart';
import 'package:bitx_screens_app/ui/login/view/login_screen.dart';
import 'package:bitx_screens_app/ui/my_portfolio/view/my_portfolio_screen.dart';
import 'package:bitx_screens_app/ui/my_wishlist/view/my_wishlist_screen.dart';
import 'package:bitx_screens_app/ui/notification/view/notification_screen.dart';
import 'package:bitx_screens_app/ui/notification_setting/view/notification_setting_screen.dart';
import 'package:bitx_screens_app/ui/onboarding/on_boarding_screen.dart';
import 'package:bitx_screens_app/ui/payment_method/view/payment_method_screen.dart';
import 'package:bitx_screens_app/ui/profile_setup/view/profile_setup_screen.dart';
import 'package:bitx_screens_app/ui/reset_password/view/reset_password_screen.dart';
import 'package:bitx_screens_app/ui/search/view/searh_screen.dart';
import 'package:bitx_screens_app/ui/search_currency/view/search_currency_screen.dart';
import 'package:bitx_screens_app/ui/security/view/security_screen.dart';
import 'package:bitx_screens_app/ui/select_exchange_stocks/views/select_exchange_stocks_screen.dart';
import 'package:bitx_screens_app/ui/sell/view/sell_screen.dart';
import 'package:bitx_screens_app/ui/sign_up/view/sign_up_screen.dart';
import 'package:bitx_screens_app/ui/splash/view/splash_screen.dart';
import 'package:bitx_screens_app/ui/transfer_amount/view/transfer_amount_screen.dart';
import 'package:bitx_screens_app/ui/transfer_coin/view/transfer_coin_screen.dart';
import 'package:bitx_screens_app/ui/verify_otp/view/verify_otp_screen.dart';
import 'package:bitx_screens_app/ui/welcome/view/welcome_screen.dart';
import 'package:bitx_screens_app/ui/withdraw_amount/view/withdraw_amount_screen.dart';
import 'package:bitx_screens_app/ui/withdraw_coin/view/withdraw_coin_screen.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../deposit_amount/view/deposit_amount_screen.dart';
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
        title: "Otp Verification",
        onClick: () => Navigator.push(context, VerifyOtpScreen.route(isFromSignIn: false)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Reset Password",
        onClick: () => Navigator.push(context, ResetPasswordScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Reset Password Successfully",
        onClick: () => Navigator.push(context, ResetPasswordScreen.route(forSuccessDialog: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Profile Setup : Your Gender",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Profile Setup : Select Currency",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Profile Setup : Your Profile",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Profile Setup : Upload Your National ID",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 3)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Profile Setup : Take Photo Id Card",
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
        title: "Profile Setup : Your Selfie With Your ID Card",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 4)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Profile Setup : Take Selfie With Id Card",
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
        title: "Profile Setup :  Your Digital Signature",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 5)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Profile Setup : Terms And Conditions",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 6)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Profile Setup : Create New Pin",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 7)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Profile Setup : All Set",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(forSuccessDialog: true, currentIndex: 7)),
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
        title: "Search Not Found",
        onClick: () => Navigator.push(context, SearchScreen.route(forEmptyScreen: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Notification",
        onClick: () => Navigator.push(context, NotificationScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Empty Notification",
        onClick: () => Navigator.push(context, NotificationScreen.route(forEmptyScreen: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Market Movers",
        onClick: () => Navigator.push(context, MyWishlistScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "My Portfolio",
        onClick: () => Navigator.push(context, MyPortfolioScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Explore Coin : Candle Chart",
        onClick: () => Navigator.push(
          context,
          ExploreStockScreen.route(
            data: WishListItemData(
              symbol: "BTC",
              company: "Bitcoin",
              price: "\$32,165.10",
              percentage: "2.53%",
              isPositive: true,
              color: Colors.blue,
              stockIcon: AppAssets.icBtBtc,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Explore Coin : Line Chart",
        onClick: () => Navigator.push(
          context,
          ExploreStockScreen.route(
            data: WishListItemData(
              symbol: "BTC",
              company: "Bitcoin",
              price: "\$32,165.10",
              percentage: "2.53%",
              isPositive: true,
              color: Colors.blue,
              stockIcon: AppAssets.icBtBtc,
            ),
            currentIndex: 1,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Share",
        onClick: () => Navigator.push(
          context,
          ExploreStockScreen.route(
            data: WishListItemData(
              symbol: "BTC",
              company: "Bitcoin",
              price: "\$32,165.10",
              percentage: "2.53%",
              isPositive: true,
              color: Colors.blue,
              stockIcon: AppAssets.icBtBtc,
            ),
            currentIndex: 1,
            forShareBs: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Buy Coin",
        onClick: () => Navigator.push(
            context,
            BuyScreen.route(
              data: WishListItemData(
                symbol: "BTC",
                company: "Bitcoin",
                price: "\$32,165.10",
                percentage: "2.53%",
                isPositive: true,
                color: Colors.blue,
                stockIcon: AppAssets.icBtBtc,
              ),
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Enter Pin",
        onClick: () => Navigator.push(
          context,
          EnterPinScreen.route(
            data: WishListItemData(
              symbol: "BTC",
              company: "Bitcoin",
              price: "\$32,165.10",
              percentage: "2.53%",
              isPositive: true,
              color: Colors.blue,
              stockIcon: AppAssets.icBtBtc,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Buy Successful",
        onClick: () => Navigator.push(
            context,
            EnterPinScreen.route(
              forSuccessDialog: true,
              data: WishListItemData(
                symbol: "BTC",
                company: "Bitcoin",
                price: "\$32,165.10",
                percentage: "2.53%",
                isPositive: true,
                color: Colors.blue,
                stockIcon: AppAssets.icBtBtc,
              ),
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sell Coin",
        onClick: () => Navigator.push(
          context,
          SellScreen.route(
            data: WishListItemData(
              symbol: "BTC",
              company: "Bitcoin",
              price: "\$32,165.10",
              percentage: "2.53%",
              isPositive: true,
              color: Colors.blue,
              stockIcon: AppAssets.icBtBtc,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Enter Pin",
        onClick: () => Navigator.push(
          context,
          EnterPinScreen.route(
            data: WishListItemData(
              symbol: "BTC",
              company: "Bitcoin",
              price: "\$32,165.10",
              percentage: "2.53%",
              isPositive: true,
              color: Colors.blue,
              stockIcon: AppAssets.icBtBtc,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sell Successful",
        onClick: () => Navigator.push(
          context,
          EnterPinScreen.route(
            forSuccessDialog: true,
            data: WishListItemData(
              symbol: "BTC",
              company: "Bitcoin",
              price: "\$32,165.10",
              percentage: "2.53%",
              isPositive: true,
              color: Colors.blue,
              stockIcon: AppAssets.icBtBtc,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Market : All",
        onClick: () => Navigator.push(
          context,
          DashboardScreen.route(
            currentIndex: 1,
            selectedMarketTab: "All",
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Market : Gainer ",
        onClick: () => Navigator.push(
          context,
          DashboardScreen.route(
            currentIndex: 1,
            selectedMarketTab: "Gainers",
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Market : Loser",
        onClick: () => Navigator.push(
          context,
          DashboardScreen.route(
            currentIndex: 1,
            selectedMarketTab: "Loser",
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Market : Favorite",
        onClick: () => Navigator.push(
          context,
          DashboardScreen.route(
            currentIndex: 1,
            selectedMarketTab: "Favorite",
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Empty Market",
        onClick: () => Navigator.push(
          context,
          DashboardScreen.route(
            currentIndex: 1,
            selectedMarketTab: "All",
            forEmptyMarket: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Wallet",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 3)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Search Currency",
        onClick: () => Navigator.push(context, SearchCurrencyScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Empty Search Currency",
        onClick: () => Navigator.push(context, SearchCurrencyScreen.route(forEmptyScreen: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "History About Currency",
        onClick: () => Navigator.push(
          context,
          HistoryAboutScreen.route(
            data: WishListItemData(
              symbol: "BTC",
              company: "Bitcoin",
              price: "\$32,165.10",
              percentage: "2.53%",
              isPositive: true,
              color: Colors.blue,
              stockIcon: AppAssets.icBtBtc,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Deposit Coin",
        onClick: () => Navigator.push(
          context,
          DepositeCoinScreen.route(
            data: WishListItemData(
              symbol: "BTC",
              company: "Bitcoin",
              price: "\$32,165.10",
              percentage: "2.53%",
              isPositive: true,
              color: Colors.blue,
              stockIcon: AppAssets.icBtBtc,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Payment Method",
        onClick: () => Navigator.push(context, PaymentMethodScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Deposit Amount",
        onClick: () => Navigator.push(
          context,
          DepositAmountScreen.route(
            data: WishListItemData(
              symbol: "BTC",
              company: "Bitcoin",
              price: "\$32,165.10",
              percentage: "2.53%",
              isPositive: true,
              color: Colors.blue,
              stockIcon: AppAssets.icBtBtc,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Deposit Details",
        onClick: () => Navigator.push(
          context,
          DepositAmountScreen.route(
            data: WishListItemData(
              symbol: "BTC",
              company: "Bitcoin",
              price: "\$32,165.10",
              percentage: "2.53%",
              isPositive: true,
              color: Colors.blue,
              stockIcon: AppAssets.icBtBtc,
            ),
            forDetailsBs: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Deposit Successful",
        onClick: () => Navigator.push(
          context,
          DepositAmountScreen.route(
            data: WishListItemData(
              symbol: "BTC",
              company: "Bitcoin",
              price: "\$32,165.10",
              percentage: "2.53%",
              isPositive: true,
              color: Colors.blue,
              stockIcon: AppAssets.icBtBtc,
            ),
            forSuccessDialog: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Transfer Coin",
        onClick: () => Navigator.push(
          context,
          TransferCoinScreen.route(
            data: WishListItemData(
              symbol: "BTC",
              company: "Bitcoin",
              price: "\$32,165.10",
              percentage: "2.53%",
              isPositive: true,
              color: Colors.blue,
              stockIcon: AppAssets.icBtBtc,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Transfer Amount",
        onClick: () => Navigator.push(
          context,
          TransferAmountScreen.route(
            data: WishListItemData(
              symbol: "BTC",
              company: "Bitcoin",
              price: "\$32,165.10",
              percentage: "2.53%",
              isPositive: true,
              color: Colors.blue,
              stockIcon: AppAssets.icBtBtc,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Transfer Details",
        onClick: () => Navigator.push(
          context,
          TransferAmountScreen.route(
            data: WishListItemData(
              symbol: "BTC",
              company: "Bitcoin",
              price: "\$32,165.10",
              percentage: "2.53%",
              isPositive: true,
              color: Colors.blue,
              stockIcon: AppAssets.icBtBtc,
            ),
            forDetailsBs: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Transfer Successful",
        onClick: () => Navigator.push(
          context,
          TransferAmountScreen.route(
            data: WishListItemData(
              symbol: "BTC",
              company: "Bitcoin",
              price: "\$32,165.10",
              percentage: "2.53%",
              isPositive: true,
              color: Colors.blue,
              stockIcon: AppAssets.icBtBtc,
            ),
            forSuccessDialog: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Withdraw Coin",
        onClick: () => Navigator.push(
            context,
            WithdrawCoinScreen.route(
              data: WishListItemData(
                symbol: "BTC",
                company: "Bitcoin",
                price: "\$32,165.10",
                percentage: "2.53%",
                isPositive: true,
                color: Colors.blue,
                stockIcon: AppAssets.icBtBtc,
              ),
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Withdraw Amount",
        onClick: () => Navigator.push(
          context,
          WithdrawAmountScreen.route(
            data: WishListItemData(
              symbol: "BTC",
              company: "Bitcoin",
              price: "\$32,165.10",
              percentage: "2.53%",
              isPositive: true,
              color: Colors.blue,
              stockIcon: AppAssets.icBtBtc,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Withdraw Details",
        onClick: () => Navigator.push(
          context,
          WithdrawAmountScreen.route(
            data: WishListItemData(
              symbol: "BTC",
              company: "Bitcoin",
              price: "\$32,165.10",
              percentage: "2.53%",
              isPositive: true,
              color: Colors.blue,
              stockIcon: AppAssets.icBtBtc,
            ),
            forDetailsBs: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Withdraw Successful",
        onClick: () => Navigator.push(
          context,
          WithdrawAmountScreen.route(
            data: WishListItemData(
              symbol: "BTC",
              company: "Bitcoin",
              price: "\$32,165.10",
              percentage: "2.53%",
              isPositive: true,
              color: Colors.blue,
              stockIcon: AppAssets.icBtBtc,
            ),
            forSuccessDialog: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Exchange",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Exchange Coin",
        onClick: () => Navigator.push(context, SelectExchangeStocksScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Exchange Details",
        onClick: () => Navigator.push(context, SelectExchangeStocksScreen.route(forDetailsBs: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Exchange Successful",
        onClick: () => Navigator.push(context, SelectExchangeStocksScreen.route(forSuccessDialog: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "My Profile",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 4)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Profile",
        onClick: () => Navigator.push(context, EditProfileScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Notification Settings",
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
        title: "Add New Card",
        onClick: () => Navigator.push(context, AddNewCardScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Card",
        onClick: () => Navigator.push(context, EditCardScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Languages Settings",
        onClick: () => Navigator.push(context, LanguageSettingScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Help Center : FAQ",
        onClick: () => Navigator.push(context, HelpCenterScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Help Center : Contact Us",
        onClick: () => Navigator.push(context, HelpCenterScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Delete Account ",
        onClick: () => Navigator.push(
          context,
          DashboardScreen.route(
            currentIndex: 4,
            forDeleteAccountDialog: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Logout",
        onClick: () => Navigator.push(
          context,
          DashboardScreen.route(
            currentIndex: 4,
            forLogoutDialog: true,
          ),
        ),
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
            text: "BitX Crypto App",
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
