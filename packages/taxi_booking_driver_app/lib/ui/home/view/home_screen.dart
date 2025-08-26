import 'dart:async';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_booking_driver_app_package/localization/language/languages.dart';
import 'package:taxi_booking_driver_app_package/ui/customer_location/view/customer_location_screen.dart';
import 'package:taxi_booking_driver_app_package/ui/documents/view/documents_screen.dart';
import 'package:taxi_booking_driver_app_package/ui/edit_account/view/edit_account_screen.dart';
import 'package:taxi_booking_driver_app_package/ui/invite_friends/view/invite_friends_screen.dart';
import 'package:taxi_booking_driver_app_package/ui/my_earning/view/my_earning_screen.dart';
import 'package:taxi_booking_driver_app_package/ui/notifications/view/notification_screen.dart';
import 'package:taxi_booking_driver_app_package/ui/settings/view/settings_screen.dart';
import 'package:taxi_booking_driver_app_package/ui/wallet/view/wallet_screen.dart';
import 'package:taxi_booking_driver_app_package/ui/your_trips/view/your_trips_screen.dart';
import 'package:taxi_booking_driver_app_package/utils/app_assets.dart';
import 'package:taxi_booking_driver_app_package/utils/app_color.dart';
import 'package:taxi_booking_driver_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_driver_app_package/widgets/text/common_text.dart';

import '../../../widgets/alert_dialog/common_alert_dialog.dart';
import '../../../widgets/button/common_button.dart';
import '../../cancel_ride/view/cancel_ride_screen.dart';

class HomeScreen extends StatefulWidget {
  final bool isFromRideBooked;

