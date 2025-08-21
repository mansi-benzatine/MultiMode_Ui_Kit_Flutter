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
import 'package:food_delivery_screens_app_package/utils/constant.dart';
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
        title: "Splash",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, SplashScreen.route()),
      ),
      ScreenListDataModel(
        title: "Onboarding 1",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OnBoardingScreen.route(currentIndex: 0)),
      ),
      ScreenListDataModel(
        title: "Onboarding 2",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OnBoardingScreen.route(currentIndex: 1)),
      ),
      ScreenListDataModel(
        title: "Onboarding 3",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OnBoardingScreen.route(currentIndex: 2)),
      ),
      ScreenListDataModel(
        title: "Login Or Sign Up",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, LoginAndSignupScreen.route()),
      ),
      ScreenListDataModel(
        title: "Otp Verification",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, MobileVerificationOtpScreen.route()),
      ),
      ScreenListDataModel(
        title: "Email Sign Up",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, EmailSignUpScreen.route()),
      ),
      ScreenListDataModel(
        title: "Check Your Email",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, CheckYourEmailScreen.route()),
      ),
      ScreenListDataModel(
        title: "Email Verification",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, EmailVerificationOtpScreen.route()),
      ),
      ScreenListDataModel(
        title: "Login",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, LoginScreen.route()),
      ),
      ScreenListDataModel(
        title: "Set Delivery Location",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, SetDeliveryLocationScreen.route()),
      ),
      ScreenListDataModel(
        title: "Home",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0, isFromEmptyCart: false)),
      ),
      ScreenListDataModel(
        title: "Add Address",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, AddAddressScreen.route()),
      ),
      ScreenListDataModel(
        title: "Search",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, SearchScreen.route()),
      ),
      ScreenListDataModel(
        title: "Near You",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, NearYouScreen.route()),
      ),
      ScreenListDataModel(
        title: "All Categories",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, AllCategoryScreen.route()),
      ),
      ScreenListDataModel(
        title: "Category List",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, AllCategoryListScreen.route()),
      ),
      ScreenListDataModel(
        title: "View Item Details",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ViewCategoryDetailsScreen.route()),
      ),
      ScreenListDataModel(
        title: "View Restaurant Details",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ViewRestaurantScreen.route()),
      ),
      ScreenListDataModel(
        title: "View Cart",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ViewCartScreen.route(isFromDashboard: false, isFromEmptyCart: false)),
      ),
      ScreenListDataModel(
        title: "Apply Coupon",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ApplyCouponScreen.route()),
      ),
      ScreenListDataModel(
        title: "Proceed To Pay",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ProceedToPayScreen.route()),
      ),
      ScreenListDataModel(
        title: "Add Card",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, AddCardScreen.route()),
      ),
      ScreenListDataModel(
        title: "Order Summary",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OrderSummaryScreen.route()),
      ),
      ScreenListDataModel(
        title: "Confirm Order",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ConfirmOrderScreen.route()),
      ),
      ScreenListDataModel(
        title: "Track Order",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, TrackOrderScreen.route()),
      ),
      ScreenListDataModel(
        title: "Cancel Order",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, CancelOrderScreen.route()),
      ),
      ScreenListDataModel(
        title: "Cart",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 1, isFromEmptyCart: false)),
      ),
      ScreenListDataModel(
        title: "Empty Cart",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 1, isFromEmptyCart: true)),
      ),
      ScreenListDataModel(
        title: "Account",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2, isFromEmptyCart: false)),
      ),
      ScreenListDataModel(
        title: "Edit Account",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, EditAccountScreen.route()),
      ),
      ScreenListDataModel(
        title: "My Account",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, MyAccountScreen.route()),
      ),
      ScreenListDataModel(
        title: "Manage Address",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ManageAddressScreen.route()),
      ),
      ScreenListDataModel(
        title: "Favourites",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, FavouritesScreen.route()),
      ),
      ScreenListDataModel(
        title: "Offers",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OffersScreen.route()),
      ),
      ScreenListDataModel(
        title: "App Settings",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, AppSettingsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Payment",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, PaymentScreen.route()),
      ),
      ScreenListDataModel(
        title: "Edit Card",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, EditCardScreen.route()),
      ),
      ScreenListDataModel(
        title: "Re Order",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ReOrderScreen.route()),
      ),
      ScreenListDataModel(
        title: "Review",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, FeedbackScreen.route()),
      ),
      ScreenListDataModel(
        title: "Help & Support",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, HelpsAndSupportScreen.route()),
      ),
      ScreenListDataModel(
        title: "General Issues",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, GeneralIssuesScreen.route()),
      ),
      ScreenListDataModel(
        title: "Chat",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ChatScreen.route(isFromPastThread: false)),
      ),
      ScreenListDataModel(
        title: "Terms & Conditions",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, TermAndConditionScreen.route()),
      ),
      ScreenListDataModel(
        title: "FAQS",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, FaqsScreen.route()),
      ),
      ScreenListDataModel(
        title: "All Conversations Threads",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, AllConversationsThreadsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Past Chat",
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
          leadingWidth: 38.setWidth,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: CommonText(
            text: "Food Delivery App",
            fontSize: 22.setFontSize,
            fontWeight: FontWeight.w700,
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
