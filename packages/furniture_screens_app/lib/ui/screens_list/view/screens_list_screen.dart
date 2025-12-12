import 'package:flutter/material.dart';
import 'package:furniture_screens_app_package/ui/add_new_address/views/add_new_address_screen.dart';
import 'package:furniture_screens_app_package/ui/add_new_card/views/add_new_card_screen.dart';
import 'package:furniture_screens_app_package/ui/add_promo/view/add_promo_screen.dart';
import 'package:furniture_screens_app_package/ui/call/views/call_screen.dart';
import 'package:furniture_screens_app_package/ui/category/view/category_screen.dart';
import 'package:furniture_screens_app_package/ui/category_details/view/category_details_screen.dart';
import 'package:furniture_screens_app_package/ui/chat/views/chat_screen.dart';
import 'package:furniture_screens_app_package/ui/checkout/view/checkout_screen.dart';
import 'package:furniture_screens_app_package/ui/dashboard/view/dashboard_screen.dart';
import 'package:furniture_screens_app_package/ui/edit_address/view/edit_address_screen.dart';
import 'package:furniture_screens_app_package/ui/edit_address_list/views/edit_address_list_screen.dart';
import 'package:furniture_screens_app_package/ui/edit_card/views/edit_card_screen.dart';
import 'package:furniture_screens_app_package/ui/edit_profile/views/edit_profile_screen.dart';
import 'package:furniture_screens_app_package/ui/enter_otp/view/enter_otp_screen.dart';
import 'package:furniture_screens_app_package/ui/enter_your_pin/view/enter_your_pin_screen.dart';
import 'package:furniture_screens_app_package/ui/get_start/view/get_start_screen.dart';
import 'package:furniture_screens_app_package/ui/help_center/views/help_center_screen.dart';
import 'package:furniture_screens_app_package/ui/languages/views/languages_screen.dart';
import 'package:furniture_screens_app_package/ui/lost_your_password/view/lost_your_password_screen.dart';
import 'package:furniture_screens_app_package/ui/notification/view/notification_screen.dart';
import 'package:furniture_screens_app_package/ui/notification_settings/views/notification_settings_screen.dart';
import 'package:furniture_screens_app_package/ui/on_boarding/view/on_boarding_screen.dart';
import 'package:furniture_screens_app_package/ui/payment_method/view/payment_method_screen.dart';
import 'package:furniture_screens_app_package/ui/payment_method_list/views/payment_method_list_screen.dart';
import 'package:furniture_screens_app_package/ui/privacy_policy/views/privacy_policy_screen.dart';
import 'package:furniture_screens_app_package/ui/product_details/view/product_details_screen.dart';
import 'package:furniture_screens_app_package/ui/reset_password/view/reset_password_screen.dart';
import 'package:furniture_screens_app_package/ui/reviews/view/reviews_screen.dart';
import 'package:furniture_screens_app_package/ui/search/view/search_screen.dart';
import 'package:furniture_screens_app_package/ui/sign_in/view/sign_in_screen.dart';
import 'package:furniture_screens_app_package/ui/sign_up/view/sign_up_screen.dart';
import 'package:furniture_screens_app_package/ui/special_offers/views/special_offers_screen.dart';
import 'package:furniture_screens_app_package/ui/track_order/view/track_order_screen.dart';
import 'package:furniture_screens_app_package/utils/sizer_utils.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../address/views/address_screen.dart';
import '../../live_tracking/views/live_tracking_screen.dart';
import '../../payment/view/payment_screen.dart';
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
        onClick: () => Navigator.push(context, OnBoardingScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Onboarding 2",
        onClick: () => Navigator.push(context, OnBoardingScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Onboarding 3",
        onClick: () => Navigator.push(context, OnBoardingScreen.route(currentIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Get Start",
        onClick: () => Navigator.push(context, GetStartScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sign In",
        onClick: () => Navigator.push(context, SignInScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sign Up",
        onClick: () => Navigator.push(context, SignUpScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Lost Your Password?",
        onClick: () => Navigator.push(context, LostYourPasswordScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Enter OTP",
        onClick: () => Navigator.push(context, EnterOtpScreen.route()),
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
        title: "Home",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Category",
        onClick: () => Navigator.push(context, CategoriesScreen.route()),
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
        title: "Filter Options",
        onClick: () => Navigator.push(context, SearchScreen.route(isForFilterBs: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Notification",
        onClick: () => Navigator.push(context, NotificationScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Empty Notification",
        onClick: () => Navigator.push(context, NotificationScreen.route(isForEmptyNotificationScreen: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Category Lists",
        onClick: () => Navigator.push(context, CategoryDetailsScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Empty Category Lists",
        onClick: () => Navigator.push(context, CategoryDetailsScreen.route(selectedCategory: "Cupboard")),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Product Details",
        onClick: () => Navigator.push(context, ProductDetailsScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Reviews",
        onClick: () => Navigator.push(context, ReviewsScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Share",
        onClick: () => Navigator.push(context, ProductDetailsScreen.route(isForShareDialog: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Checkout",
        onClick: () => Navigator.push(context, CheckoutScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Remove From Cart",
        onClick: () => Navigator.push(context, CheckoutScreen.route(isForDeleteDialog: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Payment",
        onClick: () => Navigator.push(context, PaymentScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Select Address",
        onClick: () => Navigator.push(context, AddressScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Payment Method",
        onClick: () => Navigator.push(context, PaymentMethodScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Promo Code List",
        onClick: () => Navigator.push(context, AddPromoScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Enter Pin For Confirm Payment",
        onClick: () => Navigator.push(context, EnterYourPinScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Order Successfully",
        onClick: () => Navigator.push(context, EnterYourPinScreen.route(isForOrderSuccessDialog: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "My Cart",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Empty Cart",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 1, isForEmptyCart: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "My Favourites",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 3)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Empty Favourite Order",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 3, isForEmptyFavourite: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "My Orders : Active Orders",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2, selectedTabInOrderScreen: "Active")),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Cancel Active Orders",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2, isForCancelOrderDialog: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Track Order",
        onClick: () => Navigator.push(context, TrackOrderScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Live Tracking",
        onClick: () => Navigator.push(context, LiveTrackingScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "My Orders : Completed Orders",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2, selectedTabInOrderScreen: "Completed")),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Review Orders",
        onClick: () => Navigator.push(
            context,
            DashboardScreen.route(
              currentIndex: 2,
              selectedTabInOrderScreen: "Completed",
              isForReviewOrder: true,
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "My Orders : Cancelled Orders",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2, selectedTabInOrderScreen: "Cancelled")),
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
        title: "Edit Address List",
        onClick: () => Navigator.push(context, EditAddressListScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Add New Address",
        onClick: () => Navigator.push(context, AddNewAddressScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Address",
        onClick: () => Navigator.push(context, EditAddressScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Notification Settings",
        onClick: () => Navigator.push(context, NotificationSettingsScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Payment Method List",
        onClick: () => Navigator.push(context, PaymentMethodListScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "My Wallet",
        onClick: () => Navigator.push(context, EditCardScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Add New Card",
        onClick: () => Navigator.push(context, AddNewCardScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Special Offer",
        onClick: () => Navigator.push(context, SpecialOffersScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Select Languages",
        onClick: () => Navigator.push(context, LanguagesScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Privacy Policy",
        onClick: () => Navigator.push(context, PrivacyPolicyScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Help Center : FAQ",
        onClick: () => Navigator.push(context, HelpCenterScreen.route(currentTabIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Help Center : Contact Us",
        onClick: () => Navigator.push(context, HelpCenterScreen.route(currentTabIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Customer Service",
        onClick: () => Navigator.push(context, ChatScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Call",
        onClick: () => Navigator.push(context, CallScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Logout",
        onClick: () => Navigator.push(context, DashboardScreen.route(isShowlogoutDialog: true, currentIndex: 4)),
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
            text: "Furnify - Furniture App",
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
                      fontSize: 16.setFontSize,
                      fontFamily: Constant.fontFamilyMontserratSemiBold,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    Expanded(
                      child: CommonText(
                        text: item.title,
                        fontSize: 16.setFontSize,
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
