import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/account_created/view/account_created_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/add_delivery_address/views/add_delivery_address_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/add_margin/views/add_margin_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/bank_details/views/bank_details_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/cart/views/cart_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/create_new_account/view/create_new_account_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/create_new_password/view/create_new_password_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/dashboard/view/dashboard_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/edit_profile/view/edit_profile_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/forgot_password/view/forgot_password_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/my_catalogs/views/my_catalogs_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/notification/views/notification_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/notification_settings/views/notification_setting_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/order_summary/views/order_summary_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/otp_verification/view/otp_verification_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/profile/view/profile_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/refer_and_earn/view/refer_and_earn_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/see_all_product/view/see_all_product_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/settings/views/settings_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/sign_up/view/sign_up_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/social_login/view/social_login_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/track_order/views/track_order_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/verify_code/view/verify_code_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/view_inner_product/view/view_inner_product_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/view_product/view/view_product_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/ui/wishlist/view/wishlist_screen.dart';
import 'package:goozzy_e_commerce_screens_app_package/utils/sizer_utils.dart';
import 'package:goozzy_e_commerce_screens_app_package/utils/utils.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../login_to_your_account/view/login_to_your_account_screen.dart';
import '../../on_boarding/view/on_boarding_screen.dart';
import '../../splash/splash_screen.dart';
import '../datamodel/screens_list_data.dart';

class GoozzyECommerceScreenListScreen extends StatefulWidget {
  final String title;
  final Function()? onBack;

  const GoozzyECommerceScreenListScreen({super.key, required this.title, this.onBack});

  static Route<void> route({required String title}) {
    return MaterialPageRoute<void>(builder: (_) => GoozzyECommerceScreenListScreen(title: title));
  }

  @override
  State<GoozzyECommerceScreenListScreen> createState() => _GoozzyECommerceScreenListScreen();
}

class _GoozzyECommerceScreenListScreen extends State<GoozzyECommerceScreenListScreen> {
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
        onClick: () => Navigator.push(context, OnBoardingScreen.route(initialIndex: 0)),
      ),
      ScreenListDataModel(
        title: "OnBoarding 2".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OnBoardingScreen.route(initialIndex: 1)),
      ),
      ScreenListDataModel(
        title: "OnBoarding 3".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OnBoardingScreen.route(initialIndex: 2)),
      ),
      ScreenListDataModel(
        title: "Sign Up With Phone Number".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, SignUpScreen.route()),
      ),
      ScreenListDataModel(
        title: "OTP Verification".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OtpVerificationScreen.route()),
      ),
      ScreenListDataModel(
        title: "Account Created".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, AccountCreatedScreen.route()),
      ),
      ScreenListDataModel(
        title: "Sign in with Social login".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, SocialLoginScreen.route()),
      ),
      ScreenListDataModel(
        title: "Create new Account".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, CreateNewAccountScreen.route()),
      ),
      ScreenListDataModel(
        title: "Log in to Your Account".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, LoginToYourAccountScreen.route()),
      ),
      ScreenListDataModel(
        title: "Forgot Password with Email".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ForgotPasswordScreen.route(isFromEmail: true)),
      ),
      ScreenListDataModel(
        title: "Create New Password".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, CreateNewPasswordScreen.route()),
      ),
      ScreenListDataModel(
        title: "Forgot Password with Phone Number".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ForgotPasswordScreen.route(isFromEmail: false)),
      ),
      ScreenListDataModel(
        title: "Verify Code".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, VerifyCodeScreen.route()),
      ),
      ScreenListDataModel(
        title: "Home".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
            )),
      ),
      ScreenListDataModel(
        title: "View Product".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ViewProductScreen.route()),
      ),
      ScreenListDataModel(
        title: "View inner product".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ViewInnerProductScreen.route()),
      ),
      ScreenListDataModel(
        title: "Product Categories".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: false,
              isFromAccount: false,
              isFromCategory: true,
              isFromOrders: false,
            )),
      ),
      ScreenListDataModel(
        title: "See All Products".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, SeeAllProductScreen.route()),
      ),
      ScreenListDataModel(
        title: "Account".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: false,
              isFromAccount: true,
              isFromCategory: false,
              isFromOrders: false,
            )),
      ),
      ScreenListDataModel(
        title: "Edit Profile".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, EditProfileScreen.route()),
      ),
      ScreenListDataModel(
        title: "Profile".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ProfileScreen.route()),
      ),
      ScreenListDataModel(
        title: "Bank Details".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, BankDetailsScreen.route()),
      ),
      ScreenListDataModel(
        title: "My Catalogs".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, MyCatalogsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Refer And Earn".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ReferAndEarnScreen.route()),
      ),
      ScreenListDataModel(
        title: "Settings".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, SettingsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Notification Settings".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, NotificationSettingsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Cart".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, CartScreen.route()),
      ),
      ScreenListDataModel(
        title: "Add Margin".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, AddMarginScreen.route()),
      ),
      ScreenListDataModel(
        title: "Add Delivery Address".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, AddDeliveryAddressScreen.route()),
      ),
      ScreenListDataModel(
        title: "Order Summary".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OrderSummaryScreen.route()),
      ),
      ScreenListDataModel(
        title: "Order History".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: false,
              isFromCategory: false,
              isFromOrders: true,
              isFromAccount: false,
            )),
      ),
      ScreenListDataModel(
        title: "Track Order".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, TrackOrderScreen.route()),
      ),
      ScreenListDataModel(
        title: "Notification".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, NotificationsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Wishlist".toUpperCase(),
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, WishlistScreen.route()),
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
            text: "Goozzy E-Commerce App",
            fontSize: AppSizes.setFontSize(20),
            textColor: CustomAppColor.of(context).white,
            fontWeight: FontWeight.w700,
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: AppSizes.setHeight(20)),
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
            SizedBox(height: AppSizes.setHeight(6)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(15)),
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
              height: AppSizes.setHeight(37),
              alignment: Alignment.center,
              child: CommonText(
                text: item.title.toUpperCase(),
                fontSize: AppSizes.setFontSize(12),
                fontWeight: FontWeight.w700,
                textColor: CustomAppColor.of(context).txtBlack,
                textAlign: TextAlign.center,
                isAutoSize: true,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
