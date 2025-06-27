import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_screens_app_package/ui/add_address/views/add_address_screen.dart';
import 'package:food_delivery_screens_app_package/ui/add_card/views/add_card_screen.dart';
import 'package:food_delivery_screens_app_package/ui/all_category/views/all_category_screen.dart';
import 'package:food_delivery_screens_app_package/ui/all_category_list/views/all_category_list_screen.dart';
import 'package:food_delivery_screens_app_package/ui/all_conversations_threads/views/all_conversations_threads_screen.dart';
import 'package:food_delivery_screens_app_package/ui/app_settings/views/app_settings_screen.dart';
import 'package:food_delivery_screens_app_package/ui/apply_coupon/views/apply_coupon_screen.dart';
import 'package:food_delivery_screens_app_package/ui/cancel_order/views/cancel_order_screen.dart';
import 'package:food_delivery_screens_app_package/ui/chat/views/chat_screen.dart';
import 'package:food_delivery_screens_app_package/ui/check_your_email/views/check_your_email_screen.dart';
import 'package:food_delivery_screens_app_package/ui/confirm_order/views/confirm_order_screen.dart';
import 'package:food_delivery_screens_app_package/ui/dashboard/views/dashboard_screen.dart';
import 'package:food_delivery_screens_app_package/ui/edit_account/views/edit_account_screen.dart';
import 'package:food_delivery_screens_app_package/ui/edit_card/views/edit_cards_screen.dart';
import 'package:food_delivery_screens_app_package/ui/email_sign_up/views/email_sign_up_screen.dart';
import 'package:food_delivery_screens_app_package/ui/email_verification_otp/views/email_verification_otp_screen.dart';
import 'package:food_delivery_screens_app_package/ui/faqs/views/faqs_screen.dart';
import 'package:food_delivery_screens_app_package/ui/favourites/views/favourites_screen.dart';
import 'package:food_delivery_screens_app_package/ui/feedback/views/feedback_screen.dart';
import 'package:food_delivery_screens_app_package/ui/general_issues/views/general_issues_screen.dart';
import 'package:food_delivery_screens_app_package/ui/helps_and_support/views/helps_and_support_screen.dart';
import 'package:food_delivery_screens_app_package/ui/login/views/login_screen.dart';
import 'package:food_delivery_screens_app_package/ui/login_and_signup/views/login_and_signup_screen.dart';
import 'package:food_delivery_screens_app_package/ui/manage_address/views/manage_address_screen.dart';
import 'package:food_delivery_screens_app_package/ui/mobile_verification_otp/views/mobile_verification_otp_screen.dart';
import 'package:food_delivery_screens_app_package/ui/my_account/views/my_account_screen.dart';
import 'package:food_delivery_screens_app_package/ui/near_you/views/near_you_screen.dart';
import 'package:food_delivery_screens_app_package/ui/offers/views/offers_screen.dart';
import 'package:food_delivery_screens_app_package/ui/on_boarding/views/on_boarding_screen.dart';
import 'package:food_delivery_screens_app_package/ui/order_summary/views/order_smmary_screen.dart';
import 'package:food_delivery_screens_app_package/ui/payment/views/payment_screen.dart';
import 'package:food_delivery_screens_app_package/ui/proceed_to_pay/views/proceed_to_pay_screen.dart';
import 'package:food_delivery_screens_app_package/ui/re_order/views/re_order_screen.dart';
import 'package:food_delivery_screens_app_package/ui/search/views/search_screen.dart';
import 'package:food_delivery_screens_app_package/ui/set_delivery_location/views/set_delivery_location_screen.dart';
import 'package:food_delivery_screens_app_package/ui/term_and_condition/views/term_and_condition_screen.dart';
import 'package:food_delivery_screens_app_package/ui/track_order/views/track_order_screen.dart';
import 'package:food_delivery_screens_app_package/ui/view_cart/views/view_cart_screen.dart';
import 'package:food_delivery_screens_app_package/ui/view_restaurant/views/view_restaurant_screen.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../splash/views/splash_screen.dart';
import '../../view_category_details/views/view_category_details_screen.dart';
import '../datamodels/screens_list_data.dart';

class FoodDeliveryScreensListScreen extends StatefulWidget {
  final String title;
  final Function()? onBack;

  const FoodDeliveryScreensListScreen({super.key, required this.title, this.onBack});

  static Route<void> route({required String title}) {
    return MaterialPageRoute<void>(builder: (_) => FoodDeliveryScreensListScreen(title: title));
  }

  @override
  State<FoodDeliveryScreensListScreen> createState() => _FoodDeliveryScreensListScreen();
}

class _FoodDeliveryScreensListScreen extends State<FoodDeliveryScreensListScreen> {
  List<ScreenListDataModel> screenList = [];

