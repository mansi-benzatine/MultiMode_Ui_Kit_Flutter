import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/localization/language/languages.dart';
import 'package:food_delivery_screens_app_package/ui/account/datamodels/account_data.dart';
import 'package:food_delivery_screens_app_package/ui/edit_account/views/edit_account_screen.dart';
import 'package:food_delivery_screens_app_package/ui/feedback/views/feedback_screen.dart';
import 'package:food_delivery_screens_app_package/ui/helps_and_support/views/helps_and_support_screen.dart';
import 'package:food_delivery_screens_app_package/ui/my_account/views/my_account_screen.dart';
import 'package:food_delivery_screens_app_package/ui/past_order/views/past_orders_screen.dart';
import 'package:food_delivery_screens_app_package/ui/payment/views/payment_screen.dart';
import 'package:food_delivery_screens_app_package/ui/re_order/views/re_order_screen.dart';
import 'package:food_delivery_screens_app_package/utils/app_assets.dart';
import 'package:food_delivery_screens_app_package/utils/app_color.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_screens_app_package/widgets/button/common_button.dart';
import 'package:food_delivery_screens_app_package/widgets/text/common_text.dart';

import '../../../widgets/dotted_divider/dotted_diveder.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AccountScreen());
  }

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<AccountNavigationList> navigationList = [];
  void fillData() {
    navigationList = [
      AccountNavigationList(
        title: Languages.of(context).txtMyAccount,
        subTitle: Languages.of(context).txtMyAccountDesc,
        screen: const MyAccountScreen(),
      ),
      AccountNavigationList(
        title: Languages.of(context).txtPayment,
        subTitle: Languages.of(context).txtPaymentMode,
        screen: const PaymentScreen(),
      ),
      AccountNavigationList(
        title: Languages.of(context).txtHelpsAndSupport,
        subTitle: Languages.of(context).txtFaqsAndLinks,
        screen: const HelpsAndSupportScreen(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).detailScreenBg,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            const IgnorePointer(ignoring: true, child: ProfileInformationView()),
            SizedBox(height: 8.setHeight),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    IgnorePointer(ignoring: true, child: NavigationOptionsListView(navigationList: navigationList)),
                    SizedBox(height: 8.setHeight),
                    const IgnorePointer(ignoring: true, child: PastOrderView()),
                    SizedBox(height: 8.setHeight),
                    const LogOutView(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 28.setHeight),
                      child: CommonText(
                        text: "${Languages.of(context).txtAppVersion} 1.0.0",
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtGrey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileInformationView extends StatelessWidget {
  const ProfileInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
      color: CustomAppColor.of(context).bgScaffold,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            AppAssets.imgUserProfile,
            height: 45.setHeight,
            width: 45.setWidth,
          ),
          SizedBox(width: 14.setWidth),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      text: "Brayden",
                      fontWeight: FontWeight.w700,
                      fontSize: 22.setFontSize,
                    ),
                    InkWell(
                      onTap: () => Navigator.push(context, EditAccountScreen.route()),
                      child: CommonText(
                        text: Languages.of(context).txtEdit.toUpperCase(),
                        fontWeight: FontWeight.w700,
                        fontSize: 15.setFontSize,
                        textColor: CustomAppColor.of(context).primary,
                      ),
                    ),
                  ],
                ),
                CommonText(
                  text: "12345 67890  |  email@yourdomain.com",
                  fontWeight: FontWeight.w500,
                  fontSize: 14.setFontSize,
                  textColor: CustomAppColor.of(context).txtGrey,
                  letterSpacing: -0.3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationOptionsListView extends StatelessWidget {
  final List<AccountNavigationList> navigationList;
  const NavigationOptionsListView({super.key, required this.navigationList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
          itemBuilder: (context, index) {
            final item = navigationList[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => item.screen),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.setHeight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: item.title,
                          fontSize: 18.setFontSize,
                          fontWeight: FontWeight.w600,
                        ),
                        CommonText(
                          text: item.subTitle ?? "",
                          fontSize: 14.setFontSize,
                        )
                      ],
                    ),
                    Icon(
                      Icons.navigate_next_rounded,
                      color: CustomAppColor.of(context).txtGrey,
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: CustomAppColor.of(context).containerBorder,
              thickness: 1.5,
            );
          },
          itemCount: navigationList.length),
    );
  }
}

