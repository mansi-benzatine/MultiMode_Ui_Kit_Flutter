import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../card_or_wallet_details/view/card_or_wallet_details_screen.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key, required this.isFromSelection});

  final bool isFromSelection;

  static Route<dynamic> route({bool isFromSelection = false}) {
    return MaterialPageRoute(builder: (context) => PaymentMethodScreen(isFromSelection: isFromSelection));
  }

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> implements TopBarClickListener {
  final ValueNotifier<String> selectedPaymentMethod = ValueNotifier("");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: widget.isFromSelection ? Languages.of(context).txtPaymentMethod : Languages.of(context).txtSelectPaymentMethod,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 15.setWidth,
                right: 15.setWidth,
                top: 15.setHeight,
                bottom: MediaQuery.of(context).padding.bottom + 10.setHeight,
              ),
              child: IgnorePointer(
                ignoring: widget.isFromSelection ? false : true,
                child: Column(
                  children: [
                    _itemOfOptionsView(
                      image: AppAssets.icPaymentWallet,
                      title: Languages.of(context).txtMyWallet,
                      onEditTap: () {
                        Navigator.push(context, CardOrWalletDetailsScreen.route(isFromCard: false));
                      },
                    ),
                    _itemOfOptionsView(
                      image: AppAssets.icPaymentPaypal,
                      title: Languages.of(context).txtPaypal,
                      isShowEdit: false,
                    ),
                    _itemOfOptionsView(
                      image: AppAssets.icPaymentGoogle,
                      title: Languages.of(context).txtGooglePay,
                      isShowEdit: false,
                    ),
                    _itemOfOptionsView(
                      image: AppAssets.icPaymentApple,
                      title: Languages.of(context).txtApplePay,
                      isShowEdit: false,
                    ),
                    _itemOfOptionsView(
                      image: AppAssets.icPaymentVisa,
                      title: "**** **** **05",
                      imageWidth: 40.setWidth,
                      onEditTap: () {
                        Navigator.push(context, CardOrWalletDetailsScreen.route(isFromCard: true));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: widget.isFromSelection,
            child: CommonButton(
              text: "${Languages.of(context).txtContinue} - \$14.00",
              onTap: () {},
              buttonColor: CustomAppColor.of(context).primary,
              borderColor: CustomAppColor.of(context).borderColor,
              borderWidth: 4,
              radius: 18,
              mLeft: 20.setWidth,
              mRight: 20.setWidth,
              mBottom: MediaQuery.of(context).padding.bottom + 10.setHeight,
              mTop: 20.setHeight,
            ),
          ),
        ],
      ),
    );
  }

  _itemOfOptionsView({required String image, required String title, double? imageHeight, double? imageWidth, bool isShowEdit = true, Function()? onEditTap}) {
    return ValueListenableBuilder(
      valueListenable: selectedPaymentMethod,
      builder: (context, value, child) {
        return InkWell(
          highlightColor: CustomAppColor.of(context).transparent,
          splashColor: CustomAppColor.of(context).transparent,
          onTap: () {
            if (widget.isFromSelection) {
              if (selectedPaymentMethod.value == title) {
                selectedPaymentMethod.value = "";
              } else {
                selectedPaymentMethod.value = title;
              }
            }
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 15.setHeight),
            padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 15.setHeight),
            decoration: BoxDecoration(
              color: (selectedPaymentMethod.value == title && widget.isFromSelection) ? CustomAppColor.of(context).containerBorderAndBlack : CustomAppColor.of(context).bgScreen,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: (selectedPaymentMethod.value == title && widget.isFromSelection) ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                width: (selectedPaymentMethod.value == title && widget.isFromSelection) ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  image,
                  height: imageHeight ?? 20.setHeight,
                  width: imageWidth ?? 20.setHeight,
                  color: (image == AppAssets.icPaymentPaypal || image == AppAssets.icPaymentGoogle) ? null : CustomAppColor.of(context).txtBlack,
                ),
                SizedBox(width: 10.setWidth),
                Expanded(
                  child: CommonText(
                    text: title,
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w600,
                    fontFamily: Constant.fontFamilySemiBold600,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.start,
                  ),
                ),
                if (!widget.isFromSelection && isShowEdit)
                  InkWell(
                    onTap: () {
                      onEditTap?.call();
                    },
                    child: Image.asset(
                      AppAssets.icEditOutline,
                      height: 20.setHeight,
                      width: 20.setWidth,
                      color: CustomAppColor.of(context).txtBlack,
                    ),
                  ),
                if (widget.isFromSelection && selectedPaymentMethod.value == title)
                  Icon(
                    Icons.done_rounded,
                    color: CustomAppColor.of(context).primary,
                    size: 20.setHeight,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
