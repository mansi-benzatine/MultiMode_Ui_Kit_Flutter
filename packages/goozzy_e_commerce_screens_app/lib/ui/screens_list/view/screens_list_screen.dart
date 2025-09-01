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

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
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
        title: "Splash",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, SplashScreen.route()),
      ),
      ScreenListDataModel(
        title: "Onboarding 1",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OnBoardingScreen.route(initialIndex: 0)),
      ),
      ScreenListDataModel(
        title: "Onboarding 2",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OnBoardingScreen.route(initialIndex: 1)),
      ),
      ScreenListDataModel(
        title: "Onboarding 3",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OnBoardingScreen.route(initialIndex: 2)),
      ),
      ScreenListDataModel(
        title: "Sign Up With Phone Number",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, SignUpScreen.route()),
      ),
      ScreenListDataModel(
        title: "OTP Verification",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OtpVerificationScreen.route()),
      ),
      ScreenListDataModel(
        title: "Account Created",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, AccountCreatedScreen.route()),
      ),
      ScreenListDataModel(
        title: "Sign In With Social Login",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, SocialLoginScreen.route()),
      ),
      ScreenListDataModel(
        title: "Create New Account",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, CreateNewAccountScreen.route()),
      ),
      ScreenListDataModel(
        title: "Log In To Your Account",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, LoginToYourAccountScreen.route()),
      ),
      ScreenListDataModel(
        title: "Forgot Password With Email",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ForgotPasswordScreen.route(isFromEmail: true)),
      ),
      ScreenListDataModel(
        title: "Create New Password",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, CreateNewPasswordScreen.route()),
      ),
      ScreenListDataModel(
        title: "Created New Password Successfully",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, CreateNewPasswordScreen.route(isShowAlert: true)),
      ),
      ScreenListDataModel(
        title: "Forgot Password With Phone Number",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ForgotPasswordScreen.route(isFromEmail: false)),
      ),
      ScreenListDataModel(
        title: "Verify Code",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, VerifyCodeScreen.route()),
      ),
      ScreenListDataModel(
        title: "Verify Code Successfully",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, VerifyCodeScreen.route(isShowAlert: true)),
      ),
      ScreenListDataModel(
        title: "Home",
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
        title: "Sort By",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowSortByBs: true,
            )),
      ),
      ScreenListDataModel(
        title: "Filter : Category",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowCategoryBs: true,
            )),
      ),
      ScreenListDataModel(
        title: "Filter : Gender",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: true,
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Category",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Category",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Gender",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Gender",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Colors",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Colors",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Size",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Size",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Fabric",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Fabric",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Price",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Price",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Rating",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Rating",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Occasion",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Occasion",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Combo",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Combo",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Discount",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Discount",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Reversible",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Reversible",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Fit/Shape",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Fit/Shape",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Material",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Material",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Pattern Type",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Pattern Type",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Bottomwear Fabric",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Bottomwear Fabric",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Bottom Pattern Type",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Bottom Pattern Type",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Border",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Border",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Back type",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Back Type",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Top type",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Top Type",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Brand",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Brand",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Warranty Period",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Warranty Period",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Bottom Type",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Bottom Type",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Heel Type",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Heel Type",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Concern",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Concern",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Type Of Skin",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Type Of Skin",
            )),
      ),
      ScreenListDataModel(
        title: "Filter By Shade",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: true,
              isFromAccount: false,
              isFromCategory: false,
              isFromOrders: false,
              isShowGenderBs: false,
              isShowFilterByColorBs: true,
              currentIndex: 1,
              filterType: "Shade",
            )),
      ),
      ScreenListDataModel(
        title: "View Product",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ViewProductScreen.route()),
      ),
      ScreenListDataModel(
        title: "See All Reviews",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ViewProductScreen.route(isShowReviewBs: true)),
      ),
      ScreenListDataModel(
        title: "View Inner Product",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ViewInnerProductScreen.route()),
      ),
      ScreenListDataModel(
        title: "Product Categories",
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
        title: "See All Products",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, SeeAllProductScreen.route()),
      ),
      ScreenListDataModel(
        title: "Account",
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
        title: "Sign Up To Continue",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: false,
              isFromAccount: true,
              isFromCategory: false,
              isFromOrders: false,
              isSignupToContinueBs: true,
            )),
      ),
      ScreenListDataModel(
        title: "Otp Verification",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: false,
              isFromAccount: true,
              isFromCategory: false,
              isFromOrders: false,
              isOtpVerificationBs: true,
            )),
      ),
      ScreenListDataModel(
        title: "Account Created",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: false,
              isFromAccount: true,
              isFromCategory: false,
              isFromOrders: false,
              isAccountCreatedBs: true,
            )),
      ),
      ScreenListDataModel(
        title: "Logout",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: false,
              isFromAccount: true,
              isFromCategory: false,
              isFromOrders: false,
              isLogoutBs: true,
            )),
      ),
      ScreenListDataModel(
        title: "Edit Profile : Primary Information",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, EditProfileScreen.route(currentIndex: 0)),
      ),
      ScreenListDataModel(
        title: "Edit Profile : Other Information",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, EditProfileScreen.route(currentIndex: 1)),
      ),
      ScreenListDataModel(
        title: "Edit Profile : Add Education",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, EditProfileScreen.route(isShowAddEducataionBs: true)),
      ),
      ScreenListDataModel(
        title: "Edit Profile : Setting",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, EditProfileScreen.route(currentIndex: 2)),
      ),
      ScreenListDataModel(
        title: "Profile",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ProfileScreen.route()),
      ),
      ScreenListDataModel(
        title: "Bank Details",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, BankDetailsScreen.route()),
      ),
      ScreenListDataModel(
        title: "My Catalogs : Wishlist",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, MyCatalogsScreen.route(currentIndex: 0)),
      ),
      ScreenListDataModel(
        title: "My Catalogs : Shared",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, MyCatalogsScreen.route(currentIndex: 1)),
      ),
      ScreenListDataModel(
        title: "Refer And Earn",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ReferAndEarnScreen.route()),
      ),
      ScreenListDataModel(
        title: "Enter Referral Code",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: false,
              isFromAccount: true,
              isFromCategory: false,
              isFromOrders: false,
              isEnterReferralCodeBs: true,
            )),
      ),
      ScreenListDataModel(
        title: "Settings",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, SettingsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Notification Settings",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, NotificationSettingsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Cart",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, CartScreen.route()),
      ),
      ScreenListDataModel(
        title: "Add Margin",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, AddMarginScreen.route()),
      ),
      ScreenListDataModel(
        title: "Add Delivery Address",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, AddDeliveryAddressScreen.route()),
      ),
      ScreenListDataModel(
        title: "Order Summary",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OrderSummaryScreen.route()),
      ),
      ScreenListDataModel(
        title: "Order Success",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OrderSummaryScreen.route(orderSuccessBs: true)),
      ),
      ScreenListDataModel(
        title: "Payment Failed",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OrderSummaryScreen.route(paymentFailedBs: true)),
      ),
      ScreenListDataModel(
        title: "Order History",
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
        title: "Reason Of Cancellation",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: false,
              isFromCategory: false,
              isFromOrders: true,
              isFromAccount: false,
              isForReasonOfCancellationBs: true,
            )),
      ),
      ScreenListDataModel(
        title: "Order Cancelled",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              isFromHome: false,
              isFromCategory: false,
              isFromOrders: true,
              isFromAccount: false,
              isForOrderCancelBs: true,
            )),
      ),
      ScreenListDataModel(
        title: "Track Order",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, TrackOrderScreen.route()),
      ),
      ScreenListDataModel(
        title: "Notification",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, NotificationsScreen.route()),
      ),
      ScreenListDataModel(
        title: "No Notification",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, NotificationsScreen.route(isEmptyScreen: true)),
      ),
      ScreenListDataModel(
        title: "Wishlist",
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
          leadingWidth: AppSizes.setWidth(38),
          title: CommonText(
            text: "Goozzy E-Commerce App",
            fontSize: AppSizes.setFontSize(22),
            textColor: CustomAppColor.of(context).white,
            fontWeight: FontWeight.w700,
            fontFamily: Constant.fontFamilyMontserratSemiBold,
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
