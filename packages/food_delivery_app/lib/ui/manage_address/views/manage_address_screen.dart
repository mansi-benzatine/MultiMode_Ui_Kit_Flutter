import 'package:flutter/material.dart';
import 'package:food_delivery_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_app_package/localization/language/languages.dart';
import 'package:food_delivery_app_package/ui/manage_address/datamodels/manage_address_data.dart';
import 'package:food_delivery_app_package/utils/app_assets.dart';
import 'package:food_delivery_app_package/utils/app_color.dart';
import 'package:food_delivery_app_package/utils/constant.dart';
import 'package:food_delivery_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_app_package/widgets/button/common_button.dart';
import 'package:food_delivery_app_package/widgets/text/common_text.dart';
import 'package:food_delivery_app_package/widgets/top_bar/topbar.dart';

import '../../add_address/views/add_address_screen.dart';

class ManageAddressScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const ManageAddressScreen(),
    );
  }

  const ManageAddressScreen({super.key});

  @override
  State<ManageAddressScreen> createState() => _ManageAddressScreenState();
}

class _ManageAddressScreenState extends State<ManageAddressScreen> implements TopBarClickListener {
  List<ManageAddressData> manageAddressList = [];

  void fillData() {
    manageAddressList = [
      ManageAddressData(
        title: Languages.of(context).txtHome,
        address: "47 W 13th St, New York, NY 10011, USA",
      ),
      ManageAddressData(
        title: Languages.of(context).txtOffice,
        address: "47 W 13th St, New York, NY 10011, USA",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtManageAddress,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 14.setHeight, horizontal: 24.setWidth),
                      alignment: Alignment.topLeft,
                      color: CustomAppColor.of(context).detailScreenBg,
                      child: CommonText(
                        text: Languages.of(context).txtSavedAddress.toUpperCase(),
                        fontSize: 15.setFontSize,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item = manageAddressList[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.setHeight),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 4.setHeight),
                                child: Image.asset(
                                  AppAssets.icLocationBlack,
                                  width: 22.setWidth,
                                  height: 22.setHeight,
                                  color: CustomAppColor.of(context).icBlack,
                                ),
                              ),
                              SizedBox(width: 18.setWidth),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CommonText(
                                        text: item.title,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.setFontSize,
                                      ),
                                      CommonText(
                                        text: item.address,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.setFontSize,
                                        textColor: CustomAppColor.of(context).txtGrey,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 24.setHeight),
                                  Row(
                                    children: [
                                      CommonText(
                                        text: Languages.of(context).txtEdit.toUpperCase(),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.setFontSize,
                                        textColor: CustomAppColor.of(context).primary,
                                      ),
                                      SizedBox(width: 32.setWidth),
                                      CommonText(
                                        text: Languages.of(context).txtDelete.toUpperCase(),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.setFontSize,
                                        textColor: CustomAppColor.of(context).primary,
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(color: CustomAppColor.of(context).containerBorder);
                      },
                      itemCount: manageAddressList.length,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
              child: CommonButton(
                onTap: () => Navigator.push(context, AddAddressScreen.route()),
                text: Languages.of(context).txtAddNewAddress.toUpperCase(),
                buttonColor: CustomAppColor.of(context).transparent,
                borderColor: CustomAppColor.of(context).primary,
                buttonTextColor: CustomAppColor.of(context).txtBlack,
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
