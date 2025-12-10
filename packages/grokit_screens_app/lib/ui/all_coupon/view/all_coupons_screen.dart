import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:grokit_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_screens_app/localization/language/languages.dart';
import 'package:grokit_screens_app/utils/app_assets.dart';
import 'package:grokit_screens_app/utils/app_color.dart';
import 'package:grokit_screens_app/utils/constant.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/widgets/text/common_text.dart';
import 'package:grokit_screens_app/widgets/top_bar/topbar.dart';

class Coupon {
  final String title;
  final String description;
  final String code;

  Coupon({required this.title, required this.description, required this.code});
}

class AllCouponsScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AllCouponsScreen());
  }

  const AllCouponsScreen({super.key});

  @override
  State<AllCouponsScreen> createState() => _AllCouponsScreenState();
}

class _AllCouponsScreenState extends State<AllCouponsScreen> implements TopBarClickListener {
  final List<Coupon> coupons = [
    Coupon(
      title: 'First Order',
      description: 'Eligible items worth \$50.00 more to unlock',
      code: 'FOFD25',
    ),
    Coupon(
      title: '20% Vegetable Sale',
      description: 'Save \$20 with this code',
      code: 'VS9825',
    ),
    Coupon(
      title: 'Off 25% Above \$50',
      description: 'Save \$20 with this code',
      code: 'OF2025',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: true,
            title: Languages.of(context).txtAllCoupons,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              itemCount: coupons.length,
              itemBuilder: (context, index) {
                final coupon = coupons[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 15.setHeight),
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 12.setHeight),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: CustomAppColor.of(context).border),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppAssets.icDiscount,
                                  width: 22.setWidth,
                                  height: 22.setHeight,
                                ),
                                SizedBox(width: 5.setWidth),
                                CommonText(
                                  text: coupon.title,
                                  fontFamily: Constant.fontFamilySemiBold600,
                                )
                              ],
                            ),
                            SizedBox(height: 5.setHeight),
                            CommonText(
                              text: coupon.description,
                              fontSize: 12.setFontSize,
                              textAlign: TextAlign.start,
                              textColor: CustomAppColor.of(context).txtGray,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.setWidth),
                        child: DottedBorder(
                          options: RectDottedBorderOptions(color: CustomAppColor.of(context).itemCardBorder),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 4.setHeight),
                            child: CommonText(
                              text: coupon.code,
                              fontSize: 11.setFontSize,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
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