  _fillData() {
    screenList = [
      ScreenListDataModel(
        title: "Splash".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, SplashScreen.route()),
      ),
      ScreenListDataModel(
        title: "OnBoarding 1".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OnBoardingScreen.route(currentIndex: 0)),
      ),
      ScreenListDataModel(
        title: "OnBoarding 2".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OnBoardingScreen.route(currentIndex: 1)),
      ),
      ScreenListDataModel(
        title: "OnBoarding 3".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OnBoardingScreen.route(currentIndex: 2)),
      ),
      ScreenListDataModel(
        title: "Login Or Sign up".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, LoginAndSignupScreen.route()),
      ),
      ScreenListDataModel(
        title: "Otp Verification".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, MobileVerificationOtpScreen.route()),
      ),
      ScreenListDataModel(
        title: "Email Sign up".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, EmailSignUpScreen.route()),
      ),
      ScreenListDataModel(
        title: "Check Your Email".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, CheckYourEmailScreen.route()),
      ),
      ScreenListDataModel(
        title: "Email Verification".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, EmailVerificationOtpScreen.route()),
      ),
      ScreenListDataModel(
        title: "Login".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, LoginScreen.route()),
      ),
      ScreenListDataModel(
        title: "Set Delivery Location".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, SetDeliveryLocationScreen.route()),
      ),
      ScreenListDataModel(
        title: "Home".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0, isFromEmptyCart: false)),
      ),
      ScreenListDataModel(
        title: "Add Address".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, AddAddressScreen.route()),
      ),
      ScreenListDataModel(
        title: "Search".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, SearchScreen.route()),
      ),
      ScreenListDataModel(
        title: "Near you".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, NearYouScreen.route()),
      ),
      ScreenListDataModel(
        title: "All Categories".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, AllCategoryScreen.route()),
      ),
      ScreenListDataModel(
        title: "Category List".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, AllCategoryListScreen.route()),
      ),
      ScreenListDataModel(
        title: "View Item Details".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ViewCategoryDetailsScreen.route()),
      ),
      ScreenListDataModel(
        title: "View Restaurant Details".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ViewRestaurantScreen.route()),
      ),
      ScreenListDataModel(
        title: "View Cart".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ViewCartScreen.route(isFromDashboard: false, isFromEmptyCart: false)),
      ),
      ScreenListDataModel(
        title: "Apply Coupon".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ApplyCouponScreen.route()),
      ),
      ScreenListDataModel(
        title: "Proceed to pay".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ProceedToPayScreen.route()),
      ),
      ScreenListDataModel(
        title: "Add Card".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, AddCardScreen.route()),
      ),
      ScreenListDataModel(
        title: "Order Summary".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OrderSummaryScreen.route()),
      ),
      ScreenListDataModel(
        title: "Confirm Order".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ConfirmOrderScreen.route()),
      ),
      ScreenListDataModel(
        title: "Track Order".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, TrackOrderScreen.route()),
      ),
      ScreenListDataModel(
        title: "Cancel Order".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, CancelOrderScreen.route()),
      ),
      ScreenListDataModel(
        title: "Cart".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 1, isFromEmptyCart: false)),
      ),
      ScreenListDataModel(
        title: "Empty Cart".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 1, isFromEmptyCart: true)),
      ),
      ScreenListDataModel(
        title: "Account".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2, isFromEmptyCart: false)),
      ),
      ScreenListDataModel(
        title: "Edit Account".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, EditAccountScreen.route()),
      ),
      ScreenListDataModel(
        title: "My Account".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, MyAccountScreen.route()),
      ),
      ScreenListDataModel(
        title: "Manage Address".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ManageAddressScreen.route()),
      ),
      ScreenListDataModel(
        title: "Favourites".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, FavouritesScreen.route()),
      ),
      ScreenListDataModel(
        title: "Offers".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OffersScreen.route()),
      ),
      ScreenListDataModel(
        title: "App Settings".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, AppSettingsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Payment".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, PaymentScreen.route()),
      ),
      ScreenListDataModel(
        title: "Edit card".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, EditCardScreen.route()),
      ),
      ScreenListDataModel(
        title: "Re Order".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ReOrderScreen.route()),
      ),
      ScreenListDataModel(
        title: "Review".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, FeedbackScreen.route()),
      ),
      ScreenListDataModel(
        title: "Help & Support".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, HelpsAndSupportScreen.route()),
      ),
      ScreenListDataModel(
        title: "General Issues".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, GeneralIssuesScreen.route()),
      ),
      ScreenListDataModel(
        title: "Chat".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ChatScreen.route(isFromPastThread: false)),
      ),
      ScreenListDataModel(
        title: "Terms & Conditions".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, TermAndConditionScreen.route()),
      ),
      ScreenListDataModel(
        title: "FAQS".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, FaqsScreen.route()),
      ),
      ScreenListDataModel(
        title: "All Conversations threads".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, AllConversationsThreadsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Past Chat".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ChatScreen.route(isFromPastThread: true)),
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
          leadingWidth: 40.setWidth,
          centerTitle: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: CustomAppColor.of(context).white),
            onPressed: () {
              widget.onBack?.call();
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: CommonText(
            text: "Food Delivery App",
            fontSize: 22.setFontSize,
            fontWeight: FontWeight.w700,
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
        padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setHeight),
        width: (MediaQuery.of(context).size.width - 16.setWidth * 2 - 14.setWidth * 2) / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: CustomAppColor.of(context).listTileColorScreenList,
          boxShadow: [
            BoxShadow(
              color: CustomAppColor.of(context).listTileShadow.withValues(alpha: .10),
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
                height: 32.setHeight,
                width: 32.setHeight,
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
                fontWeight: FontWeight.w600,
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
