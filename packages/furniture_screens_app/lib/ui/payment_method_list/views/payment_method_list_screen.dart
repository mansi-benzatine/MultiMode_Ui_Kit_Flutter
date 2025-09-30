import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:furniture_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_screens_app_package/localization/language/languages.dart';
import 'package:furniture_screens_app_package/ui/edit_card/views/edit_card_screen.dart';
import 'package:furniture_screens_app_package/utils/app_color.dart';
import 'package:furniture_screens_app_package/utils/constant.dart';
import 'package:furniture_screens_app_package/utils/sizer_utils.dart';
import 'package:furniture_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/text/common_text.dart';
import '../../add_new_card/views/add_new_card_screen.dart';

class PaymentMethodListScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const PaymentMethodListScreen());
  }

  const PaymentMethodListScreen({super.key});

  @override
  State<PaymentMethodListScreen> createState() => _PaymentMethodListScreenState();
}

class _PaymentMethodListScreenState extends State<PaymentMethodListScreen> implements TopBarClickListener {
  final List<Map<String, String>> addresses = [
    {
      "title": "My Wallet",
      "icon": AppAssets.icPaymentMethod,
    },
    {
      "title": "Google Pay",
      "icon": AppAssets.icGoogle,
    },
    {
      "title": "Paypal",
      "icon": AppAssets.icPaypal,
    },
    {
      "title": "Apple Pay",
      "icon": AppAssets.icApple1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              title: Languages.of(context).txtPaymentMethod,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 12),
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  final item = addresses[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 18.setHeight, horizontal: 20.setWidth),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        border: Border.all(
                          color: CustomAppColor.of(context).dividerColor,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  item["icon"]!,
                                  height: 22.setHeight,
                                  width: 22.setWidth,
                                  color: index == 0 || index == 3 ? CustomAppColor.of(context).icBlackWhite : null,
                                ),
                                SizedBox(width: 12.setWidth),
                                CommonText(
                                  text: item["title"]!,
                                  fontSize: 18.setFontSize,
                                  textAlign: TextAlign.start,
                                  fontFamily: Constant.fontFamilySemiBold600,
                                ),
                              ],
                            ),
                          ),
                          IgnorePointer(
                            ignoring: true,
                            child: InkWell(
                              onTap: () => Navigator.push(context, EditCardScreen.route()),
                              child: Image.asset(
                                AppAssets.icEdit,
                                height: 22.setHeight,
                                width: 22.setWidth,
                                color: CustomAppColor.of(context).icBlackWhite,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 20.setHeight),
              child: IgnorePointer(
                ignoring: true,
                child: GestureDetector(
                  onTap: () => Navigator.push(context, AddNewCardScreen.route()),
                  child: DottedBorder(
                      options: RoundedRectDottedBorderOptions(
                        radius: const Radius.circular(40),
                        dashPattern: [5, 5],
                        strokeWidth: 0.5,
                        padding: const EdgeInsets.all(14),
                        color: CustomAppColor.of(context).primary,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_rounded,
                            color: CustomAppColor.of(context).txtPrimary,
                          ),
                          SizedBox(width: 12.setWidth),
                          CommonText(
                            text: Languages.of(context).txtAddNewCard,
                            textColor: CustomAppColor.of(context).txtPrimary,
                            fontFamily: Constant.fontFamilyBold700,
                            fontSize: 18.setFontSize,
                            height: 0,
                          )
                        ],
                      )),
                ),
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