  static Route<void> route({required bool isFromRideBooked}) {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(isFromRideBooked: isFromRideBooked),
    );
  }

  const HomeScreen({super.key, required this.isFromRideBooked});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late AnimationController _resizableController;
  late Animation<double> _borderWidthAnimation;
  late Animation<Color?> _borderColorAnimation;

  bool showContainer = false;
  bool isShowRideRequest = false;

  @override
  void initState() {
    super.initState();
    _checkFirstTime();

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          showContainer = true;
        });
      }
    });
    _resizableController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _borderWidthAnimation = Tween<double>(begin: 1.0, end: 5.0).animate(CurvedAnimation(parent: _resizableController, curve: Curves.decelerate));

    _borderColorAnimation = ColorTween(
      begin: Colors.green,
      end: Colors.green.withValues(alpha: 0.5),
    ).animate(CurvedAnimation(parent: _resizableController, curve: Curves.decelerate));

    _resizableController.repeat(reverse: true);
  }

  Future<void> _checkFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isFirstTime = prefs.getBool('IS_FIRST_TIME');

    if (isFirstTime != false) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showEnableLocationDialog();
      });
      await prefs.setBool('IS_FIRST_TIME', false);
    }
  }

  void _showEnableLocationDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (dialogContext) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.setWidth),
          child: CommonDialog(
            titleText: CommonText(
              text: Languages.of(context).txtEnableLocation,
              fontWeight: FontWeight.w700,
              fontSize: 24.setFontSize,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
            descriptionText: CommonText(
              text: Languages.of(context).txtWeNeedAccessToYourLocationToBeAbleToUseThisService,
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w400,
              textColor: CustomAppColor.of(context).txtGray,
            ),
            icon: Image.asset(
              AppAssets.imgEnableLocation,
              height: 100.setHeight,
            ),
            button: Column(
              children: [
                CommonButton(
                  text: Languages.of(context).txtEnableLocation,
                  onTap: () => Navigator.pop(dialogContext),
                  height: 45.setHeight,
                  buttonColor: CustomAppColor.of(context).btnPrimary,
                  buttonTextSize: 14.setFontSize,
                ),
                SizedBox(height: 16.setHeight),
                CommonButton(
                  text: Languages.of(context).txtNotNow,
                  onTap: () => Navigator.pop(dialogContext),
                  buttonColor: CustomAppColor.of(context).transparent,
                  borderColor: CustomAppColor.of(context).btnBorder,
                  buttonTextColor: CustomAppColor.of(context).txtBlack,
                  height: 45.setHeight,
                  buttonTextSize: 16.setFontSize,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    if (_resizableController.isAnimating) {
      _resizableController.stop();
    }
    _resizableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      child: SafeArea(
        top: false,
        child: Scaffold(
          key: _scaffoldKey,
          drawer: _buildDrawer(),
          body: Stack(
            children: [
              _buildMapBackground(),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 12.setHeight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: CustomAppColor.of(context).bgScreen,
                        ),
                        child: IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          icon: Image.asset(
                            AppAssets.icMenu,
                            height: 12.setHeight,
                            width: 16.setWidth,
                            color: CustomAppColor.of(context).icBlackWhite,
                          ),
                        ),
                      ),
                      InkWell(onTap: () {}, child: getContainer()),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).bgScreen,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(39)),
                  ),
                  child: isShowRideRequest
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ConfirmRideView(
                              onClickCancelFeedback: () async {
                                final result = await Navigator.push(context, CancelRideScreen.route());
                                if (result == 'cancelled') {
                                  setState(() {
                                    isShowRideRequest = false;
                                    showContainer = true;
                                  });
                                }
                              },
                            ),
                          ],
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 16.setHeight),
                            Container(
                              width: 42.setWidth,
                              height: 4.setHeight,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: const Color(0xFF9EA2A7),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadiusGeometry.all(Radius.circular(12)),
                                          child: Image.asset(
                                            AppAssets.imgDummyDriverProfile,
                                            alignment: Alignment.center,
                                            width: 70.setHeight,
                                            height: 70.setHeight,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(width: 16.setWidth),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CommonText(
                                                text: "Devin Jorje",
                                                fontSize: 17.setFontSize,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              CommonText(
                                                text: "Toyota Inova (CSR874-569)",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12.setFontSize,
                                                textColor: CustomAppColor.of(context).txtGray,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 22.setHeight),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: CustomAppColor.of(context).chatBubbleFromSender,
                                              borderRadius: const BorderRadius.all(
                                                Radius.circular(12),
                                              ),
                                            ),
                                            padding: const EdgeInsets.all(12),
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                    color: CustomAppColor.of(context).btnPrimary,
                                                    borderRadius: const BorderRadius.all(
                                                      Radius.circular(12),
                                                    ),
                                                  ),
                                                  child: Image.asset(
                                                    AppAssets.icCalender,
                                                    width: 24.setHeight,
                                                    height: 24.setHeight,
                                                  ),
                                                ),
                                                SizedBox(width: 10.setWidth),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    CommonText(
                                                      text: Languages.of(context).txtPreBooked,
                                                      fontSize: 12.setFontSize,
                                                      textColor: CustomAppColor.of(context).txtGray,
                                                    ),
                                                    CommonText(
                                                      text: "8",
                                                      fontSize: 20.setFontSize,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 11.setWidth),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: CustomAppColor.of(context).chatBubbleFromSender,
                                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                                            ),
                                            padding: const EdgeInsets.all(12),
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                    color: CustomAppColor.of(context).btnPrimary,
                                                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                                                  ),
                                                  child: Image.asset(
                                                    AppAssets.icFillDollar,
                                                    width: 24.setHeight,
                                                    height: 24.setHeight,
                                                  ),
                                                ),
                                                SizedBox(width: 10.setWidth),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    CommonText(
                                                      text: Languages.of(context).txtTodayEarned,
                                                      textColor: CustomAppColor.of(context).txtGray,
                                                      fontSize: 12.setFontSize,
                                                    ),
                                                    CommonText(
                                                      text: "\$650.00",
                                                      fontSize: 20.setFontSize,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMapBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppAssets.imgMapHome), fit: BoxFit.cover)),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
      ),
      backgroundColor: CustomAppColor.of(context).bgScreen,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, EditAccountScreen.route());
              },
              leading: CircleAvatar(
                backgroundImage: AssetImage(AppAssets.imgDummyDriverProfile),
                radius: 25,
              ),
              title: CommonText(
                text: "Hello, Devin",
                fontWeight: FontWeight.w700,
                fontSize: 17.setFontSize,
                textAlign: TextAlign.start,
              ),
              subtitle: CommonText(
                text: Languages.of(context).txtEditAccount,
                textColor: CustomAppColor.of(context).txtPrimary,
                fontWeight: FontWeight.w500,
                fontSize: 12.setFontSize,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: 6.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
              child: DottedLine(
                dashLength: 4,
                lineThickness: 1,
                dashGapLength: 4,
                dashColor: CustomAppColor.of(context).dividerColor,
              ),
            ),
            SizedBox(height: 6.setHeight),
            _drawerItem(
              icon: AppAssets.icHome,
              label: Languages.of(context).txtHome,
              onTap: () {
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            _drawerItem(
              icon: AppAssets.icFillDollar,
              label: Languages.of(context).txtMyEarning,
              onTap: () {
                _scaffoldKey.currentState?.closeDrawer();
                Navigator.push(context, MyEarningScreen.route());
              },
            ),
            _drawerItem(
              icon: AppAssets.icHistory,
              label: "Your Rides",
              onTap: () {
                Navigator.push(context, YourTripsScreen.route());
              },
            ),
            _drawerItem(
              icon: AppAssets.icWallet,
              label: Languages.of(context).txtWallet,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, WalletScreen.route());
              },
            ),
            _drawerItem(
              icon: AppAssets.icNotification,
              label: Languages.of(context).txtNotifications,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, NotificationScreen.route());
              },
            ),
            _drawerItem(
              icon: AppAssets.icDocument,
              label: Languages.of(context).txtDocument,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, DocumentsScreen.route());
              },
            ),
            _drawerItem(
              icon: AppAssets.icGift,
              label: Languages.of(context).txtInviteFriends,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, InviteFriendsScreen.route());
              },
            ),
            _drawerItem(
              icon: AppAssets.icSettings,
              label: Languages.of(context).txtSettings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, SettingsScreen.route());
              },
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (dialogContext) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
                      child: CommonDialog(
                        titleText: CommonText(
                          text: Languages.of(context).txtLogout,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.setFontSize,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                        descriptionText: CommonText(
                          text: Languages.of(context).txtAreYouSureYouWantToLogout,
                          fontSize: 14.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtGray,
                        ),
                        icon: Image.asset(
                          AppAssets.icRedLogout,
                          height: 90.setHeight,
                        ),
                        button: Row(
                          children: [
                            Expanded(
                              child: CommonButton(
                                text: Languages.of(context).txtCancel,
                                onTap: () => Navigator.pop(dialogContext),
                                buttonColor: CustomAppColor.of(context).transparent,
                                borderColor: CustomAppColor.of(context).txtGray,
                                buttonTextColor: CustomAppColor.of(context).txtGray,
                                height: 45.setHeight,
                                buttonTextSize: 16.setFontSize,
                              ),
                            ),
                            SizedBox(width: 15.setWidth),
                            Expanded(
                              child: CommonButton(
                                text: Languages.of(context).txtLogout,
                                onTap: () => Navigator.pop(dialogContext),
                                height: 45.setHeight,
                                borderColor: CustomAppColor.of(context).orange,
                                buttonColor: CustomAppColor.of(context).orange,
                                buttonTextSize: 16.setFontSize,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.setHeight, horizontal: 22.setWidth),
                child: Row(
                  children: [
                    Image.asset(
                      AppAssets.icLogout,
                      width: 20.setWidth,
                      height: 20.setHeight,
                      color: CustomAppColor.of(context).red,
                    ),
                    SizedBox(width: 15.setWidth),
                    CommonText(
                      text: Languages.of(context).txtLogout,
                      fontSize: 16.setFontSize,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).red,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem({required String icon, required String label, required VoidCallback onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 2.setHeight, horizontal: 18.setWidth),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: CustomAppColor.of(context).icDrawerBg, borderRadius: BorderRadius.circular(12)),
        child: Image.asset(
          icon,
          height: 20.setHeight,
          width: 20.setWidth,
        ),
      ),
      title: CommonText(
        text: label,
        fontSize: 15.setFontSize,
        fontWeight: FontWeight.w600,
        textAlign: TextAlign.start,
      ),
      visualDensity: VisualDensity.compact,
      onTap: onTap,
      trailing: Icon(
        Icons.navigate_next_outlined,
        color: CustomAppColor.of(context).txtGray,
      ),
    );
  }

  Widget getContainer() {
    if (!showContainer) {
      return Container(
        height: 40.setHeight,
        padding: EdgeInsets.symmetric(vertical: 5.setHeight, horizontal: 12.setWidth),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: CustomAppColor.of(context).bgScreen,
          border: Border.all(
            color: Colors.transparent,
            width: 2, // static border width
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonText(
              text: Languages.of(context).txtOnline,
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(width: 8.setWidth),
            Icon(
              Icons.radio_button_checked,
              color: Colors.green,
              size: 18.setHeight,
            ),
          ],
        ),
      );
    }
    return AnimatedBuilder(
      animation: _resizableController,
      builder: (context, child) {
        return InkWell(
          onTap: () {
            setState(() {
              isShowRideRequest = true;
              showContainer = false;
            });
          },
          child: Container(
            height: 40.setHeight,
            padding: EdgeInsets.symmetric(vertical: 5.setHeight, horizontal: 12.setWidth),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              color: CustomAppColor.of(context).bgScreen,
              border: Border.all(
                color: _borderColorAnimation.value ?? Colors.green,
                width: _borderWidthAnimation.value,
              ),
            ),
            child: child,
          ),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonText(
            text: Languages.of(context).txtOnline,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(width: 8.setWidth),
          Icon(
            Icons.radio_button_checked,
            color: Colors.green,
            size: 18.setHeight,
          ),
        ],
      ),
    );
  }
}

class ConfirmRideView extends StatefulWidget {
  final VoidCallback? onClickCancelFeedback;

  const ConfirmRideView({super.key, this.onClickCancelFeedback});

  @override
  State<ConfirmRideView> createState() => _ConfirmRideViewState();
}

class _ConfirmRideViewState extends State<ConfirmRideView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 15.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: CustomAppColor.of(context).black.withValues(alpha: 0.09),
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 42.setWidth,
            height: 4.setHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: const Color(0xFF9EA2A7),
            ),
          ),
          SizedBox(height: 15.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: Languages.of(context).txtRideRequest,
                fontWeight: FontWeight.w700,
                fontSize: 16.setFontSize,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const CommonText(
                    text: "\$25.00",
                    fontWeight: FontWeight.w700,
                  ),
                  CommonText(
                    text: "2 km, 8 min",
                    fontWeight: FontWeight.w400,
                    fontSize: 12.setFontSize,
                    textColor: CustomAppColor.of(context).txtGray,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 5.setHeight),
          Divider(color: CustomAppColor.of(context).dividerColor),
          SizedBox(height: 10.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadiusGeometry.all(
                  Radius.circular(12),
                ),
                child: Image.asset(
                  AppAssets.imgDummyProfile,
                  alignment: Alignment.center,
                  width: 70.setWidth,
                  height: 70.setHeight,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16.setWidth),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "Brayden Jockos",
                      fontWeight: FontWeight.w700,
                      fontSize: 17.setFontSize,
                    ),
                    CommonText(
                      text: Languages.of(context).txtCashPayment,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.setFontSize,
                      textColor: CustomAppColor.of(context).txtGray,
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.setHeight),
          Row(
            children: [
              Column(
                children: [
                  Icon(Icons.radio_button_checked, size: 22, color: CustomAppColor.of(context).icBlackWhite),
                  SizedBox(
                    height: 60.setHeight,
                    child: const DottedLine(
                      direction: Axis.vertical,
                      lineLength: double.infinity,
                      dashLength: 2,
                      lineThickness: 2,
                      dashGapLength: 4,
                      dashColor: Colors.grey,
                    ),
                  ),
                  const Icon(Icons.radio_button_checked, size: 22, color: Colors.green),
                ],
              ),
              SizedBox(width: 15.setWidth),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "Pickup",
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                    CommonText(
                      text: "1397 Walnut Street, Jackson",
                      fontSize: 15.setFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 4.setHeight),
                    Divider(
                      endIndent: 30,
                      color: CustomAppColor.of(context).dividerColor,
                    ),
                    SizedBox(height: 4.setHeight),
                    CommonText(
                      text: "Drop Off",
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                    CommonText(
                      text: "345 Hardesty Street, 368972",
                      fontSize: 15.setFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.setHeight),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: CommonButton(
                  height: 48.setHeight,
                  buttonTextSize: 16.setFontSize,
                  onTap: () async {
                    widget.onClickCancelFeedback?.call();
                  },
                  borderColor: CustomAppColor.of(context).txtGray,
                  buttonTextColor: CustomAppColor.of(context).txtGray,
                  buttonColor: CustomAppColor.of(context).bgScreen,
                  text: Languages.of(context).txtCancelRide,
                ),
              ),
              SizedBox(width: 8.setWidth),
              Expanded(
                flex: 2,
                child: CommonButton(
                  height: 48.setHeight,
                  buttonTextSize: 16.setFontSize,
                  onTap: () async {
                    Navigator.push(context, CustomerLocationScreen.route());
                  },
                  text: Languages.of(context).txtAccept,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
