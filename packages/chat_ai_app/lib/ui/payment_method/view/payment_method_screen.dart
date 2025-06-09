import 'package:chat_ai_app_package/ui/add_new_card/view/add_new_card_screen.dart';
import 'package:chat_ai_app_package/ui/payment_method/datamodel/payment_data.dart';
import 'package:chat_ai_app_package/ui/review_summary/view/review_summary_screen.dart';
import 'package:chat_ai_app_package/utils/sizer_utils.dart';
import 'package:chat_ai_app_package/widgets/button/common_button.dart';
import 'package:chat_ai_app_package/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/top_bar/topbar.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const PaymentMethodScreen());
  }

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> implements TopBarClickListener {
  List<PaymentTypeData> paymentTypeList = [];
  void fillData() {
    paymentTypeList = [
      PaymentTypeData(
        isSelected: true,
        paymentImageUrl: AppAssets.icWallet,
        paymentType: Languages.of(context).txtMyWallet,
      ),
      PaymentTypeData(
        isSelected: false,
        paymentImageUrl: AppAssets.icGoogle,
        paymentType: Languages.of(context).txtGooglePay,
      ),
      PaymentTypeData(
        isSelected: false,
        paymentImageUrl: AppAssets.icPayPal,
        paymentType: Languages.of(context).txtPayPal,
      ),
      PaymentTypeData(
        isSelected: false,
        paymentImageUrl: AppAssets.icAppleUnfilled,
        paymentType: Languages.of(context).txtApplePay,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtPaymentMEthod,
              isShowBack: true,
              isShowPlus: true,
            ),
            SizedBox(height: 15.setHeight),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
                child: PaymentMethodView(paymentTypeList: paymentTypeList),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CommonButton(
                  text: Languages.of(context).txtContinue,
                  onTap: () => Navigator.push(context, ReviewSummaryScreen.route()),
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
    if (name == Constant.strAddNewCard) {
      Navigator.push(context, AddNewCardScreen.route());
    }
  }
}

class PaymentMethodView extends StatefulWidget {
  final List<PaymentTypeData> paymentTypeList;
  const PaymentMethodView({super.key, required this.paymentTypeList});

  @override
  State<PaymentMethodView> createState() => _PaymentMethodViewState();
}

class _PaymentMethodViewState extends State<PaymentMethodView> {
  final List<PaymentTypeData> _paymentTypes = [];

  @override
  void initState() {
    super.initState();
    _paymentTypes.addAll(widget.paymentTypeList);
  }

  void _onSelect(int index) {
    setState(() {
      for (int i = 0; i < _paymentTypes.length; i++) {
        _paymentTypes[i].isSelected = i == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // width: 0.setWidth,
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage(AppAssets.imgBgSubscription1),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              CommonText(
                text: Languages.of(context).txtSubscriptionPlan,
                fontWeight: FontWeight.w700,
                fontSize: 24.setFontSize,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                    text: "\$10 ",
                    fontWeight: FontWeight.w800,
                    fontSize: 45.setFontSize,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: "/1 Month",
                        fontWeight: FontWeight.w700,
                        fontSize: 20.setFontSize,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: widget.paymentTypeList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15.setHeight,
              crossAxisSpacing: 10.setWidth,
              childAspectRatio: 2.6,
            ),
            itemBuilder: (context, index) {
              final type = widget.paymentTypeList[index];
              return GestureDetector(
                onTap: () => _onSelect(index),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: type.isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).containerBorder,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        type.paymentImageUrl,
                        height: 20.setHeight,
                        width: 20.setWidth,
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: type.paymentType,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.setFontSize,
                        textColor: CustomAppColor.of(context).txtBlack,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
