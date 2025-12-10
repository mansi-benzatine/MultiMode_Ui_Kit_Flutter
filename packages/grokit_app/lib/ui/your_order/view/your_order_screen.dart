import 'package:flutter/material.dart';
import 'package:grokit_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_app/localization/language/languages.dart';
import 'package:grokit_app/ui/rate_your_experience/view/rate_your_experience_screen.dart';
import 'package:grokit_app/ui/reorder/view/reorder_screen.dart';
import 'package:grokit_app/utils/app_assets.dart';
import 'package:grokit_app/utils/app_color.dart';
import 'package:grokit_app/utils/constant.dart';
import 'package:grokit_app/utils/sizer_utils.dart';
import 'package:grokit_app/widgets/button/common_button.dart';
import 'package:grokit_app/widgets/text/common_text.dart';
import 'package:grokit_app/widgets/top_bar/topbar.dart';

import '../datamodel/your_order_data.dart';

class YourOrderScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const YourOrderScreen());
  }

  const YourOrderScreen({super.key});

  @override
  State<YourOrderScreen> createState() => _YourOrderScreenState();
}

class _YourOrderScreenState extends State<YourOrderScreen> implements TopBarClickListener {
  List<Order> orders = [];

  _fillData() {
    orders = [
      Order(
        items: [AppAssets.imgVeggie5, AppAssets.imgSnack, AppAssets.imgKitchen1],
        amount: 187.0,
        time: '01 Aug, 03:45 PM',
        deliveryTime: '10–12 Min',
      ),
      Order(
        items: [AppAssets.imgRecentDairy, AppAssets.imgVeggie3, AppAssets.imgVeggie4],
        amount: 187.0,
        time: '01 Aug, 03:45 PM',
        deliveryTime: '10–12 Min',
      ),
      Order(
        items: [AppAssets.imgBeautyEyeBeauty, AppAssets.imgBeautyLipstick, AppAssets.imgBeautyNails],
        amount: 187.0,
        time: '01 Aug, 03:45 PM',
        deliveryTime: '10–12 Min',
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).unselectedCard,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtYourOrder,
            isShowBack: true,
          ),
          Container(
            color: CustomAppColor.of(context).yourOrderDivider,
            height: 16.setHeight,
          ),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final item = orders[index];
              return Container(
                color: CustomAppColor.of(context).yourOrderCard,
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    AppAssets.icDeliveryBoy,
                                    height: 18.setHeight,
                                    width: 18.setWidth,
                                  ),
                                  SizedBox(width: 12.setWidth),
                                  const CommonText(
                                    text: "Arriving In 10-12 Min",
                                    fontFamily: Constant.fontFamilyBold700,
                                  )
                                ],
                              ),
                              SizedBox(height: 4.setHeight),
                              CommonText(
                                text: item.time,
                                textColor: CustomAppColor.of(context).txtGray,
                                fontSize: 12.setFontSize,
                              )
                            ],
                          ),
                        ),
                        Image.asset(
                          AppAssets.icTrash,
                          height: 20.setHeight,
                          width: 20.setWidth,
                        )
                      ],
                    ),
                    SizedBox(height: 15.setHeight),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List.generate(
                            item.items.length,
                            (index) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 3.setWidth, vertical: 2.setHeight),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: CustomAppColor.of(context).unselectedCard,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                                      child: Image.asset(
                                        item.items[index],
                                        width: 50.setWidth,
                                        height: 50.setHeight,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CommonText(
                                text: Languages.of(context).txtTotalAmount,
                                textColor: CustomAppColor.of(context).txtGray,
                              ),
                              SizedBox(height: 3.setHeight),
                              CommonText(
                                text: "\$${item.amount.toString()}",
                                fontFamily: Constant.fontFamilyBold700,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.setHeight),
                    Row(
                      children: [
                        Expanded(
                          child: CommonButton(
                            text: Languages.of(context).txtReOrder,
                            onTap: () => Navigator.push(context, ReorderScreen.route()),
                            buttonColor: CustomAppColor.of(context).transparent,
                            borderColor: CustomAppColor.of(context).borderTextFormField,
                            buttonTextColor: CustomAppColor.of(context).txtGray,
                            height: 40.setHeight,
                            buttonTextSize: 14.setFontSize,
                          ),
                        ),
                        SizedBox(width: 12.setWidth),
                        Expanded(
                          child: CommonButton(
                            text: Languages.of(context).txtRateOrder,
                            onTap: () => Navigator.push(context, RateYourExperienceScreen.route()),
                            buttonColor: CustomAppColor.of(context).buttonPrimary,
                            borderColor: CustomAppColor.of(context).buttonPrimary,
                            height: 40.setHeight,
                            buttonTextSize: 14.setFontSize,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                color: CustomAppColor.of(context).yourOrderDivider,
                height: 16.setHeight,
              );
            },
            itemCount: orders.length,
          )
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
