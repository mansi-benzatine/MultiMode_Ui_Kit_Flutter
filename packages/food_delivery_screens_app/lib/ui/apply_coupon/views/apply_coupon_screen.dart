import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_screens_app_package/localization/language/languages.dart';
import 'package:food_delivery_screens_app_package/utils/app_color.dart';
import 'package:food_delivery_screens_app_package/utils/constant.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/text/common_text.dart';
import '../../view_restaurant/datamodels/view_restaurant_data.dart';

class ApplyCouponScreen extends StatefulWidget {
  const ApplyCouponScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ApplyCouponScreen());
  }

  @override
  State<ApplyCouponScreen> createState() => _ApplyCouponScreenState();
}

class _ApplyCouponScreenState extends State<ApplyCouponScreen> implements TopBarClickListener {
  List<OfferData> offerList = [];

  void fillData() {
    offerList = [
      OfferData(
        dealName: "Flat deal",
        dealDetail: "Flat 30% OFF",
        dealCouponDetail: "Use unlimited",
        dealPrice: "Above \$700",
      ),
      OfferData(
        dealName: "Top offer",
        dealDetail: "Buy 2 get 1 free",
        dealCouponDetail: "Use FreeDish",
      ),
      OfferData(
        dealName: "Super Sale",
        dealDetail: "Sale 50% off in pizza",
        dealCouponDetail: "Use PizzaLove",
      ),
      OfferData(
        dealName: "Super Sale",
        dealDetail: "Sale 70% off in Burger",
        dealCouponDetail: "Use BurgerLove",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
          child: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtApplyCoupon,
            isShowBack: true,
          ),
          Expanded(
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
              itemCount: offerList.length,
              itemBuilder: (context, index) {
                final offer = offerList[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                  child: Container(
                    padding: EdgeInsets.all(8.setWidth),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: CustomAppColor.of(context).containerBorder,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RotatedBox(
                          quarterTurns: 3,
                          child: CommonText(
                            text: offer.dealName.toUpperCase(),
                            fontSize: 11.setFontSize,
                            fontWeight: FontWeight.w700,
                            textColor: CustomAppColor.of(context).primary,
                          ),
                        ),
                        SizedBox(width: 8.setWidth),
                        Container(
                          width: 1,
                          height: 62.setHeight,
                          color: CustomAppColor.of(context).containerBorder,
                        ),
                        SizedBox(width: 8.setWidth),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8.setHeight),
                              Row(
                                children: [
                                  Image.asset(
                                    AppAssets.icDiscount,
                                    width: 20.setWidth,
                                    height: 20.setHeight,
                                  ),
                                  SizedBox(width: 6.setWidth),
                                  CommonText(
                                    text: offer.dealDetail.toUpperCase(),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.setFontSize,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.setHeight),
                              Row(
                                children: [
                                  CommonText(
                                    text: offer.dealCouponDetail.toUpperCase(),
                                    fontSize: 12.setFontSize,
                                    fontWeight: FontWeight.w400,
                                    textColor: CustomAppColor.of(context).txtGrey,
                                  ),
                                  Visibility(
                                    visible: offer.dealPrice != null,
                                    child: CommonText(
                                      text: " |${offer.dealPrice ?? ""}".toUpperCase(),
                                      fontSize: 12.setFontSize,
                                      fontWeight: FontWeight.w400,
                                      textColor: CustomAppColor.of(context).txtGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
