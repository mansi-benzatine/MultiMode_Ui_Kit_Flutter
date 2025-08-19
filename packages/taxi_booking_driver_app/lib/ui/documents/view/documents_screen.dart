import 'package:flutter/material.dart';
import 'package:taxi_booking_driver_app_package/interfaces/top_bar_click_listener.dart';
import 'package:taxi_booking_driver_app_package/localization/language/languages.dart';
import 'package:taxi_booking_driver_app_package/ui/update_bank_details/view/update_bank_details_screen.dart';
import 'package:taxi_booking_driver_app_package/ui/update_government_details/view/update_goverment_id_screen.dart';
import 'package:taxi_booking_driver_app_package/utils/app_assets.dart';
import 'package:taxi_booking_driver_app_package/utils/app_color.dart';
import 'package:taxi_booking_driver_app_package/utils/constant.dart';
import 'package:taxi_booking_driver_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_driver_app_package/widgets/button/common_button.dart';
import 'package:taxi_booking_driver_app_package/widgets/text/common_text.dart';
import 'package:taxi_booking_driver_app_package/widgets/top_bar/topbar.dart';

import '../../update_driving_details/view/update_driving_details_screen.dart';

class DocumentsScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const DocumentsScreen());
  }

  const DocumentsScreen({super.key});

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> implements TopBarClickListener {
  List<Map<String, dynamic>> documentsList = [];

  void _fillData() {
    documentsList = [
      {
        'icon': AppAssets.icDrivingDetails,
        'title': Languages.of(context).txtDrivingDetails,
        'onTap': () {
          Navigator.push(context, UpdateDrivingDetailsScreen.route());
        }
      },
      {
        'icon': AppAssets.icWallet,
        'title': Languages.of(context).txtBankDetails,
        'onTap': () {
          Navigator.push(context, UpdateBankDetailsScreen.route());
        }
      },
      {
        'icon': AppAssets.icGovernment,
        'title': Languages.of(context).txtGovernmentId,
        'onTap': () {
          Navigator.push(context, UpdateGovernmentIdScreen.route());
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
            TopBar(this, title: Languages.of(context).txtDocument),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final item = documentsList[index];
                    return ListTile(
                        onTap: item['onTap'],
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
                text: Languages.of(context).txtUpdate,
                onTap: () {
                  Navigator.pop(context);
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
