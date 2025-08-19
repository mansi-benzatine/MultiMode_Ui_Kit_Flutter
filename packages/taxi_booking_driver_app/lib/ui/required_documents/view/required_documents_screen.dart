import 'package:flutter/material.dart';
import 'package:taxi_booking_driver_app_package/interfaces/top_bar_click_listener.dart';
import 'package:taxi_booking_driver_app_package/localization/language/languages.dart';
import 'package:taxi_booking_driver_app_package/ui/bank_details/view/bank_details_screen.dart';
import 'package:taxi_booking_driver_app_package/ui/driving_details/view/driving_details_screen.dart';
import 'package:taxi_booking_driver_app_package/ui/government_id/view/government_id_screen.dart';
import 'package:taxi_booking_driver_app_package/utils/app_assets.dart';
import 'package:taxi_booking_driver_app_package/utils/app_color.dart';
import 'package:taxi_booking_driver_app_package/utils/constant.dart';
import 'package:taxi_booking_driver_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_driver_app_package/widgets/button/common_button.dart';
import 'package:taxi_booking_driver_app_package/widgets/text/common_text.dart';
import 'package:taxi_booking_driver_app_package/widgets/top_bar/topbar.dart';

import '../../../widgets/alert_dialog/common_alert_dialog.dart';
import '../../home/view/home_screen.dart';

class RequiredDocumentsScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const RequiredDocumentsScreen());
  }

  const RequiredDocumentsScreen({super.key});

  @override
  State<RequiredDocumentsScreen> createState() => _RequiredDocumentsScreenState();
}

class _RequiredDocumentsScreenState extends State<RequiredDocumentsScreen> implements TopBarClickListener {
  List<Map<String, dynamic>> documentsList = [];

  void _fillData() {
    documentsList = [
      {
        'icon': AppAssets.icDrivingDetails,
        'title': Languages.of(context).txtDrivingDetails,
        'onTap': () {
          Navigator.push(context, DrivingDetailsScreen.route());
        }
      },
      {
        'icon': AppAssets.icWallet,
        'title': Languages.of(context).txtBankDetails,
        'onTap': () {
          Navigator.push(context, BankDetailsScreen.route());
        }
      },
      {
        'icon': AppAssets.icGovernment,
        'title': Languages.of(context).txtGovernmentId,
        'onTap': () {
          Navigator.push(context, GovernmentIdScreen.route());
        }
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    _fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            TopBar(this, title: Languages.of(context).txtRequiredDocuments),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final item = documentsList[index];
                    return ListTile(
                        onTap: item['onTap'],
                        dense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 22.setWidth),
                        trailing: const Icon(Icons.navigate_next_rounded),
                        title: CommonText(
                          text: item['title'],
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.start,
                        ),
                        leading: Image.asset(
                          item['icon'],
                          height: 24.setHeight,
                          width: 24.setWidth,
                          color: CustomAppColor.of(context).icBlackWhite,
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: CustomAppColor.of(context).dividerColor,
                    );
                  },
                  itemCount: documentsList.length),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 20.setHeight),
              child: CommonButton(
                text: Languages.of(context).txtContinue,
                onTap: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (_) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.setWidth),
                        child: CommonDialog(
                          titleText: CommonText(
                            text: Languages.of(context).txtDocumentSubmitted,
                            fontWeight: FontWeight.w700,
                            fontSize: 24.setFontSize,
                            textColor: CustomAppColor.of(context).txtBlack,
                          ),
                          descriptionText: CommonText(
                            text: Languages.of(context).txtYourAccountHasBeenCreatedSuccessfullyPressContinueToStartUsingApp,
                            fontSize: 13.setFontSize,
                            fontWeight: FontWeight.w400,
                            textColor: CustomAppColor.of(context).txtGray,
                          ),
                          icon: Image.asset(
                            AppAssets.icGreyThumbUp,
                            height: 110.setHeight,
                          ),
                          button: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(context, HomeScreen.route(isFromRideBooked: false));
                              },
                              child: Image.asset(
                                AppAssets.icGoToNext,
                                height: 55.setHeight,
                                width: 55.setHeight,
                              )),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
