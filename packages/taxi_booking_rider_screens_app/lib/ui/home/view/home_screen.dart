import 'dart:async';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taxi_booking_rider_screens_app_package/localization/language/languages.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/cancel_ride/view/cancel_ride_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/create_trip/view/create_trip_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/edit_account/view/edit_account_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/invite_friends/view/invite_friends_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/notifications/view/notification_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/settings/view/settings_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/wallet/view/wallet_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/your_trips/view/your_trips_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/app_assets.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/app_color.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_rider_screens_app_package/widgets/text/common_text.dart';
import 'package:taxi_booking_rider_screens_app_package/widgets/text_field/text_form_field.dart';

import '../../../widgets/alert_dialog/common_alert_dialog.dart';
import '../../../widgets/button/common_button.dart';
import '../../chat/view/chat_screen.dart';
import '../../create_new_pin/call_screen.dart';

class HomeScreen extends StatefulWidget {
  final bool isFromRideBooked;
  final bool isShownLocationAlert;
  final bool isForArrivedView;
  final bool isForPayTipView;
  final bool isShownThankYouAlert;
  final bool isShownSideMenu;

  static Route<void> route({required bool isFromRideBooked, bool isForArrivedView = false, bool isForPayTipView = false, bool isShownLocationAlert = false, bool isShownThankYouAlert = false, bool isShownSideMenu = false}) {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(
        isFromRideBooked: isFromRideBooked,
        isForArrivedView: isForArrivedView,
        isForPayTipView: isForPayTipView,
        isShownLocationAlert: isShownLocationAlert,
        isShownThankYouAlert: isShownThankYouAlert,
        isShownSideMenu: isShownSideMenu,
      ),
    );
  }

  const HomeScreen({
    super.key,
    required this.isFromRideBooked,
    this.isForArrivedView = false,
    this.isForPayTipView = false,
    this.isShownLocationAlert = false,
    this.isShownThankYouAlert = false,
    this.isShownSideMenu = false,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _showArrivedView = false;
  int countDown = 5;
  Timer? _timer;
  bool _showPayTipView = false;
  bool _isFromRideBooked = true;

  @override
  void initState() {
    super.initState();
    _isFromRideBooked = widget.isFromRideBooked;

    if (widget.isForPayTipView && !(widget.isShownThankYouAlert)) {
      _showPayTipView = true;
      _isFromRideBooked = true;
    } else if (widget.isForPayTipView && widget.isShownThankYouAlert) {
      _showPayTipView = true;
      _isFromRideBooked = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                if (!didPop) {
                  Navigator.pop(dialogContext);
                  Navigator.pop(context);
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.setWidth),
                child: CommonDialog(
                  titleText: CommonText(
                    text: Languages.of(context).txtThankYou,
                    fontWeight: FontWeight.w700,
                    fontSize: 24.setFontSize,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  descriptionText: CommonText(
                    text: Languages.of(context).txtManyThanksForYourValuableFeedbackAndTip,
                    fontSize: 13.setFontSize,
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).txtGray,
                  ),
                  icon: Image.asset(
                    AppAssets.imgThankYou,
                    height: 90.setHeight,
                  ),
                  button: IgnorePointer(
                    ignoring: true,
                    child: CommonButton(
                      text: Languages.of(context).txtBackToHome,
                      onTap: () {
                        Navigator.pop(dialogContext);
                        /*  widget.onBackToHome();*/
                      },
                      height: 45.setHeight,
                      buttonTextSize: 14.setFontSize,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      });
    } else if (widget.isForArrivedView) {
      _showArrivedView = true;
      _isFromRideBooked = true;
    } else if (_isFromRideBooked) {
      _timer = Timer(
        const Duration(seconds: 5),
        () {
          if (mounted && _isFromRideBooked && _showArrivedView) {
            setState(() {
              _showArrivedView = false;
            });
          }
        },
      );
    }

    if (widget.isShownLocationAlert) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                if (!didPop) {
                  Navigator.pop(dialogContext);
                  Navigator.pop(context);
                }
              },
              child: Padding(
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
                  button: IgnorePointer(
                    ignoring: true,
                    child: Column(
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
                          borderColor: CustomAppColor.of(context).txtGray.withValues(alpha: 0.5),
                          buttonTextColor: CustomAppColor.of(context).txtBlack,
                          height: 42.setHeight,
                          buttonTextSize: 14.setFontSize,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      });
    }

    if (widget.isShownSideMenu) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scaffoldKey.currentState?.openDrawer();
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: PopScope(
        canPop: widget.isShownSideMenu ? false : true,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop && widget.isShownSideMenu) {
            Navigator.pop(context);
            Navigator.pop(context);
          }
        },
        child: SafeArea(
          top: false,
          child: Scaffold(
            key: _scaffoldKey,
            drawer: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 304,
                    child: _buildDrawer(),
                  ),
                ],
              ),
            ),
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
                        IgnorePointer(
                          ignoring: true,
                          child: InkWell(
                            onTap: () {
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
                                            borderColor: CustomAppColor.of(context).txtGray.withValues(alpha: 0.5),
                                            buttonTextColor: CustomAppColor.of(context).txtBlack,
                                            height: 42.setHeight,
                                            buttonTextSize: 14.setFontSize,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 12.setWidth),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(26),
                                color: CustomAppColor.of(context).bgScreen,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.my_location, color: CustomAppColor.of(context).icBlackGreen),
                                  SizedBox(width: 8.setWidth),
                                  CommonText(
                                    text: Languages.of(context).txtLocation,
                                    fontSize: 14.setFontSize,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
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
                    child: _isFromRideBooked
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (_showPayTipView)
                                PayTipView(
                                  onBackToHome: () {
                                    setState(() {
                                      _isFromRideBooked = false;
                                      _showPayTipView = false;
                                    });

                                    Navigator.pushReplacement(
                                      context,
                                      HomeScreen.route(isFromRideBooked: false),
                                    );
                                  },
                                )
                              else if (_showArrivedView)
                                YouHaveArrivedView(
                                  onSubmitFeedback: () {
                                    setState(() {
                                      _showArrivedView = false;
                                      _showPayTipView = true;
                                    });
                                  },
                                )
                              else
                                ConfirmRideView(
                                  countDown: countDown,
                                  onClickCancelFeedback: () async {
                                    // _timer?.cancel();
                                    final result = await Navigator.push(context, CancelRideScreen.route());
                                    if (result == 'cancelled') {
                                      setState(() {
                                        _isFromRideBooked = false;
                                        _showArrivedView = false;
                                        _showPayTipView = false;
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
                                      CommonText(
                                        text: "Hey Lisa",
                                        fontSize: 14.setFontSize,
                                        textColor: CustomAppColor.of(context).txtGray,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      CommonText(
                                        text: Languages.of(context).txtWhereAreYouGoing,
                                        fontSize: 22.setFontSize,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 102.setHeight,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    _buildDestinationItem(
                                      icon: Icons.location_on_rounded,
                                      title: Languages.of(context).txtNewTrip,
                                      subtitle: Languages.of(context).txtCreate,
                                      onTap: () {
                                        Navigator.push(context, CreateTripScreen.route());
                                      },
                                    ),
                                    _buildDestinationItem(
                                      icon: Icons.work,
                                      title: Languages.of(context).txtWork,
                                      subtitle: "38 minutes",
                                      onTap: () {
                                        Navigator.push(context, CreateTripScreen.route());
                                      },
                                    ),
                                    _buildDestinationItem(
                                      icon: Icons.flight,
                                      title: Languages.of(context).txtAirport,
                                      subtitle: "23 minutes",
                                      onTap: () {
                                        Navigator.push(context, CreateTripScreen.route());
                                      },
                                    ),
                                    _buildDestinationItem(
                                      icon: Icons.directions_bus,
                                      title: Languages.of(context).txtBusStop,
                                      subtitle: "12 minutes",
                                      onTap: () {
                                        Navigator.push(context, CreateTripScreen.route());
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.setHeight),
                            ],
                          ),
                  ),
                ),
              ],
            ),
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

  Widget _buildDestinationItem({required IconData icon, required String title, required String subtitle, required Function() onTap}) {
    return IgnorePointer(
      ignoring: true,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.setWidth),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: CustomAppColor.of(context).icBlackGreen, shape: BoxShape.circle),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 22.setHeight,
                  )),
              SizedBox(height: 6.setHeight),
              CommonText(text: title, textColor: CustomAppColor.of(context).txtBlack, fontSize: 14.setFontSize, fontWeight: FontWeight.w500, textAlign: TextAlign.center),
              CommonText(text: subtitle, textColor: CustomAppColor.of(context).txtGray, fontSize: 12.setFontSize, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
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
            IgnorePointer(
              ignoring: true,
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, EditAccountScreen.route());
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage(AppAssets.imgDummyProfile),
                  radius: 25,
                ),
                title: CommonText(
                  text: "Hello, Brayden",
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
            ),
            SizedBox(height: 12.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
              child: DottedLine(
                dashLength: 4,
                lineThickness: 1,
                dashGapLength: 4,
                dashColor: CustomAppColor.of(context).dividerColor,
              ),
            ),
            SizedBox(height: 12.setHeight),
            _drawerItem(
              icon: AppAssets.icHome,
              label: Languages.of(context).txtHome,
              onTap: () {
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            _drawerItem(
              icon: AppAssets.icHistory,
              label: Languages.of(context).txtYourTrips,
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
            IgnorePointer(
              ignoring: true,
              child: InkWell(
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem({required String icon, required String label, required VoidCallback onTap}) {
    return IgnorePointer(
      ignoring: true,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 4.setHeight, horizontal: 18.setWidth),
        leading: Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(color: CustomAppColor.of(context).icDrawerBg, borderRadius: BorderRadius.circular(12)),
            child: Image.asset(
              icon,
              height: 23.setHeight,
              width: 23.setWidth,
            )),
        title: CommonText(
          text: label,
          fontSize: 15.setFontSize,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.start,
        ),
        onTap: onTap,
        trailing: Icon(
          Icons.navigate_next_outlined,
          color: CustomAppColor.of(context).txtGray,
        ),
      ),
    );
  }
}

class ConfirmRideView extends StatefulWidget {
  final int countDown;
  final VoidCallback? onClickCancelFeedback;

  const ConfirmRideView({super.key, this.countDown = 5, this.onClickCancelFeedback});

  @override
  State<ConfirmRideView> createState() => _ConfirmRideViewState();
}

class _ConfirmRideViewState extends State<ConfirmRideView> {
  late int _currentCount;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _currentCount = widget.countDown;
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentCount > 0) {
        setState(() {
          _currentCount--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 25.setHeight),
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
          CommonText(
            text: "Arrives in $_currentCount sec".toUpperCase(),
            fontSize: 15.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: Colors.green,
          ),
          SizedBox(height: 15.setHeight),
          DottedLine(
            dashLength: 4,
            lineThickness: 1,
            dashGapLength: 4,
            dashColor: CustomAppColor.of(context).dividerColor,
          ),
          SizedBox(height: 15.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadiusGeometry.all(
                  Radius.circular(12),
                ),
                child: Image.asset(
                  AppAssets.imgDummyDriverProfile,
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
                    const CommonText(
                      text: "Devin",
                      fontWeight: FontWeight.w600,
                    ),
                    CommonText(
                      text: "Toyota Innova (CSR874-569)",
                      fontWeight: FontWeight.w400,
                      fontSize: 12.setFontSize,
                      textColor: CustomAppColor.of(context).txtGray,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7.setWidth, vertical: 3.setHeight),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    border: Border.all(
                      color: CustomAppColor.of(context).btnBorder.withValues(alpha: 0.1),
                    ),
                    color: CustomAppColor.of(context).bgAlertDialog),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color(0xFFFFC107),
                      size: 15,
                    ),
                    SizedBox(width: 4.setWidth),
                    CommonText(
                      text: "4.5",
                      fontWeight: FontWeight.w500,
                      fontSize: 10.setFontSize,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 15.setHeight),
          DottedLine(
            dashLength: 4,
            lineThickness: 1,
            dashGapLength: 4,
            dashColor: CustomAppColor.of(context).dividerColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 16.setHeight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppAssets.icMap,
                      height: 20.setHeight,
                      width: 20.setWidth,
                    ),
                    SizedBox(width: 6.setWidth),
                    CommonText(
                      text: "45 km",
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      AppAssets.icClock,
                      height: 20.setHeight,
                      width: 20.setWidth,
                    ),
                    SizedBox(width: 6.setWidth),
                    CommonText(
                      text: "15 min",
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      AppAssets.icDollar,
                      height: 20.setHeight,
                      width: 20.setWidth,
                    ),
                    SizedBox(width: 6.setWidth),
                    CommonText(
                      text: "\$146",
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),
          ),
          DottedLine(
            dashLength: 4,
            lineThickness: 1,
            dashGapLength: 4,
            dashColor: CustomAppColor.of(context).dividerColor,
          ),
          SizedBox(height: 20.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtPickupPoint,
                fontSize: 17.setFontSize,
                fontWeight: FontWeight.w600,
              ),
              InkWell(
                onTap: () {},
                child: CommonText(
                  text: Languages.of(context).txtChange.toUpperCase(),
                  fontSize: 15.setFontSize,
                  fontWeight: FontWeight.w700,
                  textColor: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.setHeight),
          ClipRRect(
            borderRadius: const BorderRadiusGeometry.all(
              Radius.circular(12),
            ),
            child: Image.asset(
              AppAssets.imgMapHome,
              alignment: Alignment.center,
              width: 335.setWidth,
              height: 130.setHeight,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 15.setHeight),
          Row(
            children: [
              Expanded(
                child: IgnorePointer(
                  ignoring: true,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(context, ChatScreen.route()),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                              border: Border.all(
                                color: CustomAppColor.of(context).dividerColor.withValues(alpha: 0.1),
                              ),
                              color: CustomAppColor.of(context).bgAlertDialog),
                          padding: const EdgeInsets.all(11),
                          child: Image.asset(
                            AppAssets.icChat,
                            width: 23.setWidth,
                            height: 23.setHeight,
                            color: CustomAppColor.of(context).icBlackWhite,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      InkWell(
                        onTap: () => Navigator.push(context, CallScreen.route()),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                              border: Border.all(
                                color: CustomAppColor.of(context).dividerColor.withValues(alpha: 0.1),
                              ),
                              color: CustomAppColor.of(context).bgAlertDialog),
                          padding: const EdgeInsets.all(11),
                          child: const Icon(Icons.call),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8.setWidth),
              Expanded(
                flex: 2,
                child: CommonButton(
                  height: 48.setHeight,
                  buttonTextSize: 16.setFontSize,
                  onTap: () async {
                    // widget.onClickCancelFeedback?.call();
                  },
                  text: Languages.of(context).txtCancelRequest,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class YouHaveArrivedView extends StatefulWidget {
  final VoidCallback onSubmitFeedback;

  const YouHaveArrivedView({super.key, required this.onSubmitFeedback});

  @override
  State<YouHaveArrivedView> createState() => _YouHaveArrivedViewState();
}

class _YouHaveArrivedViewState extends State<YouHaveArrivedView> {
  double _rating = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 25.setHeight),
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
          CommonText(
            text: Languages.of(context).txtYouHaveArrived.toUpperCase(),
            fontSize: 15.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: Colors.green,
          ),
          SizedBox(height: 15.setHeight),
          DottedLine(
            dashLength: 4,
            lineThickness: 1,
            dashGapLength: 4,
            dashColor: CustomAppColor.of(context).dividerColor,
          ),
          SizedBox(height: 15.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadiusGeometry.all(
                  Radius.circular(12),
                ),
                child: Image.asset(
                  AppAssets.imgDummyDriverProfile,
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
                      text: "Devin Jorje",
                      fontWeight: FontWeight.w700,
                      fontSize: 17.setFontSize,
                    ),
                    CommonText(
                      text: "Toyota Innova (CSR874-569)",
                      fontWeight: FontWeight.w500,
                      fontSize: 13.setFontSize,
                      textColor: CustomAppColor.of(context).txtGray,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7.setWidth, vertical: 3.setHeight),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    border: Border.all(
                      color: CustomAppColor.of(context).btnBorder.withValues(alpha: 0.1),
                    ),
                    color: CustomAppColor.of(context).bgAlertDialog),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color(0xFFFFC107),
                      size: 15,
                    ),
                    SizedBox(width: 4.setWidth),
                    CommonText(
                      text: "4.5",
                      fontWeight: FontWeight.w500,
                      fontSize: 10.setFontSize,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 15.setHeight),
          DottedLine(
            dashLength: 4,
            lineThickness: 1,
            dashGapLength: 4,
            dashColor: CustomAppColor.of(context).dividerColor,
          ),
          SizedBox(height: 20.setHeight),
          CommonText(
            text: Languages.of(context).txtHowWasYourTrip,
            fontWeight: FontWeight.w500,
            fontSize: 18.setFontSize,
          ),
          SizedBox(height: 5.setHeight),
          CommonText(
            text: Languages.of(context).txtYourFeedbackWillHelpImproveDrivingExperience,
            fontWeight: FontWeight.w400,
            fontSize: 13.setFontSize,
            textColor: CustomAppColor.of(context).txtGray,
          ),
          SizedBox(height: 15.setHeight),
          RatingBar.builder(
            initialRating: _rating,
            minRating: 1,
            direction: Axis.horizontal,
            itemCount: 5,
            itemSize: 40,
            unratedColor: CustomAppColor.of(context).txtGray,
            itemPadding: EdgeInsets.symmetric(horizontal: 3.setWidth),
            itemBuilder: (context, index) => const Icon(Icons.star_rounded, color: Colors.amber),
            onRatingUpdate: (rating) {
              setState(() {
                _rating = rating;
              });
            },
          ),
          SizedBox(height: 15.setHeight),
          CommonTextFormField(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtAdditionalComments,
            minLines: 4,
            maxLines: 5,
          ),
          SizedBox(height: 20.setHeight),
          IgnorePointer(
            ignoring: true,
            child: CommonButton(
              height: 48.setHeight,
              buttonTextSize: 16.setFontSize,
              onTap: () {
                widget.onSubmitFeedback();
              },
              text: Languages.of(context).txtSubmitFeedback,
            ),
          ),
        ],
      ),
    );
  }
}

class PayTipView extends StatefulWidget {
  final VoidCallback onBackToHome;

  const PayTipView({super.key, required this.onBackToHome});

  @override
  State<PayTipView> createState() => _PayTipViewState();
}

class _PayTipViewState extends State<PayTipView> {
  final List<int> _tipValues = [1, 2, 4, 6];
  int _selectedTip = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 25.setHeight),
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
          SizedBox(height: 5.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadiusGeometry.all(
                  Radius.circular(12),
                ),
                child: Image.asset(
                  AppAssets.imgDummyDriverProfile,
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
                      text: "Devin Jorje",
                      fontWeight: FontWeight.w700,
                      fontSize: 17.setFontSize,
                    ),
                    CommonText(
                      text: "Toyota Innova (CSR874-569)",
                      fontWeight: FontWeight.w500,
                      fontSize: 13.setFontSize,
                      textColor: CustomAppColor.of(context).txtGray,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7.setWidth, vertical: 3.setHeight),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    border: Border.all(
                      color: CustomAppColor.of(context).btnBorder.withValues(alpha: 0.1),
                    ),
                    color: CustomAppColor.of(context).bgAlertDialog),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color(0xFFFFC107),
                      size: 15,
                    ),
                    SizedBox(width: 4.setWidth),
                    CommonText(
                      text: "4.5",
                      fontWeight: FontWeight.w500,
                      fontSize: 10.setFontSize,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 25.setHeight),
          DottedLine(
            dashLength: 4,
            lineThickness: 1,
            dashGapLength: 4,
            dashColor: CustomAppColor.of(context).dividerColor,
          ),
          SizedBox(height: 20.setHeight),
          CommonText(
            text: "Wow 5 Star!",
            fontWeight: FontWeight.w600,
            fontSize: 18.setFontSize,
          ),
          SizedBox(height: 5.setHeight),
          CommonText(
            text: "${Languages.of(context).txtDoYouWantToAnyAdditionalTipFor}Devin?",
            fontWeight: FontWeight.w400,
            fontSize: 12.setFontSize,
            textColor: CustomAppColor.of(context).txtGray,
          ),
          SizedBox(height: 25.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.setWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_tipValues.length, (index) {
                final tipValue = _tipValues[index];
                final isSelected = _selectedTip == index + 1;

                return GestureDetector(
                  onTap: () => setState(() => _selectedTip = index + 1),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.setWidth,
                      vertical: 8.setHeight,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 4.setWidth),
                    decoration: BoxDecoration(
                      color: isSelected ? CustomAppColor.of(context).btnPrimary : CustomAppColor.of(context).bgAlertDialog,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? CustomAppColor.of(context).btnPrimary : CustomAppColor.of(context).dividerColor,
                      ),
                    ),
                    child: CommonText(
                      text: '\$$tipValue',
                      fontSize: 20.setFontSize,
                      textColor: isSelected ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtGray,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 25.setHeight),
          IgnorePointer(
            ignoring: true,
            child: CommonButton(
              height: 48.setHeight,
              buttonTextSize: 16.setFontSize,
              onTap: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (dialogContext) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.setWidth),
                      child: CommonDialog(
                        titleText: CommonText(
                          text: Languages.of(context).txtThankYou,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.setFontSize,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                        descriptionText: CommonText(
                          text: Languages.of(context).txtManyThanksForYourValuableFeedbackAndTip,
                          fontSize: 13.setFontSize,
                          fontWeight: FontWeight.w500,
                          textColor: CustomAppColor.of(context).txtGray,
                        ),
                        icon: Image.asset(
                          AppAssets.imgThankYou,
                          height: 90.setHeight,
                        ),
                        button: CommonButton(
                          text: Languages.of(context).txtBackToHome,
                          onTap: () {
                            Navigator.pop(dialogContext);
                            /*  widget.onBackToHome();*/
                          },
                          height: 45.setHeight,
                          buttonTextSize: 14.setFontSize,
                        ),
                      ),
                    );
                  },
                );
              },
              text: Languages.of(context).txtPayTip,
            ),
          ),
        ],
      ),
    );
  }
}