class PastOrderView extends StatelessWidget {
  const PastOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtPastOrder.toUpperCase(),
            fontWeight: FontWeight.w700,
            fontSize: 14.setFontSize,
            textColor: CustomAppColor.of(context).txtGrey,
          ),
          SizedBox(height: 15.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: "The Modern Restaurant ",
                fontWeight: FontWeight.w600,
                fontSize: 18.setFontSize,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: Languages.of(context).txtDelivered,
                    fontSize: 14.setFontSize,
                  ),
                  SizedBox(width: 6.setWidth),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomAppColor.of(context).primary,
                    ),
                    child: Icon(
                      Icons.check,
                      color: CustomAppColor.of(context).white,
                      size: 16,
                    ),
                  )
                ],
              ),
            ],
          ),
          CommonText(
            text: "New York",
            fontWeight: FontWeight.w400,
            fontSize: 14.setFontSize,
            textColor: CustomAppColor.of(context).txtGrey,
          ),
          SizedBox(height: 3.setHeight),
          Row(
            children: [
              CommonText(
                text: "\$135",
                fontWeight: FontWeight.w700,
                fontSize: 14.setFontSize,
              ),
              Icon(
                Icons.navigate_next_rounded,
                color: CustomAppColor.of(context).icBlack,
              )
            ],
          ),
          SizedBox(height: 10.setHeight),
          const DottedDivider(
            height: 2,
            dotWidth: 2,
            spacing: 2,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: "Testy Burger x 2",
            fontWeight: FontWeight.w600,
            fontSize: 14.setFontSize,
            textColor: CustomAppColor.of(context).txtGrey,
          ),
          CommonText(
            text: "February 26, 12:10 PM",
            fontWeight: FontWeight.w400,
            fontSize: 14.setFontSize,
            textColor: CustomAppColor.of(context).txtGrey,
          ),
          SizedBox(height: 20.setHeight),
          Row(
            children: [
              Expanded(
                  child: CommonButton(
                height: 44.setHeight,
                text: Languages.of(context).txtReOrder.toUpperCase(),
                onTap: () => Navigator.push(context, ReOrderScreen.route()),
              )),
              SizedBox(width: 20.setWidth),
              Expanded(
                child: CommonButton(
                  buttonColor: CustomAppColor.of(context).reviewButton,
                  borderColor: CustomAppColor.of(context).txtBlack,
                  height: 44.setHeight,
                  text: Languages.of(context).txtReview.toUpperCase(),
                  onTap: () => Navigator.push(context, FeedbackScreen.route()),
                ),
              ),
            ],
          ),
          SizedBox(height: 25.setHeight),
          InkWell(
            onTap: () => Navigator.push(context, PastOrdersScreen.route()),
            child: CommonText(
              text: Languages.of(context).txtViewMoreOrders.toUpperCase(),
              fontWeight: FontWeight.w700,
              fontSize: 15.setFontSize,
              textColor: CustomAppColor.of(context).primary,
            ),
          ),
        ],
      ),
    );
  }
}

class LogOutView extends StatelessWidget {
  const LogOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 24.setWidth),
      child: InkWell(
        onTap: () => logOutBs(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: Languages.of(context).txtLogout.toUpperCase(),
              fontWeight: FontWeight.w700,
              fontSize: 18.setFontSize,
            ),
            Image.asset(
              AppAssets.icLogout,
              height: 24.setHeight,
              width: 24.setWidth,
            )
          ],
        ),
      ),
    );
  }

  void logOutBs(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: false,
      scrollControlDisabledMaxHeightRatio: 0.4,
      barrierColor: Colors.black54,
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (dialogContext) {
        return SafeArea(
          top: true,
          child: Wrap(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 26.setHeight),
                        CommonText(
                          text: Languages.of(context).txtLogout,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.setFontSize,
                        ),
                        SizedBox(height: 12.setHeight),
                        Divider(color: CustomAppColor.of(context).containerBorder),
                        SizedBox(height: 18.setHeight),
                        CommonText(
                          text: Languages.of(context).txtAreYouSureYouWantToLogout,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.setFontSize,
                          textColor: CustomAppColor.of(context).txtGrey,
                        ),
                        SizedBox(height: 30.setHeight),
                        CommonButton(
                          onTap: () {
                            if (dialogContext.mounted) {
                              Navigator.pop(dialogContext);
                            }
                          },
                          text: Languages.of(context).txtLogout.toUpperCase(),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -20.setHeight,
                    right: 0.setWidth,
                    left: 0.setWidth,
                    child: GestureDetector(
                      onTap: () {
                        if (dialogContext.mounted) {
                          Navigator.pop(dialogContext);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 14.setHeight, horizontal: 14.setWidth),
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).bgScaffold,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: CustomAppColor.of(context).primary,
                            width: 2,
                          ),
                        ),
                        child: Icon(Icons.close, color: CustomAppColor.of(context).icBlack),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
