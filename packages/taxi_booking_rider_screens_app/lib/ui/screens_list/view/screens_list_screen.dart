import 'package:flutter/material.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/add_card/view/add_card_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/add_payment/view/add_payment_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/add_promo_code/view/add_promo_code_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/add_vouncher_code/view/add_voucher_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/cancel_ride/view/cancel_ride_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/chat/view/chat_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/create_new_pin/call_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/create_trip/view/create_trip_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/create_trip_steps/view/create_trip_step_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/edit_account/view/edit_account_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/gift_card/view/gift_card_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/home/view/home_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/invite_friends/view/invite_friends_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/notifications/view/notification_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/privacy_policy/view/privacy_policy_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/security/view/security_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/settings/view/settings_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/terms_and_conditions/views/terms_and_conditions_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/update_location/view/update_location_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/wallet/view/wallet_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/welcome/view/welcome_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/your_trips/view/your_trips_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/constant.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/sizer_utils.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../account_created/view/account_created_screen.dart';
import '../../create_new_pin/view/create_new_pin_screen.dart';
import '../../login/view/login_screen.dart';
import '../../otp_verification/view/otp_verification_screen.dart';
import '../../setup_profile/view/setup_profile_screen.dart';
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
        title: "Welcome",
        onClick: () => Navigator.push(context, WelcomeScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Login With Mobile Number",
        onClick: () => Navigator.push(context, LoginScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "OTP Verification",
        onClick: () => Navigator.push(context, OtpVerificationScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Account Created",
        onClick: () => Navigator.push(context, AccountCreatedScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Create Your Profile",
        onClick: () => Navigator.push(context, SetupProfileScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Create New PIN",
        onClick: () => Navigator.push(context, CreateNewPinScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Home",
        onClick: () => Navigator.push(context, HomeScreen.route(isFromRideBooked: false)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Create New Trip",
        onClick: () => Navigator.push(context, CreateTripScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Update Location",
        onClick: () => Navigator.push(context, UpdateLocationScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Create New Trip Steps",
        onClick: () => Navigator.push(context, CreateTripStepScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Call",
        onClick: () => Navigator.push(context, CallScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Chat",
        onClick: () => Navigator.push(context, ChatScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Arrival Time",
        onClick: () => Navigator.push(context, HomeScreen.route(isFromRideBooked: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Cancel Request",
        onClick: () => Navigator.push(context, CancelRideScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Driver Feedback",
        onClick: () => Navigator.push(context, HomeScreen.route(isFromRideBooked: true, isForArrivedView: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Tip For Driver",
        onClick: () => Navigator.push(context, HomeScreen.route(isFromRideBooked: true, isForPayTipView: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Your Trips",
        onClick: () => Navigator.push(context, YourTripsScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Wallet",
        onClick: () => Navigator.push(context, WalletScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Add Payment",
        onClick: () => Navigator.push(context, AddPaymentScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Add Card",
        onClick: () => Navigator.push(context, AddCardScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Gift Card",
        onClick: () => Navigator.push(context, GiftCardScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Add Promo Code",
        onClick: () => Navigator.push(context, AddPromoCodeScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Add Voucher Code",
        onClick: () => Navigator.push(context, AddVoucherScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Notification",
        onClick: () => Navigator.push(context, NotificationScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Invite Friends",
        onClick: () => Navigator.push(context, InviteFriendsScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Account",
        onClick: () => Navigator.push(context, EditAccountScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Settings",
        onClick: () => Navigator.push(context, SettingsScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Security",
        onClick: () => Navigator.push(context, SecurityScreen.route()),
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
            text: "Taxi Booking App - Rider",
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
