import 'package:flutter/material.dart';
import 'package:grokit_screens_app/ui/add_new_card/view/add_new_card_screen.dart';
import 'package:grokit_screens_app/ui/address/view/address_screen.dart';
import 'package:grokit_screens_app/ui/all_coupon/view/all_coupons_screen.dart';
import 'package:grokit_screens_app/ui/call/view/call_screen.dart';
import 'package:grokit_screens_app/ui/cancel_order/view/cancel_order_screen.dart';
import 'package:grokit_screens_app/ui/category_list/view/category_list_screen.dart';
import 'package:grokit_screens_app/ui/dashboard/view/dashboard_screen.dart';
import 'package:grokit_screens_app/ui/edit_card/view/edit_card_screen.dart';
import 'package:grokit_screens_app/ui/edit_profile/view/edit_profile_screen.dart';
import 'package:grokit_screens_app/ui/enter_otp/view/enter_otp_screen.dart';
import 'package:grokit_screens_app/ui/enter_your_location/view/enter_your_location.dart';
import 'package:grokit_screens_app/ui/favorite/view/favorite_screen.dart';
import 'package:grokit_screens_app/ui/forgot_password/view/forgot_password_screen.dart';
import 'package:grokit_screens_app/ui/help_center/view/help_center_screen.dart';
import 'package:grokit_screens_app/ui/item_detail/view/item_details_screen.dart';
import 'package:grokit_screens_app/ui/languages/view/languages_screen.dart';
import 'package:grokit_screens_app/ui/on_boarding/view/on_boarding_screen.dart';
import 'package:grokit_screens_app/ui/payment/view/payment_screen.dart';
import 'package:grokit_screens_app/ui/privacy_policy/view/privacy_policy_screen.dart';
import 'package:grokit_screens_app/ui/reorder/view/reorder_screen.dart';
import 'package:grokit_screens_app/ui/reset_password/view/reset_password_screen.dart';
import 'package:grokit_screens_app/ui/search/views/search_screen.dart';
import 'package:grokit_screens_app/ui/set_location/view/set_location_screen.dart';
import 'package:grokit_screens_app/ui/sign_up/view/sign_up_screen.dart';
import 'package:grokit_screens_app/ui/signin/view/sign_in_screen.dart';
import 'package:grokit_screens_app/ui/terms_and_conditions/view/terms_and_conditions_screen.dart';
import 'package:grokit_screens_app/ui/track_order/view/track_order_screen.dart';
import 'package:grokit_screens_app/ui/view_cart/view/view_cart_screen.dart';
import 'package:grokit_screens_app/ui/your_location/view/your_location_screen.dart';
import 'package:grokit_screens_app/ui/your_order/view/your_order_screen.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../login_or_signup/view/login_or_signup_screen.dart';
import '../../payment_method/view/payment_method_screen.dart';
import '../../place_order/view/place_order_screen.dart';
import '../../rate_your_experience/view/rate_your_experience_screen.dart';
import '../../splash/view/splash_screen.dart';
import '../../view_product_details/view/view_product_details_screen.dart';
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
        title: "Login Or Sign Up",
        onClick: () => Navigator.push(context, LoginOrSignupScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Enter OTP",
        onClick: () => Navigator.push(context, EnterOtpScreen.route(isFromLoginOrSignupScreen: true)),
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
        title: "Forgot Password",
        onClick: () => Navigator.push(context, ForgotPasswordScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "OTP Verification",
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
        onClick: () => Navigator.push(context, ResetPasswordScreen.route(isShowSuccessAlert: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Your Location",
        onClick: () => Navigator.push(context, YourLocationScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Enter Your Location",
        onClick: () => Navigator.push(context, EnterYourLocation.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Home",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Select Delivery Location",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0, isShowDeliveryLocationBs: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Location",
        onClick: () => Navigator.push(context, SetLocationScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Favorite",
        onClick: () => Navigator.push(context, FavoriteScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Search",
        onClick: () => Navigator.push(context, SearchScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Search Not Found",
        onClick: () => Navigator.push(context, SearchScreen.route(isForEmptyView: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Categories Details",
        onClick: () => Navigator.push(context, CategoryListScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Categories : Item Details",
        onClick: () => Navigator.push(context, ItemDetailsScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Item Details : Added In Cart",
        onClick: () => Navigator.push(context, ItemDetailsScreen.route(isShowAddToCart: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Share",
        onClick: () => Navigator.push(context, ItemDetailsScreen.route(isShowShareBs: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "View Product Details",
        onClick: () => Navigator.push(context, ViewProductDetailsScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "View Cart",
        onClick: () => Navigator.push(context, ViewCartScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "All Coupons",
        onClick: () => Navigator.push(context, AllCouponsScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Payment Method",
        onClick: () => Navigator.push(context, PaymentMethodScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Place Order",
        onClick: () => Navigator.push(context, PlaceOrderScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Order Place Successfully",
        onClick: () => Navigator.push(context, PlaceOrderScreen.route(isShowPlaceOrderPopUp: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Categories",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "My Cart",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Empty Cart",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2, isForEmptyCartView: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Track Order",
        onClick: () => Navigator.push(context, TrackOrderScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Call To Delivery Person",
        onClick: () => Navigator.push(context, CallScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Cancel Order",
        onClick: () => Navigator.push(context, CancelOrderScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Profile",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 3)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Profile",
        onClick: () => Navigator.push(context, EditProfileScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Address",
        onClick: () => Navigator.push(context, AddressScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Select Option",
        onClick: () => Navigator.push(context, AddressScreen.route(isShowSelectOptionBs: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Payment",
        onClick: () => Navigator.push(context, PaymentScreen.route()),
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
        title: "Your Order",
        onClick: () => Navigator.push(context, YourOrderScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Re Order",
        onClick: () => Navigator.push(context, ReorderScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Rate Your Experience",
        onClick: () => Navigator.push(context, RateYourExperienceScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Privacy Policy",
        onClick: () => Navigator.push(context, PrivacyPolicyScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Terms & Conditions",
        onClick: () => Navigator.push(context, TermsAndConditionsScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Languages",
        onClick: () => Navigator.push(context, LanguagesScreen.route()),
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
        title: "Logout",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 3, isForLogoutAlert: true)),
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
            text: "Grokit App",
            fontSize: 23.setFontSize,
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
          decoration: const BoxDecoration(
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
